<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\SubJenisDokumen;
use App\Models\Dokumen;

class JenisDokumen extends Model
{
    use HasFactory;

    protected $table = 'jenis_dokumen';
    protected $primaryKey = 'id_jenis_dokumen';
    protected $fillable = [
        'nama_jenis_dokumen',
        'status_jenis_dokumen',
        'keterangan'
    ];

    public function scopeListing($query)
    {
        return $query->with(['users'])
            ->withCount('dokumen')
            ->orderBy('urutan', 'ASC');
    }

    public function dokumen(): HasMany
    {
        return $this->hasMany(
            Dokumen::class,
            'id_jenis_dokumen',
            'id_jenis_dokumen'
        );
    }

    // listing
    public function scopeDenganSubJenis($query)
    {
        return $query->with([
            'subJenisDokumen' => function ($q) {
                $q->orderBy('nama_sub_jenis_dokumen','ASC');
            }
        ])->orderBy('nama_jenis_dokumen','ASC');
    }

    // subJenisDokumen
    public function subJenisDokumen(): HasMany
    {
        return $this->hasMany(
            SubJenisDokumen::class,
            'id_jenis_dokumen',
            'id_jenis_dokumen'
        );
    }

    /**
     * Relasi ke User (Satu Unit Kerja punya banyak User)
     */
    public function users(): HasMany
    {
        return $this->hasMany(User::class, 'created_by', 'id_jenis_dokumen');
    }

    public function scopeAktif($query)
    {
        return $query->where('status_jenis_dokumen', 'Aktif')->orderBy('nama_jenis_dokumen', 'ASC');
    }
}
