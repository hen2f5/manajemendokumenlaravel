<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Konfigurasi;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;
use Illuminate\Support\Str;

class KonfigurasiController extends Controller
{
    // Tampilan utama konfigurasi
    public function index(): View
    {
        $konfigurasi = Konfigurasi::first();
        $data = [
            'title'         => 'Konfigurasi Website',
            'konfigurasi'   => $konfigurasi,
            'content'       => 'admin.konfigurasi.index'
        ];
        return view('admin.layout.wrapper', $data);
    }

    // Email
    public function email(Request $request): View|RedirectResponse
    {
        $konfigurasi = Konfigurasi::first();
        if ($request->isMethod('post')) {
            $request->validate([
                'smtp_host'     => 'required',
                'smtp_port'     => 'required|numeric',
                'smtp_username' => 'required|email',
                'smtp_password' => 'required',
            ]);
            $data = $request->only(['smtp_host', 'smtp_port', 'smtp_username', 'smtp_password']);
            $data['id_user'] = Auth::id();
            $konfigurasi->update($data);
            return redirect()->back()->with('sukses', 'Data Email telah diupdate');
        }
        return view('admin.layout.wrapper', [
            'title'       => 'Konfigurasi Email SMTP',
            'konfigurasi' => $konfigurasi,
            'content'     => 'admin.konfigurasi.email'
        ]);
    }

    // view profil
    public function profil()
    {
        $konfigurasi = Konfigurasi::first();
        $data = array(
            'title'               => 'Profil ' . $konfigurasi->namaweb,
            'konfigurasi'         => $konfigurasi,
            'content'             => 'admin/konfigurasi/profil'
        );
        return view('admin/layout/wrapper', $data);
    }

    // unggah
    public function unggah()
    {
        $konfigurasi = Konfigurasi::first();
        $data = array(
            'title'               => 'Setting Unggahan File - ' . $konfigurasi->namaweb,
            'konfigurasi'         => $konfigurasi,
            'content'             => 'admin/konfigurasi/unggah'
        );
        return view('admin/layout/wrapper', $data);
    }

    // prosesProfil
    public function updateProfil(Request $request): RedirectResponse
    {
        // Validasi
        $request->validate([
            'id_konfigurasi' => 'required',
            'nama_singkat'   => 'required',
            'gambar'         => 'nullable|image|mimes:jpeg,png,jpg|max:8024',
        ]);
        $konfigurasi = Konfigurasi::findOrFail($request->id_konfigurasi);
        $currentUserId = Auth::id() ?? 1;
        // Setup Path (Samakan dengan fungsi uploadGambar sebelumnya)
        $path = './assets/upload/image';
        $thumbPath = $path . '/thumbs';
        // Buat folder jika belum ada
        if (!File::isDirectory($path)) File::makeDirectory($path, 0777, true, true);
        if (!File::isDirectory($thumbPath)) File::makeDirectory($thumbPath, 0777, true, true);
        $dataUpdate = [
            'id_user'      => $currentUserId,
            'nama_singkat' => $request->nama_singkat,
            'tentang'      => $request->tentang,
        ];
        // Cek jika ada upload gambar
        if ($request->hasFile('gambar')) {
            $image = $request->file('gambar');
            $namaFile = Str::slug(pathinfo($image->getClientOriginalName(), PATHINFO_FILENAME)) . '-' . time() . '.' . $image->getClientOriginalExtension();

            // Hapus gambar lama jika ada
            if ($konfigurasi->gambar) {
                File::delete($path . '/' . $konfigurasi->gambar);
                File::delete($thumbPath . '/' . $konfigurasi->gambar);
            }
            // Simpan file asli
            $image->move($path, $namaFile);
            // Buat thumbnail (Menggunakan File::copy agar simpel seperti fungsi logo)
            // Jika ingin resize beneran, aktifkan library Intervention Image
            File::copy($path . '/' . $namaFile, $thumbPath . '/' . $namaFile);
            $dataUpdate['gambar'] = $namaFile;
        }
        // Update menggunakan Eloquent (lebih disarankan daripada DB::table)
        $konfigurasi->update($dataUpdate);
        return redirect('admin/konfigurasi/profil')->with('sukses', 'Profil dan gambar berhasil diperbarui');
    }

    // Update Konfigurasi Umum
    public function updateUnggah(Request $request): RedirectResponse
    {
        $request->validate([
            'ukuran_file_kb' => 'required',
            'ukuran_file_mb'   => 'required',
        ]);
        $konfigurasi = Konfigurasi::first();
        // Konversi tanggal
        Konfigurasi::where('id_konfigurasi',$konfigurasi->id_konfigurasi)->update([
            'ukuran_file_kb'    => $request->ukuran_file_kb,
            'ukuran_file_mb'    => $request->ukuran_file_mb,
            'pagination'        => $request->pagination,
            'ekstensi_file'      => strtolower($request->ekstensi_file),
            'jumlah_file_maksimal'  => $request->jumlah_file_maksimal,
            'id_user'           => Auth::id(),
        ]);
        return redirect('admin/konfigurasi/unggah')->with('sukses', 'Konfigurasi unggahan berhasil diperbarui');
    }

