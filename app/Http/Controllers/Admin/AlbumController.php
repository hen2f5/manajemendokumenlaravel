<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Album;
use Image;

class AlbumController extends Controller
{
    // Index
    public function index()
    {
		$album 	   = Album::orderBy('id_album','DESC')->get();
        $akhir              = Album::orderBy('id_album','DESC')->first();

		$data = array(  'title'       => 'Album ('.count($album).')',
						'album'       => $album,
                        'content'     => 'admin/album/index'
                    );
        return view('admin/layout/wrapper',$data);
    }

    // Index
    public function edit($id_album)
    {
        
        $album   = Album::where('id_album',$id_album)->orderBy('id_album','DESC')->first();

        $data = array(  'title'     => 'Edit Album',
                        'album'     => $album,
                        'content'   => 'admin/album/edit'
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
            $id_albumnya       = $request->id_album;
            for($i=0; $i < sizeof($id_albumnya);$i++) {
                Album::where('id_album',$id_albumnya[$i])->delete();
            }
            return redirect('admin/album')->with(['sukses' => 'Data telah dihapus']);
        // PROSES SETTING DRAFT
        }
    }

    // tambah
    public function tambahAlbum(Request $request)
    {
    	
    	$request->validate([
            'nama_album' => 'required|max:255',
            'keterangan' => 'nullable',
            'gambar' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
        ]);

        $namaFile = null;

        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $namaFile = time().'_'.$file->getClientOriginalName();
            $file->move('./assets/upload/image/', $namaFile);
        }

        Album::create([
            'id_unit_kerja' => auth()->user()->id_unit_kerja ?? 1,
            'slug_album'    => strtolower(Str::random(5).'-'.Str::slug($request->nama_album)),
            'nama_album'    => $request->nama_album,
            'keterangan'    => $request->keterangan,
            'gambar'        => $namaFile,
            'created_by'    => Auth::id(),
            'updated_by'    => Auth::id(),
            'deleted_by'    => 0
        ]);
        return redirect('admin/album')->with(['sukses' => 'Data album telah ditambahkan']);
    }

    // edit
    public function proses_edit(Request $request)
    {
    	
    	request()->validate([
					        'nama_album' => 'required|max:255',
                            'keterangan' => 'nullable',
                            'gambar' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048'
					        ]);
        // UPLOAD START
        $namaFile = null;

        if ($request->hasFile('gambar')) {
            $file = $request->file('gambar');
            $namaFile = time().'_'.$file->getClientOriginalName();
            $file->move('./assets/upload/image/', $namaFile);
        }

        Album::where('id_album',$request->id_album)->update([
            'id_unit_kerja' => auth()->user()->id_unit_kerja ?? 1,
            'slug_album'    => strtolower(Str::random(5).'-'.Str::slug($request->nama_album)),
            'nama_album'    => $request->nama_album,
            'keterangan'    => $request->keterangan,
            'gambar'        => $namaFile,
            'created_by'    => Auth::id(),
            'updated_by'    => Auth::id(),
            'deleted_by'    => 0
        ]);
        return redirect('admin/album')->with(['sukses' => 'Data telah diupdate']);
    }


    // Delete
    public function delete($id_album)
    {
    	Album::where('id_album',$id_album)->delete();
    	return redirect('admin/album')->with(['sukses' => 'Data telah dihapus']);
    }
}
