<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Unitkerja;
use Image;

class UnitKerjaController extends Controller
{
    // Index
    public function index()
    {
		$unit_kerja 	=UnitKerja::orderBy('id_unit_kerja','DESC')->get();
        $akhir          =UnitKerja::orderBy('urutan','DESC')->first();
        $kode           = $akhir->urutan+1;
        if($kode < 10) {
            $kode_unit_kerja    = '00'.$kode;
        }elseif($kode < 100) {
            $kode_unit_kerja    = '0'.$kode;
        }elseif($kode < 1000) {
            $kode_unit_kerja    = $kode;
        }

		$data = array(  'title'               => 'Unit Kerja ('.count($unit_kerja).')',
						'unit_kerja'  => $unit_kerja,
                        'kode_unit_kerja'   => $kode_unit_kerja,
                        'kode'      => $kode,
                        'content'     => 'admin/unit_kerja/index'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Index
    public function edit($id_unit_kerja)
    {
        
        $unit_kerja   =UnitKerja::where('id_unit_kerja',$id_unit_kerja)->orderBy('id_unit_kerja','DESC')->first();

        $data = array(  'title'         => 'Edit Unit Kerja',
                        'unit_kerja'    => $unit_kerja,
                        'content'       => 'admin/unit_kerja/edit'
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
            $id_unit_kerjanya       = $request->id_unit_kerja;
            for($i=0; $i < sizeof($id_unit_kerjanya);$i++) {
               UnitKerja::where('id_unit_kerja',$id_unit_kerjanya[$i])->delete();
            }
            return redirect('admin/unit-kerja')->with(['sukses' => 'Data telah dihapus']);
        // PROSES SETTING DRAFT
        }
    }

    // tambah
    public function tambah(Request $request)
    {
    	
    	request()->validate([
                            'nama_unit_kerja'  => 'required|unique:unit_kerja',
					        'kode_unit_kerja'  => 'required|unique:unit_kerja',
                            'gambar'           => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_unit_kerja_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_unit_kerja_file']);
            $destinationPath = './assets/upload/unit_kerja/';
            $image->move($destinationPath, $input['nama_unit_kerja_file']);
            // END UPLOAD
           UnitKerja::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_unit_kerja'   => $request->kode_unit_kerja,
                'nama_unit_kerja'   => $request->nama_unit_kerja,
                'keterangan'   	    => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_unit_kerja_file'],
                'status_unit_kerja' => $request->status_unit_kerja
            ]);
        }else{
            UnitKerja::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_unit_kerja'   => $request->kode_unit_kerja,
                'nama_unit_kerja'   => $request->nama_unit_kerja,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_unit_kerja' => $request->status_unit_kerja
                //'gambar'            => $input['nama_unit_kerja_file']
            ]);
        }
        return redirect('admin/unit-kerja')->with(['sukses' => 'Data telah ditambah']);
    }

    // edit
    public function proses_edit(Request $request)
    {
    	
    	request()->validate([
					        'nama_unit_kerja'     => 'required',
                            'kode_unit_kerja' => 'required',
                            'gambar'   => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            // UPLOAD START
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_unit_kerja_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_unit_kerja_file']);
            $destinationPath = './assets/upload/unit_kerja/';
            $image->move($destinationPath, $input['nama_unit_kerja_file']);
            // END UPLOAD
            $slug_user = Str::slug($request->nama_unit_kerja, '-');
           UnitKerja::where('id_unit_kerja',$request->id_unit_kerja)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_unit_kerja'   => $request->kode_unit_kerja,
                'nama_unit_kerja'   => $request->nama_unit_kerja,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_unit_kerja_file'],
                'status_unit_kerja' => $request->status_unit_kerja
            ]);
        }else{
            $slug_user = Str::slug($request->nama_unit_kerja, '-');
           UnitKerja::where('id_unit_kerja',$request->id_unit_kerja)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_unit_kerja'   => $request->kode_unit_kerja,
                'nama_unit_kerja'   => $request->nama_unit_kerja,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_unit_kerja' => $request->status_unit_kerja
                //'gambar'            => $input['nama_unit_kerja_file']
            ]);
        }
        return redirect('admin/unit-kerja')->with(['sukses' => 'Data telah diupdate']);
    }

    // activate
    public function activate($id_unit_kerja)
    {
        $unit_kerja   =UnitKerja::where('id_unit_kerja',$id_unit_kerja)->orderBy('id_unit_kerja','DESC')->first();
        if($_GET['status']=='Disable') {
            $status_unit_kerja    = 'Non Aktif';
        }elseif($_GET['status']=='Activate') {
            $status_unit_kerja    = 'Aktif';
        }
       UnitKerja::where('id_unit_kerja',$id_unit_kerja)->update([
                'updated_by'            => Session()->get('id_user'),
                'status_unit_kerja'     => $status_unit_kerja
            ]);
        return redirect('admin/unit-kerja')->with(['sukses' => 'Data status unit kerja: '.$unit_kerja->nama_unit_kerja.' telah diupdate']);
    }

    // Delete
    public function delete($id_unit_kerja)
    {
    	Unitkerja::where('id_unit_kerja',$id_unit_kerja)->delete();
    	return redirect('admin/unit-kerja')->with(['sukses' => 'Data telah dihapus']);
    }
}
