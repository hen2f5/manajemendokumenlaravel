@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<form action="{{ asset('admin/perkembangan/proses_edit') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
{{ csrf_field() }}

<div class="row">
	<div class="col-md-3">
		<div class="card">
			<div class="card-header">FOTO/LOGO</div>
			<div class="card-body p-3 text-center">
				<?php if($perkembangan->gambar != "") { ?>
		            <img src="{{ asset('assets/upload/image/thumbs/'.$perkembangan->gambar) }}" class="img img-fluid img-thumbnail">
		        <?php }else{ echo '<p class="badge bg-warning text-center">Belum ada</p>'; } ?>
			</div>
		</div>
		
	</div>
	<div class="col-md-9">
		<div class="card">
			<div class="card-header">Update Data</div>
			<div class="card-body p-3">

				<input type="hidden" name="id_perkembangan" value="<?php echo $perkembangan->id_perkembangan ?>">

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Status Jenis Dokumen</label>
					<div class="col-sm-9">
						<select name="status_perkembangan" class="form-control">
							<option value="Aktif">Aktif</option>
							<option value="Non Aktif" <?php if($perkembangan->status_perkembangan=="Non Aktif") { echo 'selected'; } ?>>Non Aktif</option>
						</select>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Nama Jenis Dokumen</label>
					<div class="col-sm-9">
						<input type="text" name="nama_perkembangan" class="form-control" placeholder="Nama lengkap" value="{{ $perkembangan->nama_perkembangan }}" required>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Kode dan Nomor Urut Jenis Dokumen</label>
					<div class="col-sm-4">
						<input type="text" name="kode_perkembangan" class="form-control" placeholder="Kode Jenis Dokumen" value="{{ $perkembangan->kode_perkembangan }}" required>
						<small class="text-secondary">Kode Jenis Dokumen</small>
					</div>
					<div class="col-sm-5">
						<input type="number" name="urutan" class="form-control" placeholder="Nomor Urut Jenis Dokumen" value="{{ $perkembangan->urutan }}" required>
						<small class="text-secondary">Nomor urut</small>
					</div>
				</div>				

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Keterangan</label>
					<div class="col-sm-9">
						<textarea name="keterangan" class="form-control"><?php echo $perkembangan->keterangan ?></textarea>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Gambar/logo</label>
					<div class="col-sm-9">
						<input type="file" name="gambar" class="form-control" placeholder="Upload Foto" value="{{ old('gambar') }}">
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right"></label>
					<div class="col-sm-9">
						<div class="form-group pull-right btn-group">
							<input type="submit" name="submit" class="btn btn-primary " value="Simpan Data">
							<input type="reset" name="reset" class="btn btn-success " value="Reset">
							<a href="{{ asset('admin/perkembangan') }}" class="btn btn-danger">Kembali</a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
	</div>
</div>

</form>

