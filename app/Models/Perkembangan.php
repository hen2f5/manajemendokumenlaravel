<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Perkembangan extends Model
{
    use HasFactory;

    protected $table = 'perkembangan';
    protected $primaryKey = 'id_perkembangan';
    protected $fillable = [
        'nama_perkembangan',
        'status_perkembangan',
        'keterangan'
    ];

    /**
     * Relasi ke User (Satu Unit Kerja punya banyak User)
     */
    public function users(): HasMany
    {
        return $this->hasMany(User::class, 'id_perkembangan', 'id_perkembangan');
    }

    // --- SCOPES (Pengganti manual Query di Laravel 12) ---

    public function scopeListing($query)
    {
        return $query->with('users')->orderBy('nama_perkembangan', 'ASC');
    }

    public function scopeAktif($query)
    {
        return $query->where('status_perkembangan', 'Aktif')->orderBy('nama_perkembangan', 'ASC');
    }
}
