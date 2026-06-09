@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<form action="{{ asset('admin/album/proses_edit') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
{{ csrf_field() }}

<div class="row">
	<div class="col-md-3">
		<div class="card">
			<div class="card-header">FOTO/LOGO</div>
			<div class="card-body p-3 text-center">
				<?php if($album->gambar != "") { ?>
		            <img src="{{ asset('assets/upload/image/'.$album->gambar) }}" class="img img-fluid img-thumbnail">
		        <?php }else{ echo '<p class="badge bg-warning text-center">Belum ada</p>'; } ?>
			</div>
		</div>
		
	</div>
	<div class="col-md-9">
		<div class="card">
			<div class="card-header">Update Data</div>
			<div class="card-body p-3">

				<input type="hidden" name="id_album" value="<?php echo $album->id_album ?>">

				<div class="mb-3">
                        <label class="form-label">Nama Album</label>
                        <input type="text" name="nama_album" value="{{ old('nama_album',$album->nama_album) }}" class="form-control" placeholder="Nama Album" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Keterangan</label>
                        <textarea name="keterangan" class="form-control" rows="3" placeholder="Keterangan">{{ old('keterangan',$album->keterangan) }}</textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gambar Album</label>
                        <input type="file" name="gambar" class="form-control">
                        <small class="text-muted">Format: JPG, PNG</small>
                    </div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right"></label>
					<div class="col-sm-9">
						<div class="form-group pull-right btn-group">
							<input type="submit" name="submit" class="btn btn-primary " value="Simpan Data">
							<input type="reset" name="reset" class="btn btn-success " value="Reset">
							<a href="{{ asset('admin/album') }}" class="btn btn-danger">Kembali</a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
	</div>
</div>

</form>

