<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Collection;

class MenuAkses extends Model
{
    protected $table      = 'menu_akses';
    protected $primaryKey = 'id_menu_akses';
    protected $fillable   = [
        'id_user',
        'id_menu_aplikasi',
        'id_menu_aplikasi_sub',
        'id_akses_level',
        'urutan_menu_aplikasi',
        'urutan_menu_aplikasi_sub'
    ];
    public $timestamps    = false; // Set true jika ada created_at/updated_at

    // Ambil semua data
    public function listing(): Collection
    {
        return self::orderBy('urutan_menu_aplikasi', 'ASC')->get();
    }

    public static function getMenuByAksesLevel($id_akses_level)
    {
        return MenuAplikasi::select(
                'menu_aplikasi.id_menu_aplikasi',
                'menu_aplikasi.nama_menu_aplikasi',
                'menu_aplikasi.icon_menu_aplikasi',
                'menu_aplikasi.alamat_menu_aplikasi',
                'menu_aplikasi.urutan'
            )
            ->join('menu_akses', 'menu_akses.id_menu_aplikasi', '=', 'menu_aplikasi.id_menu_aplikasi')
            ->where('menu_akses.id_akses_level', $id_akses_level)
            ->where('menu_akses.id_menu_aplikasi_sub', 0)
            ->with(['submenu' => function ($q) use ($id_akses_level) {
                $q->join('menu_akses', 'menu_akses.id_menu_aplikasi_sub', '=', 'menu_aplikasi_sub.id_menu_aplikasi_sub')
                  ->where('menu_akses.id_akses_level', $id_akses_level)
                  ->select(
                      'menu_aplikasi_sub.id_menu_aplikasi_sub',
                      'menu_aplikasi_sub.id_menu_aplikasi',
                      'menu_aplikasi_sub.nama_menu_aplikasi_sub',
                      'menu_aplikasi_sub.icon_menu_aplikasi_sub',
                      'menu_aplikasi_sub.alamat_menu_aplikasi_sub',
                      'menu_aplikasi_sub.urutan_sub'
                  )
                  ->orderBy('menu_aplikasi_sub.urutan_sub', 'ASC');
            }])
            ->orderBy('menu_aplikasi.urutan', 'ASC')
            ->get();
    }


    

    // Ambil Menu Utama berdasarkan Level
    public function getMenuAksesLevel($id_akses_level): Collection
    {
        return self::select('menu_akses.*', 
                    'menu_aplikasi.nama_menu_aplikasi', 
                    'menu_aplikasi.icon_menu_aplikasi')
            ->join('menu_aplikasi', 'menu_aplikasi.id_menu_aplikasi', '=', 'menu_akses.id_menu_aplikasi')
            ->where('menu_akses.id_akses_level', $id_akses_level)
            ->where('menu_akses.id_menu_aplikasi_sub', 0)
            ->orderBy('menu_aplikasi.urutan', 'ASC')
            ->get();
    }

    // Ambil Submenu berdasarkan Level
    public function getMenuAplikasiSubAksesLevel($id_akses_level, $id_menu_aplikasi): Collection
    {
        return self::select('menu_akses.*', 'menu_aplikasi_sub.nama_menu_aplikasi_sub', 'menu_aplikasi_sub.alamat_menu_aplikasi_sub')
            ->join('menu_aplikasi_sub', 'menu_aplikasi_sub.id_menu_aplikasi_sub', '=', 'menu_akses.id_menu_aplikasi_sub')
            ->where('menu_akses.id_akses_level', $id_akses_level)
            ->where('menu_akses.id_menu_aplikasi', $id_menu_aplikasi)
            ->orderBy('menu_aplikasi_sub.urutan', 'ASC')
            ->get();
    }

    // Cek apakah user punya akses ke URL ini (Sangat Simpel)
    public function checkLevelMenu($id_akses_level, $alamat): int
    {
        return self::leftJoin('menu_aplikasi', 'menu_aplikasi.id_menu_aplikasi', '=', 'menu_akses.id_menu_aplikasi')
            ->leftJoin('menu_aplikasi_sub', 'menu_aplikasi_sub.id_menu_aplikasi_sub', '=', 'menu_akses.id_menu_aplikasi_sub')
            ->where('menu_akses.id_akses_level', $id_akses_level)
            ->where(fn($q) => $q->where('menu_aplikasi.alamat_menu_aplikasi', $alamat)
                ->orWhere('menu_aplikasi_sub.alamat_menu_aplikasi_sub', $alamat))
            ->count();
    }

    // Simpan data (Bisa pakai create langsung di Controller, tapi ini untuk shortcut)
    public function simpan(array $data)
    {
        return self::create($data);
    }

    // Hapus semua akses per level
    public function delete_akses_level($id_akses_level)
    {
        return self::where('id_akses_level', $id_akses_level)->delete();
    }

    public function menu_aplikasi()
    {
        return $this->belongsTo(MenuAplikasi::class, 'id_menu_aplikasi', 'id_menu_aplikasi');
    }
}
