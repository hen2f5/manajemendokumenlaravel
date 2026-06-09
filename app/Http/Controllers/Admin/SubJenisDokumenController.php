<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\SubJenisDokumen;
use App\Models\JenisDokumen;
use Image;

class SubJenisDokumenController extends Controller
{
    // Index
    public function index()
    {
        $jenis_dokumen      = JenisDokumen::denganSubJenis()->get();
		$sub_jenis_dokumen 	= SubJenisDokumen::with('jenisDokumen')->orderBy('urutan','ASC')->get();
        $akhir                  = SubJenisDokumen::orderBy('urutan','DESC')->first();
        $kode                   = $akhir ? $akhir->urutan + 1 : 1;
        $kode_sub_jenis_dokumen = str_pad($kode, 3, '0', STR_PAD_LEFT);

		$data = array(  'title'                   => 'Sub Jenis Dokumen ('.count($sub_jenis_dokumen).')',
						'sub_jenis_dokumen'       => $sub_jenis_dokumen,
                        'kode_sub_jenis_dokumen'    => $kode_sub_jenis_dokumen,
                        'kode'                      => $kode,
                        'jenis_dokumen'             => $jenis_dokumen,
                        'content'                   => 'admin/sub_jenis_dokumen/index'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Index
    public function edit($id_sub_jenis_dokumen)
    {
        $sub_jenis_dokumen      = SubJenisDokumen::where('id_sub_jenis_dokumen',$id_sub_jenis_dokumen)->orderBy('id_sub_jenis_dokumen','DESC')->first();
        $jenis_dokumen          = JenisDokumen::denganSubJenis()->get();
        $data = array(  'title'                 => 'Edit Sub Jenis Dokumen',
                        'sub_jenis_dokumen'     => $sub_jenis_dokumen,
                        'jenis_dokumen'         => $jenis_dokumen,
                        'content'               => 'admin/sub_jenis_dokumen/edit'
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
            $id_sub_jenis_dokumennya       = $request->id_sub_jenis_dokumen;
            for($i=0; $i < sizeof($id_sub_jenis_dokumennya);$i++) {
                SubJenisDokumen::where('id_sub_jenis_dokumen',$id_sub_jenis_dokumennya[$i])->delete();
            }
            return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah dihapus']);
        // PROSES SETTING DRAFT
        }
    }

    // tambah
    public function tambah(Request $request)
    {
    	
    	request()->validate([
                            'nama_sub_jenis_dokumen'  => 'required|unique:sub_jenis_dokumen',
					        'kode_sub_jenis_dokumen'  => 'required|unique:sub_jenis_dokumen',
                            'gambar'           => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_sub_jenis_dokumen_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_sub_jenis_dokumen_file']);
            $destinationPath = './assets/upload/sub_jenis_dokumen/';
            $image->move($destinationPath, $input['nama_sub_jenis_dokumen_file']);
            // END UPLOAD
            SubJenisDokumen::insert([
                'id_user'           => Session()->get('id_user'),
                'id_jenis_dokumen'   => $request->id_jenis_dokumen,
                'kode_sub_jenis_dokumen'   => $request->kode_sub_jenis_dokumen,
                'nama_sub_jenis_dokumen'   => $request->nama_sub_jenis_dokumen,
                'keterangan'   	    => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_sub_jenis_dokumen_file'],
                'status_sub_jenis_dokumen' => $request->status_sub_jenis_dokumen
            ]);
        }else{
             SubJenisDokumen::insert([
                'id_user'           => Session()->get('id_user'),
                'id_jenis_dokumen'   => $request->id_jenis_dokumen,
                'kode_sub_jenis_dokumen'   => $request->kode_sub_jenis_dokumen,
                'nama_sub_jenis_dokumen'   => $request->nama_sub_jenis_dokumen,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_sub_jenis_dokumen' => $request->status_sub_jenis_dokumen
                //'gambar'            => $input['nama_sub_jenis_dokumen_file']
            ]);
        }
        return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah ditambah']);
    }

    // edit
    public function proses_edit(Request $request)
    {
    	
    	request()->validate([
					        'nama_sub_jenis_dokumen'     => 'required',
                            'kode_sub_jenis_dokumen' => 'required',
                            'gambar'   => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            // UPLOAD START
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_sub_jenis_dokumen_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_sub_jenis_dokumen_file']);
            $destinationPath = './assets/upload/sub_jenis_dokumen/';
            $image->move($destinationPath, $input['nama_sub_jenis_dokumen_file']);
            // END UPLOAD
            $slug_user = Str::slug($request->nama_sub_jenis_dokumen, '-');
            SubJenisDokumen::where('id_sub_jenis_dokumen',$request->id_sub_jenis_dokumen)->update([
                'id_user'           => Session()->get('id_user'),
                'id_jenis_dokumen'   => $request->id_jenis_dokumen,
                'kode_sub_jenis_dokumen'   => $request->kode_sub_jenis_dokumen,
                'nama_sub_jenis_dokumen'   => $request->nama_sub_jenis_dokumen,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_sub_jenis_dokumen_file'],
                'status_sub_jenis_dokumen' => $request->status_sub_jenis_dokumen
            ]);
        }else{
            $slug_user = Str::slug($request->nama_sub_jenis_dokumen, '-');
            SubJenisDokumen::where('id_sub_jenis_dokumen',$request->id_sub_jenis_dokumen)->update([
                'id_user'           => Session()->get('id_user'),
                'id_jenis_dokumen'   => $request->id_jenis_dokumen,
                'kode_sub_jenis_dokumen'   => $request->kode_sub_jenis_dokumen,
                'nama_sub_jenis_dokumen'   => $request->nama_sub_jenis_dokumen,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_sub_jenis_dokumen' => $request->status_sub_jenis_dokumen
                //'gambar'            => $input['nama_sub_jenis_dokumen_file']
            ]);
        }
        return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah diupdate']);
    }

    // activate
    public function activate($id_sub_jenis_dokumen)
    {
        $sub_jenis_dokumen   = SubJenisDokumen::where('id_sub_jenis_dokumen',$id_sub_jenis_dokumen)->orderBy('id_sub_jenis_dokumen','DESC')->first();
        if($_GET['status']=='Disable') {
            $status_sub_jenis_dokumen    = 'Non Aktif';
        }elseif($_GET['status']=='Activate') {
            $status_sub_jenis_dokumen    = 'Aktif';
        }
        SubJenisDokumen::where('id_sub_jenis_dokumen',$id_sub_jenis_dokumen)->update([
                'updated_by'            => Session()->get('id_user'),
                'status_sub_jenis_dokumen'     => $status_sub_jenis_dokumen
            ]);
        return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data status Sub Jenis Dokumen: '.$sub_jenis_dokumen->nama_sub_jenis_dokumen.' telah diupdate']);
    }

    // Delete
    public function delete($id_sub_jenis_dokumen)
    {
    	
    	SubJenisDokumen::where('id_sub_jenis_dokumen',$id_sub_jenis_dokumen)->delete();
    	return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah dihapus']);
    }
}
