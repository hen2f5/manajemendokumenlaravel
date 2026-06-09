<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Konfigurasi;
use App\Models\Users;
use App\Models\UnitKerja;
use App\Models\AksesLevel;
use Intervention\Image\ImageManager;
use Intervention\Image\Drivers\Gd\Driver;
use Illuminate\Support\Facades\Auth;

class AkunController extends Controller
{
    // index
    public function index()
    {
        $konfigurasi = Konfigurasi::listing();
        $user       = Users::where('id_user', session()->get('id_user'))->firstOrFail();
        $unitKerja  = UnitKerja::orderBy('nama_unit_kerja', 'ASC')->get();
        $aksesLevel = AksesLevel::orderBy('urutan','ASC')->get();

        $data = [   'title'         => 'Selamat datang di '.$konfigurasi->namaweb,
                    'konfigurasi'   => $konfigurasi,
                    'user'          => $user,
                    'unitKerja'     => $unitKerja,
                    'aksesLevel'    => $aksesLevel,
                    'content'       => 'admin.akun.index'
                ];
        return view('admin.layout.wrapper',$data);
    }

    // Proses Edit Data
    public function updateProfile(Request $request)
    {
        $id_user = session()->get('id_user');
        $request->validate([
            'nama'        => 'required',
            'email'       => 'required|email',
            'gambar'      => 'file|image|mimes:jpeg,png,jpg|max:8024',
        ]);
        // 2. Cari User yang akan diupdate
        $user = Users::where('id_user', $id_user)->firstOrFail();
        // 3. Handling Array Unit Kerja (Fix: Array to String)
        // 4. Siapkan Data Update
        $data_update = [
            'nama'              => $request->nama,
            'email'             => $request->email,
            'updated_by'        => session()->get('id_user') ?? 1,
        ];
        
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
        return redirect('admin/akun')->with('sukses', 'Data user berhasil diperbarui');
    }

    // update password
    public function updatePassword(Request $request)
    {
        // Validasi input
        $request->validate([
            'password' => 'required|string|min:6|max:32|same:konfirmasi_password',
            'konfirmasi_password' => 'required'
        ],[
            'password.required' => 'Password wajib diisi',
            'password.min'      => 'Password minimal 6 karakter',
            'password.max'      => 'Password maksimal 32 karakter',
            'password.same'     => 'Password dan konfirmasi password tidak sama'
        ]);


        // Ambil user login
        $id_user = session()->get('id_user');
        $data_update = [
                    'password'              => sha1($request->password),
                    'updated_by'        => session()->get('id_user') ?? 1,
                ];
        Users::where('id_user', $id_user)->update($data_update);
        return redirect('admin/akun')->with('sukses', 'Data password user berhasil diperbarui');
    }

}
