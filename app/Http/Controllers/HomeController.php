<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Konfigurasi;

class HomeController extends Controller
{
    // index
    public function index()
    {
        $konfigurasi = Konfigurasi::listing();

        $data = [   'title'         => 'Selamat datang di '.$konfigurasi->namaweb,
                    'konfigurasi'   => $konfigurasi,
                    'description'   => $konfigurasi->namaweb.' | '.$konfigurasi->tagline,
                    'keywords'      => $konfigurasi->namaweb.' | '.$konfigurasi->tagline,
                    'content'       => 'home.index'
                ];
        return view('layout.wrapper',$data);
    }

}
