<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use App\Models\Users;
use App\Models\UnitKerja;
use App\Models\AksesLevel;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Illuminate\Support\Facades\Auth;

class UserController extends Controller
{
    // Index - Menampilkan daftar user
    public function index()
    {
        $user       = Users::with('unitKerja')->orderBy('id_user', 'DESC')->get();
        $unitKerja  = UnitKerja::orderBy('nama_unit_kerja', 'ASC')->get();
        $aksesLevel = AksesLevel::orderBy('urutan','ASC')->get();

        $data = [
            'title'      => 'Manajemen Pengguna',
            'user'       => $user,
            'unitKerja'  => $unitKerja,
            'aksesLevel' => $aksesLevel,
            'content'    => 'admin/user/index'
        ];
        return view('admin/layout/wrapper', $data);
    }

    // Proses Tambah Data
    public function proses_tambah(Request $request)
    {
        $request->validate([
            'nama'           => 'required',
            'username'       => 'required|unique:users',
            'password'       => 'required',
            'email'          => 'required|email',
            'id_akses_level' => 'required',
            'gambar'         => 'file|image|mimes:jpeg,png,jpg|max:8024',
        ]);

        // 1. Handling Image Upload
        $image = $request->file('gambar');
        $nama_file = null;

        if ($image) {
            $nama_file = Str::slug(pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME), '-') . '-' . time() . '.' . $image->getClientOriginalExtension();
            $thumbPath = './assets/upload/user/thumbs/';
            $oriPath   = './assets/upload/user/';

            if (!File::isDirectory($thumbPath)) File::makeDirectory($thumbPath, 0777, true, true);

            // Proses Intervention V3
            $manager = new ImageManager(new Driver());
            $img = $manager->read($image);
            $img->cover(150, 150)->save($thumbPath . $nama_file);
            $image->move($oriPath, $nama_file);
        }

        // 2. Change array to string for id_unit_kerja
        $akses_level        = AksesLevel::where('id_akses_level',$request->id_akses_level)->first();

        // 3. Simpan ke Database
        Users::create([
            'posted_by'         => session()->get('id_user') ?? 1,
            'id_unit_kerja'     => $request->id_unit_kerja,
            'id_akses_level'    => $request->id_akses_level,
            'nama'              => $request->nama,
            'email'             => $request->email,
            'username'          => $request->username,
            'password'          => sha1($request->password),
            'akses_level'       => $akses_level->nama_akses_level,
            'gambar'            => $nama_file,
            'status_user'       => $request->status_user ?? 'Aktif',
            'created_by'        => session()->get('id_user') ?? 1,
            'updated_by'        => session()->get('id_user') ?? 1,
            'created_at'        => now()
        ]);

        return redirect('admin/user')->with('sukses', 'Data user berhasil ditambahkan');
    }

    // Form Edit
    public function edit($id_user)
    {
        $user       = Users::where('id_user', $id_user)->firstOrFail();
        $unitKerja  = UnitKerja::orderBy('nama_unit_kerja', 'ASC')->get();
        $aksesLevel = AksesLevel::orderBy('urutan','ASC')->get();

        $data = [
            'title'       => 'Edit Pengguna Website',
            'user'        => $user,
            'unitKerja'   => $unitKerja,
            'aksesLevel'  => $aksesLevel,
            'content'     => 'admin/user/edit'
        ];
        return view('admin/layout/wrapper', $data);
    }

    // Proses Edit Data
    public function proses_edit(Request $request, $id_user)
    {
        $request->validate([
            'nama'        => 'required',
            'email'       => 'required|email',
            'id_akses_level' => 'required',
            'gambar'      => 'file|image|mimes:jpeg,png,jpg|max:8024',
        ]);
        // 2. Cari User yang akan diupdate
        $user = Users::where('id_user', $id_user)->firstOrFail();
        // 3. Handling Array Unit Kerja (Fix: Array to String)
        $akses_level        = AksesLevel::where('id_akses_level',$request->id_akses_level)->first();
        // 4. Siapkan Data Update
        $data_update = [
            'id_unit_kerja'     => $request->id_unit_kerja,
            'id_akses_level'    => $request->id_akses_level,
            'nama'              => $request->nama,
            'email'             => $request->email,
            'username'          => $request->username,
            'akses_level'       => $akses_level->nama_akses_level,
            'status_user'       => $request->status_user ?? 'Aktif',
            'updated_by'        => session()->get('id_user') ?? 1,
        ];
        // 5. Update password jika diisi
        if ($request->filled('password')) {
            $data_update['password'] = sha1($request->password);
        }
        // 6. Handling Gambar Baru
        if ($request->hasFile('gambar')) {
            $image = $request->file('gambar');
            $nama_file = Str::slug(pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME), '-') . '-' . time() . '.' . $image->getClientOriginalExtension();
            $thumbPath = './assets/upload/user/thumbs/';
            $oriPath   = './assets/upload/user/';

            // Hapus file lama jika ada
            if ($user->gambar) {
                if (File::exists($thumbPath . $user->gambar)) File::delete($thumbPath . $user->gambar);
                if (File::exists($oriPath . $user->gambar)) File::delete($oriPath . $user->gambar);
            }
            // Simpan file baru (Intervention Image V3)
            $manager = new ImageManager(new Driver());
            $img = $manager->read($image);
            $img->cover(150, 150)->save($thumbPath . $nama_file);
            $image->move($oriPath, $nama_file);
            $data_update['gambar'] = $nama_file;
        }
        // 7. Eksekusi Update
        Users::where('id_user', $id_user)->update($data_update);
        return redirect('admin/user')->with('sukses', 'Data user berhasil diperbarui');
    }

    // Hapus Data
    public function delete($id_user)
    {
        $user = Users::where('id_user', $id_user)->firstOrFail();
        if ($user->gambar) {
            File::delete('./assets/upload/user/' . $user->gambar);
            File::delete('./assets/upload/user/thumbs/' . $user->gambar);
        }
        $user->delete();
        return redirect('admin/user')->with('sukses', 'User telah dihapus');
    }
}
