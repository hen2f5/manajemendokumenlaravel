<form action="{{ route('admin.akses-level.proses-menu', $akses_level->id_akses_level) }}" method="POST">
	@csrf
	<div class="mb-4 text-end">
		<button type="submit" class="btn btn-primary">Simpan Hak Akses</button>
		<a href="{{ url('admin/akses-level') }}" class="btn btn-secondary">Kembali</a>
	</div>

	<input type="hidden" name="id_akses_level" value="{{ $akses_level->id_akses_level }}">

	<div class="table-responsive">
		<table class="table table-bordered table-sm">
			<thead>
				<tr>
					<th width="5%" class="text-center justify-content-center">
						<div class="n-chk align-self-center text-center">
							<div class="form-check">
								<input type="checkbox" class="form-check-input primary" id="menu-check-all" />
								<label class="form-check-label" for="menu-check-all"></label>
								<span class="new-control-indicator"></span>
							</div>
						</div>
					</th>
					<th colspan="2" width="50%">Menu dan Sub Menu</th>
					<th width="5%">Urutan</th>
					<th width="10%">Icon</th>
					<th width="5%">Status</th>
				</tr>
			</thead>
			<tbody>
				@foreach ($menu as $item)
				@php
				$checkMenu = \App\Models\MenuAkses::where('id_akses_level', $akses_level->id_akses_level)
				->where('id_menu_aplikasi', $item->id_menu_aplikasi)
				->where('id_menu_aplikasi_sub', 0)
				->exists();
				@endphp
				<tr class="search-items">
					<td width="5%" class="text-center align-top">
						<div class="n-chk align-self-center text-center">
							<div class="form-check">
								<input type="checkbox" class="form-check-input menu-chkbox"
									name="id_menu_aplikasi[]" value="{{ $item->id_menu_aplikasi }}"
									{{ $checkMenu ? 'checked' : '' }}>
								<label class="form-check-label"></label>
								<span class="new-control-indicator"></span>
							</div>
						</div>
					</td>
					<td colspan="2"><strong>{{ $item->nama_menu_aplikasi }}</strong>
						<br><small class="text-muted">
							Link: {{ $item->alamat_menu_aplikasi }}
							<br><em>{{ $item->keterangan }}</em>
						</small>
					</td>
					<td>{{ $item->urutan }}</td>
					<td><span class="badge bg-success-subtle text-success"><i class="{{ $item->icon }}"></i> {{ $item->icon }}</span></td>

					<td>
						<span class="badge <?= $item->status_menu_aplikasi === 'Active' ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger' ?>">
							<i class="fa <?= $item->status_menu_aplikasi === 'Active' ? 'fa-eye' : 'fa-eye-slash' ?>"></i> <?= $item->status_menu_aplikasi ?>
						</span>
					</td>

				</tr>

				@if ($item->submenus)
				@foreach ($item->submenus as $sub)
				@php
				$checkMenuSub = \App\Models\MenuAkses::where('id_akses_level', $akses_level->id_akses_level)
				->where('id_menu_aplikasi_sub', $sub->id_menu_aplikasi_sub)
				->exists();
				@endphp
				<tr class="search-items">

					<td width="3%"></td>

					<td width="3%" class="text-right align-top">
						<div class="n-chk align-self-center text-center">
							<div class="form-check">
								<input type="checkbox" class="form-check-input menu-chkbox"
									name="id_menu_aplikasi_sub[]" value="{{ $sub->id_menu_aplikasi_sub }}"
									{{ $checkMenuSub ? 'checked' : '' }}>
								<label class="form-check-label"></label>
								<span class="new-control-indicator"></span>
							</div>
						</div>
					</td>
					<td><strong class="text-primary">{{ $sub->nama_menu_aplikasi_sub }}</strong>
						<br><small class="text-muted">
							Link: {{ $sub->alamat_menu_aplikasi_sub }}
							<br><em>{{ $sub->keterangan_sub }}</em>
						</small>
					</td>

					<td>{{ $sub->urutan_sub }}</td>

					<td><span class="badge bg-success-subtle text-success"><i class="{{ $sub->icon_sub }}"></i> {{ $sub->icon_sub }}</span></td>
					<td>
						<span class="badge <?= $sub->status_menu_aplikasi_sub === 'Active' ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger' ?>">
							<i class="fa <?= $sub->status_menu_aplikasi_sub === 'Active' ? 'fa-eye' : 'fa-eye-slash' ?>"></i> <?= $sub->status_menu_aplikasi_sub ?>
						</span>
					</td>
				</tr>
				@endforeach
				@endif
				@endforeach
			</tbody>
		</table>
	</div>

	<div class="mt-4 text-end">
		<button type="submit" class="btn btn-primary">Simpan Hak Akses</button>
		<a href="{{ url('admin/akses-level') }}" class="btn btn-secondary">Kembali</a>
	</div>
</form>

<script>
	// Script Check All
	document.getElementById('menu-check-all').addEventListener('change', function() {
		let checkboxes = document.querySelectorAll('.menu-chkbox');
		checkboxes.forEach(cb => cb.checked = this.checked);
	});
</script>