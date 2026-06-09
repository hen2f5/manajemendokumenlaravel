
<div class="modal fade" id="basicModal" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">

				<h4 class="modal-title" id="myModalLabel">Tambah data?</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="{{ asset('admin/poksi/tambah') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
{{ csrf_field() }}

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Status Kelompok Substansi</label>
					<div class="col-sm-9">
						<select name="status_poksi" class="form-control">
							<option value="Aktif">Aktif</option>
							<option value="Non Aktif">Non Aktif</option>
						</select>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Nama Kelompok Substansi</label>
					<div class="col-sm-9">
						<input type="text" name="nama_poksi" class="form-control" placeholder="Nama lengkap" value="{{ old('nama_poksi') }}" required>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Kode dan Nomor Urut Kelompok Substansi</label>
					<div class="col-sm-4">
						<input type="text" name="kode_poksi" class="form-control" placeholder="Kode Kelompok Substansi" value="{{ $kode_poksi }}" required>
						<small class="text-secondary">Kode Kelompok Substansi</small>
					</div>
					<div class="col-sm-5">
						<input type="number" name="urutan" class="form-control" placeholder="Nomor Urut Kelompok Substansi" value="{{ $kode }}" required>
						<small class="text-secondary">Nomor urut</small>
					</div>
				</div>				

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Keterangan</label>
					<div class="col-sm-9">
						<textarea name="keterangan" class="form-control"><?php echo old('keterangan') ?></textarea>
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
							<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
						</div>
					</div>
					<div class="clearfix"></div>
				</div>
				</form>

			</div>
		</div>
	</div>
</div>
