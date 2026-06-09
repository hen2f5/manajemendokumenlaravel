<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\JenisDokumen;
use App\Models\SubJenisDokumen;

class Dokumen extends Model
{
    use SoftDeletes;

    protected $table = 'dokumen';
    protected $primaryKey = 'id_dokumen';

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'id_jenis_dokumen',
        'id_sub_jenis_dokumen',
        'id_perkembangan',
        'id_unit_kerja',
        'id_album',
        'kode_dokumen',
        'nama_dokumen',
        'keterangan',
        'nama_file',
        'ekstensi_file',
        'ukuran_file',
        'hits',
        'unduh',
        'tahun',
        'thbl',
        'created_by',
        'updated_by',
        'deleted_by'
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    // listing
    public static function listing($paginate)
    {
        
    }

    // increment
    public function tambahHits()
    {
        $this->increment('hits');
    }

    public static function tambahUnduh()
    {
        $this->increment('unduh');
    }

    // path
    public function getFileUrlAttribute()
    {
        return asset('./assets/upload/dokumen/'.$this->nama_file);
    }

    /*
    |--------------------------------------------------------------------------
    | RELASI MASTER
    |--------------------------------------------------------------------------
    */

    public function jenisDokumen()
    {
        return $this->belongsTo(JenisDokumen::class, 'id_jenis_dokumen', 'id_jenis_dokumen');
    }

    public function subJenisDokumen()
    {
        return $this->belongsTo(SubJenisDokumen::class, 'id_sub_jenis_dokumen', 'id_sub_jenis_dokumen');
    }

    public function perkembangan()
    {
        return $this->belongsTo(Perkembangan::class, 'id_perkembangan', 'id_perkembangan');
    }

    public function unitKerja()
    {
        return $this->belongsTo(UnitKerja::class, 'id_unit_kerja');
    }

    public function album()
    {
        return $this->belongsTo(Album::class, 'id_album','id_album');
    }

    /*
    |--------------------------------------------------------------------------
    | RELASI USER
    |--------------------------------------------------------------------------
    */

    public function createdBy()
    {
        return $this->belongsTo(User::class, 'created_by', 'id_user');
    }

    public function updatedBy()
    {
        return $this->belongsTo(User::class, 'updated_by', 'id_user');
    }

    public function deletedBy()
    {
        return $this->belongsTo(User::class, 'deleted_by', 'id_user');
    }
}
