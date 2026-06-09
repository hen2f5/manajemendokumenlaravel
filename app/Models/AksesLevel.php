<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Relations\BelongsTo; // Import relasi
use Illuminate\Support\Str;
use App\Models\MenuAkses;

class AksesLevel extends Model
{
    use HasFactory;

    protected $table = 'akses_level';
    protected $primaryKey = 'id_akses_level';
    protected $guarded = [];

    public function menuAkses()
    {
        return $this->hasMany(MenuAkses::class, 'id_akses_level', 'id_akses_level');
    }

    // Menggantikan fungsi listing()
    public static function listing()
    {
        return self::orderBy('id_akses_level', 'DESC')->get();
    }

    // Menggantikan fungsi detail()
    public static function detail($id)
    {
        return self::where('id_akses_level', $id)->first();
    }

    public function menu_aplikasi(): BelongsTo
    {
        return $this->belongsTo(MenuAkses::class, 'id_menu_akses', 'id_menu_akses');
    }
}
