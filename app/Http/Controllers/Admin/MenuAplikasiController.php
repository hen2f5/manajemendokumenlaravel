<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MenuAplikasi;
use App\Models\MenuAplikasiSub;
use App\Models\Konfigurasi;
use Illuminate\Support\Facades\Auth;

class MenuAplikasiController extends Controller
{
    public function index()
    {

        $menu_aplikasi = MenuAplikasi::with('submenus')->orderBy('urutan', 'ASC')->get();
        $menu_parent = MenuAplikasi::orderBy('nama_menu_aplikasi', 'ASC')->get();
        $akhir  = MenuAplikasi::orderBy('urutan', 'desc')->first();
        $urutan = $akhir ? $akhir->urutan + 1 : 1;

        $data = [
            'title'             => 'Data Menu Aplikasi',
            'menu_aplikasi'     => $menu_aplikasi,
            'menu_parent'       => $menu_parent,
            'urutan'            => $urutan,
            'content'           => 'admin/menu-aplikasi/index',
        ];
        return view('admin/layout/wrapper', $data);
    }

    // Handle Simpan/Update Menu Utama
    public function storeMenu(Request $request)
    {
        $request->validate([
            'nama_menu_aplikasi' => 'required',
            'status_menu_aplikasi' => 'required'
        ]);

        $id_menu_aplikasi = $request->id_menu_aplikasi;
        $current_user = Auth::id() ?? 1;

        $data = [
            'nama_menu_aplikasi'   => $request->nama_menu_aplikasi,
            'icon_menu_aplikasi'   => $request->icon_menu_aplikasi,
            'alamat_menu_aplikasi' => $request->alamat_menu_aplikasi,
            'keterangan'           => $request->keterangan,
            'urutan'               => $request->urutan ?? 0,
            'status_menu_aplikasi' => $request->status_menu_aplikasi,
            'updated_by'           => $current_user,
            'created_by'           => $current_user,
        ];

        if (empty($id_menu_aplikasi)) {
            // Cek duplikasi nama menu
            if (MenuAplikasi::where('nama_menu_aplikasi', $request->nama_menu_aplikasi)->exists()) {
                return redirect()->back()->with('warning', 'Nama menu sudah ada.')->withInput();
            }
            $data['created_by'] = Auth::id();
            MenuAplikasi::create($data);
            $msg = 'Data menu telah ditambah';
        } else {
            MenuAplikasi::where('id_menu_aplikasi', $id_menu_aplikasi)->update($data);
            $msg = 'Data menu telah diupdate';
        }

        return redirect()->route('admin.menu-aplikasi.index')->with('sukses', $msg);
    }

    // Handle Simpan/Update Sub Menu
    public function storeSub(Request $request)
    {
        $request->validate([
            'nama_menu_aplikasi_sub'    => 'required',
            'alamat_menu_aplikasi_sub'  => 'required',
            'id_menu_aplikasi'          => 'required',
            'status_menu_aplikasi_sub'  => 'required'
        ]);

        $id_menu_aplikasi_sub = $request->id_menu_aplikasi_sub;
        $current_user = Auth::id() ?? 1;

        $data = [
            'id_menu_aplikasi'         => $request->id_menu_aplikasi,
            'nama_menu_aplikasi_sub'   => $request->nama_menu_aplikasi_sub,
            'icon_menu_aplikasi_sub'   => $request->icon_menu_aplikasi_sub,
            'alamat_menu_aplikasi_sub' => $request->alamat_menu_aplikasi_sub,
            'keterangan_sub'               => $request->keterangan_sub,
            'urutan_sub'               => $request->urutan_sub ?? 0,
            'status_menu_aplikasi_sub' => $request->status_menu_aplikasi_sub,
            'updated_by'               => $current_user,
            'created_by'               => $current_user,
        ];

        if (empty($id_menu_aplikasi_sub)) {
            // Cek duplikasi sub menu di parent yang sama
            if (MenuAplikasiSub::where([
                'nama_menu_aplikasi_sub' => $request->nama_menu_aplikasi_sub,
                'id_menu_aplikasi'       => $request->id_menu_aplikasi
            ])->exists()) {
                return redirect()->back()->with('warning', 'Nama sub menu sudah ada pada menu ini.')->withInput();
            }
            $data['created_by'] = Auth::id();
            MenuAplikasiSub::create($data);
            $msg = 'Data sub menu telah ditambah';
        } else {
            MenuAplikasiSub::where('id_menu_aplikasi_sub', $id_menu_aplikasi_sub)->update($data);
            $msg = 'Data sub menu telah diupdate';
        }

        return redirect()->route('admin.menu-aplikasi.index')->with('sukses', $msg);
    }

    // Ambil data Menu Utama untuk Edit (AJAX)
    public function show($id)
    {
        $menu = MenuAplikasi::find($id);
        return $menu
            ? response()->json(['status' => 'success', 'data' => $menu])
            : response()->json(['status' => 'error', 'message' => 'Data tidak ditemukan'], 404);
    }

    // Ambil data Sub Menu untuk Edit (AJAX)
    public function showSub($id)
    {
        $sub = MenuAplikasiSub::find($id);
        return $sub
            ? response()->json(['status' => 'success', 'data' => $sub])
            : response()->json(['status' => 'error', 'message' => 'Data tidak ditemukan'], 404);
    }

    // Hapus Menu Utama
    public function destroy($id)
    {
        // Opsional: Hapus juga sub menu-nya jika menu utama dihapus
        MenuAplikasiSub::where('id_menu_aplikasi', $id)->delete();
        MenuAplikasi::where('id_menu_aplikasi', $id)->delete();

        return redirect()->route('admin.menu-aplikasi.index')->with('sukses', 'Data menu dan sub-menunya telah dihapus');
    }

    // Hapus Sub Menu
    public function destroySub($id)
    {
        MenuAplikasiSub::where('id_menu_aplikasi_sub', $id)->delete();
        return redirect()->route('admin.menu-aplikasi.index')->with('sukses', 'Data sub menu telah dihapus');
    }

    // Update urutan via AJAX (Sortable)
    public function urutkan()
    {
        $menu = MenuAplikasi::with('submenus')->orderBy('urutan', 'asc')->get();
        $data = [
            'title'             => 'Urutkan Menu Aplikasi',
            'menu'              => $menu,
            'content'           => 'admin/menu-aplikasi/urutkan',
        ];
        return view('admin/layout/wrapper', $data);
    }

    // Update urutan via AJAX
    public function urutkanMenu(Request $request)
    {
        $data = $request->menus;
        foreach ($data as $row) {
            MenuAplikasi::where('id_menu_aplikasi', $row['id_menu_aplikasi'])->update(['urutan' => $row['urutan']]);
        }
        return response()->json(['status' => 'success']);
    }

    // getUrutanSub
    public function getUrutanSub(Request $request)
    {
        $id_menu = $request->id_menu_aplikasi;
        $max = MenuAplikasiSub::where('id_menu_aplikasi',$id_menu)->max('urutan_sub');
        $next = ($max ?? 0) + 1;
        return response()->json([
            'status' => 'success',
            'urutan_sub' => $next
        ]);
    }

}
