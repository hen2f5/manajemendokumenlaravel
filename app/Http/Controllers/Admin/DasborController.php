<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Konfigurasi;
use App\Models\JenisDokumen;
use App\Models\SubJenisDokumen;
use App\Models\Dokumen;
use App\Models\Album;
use App\Models\Perkembangan;
use App\Models\UnitKerja;
use App\Models\Users;

class DasborController extends Controller
{
    // index
    public function index()
    {
        $konfigurasi    = Konfigurasi::listing();

        $data = [   'title'         => 'Selamat datang di '.$konfigurasi->namaweb,
                    'konfigurasi'   => $konfigurasi,
                    'dokumen'       => Dokumen::count(),
                    'jenisdokumen'        => JenisDokumen::count(),
                    'subjenisdokumen'     => SubJenisDokumen::count(),
                    'perkembangan'  => Perkembangan::count(),
                    'album'         => Album::count(),
                    'unitkerja'     => UnitKerja::count(),
                    'user'          => Users::count(),
                    'content'       => 'admin.dasbor.index'
                ];
        return view('admin.layout.wrapper',$data);
    }

}
