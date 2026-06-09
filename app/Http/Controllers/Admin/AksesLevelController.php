<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AksesLevel;
use App\Models\MenuAplikasi;
use App\Models\MenuAplikasiSub;
use App\Models\MenuAkses;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class AksesLevelController extends Controller
{
    /**
     * Menampilkan daftar semua Level Akses
     */
    public function index()
    {
        // Pastikan User Login Terdeteksi
        // Jika Anda ingin debug ID user, hapus komentar baris di bawah ini:
        // dd(Auth::id());

        $aksesLevel = AksesLevel::withCount([
                            'menuAkses as total_menu_aplikasi' => function ($query) {
                                $query->select(DB::raw('count(distinct id_menu_aplikasi)'));
                            },
                            'menuAkses as total_menu_sub' => function ($query) {
                                $query->whereNotNull('id_menu_aplikasi_sub');
                            }
                        ])->orderBy('urutan','ASC')->get();
        $menu       = MenuAplikasi::orderBy('urutan', 'ASC')->get();
        $urutan     = AksesLevel::max('urutan') + 1;
        $total      = AksesLevel::count();

        return view('admin/layout/wrapper', [
            'title'          => 'Level Hak Akses: ' . $total,
            'aksesLevel'     => $aksesLevel,
            'menu'           => $menu,
            'urutan'         => $urutan,
            'content'        => 'admin/akses-level/index',
            'MenuAksesModel' => new MenuAkses(),
        ]);
    }

    /**
     * Proses Simpan (Create) atau Update Data
     */
    public function store(Request $request)
    {
        $request->validate([
            'nama_akses_level' => 'required|string|max:255',
        ]);

        $id = $request->id_akses_level;
        $currentUserId = Auth::id() ?? 1;

        $data = [
            'nama_akses_level'   => $request->nama_akses_level,
            'status_akses_level' => $request->status_akses_level ?? 'aktif',
            'keterangan'         => $request->keterangan,
            'urutan'             => $request->urutan ?? 0,
            'alamat_url'         => $request->alamat_url,
            'updated_by'         => $currentUserId,
            'created_by'            => $currentUserId, // Kolom yang tadinya error
        ];

        if (empty($id)) {
            // Logika CREATE
            $data['created_by'] = $currentUserId;
            AksesLevel::create($data);
            $message = 'Data berhasil ditambahkan';
        } else {
            // Logika UPDATE
            $akses = AksesLevel::where('id_akses_level', $id)->firstOrFail();
            $akses->update($data);
            $message = 'Data berhasil diperbarui';
        }

        return redirect()->back()->with('sukses', $message);
    }

    /**
     * Menampilkan halaman pengaturan menu untuk level tertentu
     */
    public function menu($id)
    {
        $akses_level = AksesLevel::where('id_akses_level', $id)->firstOrFail();
        $menu        = MenuAplikasi::orderBy('urutan', 'ASC')->get();

        return view('admin/layout/wrapper', [
            'akses_level'             => $akses_level,
            'menu'                    => $menu,
            'menu_aplikasi_sub_model' => new MenuAplikasiSub(),
            'menu_akses_model'        => new MenuAkses(),
            'title'                   => 'Atur Menu: ' . $akses_level->nama_akses_level,
            'content'                 => 'admin/akses-level/menu'
        ]);
    }

    /**
     * Memproses update hak akses menu (Checkbox Logic)
     */
    public function prosesMenu(Request $request)
    {
        $request->validate([
            'id_akses_level' => 'required'
        ]);
        $id_akses_level = $request->id_akses_level;
        $currentUserId  = Auth::id() ?? 1;
        DB::transaction(function () use ($request, $id_akses_level, $currentUserId) {
            // 1. Hapus akses lama
            MenuAkses::where('id_akses_level', $id_akses_level)->delete();
            $insertData = [];
            /*
            |--------------------------------------------------------------------------
            | Ambil data menu sekaligus (hindari query di loop)
            |--------------------------------------------------------------------------
            */
            $menus = MenuAplikasi::pluck('urutan', 'id_menu_aplikasi');
            $subs  = MenuAplikasiSub::get()->keyBy('id_menu_aplikasi_sub');
            /*
            |--------------------------------------------------------------------------
            | Simpan Menu Utama
            |--------------------------------------------------------------------------
            */
            if ($request->filled('id_menu_aplikasi')) {
                foreach ($request->id_menu_aplikasi as $id_menu) {

                    $insertData[] = [
                        'id_akses_level'           => $id_akses_level,
                        'id_menu_aplikasi'         => $id_menu,
                        'id_menu_aplikasi_sub'     => 0,
                        'created_by'               => $currentUserId,
                        'urutan_menu_aplikasi'     => $menus[$id_menu] ?? 0,
                        'urutan_menu_aplikasi_sub' => 0
                    ];
                }
            }
            /*
            |--------------------------------------------------------------------------
            | Simpan Sub Menu
            |--------------------------------------------------------------------------
            */
            if ($request->filled('id_menu_aplikasi_sub')) {
                foreach ($request->id_menu_aplikasi_sub as $id_sub) {
                    $sub = $subs[$id_sub] ?? null;
                    if ($sub) {
                        $insertData[] = [
                            'id_akses_level'           => $id_akses_level,
                            'id_menu_aplikasi'         => $sub->id_menu_aplikasi,
                            'id_menu_aplikasi_sub'     => $id_sub,
                            'created_by'               => $currentUserId,
                            'urutan_menu_aplikasi'     => $menus[$sub->id_menu_aplikasi] ?? 0,
                            'urutan_menu_aplikasi_sub' => $sub->urutan_sub ?? 0
                        ];
                    }
                }
            }
            /*
            |--------------------------------------------------------------------------
            | Insert sekaligus (lebih cepat)
            |--------------------------------------------------------------------------
            */
            if (!empty($insertData)) {
                MenuAkses::insert($insertData);
            }
        });
        return redirect('admin/akses-level/menu/' . $id_akses_level)->with('sukses', 'Hak akses menu berhasil diperbarui');
    }


    /**
     * AJAX Get Data untuk Modal Edit
     */
    public function show($id)
    {
        $data = AksesLevel::find($id);

        if ($data) {
            return response()->json(['status' => 'success', 'data' => $data]);
        }
        return response()->json(['status' => 'error', 'message' => 'Data tidak ditemukan'], 404);
    }

    // activate
    public function activate($id_akses_level)
    {
        $akses_level   = AksesLevel::where('id_akses_level',$id_akses_level)->first();
        if($_GET['status']=='Disable') {
            $status_akses_level    = 'Inaktif';
        }elseif($_GET['status']=='Activate') {
            $status_akses_level    = 'Aktif';
        }
        AksesLevel::where('id_akses_level',$id_akses_level)->update([
                'updated_by'            => Session()->get('id_user'),
                'status_akses_level'    => $status_akses_level
            ]);
        return redirect('admin/akses-level')->with(['sukses' => 'Data status unit kerja: '.$akses_level->nama_akses_level.' telah diupdate']);
    }

    /**
     * Hapus Data (Soft Delete jika di model ada trait SoftDeletes)
     */
    public function destroy($id)
    {
        AksesLevel::where('id_akses_level', $id)->delete();
        MenuAkses::where('id_akses_level', $id)->delete();
        // Catat siapa yang menghapus (opsional jika ada kolom deleted_by)
        return redirect()->back()->with('sukses', 'Level akses telah dihapus');
    }
}
