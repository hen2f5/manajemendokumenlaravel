<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Poksi;
use Image;

class PoksiController extends Controller
{
    // Index
    public function index()
    {
		$poksi    = Poksi::with('unitKerja')->get();
        $akhir    = Poksi::orderBy('urutan','DESC')->first();
        if($akhir) {
            $kode           = $akhir->urutan+1;
        }else{
            $kode           = 1;
        }
        
        if($kode < 10) {
            $kode_poksi    = '00'.$kode;
        }elseif($kode < 100) {
            $kode_poksi    = '0'.$kode;
        }elseif($kode < 1000) {
            $kode_poksi    = $kode;
        }

		$data = array(  'title'               => 'Kelompok Substansi ('.count($poksi).')',
						'poksi'  => $poksi,
                        'kode_poksi'   => $kode_poksi,
                        'kode'      => $kode,
                        'content'     => 'admin/poksi/index'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Index
    public function edit($id_poksi)
    {
        
        $poksi   =Poksi::where('id_poksi',$id_poksi)->orderBy('id_poksi','DESC')->first();

        $data = array(  'title'         => 'Edit Kelompok Substansi',
                        'poksi'    => $poksi,
                        'content'       => 'admin/poksi/edit'
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
            $id_poksinya       = $request->id_poksi;
            for($i=0; $i < sizeof($id_poksinya);$i++) {
               Poksi::where('id_poksi',$id_poksinya[$i])->delete();
            }
            return redirect('admin/poksi')->with(['sukses' => 'Data telah dihapus']);
        // PROSES SETTING DRAFT
        }
    }

    // tambah
    public function tambah(Request $request)
    {
    	
    	request()->validate([
                            'nama_poksi'  => 'required|unique:poksi',
					        'kode_poksi'  => 'required|unique:poksi',
                            'gambar'           => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_poksi_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_poksi_file']);
            $destinationPath = './assets/upload/poksi/';
            $image->move($destinationPath, $input['nama_poksi_file']);
            // END UPLOAD
           Poksi::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_poksi'   => $request->kode_poksi,
                'nama_poksi'   => $request->nama_poksi,
                'keterangan'   	    => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_poksi_file'],
                'status_poksi' => $request->status_poksi
            ]);
        }else{
            Poksi::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_poksi'   => $request->kode_poksi,
                'nama_poksi'   => $request->nama_poksi,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_poksi' => $request->status_poksi
                //'gambar'            => $input['nama_poksi_file']
            ]);
        }
        return redirect('admin/poksi')->with(['sukses' => 'Data telah ditambah']);
    }

    // edit
    public function proses_edit(Request $request)
    {
    	
    	request()->validate([
					        'nama_poksi'   => 'required',
                            'kode_poksi'    => 'required',
                            'gambar'        => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            // UPLOAD START
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_poksi_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_poksi_file']);
            $destinationPath = './assets/upload/poksi/';
            $image->move($destinationPath, $input['nama_poksi_file']);
            // END UPLOAD
            $slug_user = Str::slug($request->nama_poksi, '-');
           Poksi::where('id_poksi',$request->id_poksi)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_poksi'   => $request->kode_poksi,
                'nama_poksi'   => $request->nama_poksi,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_poksi_file'],
                'status_poksi' => $request->status_poksi
            ]);
        }else{
            $slug_user = Str::slug($request->nama_poksi, '-');
           Poksi::where('id_poksi',$request->id_poksi)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_poksi'   => $request->kode_poksi,
                'nama_poksi'   => $request->nama_poksi,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_poksi' => $request->status_poksi
                //'gambar'            => $input['nama_poksi_file']
            ]);
        }
        return redirect('admin/poksi')->with(['sukses' => 'Data telah diupdate']);
    }

    // activate
    public function activate($id_poksi)
    {
        $poksi   =Poksi::where('id_poksi',$id_poksi)->orderBy('id_poksi','DESC')->first();
        if($_GET['status']=='Disable') {
            $status_poksi    = 'Non Aktif';
        }elseif($_GET['status']=='Activate') {
            $status_poksi    = 'Aktif';
        }
       Poksi::where('id_poksi',$id_poksi)->update([
                'updated_by'            => Session()->get('id_user'),
                'status_poksi'     => $status_poksi
            ]);
        return redirect('admin/poksi')->with(['sukses' => 'Data status Kelompok Substansi: '.$poksi->nama_poksi.' telah diupdate']);
    }

    // Delete
    public function delete($id_poksi)
    {
    	Poksi::where('id_poksi',$id_poksi)->delete();
    	return redirect('admin/poksi')->with(['sukses' => 'Data telah dihapus']);
    }
}
