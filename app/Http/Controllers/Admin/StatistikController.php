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
use App\Models\Users;
use App\Models\UnitKerja;

class StatistikController extends Controller
{
    // index
    public function index()
    {
        $konfigurasi = Konfigurasi::listing();

        $data = [   'title'         => 'Statistik Dokumen',
                    'konfigurasi'   => $konfigurasi,
                    'content'       => 'admin.statistik.index'
                ];
        return view('admin.layout.wrapper',$data);
    }

    // jenisDokumen
    public function jenisDokumen()
    {
        $jenis_dokumen  = JenisDokumen::listing()->get();
        $data           = array();
        foreach ($jenis_dokumen as $item) {
            $data[] = [ 'id_jenis_dokumen'      => $item->id_jenis_dokumen,
                        'urutan'                => $item->urutan,
                        'nama_jenis_dokumen'    => $item->nama_jenis_dokumen,
                        'value'                 => $item->dokumen_count,
                    ];
        }
        return response()->json($data);
    }

    // subJenisDokumen
    public function subJenisDokumen()
    {
        $datalist   = SubJenisDokumen::all();
        $data       = array();
        foreach ($datalist as $item) {
            $total = Dokumen::where('id_sub_jenis_dokumen',$item->id_sub_jenis_dokumen)->count();
            $data[] = [ 'id_sub_jenis_dokumen'      => $item->id_sub_jenis_dokumen,
                        'urutan'                    => $item->urutan,
                        'nama_sub_jenis_dokumen'    => $item->nama_sub_jenis_dokumen,
                        'value'                     => $total,
                    ];
        }
        return response()->json($data);
    }

    // perkembangan
    public function perkembangan()
    {
        $datalist   = Perkembangan::all();
        $data       = array();
        foreach ($datalist as $item) {
            $total = Dokumen::where('id_perkembangan',$item->id_perkembangan)->count();
            $data[] = [ 'id_perkembangan'       => $item->id_perkembangan,
                        'urutan'                => $item->urutan,
                        'nama_perkembangan'     => $item->nama_perkembangan,
                        'value'                 => $total,
                    ];
        }
        return response()->json($data);
    }

    // album
    public function album()
    {
        $datalist   = Album::all();
        $data       = array();
        foreach ($datalist as $item) {
            $total = Dokumen::where('id_album',$item->id_album)->count();
            $data[] = [ 'id_album'      => $item->id_album,
                        'nama_album'    => $item->nama_album,
                        'value'         => $total,
                    ];
        }
        return response()->json($data);
    }

    // unitKerja
    public function unitKerja()
    {
        $datalist   = UnitKerja::all();
        $data       = array();
        foreach ($datalist as $item) {
            $total = Dokumen::where('id_unit_kerja',$item->id_unit_kerja)->count();
            $data[] = [ 'id_unit_kerja'      => $item->id_unit_kerja,
                        'nama_unit_kerja'    => $item->nama_unit_kerja,
                        'value'                 => $total,
                    ];
        }
        return response()->json($data);
    }
}
