<p>
  <a href="{{ route('admin.menu-aplikasi.urutkan') }}" class="btn btn-success">
    <i class="fa-solid fa-tasks"></i> Urutkan Menu
  </a>
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#dataModal">
    <i class="fa-solid fa-plus-circle"></i> Tambah Menu
  </button>
  <button type="button" class="btn btn-dark" data-bs-toggle="modal" data-bs-target="#dataModalSub">
    <i class="fa-solid fa-plus-circle"></i> Tambah Sub Menu
  </button>
</p>

<table class="table tabelku">
  <thead>
    <tr class="text-uppercase">
      <th colspan="3" width="50%">Menu dan Sub Menu</th>
      
      <th width="10%">Icon</th>
      <th width="5%">Urutan</th>
      <th width="5%">Status</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    @forelse ($menu_aplikasi as $item)
    <tr>
      <td width="3%" class="text-center align-top">
        <i class="{{ $item->icon_menu_aplikasi }}"></i>
      </td>
      <td colspan="2">
        <strong>{{ $item->nama_menu_aplikasi }}</strong>
        <br><small class="text-muted">
          Link: <a href="{{ url($item->alamat_menu_aplikasi) }}" target="_blank" class="text-secondary">{{ url($item->alamat_menu_aplikasi) }}</a>
          <br><em>{{ $item->keterangan }}</em>
        </small>
      </td>
      
      <td class="text-center">
        <span class="badge bg-success-subtle text-success">
          <i class="{{ $item->icon_menu_aplikasi }}"></i> {{ $item->icon_menu_aplikasi }}
        </span>
      </td>
      <td class="text-center">{{ $item->urutan }}</td>
      <td class="text-center">
        <span class="badge {{ $item->status_menu_aplikasi === 'Aktif' ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger' }}">
          <i class="fa {{ $item->status_menu_aplikasi === 'Aktif' ? 'fa-eye' : 'fa-eye-slash' }}"></i> {{ $item->status_menu_aplikasi }}
        </span>
      </td>
      <td>
        <button type="button" class="btn btn-warning btn-sm mb-1 edit-btn" data-id="{{ $item->id_menu_aplikasi }}" data-bs-toggle="modal" data-bs-target="#dataModal">
          <i class="fa-solid fa-edit"></i>
        </button>
        <a href="{{ route('admin.menu-aplikasi.destroy', $item->id_menu_aplikasi) }}" class="btn btn-danger btn-sm mb-1 delete-link">
          <i class="fa-solid fa-trash"></i>
        </a>
      </td>
    </tr>

    {{-- Cek apakah submenus ada dan tidak null --}}
    @if(!empty($item->submenus))
    @foreach ($item->submenus as $sub)
    <tr class="text-sm">
      <td width="3%"></td>
      <td width="3%" class="text-right align-top"><i class="{{ $sub->icon_menu_aplikasi_sub }}"></i></td>
      <td>
        <strong class="text-primary">{{ $sub->nama_menu_aplikasi_sub }}</strong>
        <br><small class="text-muted">
          Link: <a href="{{ url($sub->alamat_menu_aplikasi_sub) }}" target="_blank" class="text-success">{{ url($sub->alamat_menu_aplikasi_sub) }}</a>
          <br><em>{{ $sub->keterangan_menu_aplikasi_sub }}</em>
        </small>
      </td>
      
      <td class="text-center">
        <span class="badge bg-success-subtle text-success">
          <i class="{{ $sub->icon_menu_aplikasi_sub }}"></i> {{ $sub->icon_menu_aplikasi_sub }}
        </span>
      </td>
      <td class="text-center">{{ $sub->urutan_sub }}</td>
      <td class="text-center">
        <span class="badge {{ $sub->status_menu_aplikasi_sub === 'Aktif' ? 'bg-success-subtle text-success' : 'bg-danger-subtle text-danger' }}">
          <i class="fa {{ $sub->status_menu_aplikasi_sub === 'Aktif' ? 'fa-eye' : 'fa-eye-slash' }}"></i> {{ $sub->status_menu_aplikasi_sub }}
        </span>
      </td>
      <td>
        <button type="button" class="btn btn-warning btn-sm mb-1 edit-btn-sub" data-id="{{ $sub->id_menu_aplikasi_sub }}" data-bs-toggle="modal" data-bs-target="#dataModalSub">
          <i class="fa-solid fa-edit"></i>
        </button>
        <a href="{{ route('admin.menu-aplikasi.destroy-sub', $sub->id_menu_aplikasi_sub) }}" class="btn btn-danger btn-sm mb-1 delete-link">
          <i class="fa-solid fa-trash"></i>
        </a>
      </td>
    </tr>
    @endforeach
    @endif
    @empty
    <tr>
      <td colspan="7" class="text-center">Data menu belum tersedia.</td>
    </tr>
    @endforelse
  </tbody>
</table>

@include('admin.menu-aplikasi.tambah-menu')
@include('admin.menu-aplikasi.tambah-sub-menu')