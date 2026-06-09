<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use App\Models\Pejabat;
use App\Models\UnitKerja;
use App\Models\Konfigurasi;
use Intervention\Image\Laravel\Facades\Image;
use Illuminate\View\View;
use Illuminate\Http\RedirectResponse;

class PejabatController extends Controller
{

    public function index(Request $request): View
    {

        $user = Auth::user(); // Objek user lengkap
        $akses = $user->akses_level;
        $unit_kerja = UnitKerja::orderBy('nama_unit_kerja', 'ASC')->get();
        $konfigurasi = Konfigurasi::first();
        $lastOrder = Pejabat::max('urutan');
        $urutan = $lastOrder ? $lastOrder + 1 : 1;

        if ($request->has('jenis')) {
            $pejabat = Pejabat::fakultas();
        } elseif (in_array($akses, ['Admin-Unit', 'Pimpinan-Unit'])) {
            $pejabat = Pejabat::getByUnitKerja(Auth::user()->id_unit_kerja);
        } else {
            $pejabat = Pejabat::listing();
        }

        return view('admin.layout.wrapper', [
            'title'      => 'Pejabat Penanda Tangan (' . $pejabat->count() . ')',
            'pejabat'    => $pejabat,
            'unit_kerja' => $unit_kerja,
            'konfigurasi' => $konfigurasi,
            'urutan'    => $urutan,
            'content'    => 'admin.pejabat.index'
        ]);
    }


    public function unit($id_unit_kerja): View
    {
        $unit_kerja  = UnitKerja::orderBy('nama_unit_kerja', 'ASC')->get();
        $unit_kerjad = UnitKerja::findOrFail($id_unit_kerja);

        $pejabat = Pejabat::getByUnitKerja($id_unit_kerja);

        return view('admin.layout.wrapper', [
            'title'      => 'Pejabat: ' . $unit_kerjad->nama_unit_kerja,
            'pejabat'    => $pejabat,
            'unit_kerja' => $unit_kerja,
            'content'    => 'admin.pejabat.index'
        ]);
    }


    public function edit($id_pejabat): View
    {
        $pejabat    = Pejabat::findOrFail($id_pejabat);
        $unit_kerja = UnitKerja::orderBy('nama_unit_kerja', 'ASC')->get();
        $konfigurasi = Konfigurasi::first();

        return view('admin.layout.wrapper', [
            'title'      => 'Edit Pejabat Penanda Tangan',
            'pejabat'    => $pejabat,
            'unit_kerja' => $unit_kerja,
            'konfigurasi' => $konfigurasi,
            'content'    => 'admin.pejabat.edit'
        ]);
    }


    public function tambah(Request $request): RedirectResponse
    {
        $konfigurasi = Konfigurasi::first();

        $request->validate([
            'nama_pejabat' => 'required',
            'nip'          => 'required',
            'gambar'       => 'nullable|image|mimes:jpeg,png,jpg|max:8024',
        ]);

        $data = $request->all();
        $data['id_user'] = Auth::id();

        // Logika Nama Unit Kerja
        if ($request->id_unit_kerja == 0) {
            $data['nama_unit_kerja'] = $konfigurasi->namaweb;
        } else {
            $uk = UnitKerja::find($request->id_unit_kerja);
            $data['nama_unit_kerja'] = $uk->nama_unit_kerja;
        }

        // Handle Upload
        if ($request->hasFile('gambar')) {
            $data['gambar'] = $this->uploadImage($request->file('gambar'));
        }

        Pejabat::create($data);

        return redirect('admin/pejabat')->with('sukses', 'Data berhasil ditambah');
    }


    public function proses_edit(Request $request): RedirectResponse
    {
        $request->validate([
            'id_pejabat'   => 'required',
            'nama_pejabat' => 'required',
            'nip'          => 'required',
            'gambar'       => 'nullable|image|mimes:jpeg,png,jpg|max:8024',
        ]);

        $pejabat = Pejabat::findOrFail($request->id_pejabat);
        $data    = $request->all();
        $data['id_user'] = Auth::id();

        if ($request->hasFile('gambar')) {
            // Hapus gambar lama
            if ($pejabat->gambar) {
                File::delete(public_path('assets/upload/pejabat/' . $pejabat->gambar));
                File::delete(public_path('assets/upload/image/thumbs/' . $pejabat->gambar));
            }
            $data['gambar'] = $this->uploadImage($request->file('gambar'));
        }

        $pejabat->update($data);

        return redirect('admin/pejabat')->with('sukses', 'Data berhasil diperbarui');
    }


    public function proses(Request $request): RedirectResponse
    {
        if ($request->has('hapus')) {
            $ids = $request->id_pejabat;
            if (is_array($ids)) {
                Pejabat::whereIn('id_pejabat', $ids)->delete();
            }
            return redirect()->back()->with('sukses', 'Data terpilih telah dihapus');
        }
        return redirect()->back();
    }

    public function delete($id_pejabat): RedirectResponse
    {
        $pejabat = Pejabat::findOrFail($id_pejabat);
        $pejabat->delete();
        return redirect('admin/pejabat')->with('sukses', 'Data telah dihapus');
    }

    private function uploadImage($file): string
    {
        $namaFile = Str::slug(pathinfo($file->getClientOriginalName(), PATHINFO_FILENAME)) . '-' . time() . '.' . $file->getClientOriginalExtension();

        $thumbPath = public_path('assets/upload/image/thumbs');
        $origPath  = public_path('assets/upload/pejabat');

        if (!File::isDirectory($thumbPath)) File::makeDirectory($thumbPath, 0777, true);
        if (!File::isDirectory($origPath)) File::makeDirectory($origPath, 0777, true);

        // Thumbnail (Menggunakan copy atau resize jika Intervention terpasang)
        $file->move($origPath, $namaFile);
        File::copy($origPath . '/' . $namaFile, $thumbPath . '/' . $namaFile);

        return $namaFile;
    }
}