    // Update Konfigurasi Umum
    public function update(Request $request): RedirectResponse
    {
        $request->validate([
            'namaweb' => 'required|min:3',
            'email'   => 'required|email',
        ]);
        $konfigurasi = Konfigurasi::first();
        // Konversi tanggal
        Konfigurasi::where('id_konfigurasi',$konfigurasi->id_konfigurasi)->update([
            'namaweb'           => $request->namaweb,
            'nama_singkat'      => $request->nama_singkat,
            'singkatan'         => $request->singkatan,
            'tagline'           => $request->tagline,
            'tagline2'          => $request->tagline2,
            'tentang'           => $request->tentang,
            'website'           => $request->website,
            'email'             => $request->email,
            'email_cadangan'    => $request->email_cadangan,
            'alamat'            => $request->alamat,
            'telepon'           => $request->telepon,
            'hp'                => $request->hp,
            'fax'               => $request->fax,
            'deskripsi'         => $request->deskripsi,
            'keywords'          => $request->keywords,
            'metatext'          => $request->metatext,
            'facebook'          => $request->facebook,
            'twitter'           => $request->twitter,
            'instagram'         => $request->instagram,
            'nama_facebook'     => $request->nama_facebook,
            'nama_twitter'      => $request->nama_twitter,
            'nama_instagram'    => $request->nama_instagram,
            'google_map'        => $request->google_map,
            'id_user'           => Auth::id(),
        ]);
        return redirect()->back()->with('sukses', 'Konfigurasi berhasil diperbarui');
    }

    // Update Logo, Icon, atau Gambar Login
    public function uploadGambar(Request $request, string $tipe): RedirectResponse
    {
        $request->validate([
            $tipe => 'required|image|mimes:jpg,jpeg,png,gif,svg|max:4096'
        ]);
        $konfigurasi = Konfigurasi::first();
        if ($request->hasFile($tipe)) {
            $file      = $request->file($tipe);
            $namaBaru  = $file->hashName();
            $pathImage = './assets/upload/image/';
            $pathThumb = './assets/upload/image/thumbs/';
            // Hapus file lama
            if (!empty($konfigurasi->$tipe)) {
                $oldImage = $pathImage . $konfigurasi->$tipe;
                $oldThumb = $pathThumb . $konfigurasi->$tipe;
                if (File::exists($oldImage)) {
                    File::delete($oldImage);
                }
                if (File::exists($oldThumb)) {
                    File::delete($oldThumb);
                }
            }
            // Upload file
            $file->move($pathImage, $namaBaru);
            // Copy ke folder thumbs
            File::copy(
                $pathImage . $namaBaru,
                $pathThumb . $namaBaru
            );
            // Update database
            $konfigurasi->update([
                $tipe    => $namaBaru,
                'id_user'=> Auth::id() ?? 1
            ]);
        }
        return redirect()->back()->with('sukses', "Data $tipe berhasil diperbarui");
    }

    // Update logo
    public function logo(): View
    {
        $data = [
            'konfigurasi' => Konfigurasi::first(),
            'title'       => 'Update Logo',
            'content'     => 'admin.konfigurasi.logo'
        ];
        return view('admin.layout.wrapper', $data);
    }

    // update icon
    public function icon(): View
    {
        $data = [
            'konfigurasi' => Konfigurasi::first(),
            'title'       => 'Update Icon',
            'content'     => 'admin.konfigurasi.icon'
        ];
        return view('admin.layout.wrapper', $data);
    }

    // update seo
    public function seo(Request $request): View|RedirectResponse
    {
        $konfigurasi = Konfigurasi::first();
        if ($request->isMethod('post')) {
            $konfigurasi->update($request->only(['keywords', 'metatext']));
            return redirect()->back()->with('sukses', 'Data SEO telah diupdate');
        }
        return view('admin.konfigurasi.seo', [
            'title'       => 'Konfigurasi SEO Website',
            'konfigurasi' => $konfigurasi
        ]);
    }

    // updateEmail
    public function updateEmail(Request $request)
    {
        request()->validate([
                            'protocol'          => 'required',
                            'smtp_host'          => 'required',
                            'smtp_port'          => 'required',
                            'smtp_timeout'       => 'required',
                            'smtp_user'          => 'required',
                            'smtp_pass'          => 'required'
                            ]);
        $konfigurasi = Konfigurasi::first();
       Konfigurasi::where('id_konfigurasi',$konfigurasi->id_konfigurasi)->update([
            'protocol'          => $request->protocol,
            'smtp_host'         => $request->smtp_host,
            'smtp_port'         => $request->smtp_port,
            'smtp_timeout'      => $request->smtp_timeout,
            'smtp_user'         => $request->smtp_user,
            'smtp_pass'         => $request->smtp_pass,
            'id_user'           => Session()->get('id_user'),
        ]);
        return redirect('admin/konfigurasi/email')->with(['sukses' => 'Data setting email telah diupdate']);
    }
}
