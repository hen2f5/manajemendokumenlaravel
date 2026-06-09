
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<p>
  @include('admin/poksi/tambah')
</p>

<form action="{{ asset('admin/poksi/proses') }}" method="post" accept-charset="utf-8">
{{ csrf_field() }}
<div class="row pb-2">
  <div class="col-md-12">
      <button class="btn btn-dark" type="submit" name="hapus" onClick="check();" >
          <i class="fa fa-trash"></i>
      </button> 
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#basicModal">
            <i class="fa fa-plus-circle"></i> Tambah Baru
        </button>
</div>
</div>

<table class="table table-bordered" id="file_export">
<thead class="table-light">
    <tr>
        <th width="5%">NO</th>
        <th width="30%">NAMA</th>
        <th width="10%">KODE</th>
        <th width="20%">KETERANGAN</th>
        <th width="10%">NO.URUT</th>
        <th>STATUS</th>
        <th>ACTION</th>
</tr>
</thead>
<tbody>

    <?php $i=1; foreach($poksi as $poksi) { ?>

    <td class="text-center">
        <input class="form-check-input" type="checkbox" name="id_poksi[]" value="<?php echo $poksi->id_poksi ?>" id="gridCheck<?php echo $i ?>">
    </td>
    <td><strong><?php echo $poksi->nama_poksi ?></strong>
        <br>
        <small>
            <strong>Unit Kerja:</strong>
            <ul>
                @foreach($poksi->unitKerja as $uk)
                
                    <li><i class="fa fa-circle"></i> {{ $uk->nama_unit_kerja }}</li>

                @endforeach
            </ul>
        </small>
    </td>
    <td><?php echo $poksi->kode_poksi ?></td>
    <td><?php echo $poksi->keterangan ?></td>
    <td><?php echo $poksi->urutan ?></td>
    <td class="text-center">
        <?php if($poksi->status_poksi=='Aktif') { ?>
            <span class="badge bg-success">{{ $poksi->status_poksi }}</span>
        <?php }else{ ?>
            <span class="badge bg-danger">{{ $poksi->status_poksi }}</span>
        <?php } ?>
    </td>
    <td>
        <?php if($poksi->status_poksi=='Aktif') { ?>
            <a href="{{ asset('admin/poksi/activate/'.$poksi->id_poksi.'?status=Disable') }}" class="btn btn-dark btn-sm mr-1 disable-link" title="Non Aktifkan"><i class="fa fa-lock"></i></a>
        <?php }else{ ?>
            <a href="{{ asset('admin/poksi/activate/'.$poksi->id_poksi.'?status=Activate') }}" class="btn btn-success btn-sm mr-1 approval-link" title="Aktifkan"><i class="fa fa-unlock-alt"></i></a>
        <?php } ?>
        <a href="{{ asset('admin/poksi/edit/'.$poksi->id_poksi) }}" 
          class="btn btn-warning btn-sm mr-1"><i class="fa fa-edit"></i></a>

          <a href="{{ asset('admin/poksi/delete/'.$poksi->id_poksi) }}" class="btn btn-secondary btn-sm mr-1 delete-link">
            <i class="fa fa-trash"></i></a>
    </td>
</tr>

<?php $i++; } ?>

</tbody>
</table>
</form>