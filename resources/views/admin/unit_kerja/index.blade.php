
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
  @include('admin/unit_kerja/tambah')
</p>

<form action="{{ asset('admin/unit-kerja/proses') }}" method="post" accept-charset="utf-8">
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

    <?php $i=1; foreach($unit_kerja as $unit_kerja) { ?>

    <td class="text-center">
        <input class="form-check-input" type="checkbox" name="id_unit_kerja[]" value="<?php echo $unit_kerja->id_unit_kerja ?>" id="gridCheck<?php echo $i ?>">
    </td>
    <td><?php echo $unit_kerja->nama_unit_kerja ?></td>
    <td><?php echo $unit_kerja->kode_unit_kerja ?></td>
    <td><?php echo $unit_kerja->keterangan ?></td>
    <td><?php echo $unit_kerja->urutan ?></td>
    <td class="text-center">
        <?php if($unit_kerja->status_unit_kerja=='Aktif') { ?>
            <span class="badge bg-success">{{ $unit_kerja->status_unit_kerja }}</span>
        <?php }else{ ?>
            <span class="badge bg-danger">{{ $unit_kerja->status_unit_kerja }}</span>
        <?php } ?>
    </td>
    <td>
        <?php if($unit_kerja->status_unit_kerja=='Aktif') { ?>
            <a href="{{ asset('admin/unit-kerja/activate/'.$unit_kerja->id_unit_kerja.'?status=Disable') }}" class="btn btn-dark btn-sm mr-1 disable-link" title="Non Aktifkan"><i class="fa fa-lock"></i></a>
        <?php }else{ ?>
            <a href="{{ asset('admin/unit-kerja/activate/'.$unit_kerja->id_unit_kerja.'?status=Activate') }}" class="btn btn-success btn-sm mr-1 approval-link" title="Aktifkan"><i class="fa fa-unlock-alt"></i></a>
        <?php } ?>
        <a href="{{ asset('admin/unit-kerja/edit/'.$unit_kerja->id_unit_kerja) }}" 
          class="btn btn-warning btn-sm mr-1"><i class="fa fa-edit"></i></a>

          <a href="{{ asset('admin/unit-kerja/delete/'.$unit_kerja->id_unit_kerja) }}" class="btn btn-secondary btn-sm mr-1 delete-link">
            <i class="fa fa-trash"></i></a>
    </td>
</tr>

<?php $i++; } ?>

</tbody>
</table>
</form>