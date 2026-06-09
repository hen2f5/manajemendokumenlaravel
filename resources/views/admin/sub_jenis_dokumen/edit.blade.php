@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

<form action="{{ asset('admin/sub-jenis-dokumen/proses_edit') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
{{ csrf_field() }}

<div class="row">
	<div class="col-md-3">
		<div class="card">
			<div class="card-header">FOTO/LOGO</div>
			<div class="card-body p-3 text-center">
				<?php if($sub_jenis_dokumen->gambar != "") { ?>
		            <img src="{{ asset('assets/upload/image/thumbs/'.$sub_jenis_dokumen->gambar) }}" class="img img-fluid img-thumbnail">
		        <?php }else{ echo '<p class="badge bg-warning text-center">Belum ada</p>'; } ?>
			</div>
		</div>
		
	</div>
	<div class="col-md-9">
		<div class="card">
			<div class="card-header">Update Data</div>
			<div class="card-body p-3">

				<input type="hidden" name="id_sub_jenis_dokumen" value="<?php echo $sub_jenis_dokumen->id_sub_jenis_dokumen ?>">

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Status Jenis Dokumen</label>
					<div class="col-sm-9">
						<select name="status_sub_jenis_dokumen" class="form-control">
							<option value="Aktif">Aktif</option>
							<option value="Non Aktif" <?php if($sub_jenis_dokumen->status_sub_jenis_dokumen=="Non Aktif") { echo 'selected'; } ?>>Non Aktif</option>
						</select>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Jenis Dokumen</label>
					<div class="col-sm-9">
						<select name="id_jenis_dokumen" class="form-control" required>
							<option value="">Pilih Salah Satu</option>
							<?php foreach($jenis_dokumen as $item) { ?>
								<option value="<?php echo $item->id_jenis_dokumen ?>" <?php if($sub_jenis_dokumen->id_jenis_dokumen==$item->id_jenis_dokumen) { echo 'selected'; } ?>><?php echo $item->nama_jenis_dokumen ?></option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Nama Jenis Dokumen</label>
					<div class="col-sm-9">
						<input type="text" name="nama_sub_jenis_dokumen" class="form-control" placeholder="Nama lengkap" value="{{ $sub_jenis_dokumen->nama_sub_jenis_dokumen }}" required>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Kode dan Nomor Urut Jenis Dokumen</label>
					<div class="col-sm-4">
						<input type="text" name="kode_sub_jenis_dokumen" class="form-control" placeholder="Kode Jenis Dokumen" value="{{ $sub_jenis_dokumen->kode_sub_jenis_dokumen }}" required>
						<small class="text-secondary">Kode Jenis Dokumen</small>
					</div>
					<div class="col-sm-5">
						<input type="number" name="urutan" class="form-control" placeholder="Nomor Urut Jenis Dokumen" value="{{ $sub_jenis_dokumen->urutan }}" required>
						<small class="text-secondary">Nomor urut</small>
					</div>
				</div>				

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Keterangan</label>
					<div class="col-sm-9">
						<textarea name="keterangan" class="form-control"><?php echo $sub_jenis_dokumen->keterangan ?></textarea>
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
							<a href="{{ asset('admin/sub-jenis-dokumen') }}" class="btn btn-danger">Kembali</a>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>

			</div>
		</div>
	</div>
</div>

</form>

