<?php

namespace App\Http\Controllers\Api;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\MenuAplikasi;
use App\Models\MenuAplikasiSub;
use App\Models\Konfigurasi;
use App\Models\MenuAkses;

class MenuAplikasiController extends Controller
{
    protected $menu_aplikasi;
    protected $menu_aplikasi_sub;
    protected $m_konfigurasi;

    public function __construct()
    {
        $this->menu_aplikasi        = new MenuAplikasi();
        $this->menu_aplikasi_sub    = new MenuAplikasiSub();
        $this->m_konfigurasi        = new Konfigurasi();
    }

    // index
    public function index()
    {
        $id_akses_level = auth()->user()->id_akses_level;
        $menu = MenuAkses::getMenuByAksesLevel($id_akses_level);
        return response()->json($menu);
    }
}
