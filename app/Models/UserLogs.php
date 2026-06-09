<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserLogs extends Model
{
    protected $table = 'user_logs';

    protected $primaryKey = 'id_user_log';

    public $timestamps = false;

    protected $fillable = [
        'id_user',
        'username',
        'ip_address',
        'url',
        'user_agent'
    ];
}
