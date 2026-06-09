@include('admin/akses-level/tambah')
@include('admin/akses-level/edit')
<table id="file_export" class="table table-bordered">
  <thead>
    <tr class="table-light">
      <th width="5%" class="bg-light text-center">No</th>
      <th width="35%" class="bg-light">Nama</th>
      <th width="7%" class="bg-light">Urutan</th>
     
      <th width="7%" class="bg-light">Menu</th>
      <th width="10%" class="bg-light">Sub Menu</th>
       <th width="7%" class="bg-light">Status</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
    <?php $no = 1;
    foreach ($aksesLevel as $item) { ?>
      <tr class="align-top">
        <td class="text-center">{{ $no }}</td>
        <td><strong>{{ $item->nama_akses_level }}</strong>
          <small>
            <br><?php if ($item->alamat_url == '' || $item->alamat_url == null) {
              echo 'URL Default: <em><a href="' . url('admin/dasbor') . '" target="_blank"  class="text-info">' . url('admin/dasbor') . '</a></em>';
            } else {
              echo 'URL Default: <em><a href="' . url($item->alamat_url) . '" target="_blank"  class="text-info">' . url($item->alamat_url) . '</a></em>';
            } ?>
          <br>
          <strong>Note:</strong> {{ $item->keterangan }}

          </small>
        </td>
        <td class="text-center">{{ $item->urutan }}</td>
        
        <td class="text-center"><?php echo $item->total_menu_aplikasi ?></td>
        <td class="text-center"><?php echo $item->total_menu_sub ?></td>
        <td class="text-center">
          <?php if ($item->status_akses_level == 'Aktif') { ?>
            <span class="badge text-bg-success"><i class="fa-solid fa-check-circle"></i> <?php echo ucfirst($item->status_akses_level) ?></span>
          <?php } else { ?>
            <span class="badge text-bg-danger"><i class="fa-solid fa-times-circle"></i> <?php echo ucfirst($item->status_akses_level) ?></span>
          <?php } ?>
        </td>
        <td>
          <?php if($item->status_akses_level=='Aktif') { ?>
              <a href="{{ asset('admin/akses-level/activate/'.$item->id_akses_level.'?status=Disable') }}" class="btn btn-dark btn-sm mr-1 disable-link" title="Non Aktifkan"><i class="fa fa-lock"></i></a>
          <?php }else{ ?>
              <a href="{{ asset('admin/akses-level/activate/'.$item->id_akses_level.'?status=Activate') }}" class="btn btn-success btn-sm mr-1 approval-link" title="Aktifkan"><i class="fa fa-unlock-alt"></i></a>
          <?php } ?>
          <a href="{{ url('admin/akses-level/menu/'.$item->id_akses_level) }}" class="btn btn-sm btn-warning">
            <i class="fa-solid fa-sitemap"></i> Kelola Menu
          </a>
          <button type="button" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#formUpdate" data-id="{{ $item->id_akses_level }}">
            <i class="fa-solid fa-edit"></i>
          </button>
          <a href="{{ url('admin/akses-level/delete/'.$item->id_akses_level) }}" class="btn btn-sm btn-secondary delete-link">
            <i class="fa-solid fa-trash"></i>
          </a>
        </td>
      </tr>
    <?php $no++;
    } ?>
  </tbody>
</table>