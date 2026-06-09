<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MenuAplikasi extends Model
{
    use HasFactory;

    protected $table = 'menu_aplikasi';
    protected $primaryKey = 'id_menu_aplikasi';
    protected $guarded = [];

    /**
     * Relasi ke Sub Menu
     * Memungkinkan Anda memanggil $menu->submenus
     */
    public function submenus()
    {
        return $this->hasMany(MenuAplikasiSub::class, 'id_menu_aplikasi', 'id_menu_aplikasi')
            ->orderBy('urutan_sub', 'ASC');
    }

    public function submenu()
    {
        return $this->hasMany(MenuAplikasiSub::class, 'id_menu_aplikasi', 'id_menu_aplikasi')
            ->orderBy('urutan_sub', 'ASC');
    }

    public function getAlamatMenuAplikasiAttribute($value)
    {
        if ($value === '#') {
            return '#';
        }

        return url($value);
    }

    public function menu()
    {
        return $this->belongsTo(MenuAplikasi::class, 'id_menu_aplikasi');
    }

    // --- SCOPES (Pengganti method manual agar lebih Laravel-way) ---

    public function scopeListing($query)
    {
        return $query->orderBy('urutan', 'ASC')->get();
    }

    public function scopeAktif($query)
    {
        return $query->where('status_menu_aplikasi', 'Active')->orderBy('urutan', 'ASC');
    }

    // Method check tetap bisa dipertahankan atau gunakan MenuAplikasi::where(...)->first() langsung di controller
    public static function check($nama)
    {
        return self::where('nama_menu_aplikasi', $nama)->first();
    }
}
