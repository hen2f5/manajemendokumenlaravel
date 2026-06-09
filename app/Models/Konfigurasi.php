<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Konfigurasi extends Model
{
    use HasFactory;

    protected $table = 'konfigurasi';
    protected $primaryKey = 'id_konfigurasi';
    public $timestamps = false;
    public $guarded = [];

    // --- LOGIKA HELPER (Sesuai dengan Model CI4 kamu) ---

    /**
     * Method listing()
     * Mengambil satu baris data terakhir berdasarkan id_konfigurasi.
     */
    public static function listing()
    {
        return self::orderBy('id_konfigurasi', 'DESC')->first();
    }

    /**
     * Method edit()
     * Laravel biasanya melakukan update langsung via Controller, 
     * tapi ini versi yang mengikuti logika CI4 kamu.
     */
    public function edit($data)
    {
        return $this->where('id_konfigurasi', $data['id_konfigurasi'])
            ->update($data);
    }
}
