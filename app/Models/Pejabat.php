<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Builder;

class Pejabat extends Model
{
    protected $table      = 'pejabat';
    protected $primaryKey = 'id_pejabat';

    // Mengizinkan semua kolom diisi (Pengganti fillable)
    protected $guarded = [];

    /**
     * Relasi ke Unit Kerja
     */
    public function unitKerja(): BelongsTo
    {
        return $this->belongsTo(UnitKerja::class, 'id_unit_kerja', 'id_unit_kerja');
    }

    /**
     * Scope untuk otomatis Join/Eager Load Unit Kerja
     */
    public function scopeWithUnit(Builder $query): void
    {
        $query->with('unitKerja');
    }

    /**
     * Menampilkan semua data pejabat
     */
    public static function listing()
    {
        return self::withUnit()->orderBy('id_user', 'DESC')->get();
    }

    /**
     * Filter Pejabat Fakultas (id_unit_kerja kosong/0)
     */
    public static function fakultas()
    {
        return self::withUnit()
            ->whereIn('id_unit_kerja', ['0', '', null])
            ->orderBy('id_user', 'DESC')
            ->get();
    }

    /**
     * Pimpinan Fakultas berdasarkan urutan
     */
    public static function pimpinanFakultas($urutan)
    {
        return self::withUnit()
            ->whereIn('id_unit_kerja', ['0', '', null])
            ->where('status_pimpinan', 'Ya')
            ->where('urutan', $urutan)
            ->first();
    }

    /**
     * Ambil pejabat berdasarkan Unit Kerja tertentu
     */
    public static function getByUnitKerja($id_unit_kerja)
    {
        return self::withUnit()
            ->where('id_unit_kerja', $id_unit_kerja)
            ->orderBy('id_user', 'DESC')
            ->get();
    }

    /**
     * Ambil pejabat berdasarkan Unit Kerja dan Status Pimpinan
     */
    public static function pejabatUnit($id_unit_kerja, $status_pimpinan)
    {
        return self::withUnit()
            ->where([
                'id_unit_kerja'   => $id_unit_kerja,
                'status_pimpinan' => $status_pimpinan
            ])
            ->orderBy('urutan', 'ASC')
            ->get();
    }

    /**
     * Hitung total pejabat dalam unit tertentu
     */
    public static function totalPejabat($id_unit_kerja, $status_pimpinan)
    {
        return self::where([
            'id_unit_kerja'   => $id_unit_kerja,
            'status_pimpinan' => $status_pimpinan
        ])->count();
    }

    /**
     * Ambil detail pejabat berdasarkan ID
     */
    public static function detail($id_user)
    {
        return self::withUnit()->find($id_user);
    }
}
