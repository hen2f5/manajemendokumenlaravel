<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Perkembangan;
use Image;

class PerkembanganController extends Controller
{
    // Index
    public function index()
    {
		$perkembangan 	   = Perkembangan::orderBy('id_perkembangan','DESC')->get();
        $akhir              = Perkembangan::orderBy('urutan','DESC')->first();
        $kode               = $akhir ? $akhir->urutan + 1 : 1;
        $kode_perkembangan  = str_pad($kode, 3, '0', STR_PAD_LEFT);

		$data = array(  'title'               => 'Perkembangan ('.count($perkembangan).')',
						'perkembangan'  => $perkembangan,
                        'kode_perkembangan'   => $kode_perkembangan,
                        'kode'      => $kode,
                        'content'     => 'admin/perkembangan/index'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Index
    public function edit($id_perkembangan)
    {
        
        $perkembangan   = Perkembangan::where('id_perkembangan',$id_perkembangan)->orderBy('id_perkembangan','DESC')->first();

        $data = array(  'title'         => 'Edit Perkembangan',
                        'perkembangan'    => $perkembangan,
                        'content'       => 'admin/perkembangan/edit'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Proses
    public function proses(Request $request)
    {
        $site   = DB::table('konfigurasi')->first();
        website('user_log');
        // PROSES HAPUS MULTIPLE
        if(isset($_POST['hapus'])) {
            $id_perkembangannya       = $request->id_perkembangan;
            for($i=0; $i < sizeof($id_perkembangannya);$i++) {
                Perkembangan::where('id_perkembangan',$id_perkembangannya[$i])->delete();
            }
            return redirect('admin/perkembangan')->with(['sukses' => 'Data telah dihapus']);
        // PROSES SETTING DRAFT
        }
    }

    // tambah
    public function tambah(Request $request)
    {
    	
    	request()->validate([
                            'nama_perkembangan'  => 'required|unique:perkembangan',
					        'kode_perkembangan'  => 'required|unique:perkembangan',
                            'gambar'           => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_perkembangan_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_perkembangan_file']);
            $destinationPath = './assets/upload/perkembangan/';
            $image->move($destinationPath, $input['nama_perkembangan_file']);
            // END UPLOAD
            Perkembangan::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_perkembangan'   => $request->kode_perkembangan,
                'nama_perkembangan'   => $request->nama_perkembangan,
                'keterangan'   	    => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_perkembangan_file'],
                'status_perkembangan' => $request->status_perkembangan
            ]);
        }else{
             Perkembangan::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_perkembangan'   => $request->kode_perkembangan,
                'nama_perkembangan'   => $request->nama_perkembangan,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_perkembangan' => $request->status_perkembangan
                //'gambar'            => $input['nama_perkembangan_file']
            ]);
        }
        return redirect('admin/perkembangan')->with(['sukses' => 'Data telah ditambah']);
    }

    // edit
    public function proses_edit(Request $request)
    {
    	
    	request()->validate([
					        'nama_perkembangan'     => 'required',
                            'kode_perkembangan' => 'required',
                            'gambar'   => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            // UPLOAD START
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_perkembangan_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_perkembangan_file']);
            $destinationPath = './assets/upload/perkembangan/';
            $image->move($destinationPath, $input['nama_perkembangan_file']);
            // END UPLOAD
            $slug_user = Str::slug($request->nama_perkembangan, '-');
            Perkembangan::where('id_perkembangan',$request->id_perkembangan)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_perkembangan'   => $request->kode_perkembangan,
                'nama_perkembangan'   => $request->nama_perkembangan,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_perkembangan_file'],
                'status_perkembangan' => $request->status_perkembangan
            ]);
        }else{
            $slug_user = Str::slug($request->nama_perkembangan, '-');
            Perkembangan::where('id_perkembangan',$request->id_perkembangan)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_perkembangan'   => $request->kode_perkembangan,
                'nama_perkembangan'   => $request->nama_perkembangan,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_perkembangan' => $request->status_perkembangan
                //'gambar'            => $input['nama_perkembangan_file']
            ]);
        }
        return redirect('admin/perkembangan')->with(['sukses' => 'Data telah diupdate']);
    }

    // activate
    public function activate($id_perkembangan)
    {
        $perkembangan   = Perkembangan::where('id_perkembangan',$id_perkembangan)->orderBy('id_perkembangan','DESC')->first();
        if($_GET['status']=='Disable') {
            $status_perkembangan    = 'Non Aktif';
        }elseif($_GET['status']=='Activate') {
            $status_perkembangan    = 'Aktif';
        }
        Perkembangan::where('id_perkembangan',$id_perkembangan)->update([
                'updated_by'            => Session()->get('id_user'),
                'status_perkembangan'     => $status_perkembangan
            ]);
        return redirect('admin/perkembangan')->with(['sukses' => 'Data status unit kerja: '.$perkembangan->nama_perkembangan.' telah diupdate']);
    }

    // Delete
    public function delete($id_perkembangan)
    {
    	
    	Perkembangan::where('id_perkembangan',$id_perkembangan)->delete();
    	return redirect('admin/perkembangan')->with(['sukses' => 'Data telah dihapus']);
    }
}
