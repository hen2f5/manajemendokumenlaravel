<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MenuAplikasiSub extends Model
{
    use HasFactory;

    // Nama tabel di database
    protected $table = 'menu_aplikasi_sub';

    // Primary Key (Pastikan ini sesuai dengan struktur DB Anda)
    protected $primaryKey = 'id_menu_aplikasi_sub';

    // Izinkan pengisian massal untuk mempermudah create/update di Controller
    protected $guarded = [];

    /**
     * Relasi ke Menu Utama (BelongsTo)
     * Menghubungkan Sub Menu kembali ke Parent-nya
     */
    public function menuAplikasi()
    {
        return $this->belongsTo(MenuAplikasi::class, 'id_menu_aplikasi', 'id_menu_aplikasi');
    }

    public function getAlamatMenuAplikasiSubAttribute($value)
    {
        if ($value === '#') {
            return '#';
        }

        return url($value);
    }

    // --- SCOPES & HELPER METHODS ---

    /**
     * Mengambil semua sub menu diurutkan berdasarkan urutan_sub
     */
    public function scopeListing($query)
    {
        return $query->orderBy('urutan_sub', 'ASC')->get();
    }

    /**
     * Mengambil sub menu berdasarkan Parent (Menu Utama)
     */
    public function scopeByMenu($query, $id_menu_aplikasi)
    {
        return $query->where('id_menu_aplikasi', $id_menu_aplikasi)
            ->orderBy('urutan_sub', 'ASC')
            ->get();
    }

    /**
     * Mendapatkan nomor urutan terakhir dalam satu menu yang sama
     */
    public static function nextUrutan($id_menu_aplikasi)
    {
        $last = self::where('id_menu_aplikasi', $id_menu_aplikasi)->max('urutan_sub');
        return $last ? $last + 1 : 1;
    }
}
