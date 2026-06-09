<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Album extends Model
{
    use SoftDeletes;

    protected $table = 'album';
    protected $primaryKey = 'id_album';

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'id_unit_kerja',
        'slug_album',
        'nama_album',
        'keterangan',
        'gambar',
        'created_by',
        'updated_by',
        'deleted_by'
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime'
    ];

    /*
    |--------------------------------------------------------------------------
    | RELASI
    |--------------------------------------------------------------------------
    */

    public function unitKerja()
    {
        return $this->belongsTo(UnitKerja::class, 'id_unit_kerja');
    }

    public function dokumen()
    {
        return $this->hasMany(Dokumen::class, 'id_album');
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
