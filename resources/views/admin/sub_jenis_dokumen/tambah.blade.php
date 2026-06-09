
<div class="modal fade" id="basicModalSub" tabindex="-1">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">

				<h4 class="modal-title" id="myModalLabel">Tambah data?</h4>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="{{ asset('admin/sub-jenis-dokumen/tambah') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
{{ csrf_field() }}

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Status Jenis Dokumen</label>
					<div class="col-sm-9">
						<select name="status_sub_jenis_dokumen" class="form-control">
							<option value="Aktif">Aktif</option>
							<option value="Non Aktif">Non Aktif</option>
						</select>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Jenis Dokumen</label>
					<div class="col-sm-9">
						<select name="id_jenis_dokumen" class="form-control" required>
							<option value="">Pilih Salah Satu</option>
							<?php foreach($jenis_dokumen as $item) { ?>
								<option value="<?php echo $item->id_jenis_dokumen ?>"><?php echo $item->nama_jenis_dokumen ?></option>
							<?php } ?>
						</select>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Nama Jenis Dokumen</label>
					<div class="col-sm-9">
						<input type="text" name="nama_sub_jenis_dokumen" class="form-control" placeholder="Nama lengkap" value="{{ old('nama_sub_jenis_dokumen') }}" required>
					</div>
				</div>

				<div class="form-group row mb-3">
					<label class="col-sm-3 control-label text-right">Kode dan Nomor Urut Jenis Dokumen</label>
					<div class="col-sm-4">
						<input type="text" name="kode_sub_jenis_dokumen" class="form-control" placeholder="Kode Jenis Dokumen" value="{{ $kode_sub_jenis_dokumen }}" required>
						<small class="text-secondary">Kode Jenis Dokumen</small>
					</div>
					<div class="col-sm-5">
						<input type="number" name="urutan" class="form-control" placeholder="Nomor Urut Jenis Dokumen" value="{{ $kode }}" required>
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
