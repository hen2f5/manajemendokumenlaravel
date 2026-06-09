<div class="row">
	<div class="col-md-12">
		<p class="alert alert-warning">
			Halo <strong><?php echo session()->get('nama') ?></strong>. Selamat datang di <strong><em>{{ $konfigurasi->namaweb }}</em></strong>. Silakan Anda mengelola akun di halaman ini.
		</p>
        
	</div>
	<div class="col-md-8">
		<div class="card">
			<div class="card-header bg-info-subtle">
				<strong>Update Profile</strong>
			</div>
			<div class="card-body">
				@include('admin/akun/profile')
			</div>
		</div>
	</div>

	<div class="col-md-4">
		<div class="card">
			<div class="card-header bg-info-subtle">
				<strong>Update Password</strong>
			</div>
			<div class="card-body">
				@include('admin/akun/password')
			</div>
		</div>
	</div>
</div>