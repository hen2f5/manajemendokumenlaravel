<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Poksi extends Model
{
    use HasFactory;

    protected $table = 'poksi';
    protected $primaryKey = 'id_poksi';
    protected $fillable = [
        'nama_poksi',
        'status_poksi',
        'keterangan'
    ];

    /**
     * Relasi ke User (Satu Unit Kerja punya banyak User)
     */
    public function users(): HasMany
    {
        return $this->hasMany(User::class, 'id_poksi', 'id_poksi');
    }

    /**
     * Satu Poksi memiliki banyak Unit Kerja
     */
    public function unitKerja(): HasMany
    {
        return $this->hasMany(
            UnitKerja::class,
            'id_poksi',
            'id_poksi'
        );
    }

    // --- SCOPES (Pengganti manual Query di Laravel 12) ---

    public function scopeListing($query)
    {
        return $query->with('users')->orderBy('nama_poksi', 'ASC');
    }

    public function scopeAktif($query)
    {
        return $query->where('status_poksi', 'Aktif')->orderBy('nama_poksi', 'ASC');
    }
}
