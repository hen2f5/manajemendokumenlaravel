<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\JenisDokumen;
use App\Models\SubJenisDokumen;
use Image;

class JenisDokumenController extends Controller
{
    // Index
    public function index()
    {
        $jenis_dokumen      = JenisDokumen::denganSubJenis()->get();
        $akhir              = JenisDokumen::orderBy('urutan','DESC')->first();
        $kode               = $akhir ? $akhir->urutan + 1 : 1;
        $kode_jenis_dokumen = str_pad($kode, 3, '0', STR_PAD_LEFT);

        $akhir                  = SubJenisDokumen::orderBy('urutan','DESC')->first();
        $kode_sub               = $akhir ? $akhir->urutan + 1 : 1;
        $kode_sub_jenis_dokumen = str_pad($kode_sub, 3, '0', STR_PAD_LEFT);

        // return response()->json($jenis_dokumen);

		$data = array(  'title'                     => 'Jenis Dokumen ('.count($jenis_dokumen).')',
                        'jenis_dokumen'             => $jenis_dokumen,
                        'kode_jenis_dokumen'        => $kode_jenis_dokumen,
                        'kode_sub_jenis_dokumen'    => $kode_sub_jenis_dokumen,
                        'kode'                      => $kode,
                        'content'                   => 'admin/jenis_dokumen/index'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Index
    public function edit($id_jenis_dokumen)
    {
        $jenis_dokumen   = JenisDokumen::where('id_jenis_dokumen',$id_jenis_dokumen)->orderBy('id_jenis_dokumen','DESC')->first();
        $data = array(  'title'         => 'Edit Jenis Dokumen',
                        'jenis_dokumen'    => $jenis_dokumen,
                        'content'       => 'admin/jenis_dokumen/edit'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Proses
    public function proses(Request $request)
    {
        // PROSES HAPUS MULTIPLE
        if(isset($_POST['hapus'])) {
            $id_jenis_dokumennya       = $request->id_jenis_dokumen;
            if(empty($id_jenis_dokumennya)) {
                return redirect('admin/jenis-dokumen')->with(['warning' => 'Anda belum memilih data yang akan dihapus']);
            }else{
                for($i=0; $i < sizeof($id_jenis_dokumennya);$i++) {
                    JenisDokumen::where('id_jenis_dokumen',$id_jenis_dokumennya[$i])->delete();
                }
                return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah dihapus']);
            }
            
        // PROSES SETTING DRAFT
        }
    }

    // tambah
    public function tambah(Request $request)
    {
    	request()->validate([
                            'nama_jenis_dokumen'  => 'required|unique:jenis_dokumen',
					        'kode_jenis_dokumen'  => 'required|unique:jenis_dokumen',
                            'gambar'           => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_jenis_dokumen_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_jenis_dokumen_file']);
            $destinationPath = './assets/upload/jenis_dokumen/';
            $image->move($destinationPath, $input['nama_jenis_dokumen_file']);
            // END UPLOAD
            JenisDokumen::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_jenis_dokumen'   => $request->kode_jenis_dokumen,
                'nama_jenis_dokumen'   => $request->nama_jenis_dokumen,
                //'icon_jenis_dokumen'   => $request->icon_jenis_dokumen,
                'keterangan'   	    => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_jenis_dokumen_file'],
                'status_jenis_dokumen' => $request->status_jenis_dokumen
            ]);
        }else{
             JenisDokumen::insert([
                'id_user'           => Session()->get('id_user'),
                'kode_jenis_dokumen'   => $request->kode_jenis_dokumen,
                'nama_jenis_dokumen'   => $request->nama_jenis_dokumen,
                //'icon_jenis_dokumen'   => $request->icon_jenis_dokumen,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_jenis_dokumen' => $request->status_jenis_dokumen
                //'gambar'            => $input['nama_jenis_dokumen_file']
            ]);
        }
        return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah ditambah']);
    }

    // edit
    public function proses_edit(Request $request)
    {
    	request()->validate([
					        'nama_jenis_dokumen'     => 'required',
                            'kode_jenis_dokumen' => 'required',
                            'gambar'   => 'file|image|mimes:jpeg,png,jpg|max:8024',
					        ]);
        // UPLOAD START
        $image                  = $request->file('gambar');
        if(!empty($image)) {
            // UPLOAD START
            $filenamewithextension  = $request->file('gambar')->getClientOriginalName();
            $filename               = pathinfo($filenamewithextension, PATHINFO_FILENAME);
            $input['nama_jenis_dokumen_file']     = Str::slug($filename, '-').'-'.time().'.'.$image->getClientOriginalExtension();
            $destinationPath        = './assets/upload/image/thumbs/';
            $img = Image::make($image->getRealPath(),array(
                'width'     => 150,
                'height'    => 150,
                'grayscale' => false
            ));
            $img->save($destinationPath.'/'.$input['nama_jenis_dokumen_file']);
            $destinationPath = './assets/upload/jenis_dokumen/';
            $image->move($destinationPath, $input['nama_jenis_dokumen_file']);
            // END UPLOAD
            $slug_user = Str::slug($request->nama_jenis_dokumen, '-');
            JenisDokumen::where('id_jenis_dokumen',$request->id_jenis_dokumen)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_jenis_dokumen'   => $request->kode_jenis_dokumen,
                'nama_jenis_dokumen'   => $request->nama_jenis_dokumen,
                //'icon_jenis_dokumen'   => $request->icon_jenis_dokumen,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'gambar'            => $input['nama_jenis_dokumen_file'],
                'status_jenis_dokumen' => $request->status_jenis_dokumen
            ]);
        }else{
            $slug_user = Str::slug($request->nama_jenis_dokumen, '-');
            JenisDokumen::where('id_jenis_dokumen',$request->id_jenis_dokumen)->update([
                'id_user'           => Session()->get('id_user'),
                'kode_jenis_dokumen'   => $request->kode_jenis_dokumen,
                'nama_jenis_dokumen'   => $request->nama_jenis_dokumen,
                //'icon_jenis_dokumen'   => $request->icon_jenis_dokumen,
                'keterangan'        => $request->keterangan,
                'urutan'            => $request->urutan,
                'status_jenis_dokumen' => $request->status_jenis_dokumen
                //'gambar'            => $input['nama_jenis_dokumen_file']
            ]);
        }
        return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah diupdate']);
    }

    // activate
    public function activate($id_jenis_dokumen)
    {
        $jenis_dokumen   = JenisDokumen::where('id_jenis_dokumen',$id_jenis_dokumen)->orderBy('id_jenis_dokumen','DESC')->first();
        if($_GET['status']=='Disable') {
            $status_jenis_dokumen    = 'Non Aktif';
        }elseif($_GET['status']=='Activate') {
            $status_jenis_dokumen    = 'Aktif';
        }
        JenisDokumen::where('id_jenis_dokumen',$id_jenis_dokumen)->update([
                'updated_by'            => Session()->get('id_user'),
                'status_jenis_dokumen'     => $status_jenis_dokumen
            ]);
        return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data status unit kerja: '.$jenis_dokumen->nama_jenis_dokumen.' telah diupdate']);
    }

    // Delete
    public function delete($id_jenis_dokumen)
    {
    	JenisDokumen::where('id_jenis_dokumen',$id_jenis_dokumen)->delete();
    	return redirect('admin/jenis-dokumen')->with(['sukses' => 'Data telah dihapus']);
    }
}
