<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

class Users extends Authenticatable
{
    use Notifiable;

    protected $table = 'users';
    protected $primaryKey = 'id_user'; // Sudah benar

    // TAMBAHKAN INI: Beritahu Laravel id_user adalah auto-increment
    public $incrementing = true;
    protected $keyType = 'int';

    public $timestamps = false;
    protected $guarded = [];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    // Relasi Unit Kerja
    public function unitKerja(): BelongsTo
    {
        return $this->belongsTo(UnitKerja::class, 'id_unit_kerja', 'id_unit_kerja');
    }

    public function aksesLevel()
    {
        return $this->belongsTo(AksesLevel::class, 'id_akses_level', 'id_akses_level');
    }

    // --- Static Methods ---

    // HAPUS atau JANGAN PAKAI method ini lagi karena ini pakai SHA1 (Bikin Error)
    // Gunakan Auth::attempt di Controller sebagai gantinya
    public static function login($username, $password)
    {
        return self::where('username', $username)
            ->where('password', sha1($password))
            ->first();
    }

    public static function getAllData()
    {
        return self::with('unitKerja')->orderBy('id_user', 'DESC')->get();
    }

    public static function getDetail($id_user)
    {
        return self::with('unitKerja')->where('id_user', $id_user)->first();
    }

    // UPDATE: Gunakan Bcrypt (Hash::make) bukan sha1
    public static function updatePasswordByToken($token, $passwordBaru)
    {
        $user = self::where('token_password', $token)->first();

        if ($user) {
            $user->update([
                'password' => Hash::make($passwordBaru), // GANTI KE BCRYPT
                'token_password' => null
            ]);
            return true;
        }
        return false;
    }

    // app/Models/Users.php

    public function getKeyName()
    {
        return 'id_user';
    }

    /**
     * TAMBAHKAN INI: Memastikan Guard Laravel mengambil NILAI dari id_user
     */
    public function getAuthIdentifier()
    {
        return $this->id_user;
    }

    /**
     * Tetap pastikan ini ada
     */
    public function getAuthIdentifierName()
    {
        return 'id_user';
    }

    // Hindari error remember_token jika kolomnya belum ada di DB
    public function getRememberTokenName()
    {
        return '';
    }
    public function setRememberToken($value) {}
    public function getRememberToken()
    {
        return null;
    }

    public function dokumenCreated()
    {
        return $this->hasMany(Dokumen::class, 'created_by', 'id_user');
    }

    public function dokumenUpdated()
    {
        return $this->hasMany(Dokumen::class, 'updated_by', 'id_user');
    }

}
