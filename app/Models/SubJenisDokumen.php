<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class SubJenisDokumen extends Model
{
    use HasFactory;

    protected $table = 'sub_jenis_dokumen';
    protected $primaryKey = 'id_sub_jenis_dokumen';

    protected $fillable = [
        'id_jenis_dokumen',
        'nama_sub_jenis_dokumen',
        'status_sub_jenis_dokumen',
        'keterangan'
    ];

    /**
     * Relasi ke Jenis Dokumen
     */
    public function jenisDokumen(): BelongsTo
    {
        return $this->belongsTo(
            JenisDokumen::class,
            'id_jenis_dokumen',
            'id_jenis_dokumen'
        );
    }

    // Scope data aktif
    public function scopeAktif($query)
    {
        return $query->where('status_sub_jenis_dokumen', 'Aktif')
                     ->orderBy('nama_sub_jenis_dokumen','ASC');
    }
}