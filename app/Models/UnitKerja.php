<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class UnitKerja extends Model
{
    use HasFactory;

    protected $table = 'unit_kerja';
    protected $primaryKey = 'id_unit_kerja';
    protected $fillable = [
        'nama_unit_kerja',
        'status_unit_kerja',
        'keterangan'
    ];

    /**
     * Relasi ke User (Satu Unit Kerja punya banyak User)
     */
    public function users(): HasMany
    {
        return $this->hasMany(User::class, 'id_unit_kerja', 'id_unit_kerja');
    }

    // --- SCOPES (Pengganti manual Query di Laravel 12) ---

    public function scopeListing($query)
    {
        return $query->with('users')->orderBy('nama_unit_kerja', 'ASC');
    }

    public function scopeAktif($query)
    {
        return $query->where('status_unit_kerja', 'Aktif')->orderBy('nama_unit_kerja', 'ASC');
    }
}
