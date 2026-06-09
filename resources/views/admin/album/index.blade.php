
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
  @include('admin/album/tambah')
</p>

<form action="{{ asset('admin/album/proses') }}" method="post" accept-charset="utf-8">
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
        <th width="20%">KODE</th>
        <th width="20%">KETERANGAN</th>
        <th>ACTION</th>
</tr>
</thead>
<tbody>

    <?php $i=1; foreach($album as $album) { ?>

    <td class="text-center">
        <input class="form-check-input" type="checkbox" name="id_album[]" value="<?php echo $album->id_album ?>" id="gridCheck<?php echo $i ?>">
    </td>
    <td><?php echo $album->nama_album ?></td>
    <td><?php echo $album->slug_album ?></td>
    <td><?php echo $album->keterangan ?></td>

    <td>
       
        <a href="{{ asset('admin/album/edit/'.$album->id_album) }}" 
          class="btn btn-warning btn-sm mr-1"><i class="fa fa-edit"></i></a>

          <a href="{{ asset('admin/album/delete/'.$album->id_album) }}" class="btn btn-secondary btn-sm mr-1 delete-link">
            <i class="fa fa-trash"></i></a>
    </td>
</tr>

<?php $i++; } ?>

</tbody>
</table>
</form>