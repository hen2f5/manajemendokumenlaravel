
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
  @include('admin/sub_jenis_dokumen/tambah')
</p>

<form action="{{ asset('admin/sub-jenis-dokumen/proses') }}" method="post" accept-charset="utf-8">
{{ csrf_field() }}
<div class="row pb-2">
  <div class="col-md-12">
      <button class="btn btn-dark" type="submit" name="hapus" onClick="check();" >
          <i class="fa fa-trash"></i>
      </button> 
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#basicModalSub">
            <i class="fa fa-plus-circle"></i> Tambah Baru
        </button>
</div>
</div>

<table class="table table-bordered" id="file_export">
<thead>
    <tr class="bg-light">
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

    <?php $i=1; foreach($sub_jenis_dokumen as $sub_jenis_dokumen) { ?>

    <td class="text-center">
        <input class="form-check-input" type="checkbox" name="id_sub_jenis_dokumen[]" value="<?php echo $sub_jenis_dokumen->id_sub_jenis_dokumen ?>" id="gridCheck<?php echo $i ?>">
    </td>
    <td><?php echo $sub_jenis_dokumen->nama_sub_jenis_dokumen ?>
        <small>
            <br>Induk Dokumen: <em>{{ $sub_jenis_dokumen->jenisDokumen->nama_jenis_dokumen ?? '-' }}</em>
        </small>
    </td>
    <td><?php echo $sub_jenis_dokumen->kode_sub_jenis_dokumen ?></td>
    <td><?php echo $sub_jenis_dokumen->keterangan ?></td>
    <td><?php echo $sub_jenis_dokumen->urutan ?></td>
    <td class="text-center">
        <?php if($sub_jenis_dokumen->status_sub_jenis_dokumen=='Aktif') { ?>
            <span class="badge bg-success">{{ $sub_jenis_dokumen->status_sub_jenis_dokumen }}</span>
        <?php }else{ ?>
            <span class="badge bg-danger">{{ $sub_jenis_dokumen->status_sub_jenis_dokumen }}</span>
        <?php } ?>
    </td>
    <td>
        <?php if($sub_jenis_dokumen->status_sub_jenis_dokumen=='Aktif') { ?>
            <a href="{{ asset('admin/sub-jenis-dokumen/activate/'.$sub_jenis_dokumen->id_sub_jenis_dokumen.'?status=Disable') }}" class="btn btn-dark btn-sm mr-1 disable-link" title="Non Aktifkan"><i class="fa fa-lock"></i></a>
        <?php }else{ ?>
            <a href="{{ asset('admin/sub-jenis-dokumen/activate/'.$sub_jenis_dokumen->id_sub_jenis_dokumen.'?status=Activate') }}" class="btn btn-success btn-sm mr-1 approval-link" title="Aktifkan"><i class="fa fa-unlock-alt"></i></a>
        <?php } ?>
        <a href="{{ asset('admin/sub-jenis-dokumen/edit/'.$sub_jenis_dokumen->id_sub_jenis_dokumen) }}" 
          class="btn btn-warning btn-sm mr-1"><i class="fa fa-edit"></i></a>

          <a href="{{ asset('admin/sub-jenis-dokumen/delete/'.$sub_jenis_dokumen->id_sub_jenis_dokumen) }}" class="btn btn-secondary btn-sm mr-1 delete-link">
            <i class="fa fa-trash"></i></a>
    </td>
</tr>

<?php $i++; } ?>

</tbody>
</table>
</form>