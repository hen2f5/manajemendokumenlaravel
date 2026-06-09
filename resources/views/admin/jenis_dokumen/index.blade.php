
@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif



<form action="{{ asset('admin/jenis-dokumen/proses') }}" method="post" accept-charset="utf-8">
{{ csrf_field() }}
<div class="row pb-2">
  <div class="col-md-12">
      <button class="btn btn-dark" type="submit" name="hapus" onClick="check();" >
          <i class="fa fa-trash"></i>
      </button> 
        <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#basicModal">
            <i class="fa fa-plus-circle"></i> Tambah Menu
        </button>
        <button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#basicModalSub">
            <i class="fa fa-plus-circle"></i> Tambah Sub Menu
        </button>
</div>
</div>

<table class="table table-bordered table-condensed" id="file_export">
<thead class="table-light">
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

    <?php $i=1; foreach($jenis_dokumen as $item) { ?>
        <tr class="table-light">    
            <td class="text-center">
                <input class="form-check-input" type="checkbox" name="id_jenis_dokumen[]" value="<?php echo $item->id_jenis_dokumen ?>" id="gridCheck<?php echo $i ?>">
            </td>
            <td><?php echo $item->nama_jenis_dokumen ?></td>
            <td><?php echo $item->kode_jenis_dokumen ?></td>
            <td><?php echo $item->keterangan ?></td>
            <td><?php echo $item->urutan ?></td>
            <td class="text-center">
                <?php if($item->status_jenis_dokumen=='Aktif') { ?>
                    <span class="badge bg-success">{{ $item->status_jenis_dokumen }}</span>
                <?php }else{ ?>
                    <span class="badge bg-danger">{{ $item->status_jenis_dokumen }}</span>
                <?php } ?>
            </td>
            <td>
                <?php if($item->status_jenis_dokumen=='Aktif') { ?>
                    <a href="{{ asset('admin/jenis-dokumen/activate/'.$item->id_jenis_dokumen.'?status=Disable') }}" class="btn btn-dark btn-sm mr-1 disable-link" title="Non Aktifkan"><i class="fa fa-lock"></i></a>
                <?php }else{ ?>
                    <a href="{{ asset('admin/jenis-dokumen/activate/'.$item->id_jenis_dokumen.'?status=Activate') }}" class="btn btn-success btn-sm mr-1 approval-link" title="Aktifkan"><i class="fa fa-unlock-alt"></i></a>
                <?php } ?>
                <a href="{{ asset('admin/jenis-dokumen/edit/'.$item->id_jenis_dokumen) }}" 
                  class="btn btn-warning btn-sm mr-1"><i class="fa fa-edit"></i></a>

                  <a href="{{ asset('admin/jenis-dokumen/delete/'.$item->id_jenis_dokumen) }}" class="btn btn-secondary btn-sm mr-1 delete-link">
                    <i class="fa fa-trash"></i></a>
            </td>
        </tr>
<?php 
$sub_jenis_dokumen = $item->subJenisDokumen;
if(count($sub_jenis_dokumen) > 0) { foreach($sub_jenis_dokumen as $itemSub) { ?>
    <tr class="text-sm">
        <td></td>
        <td><i class="fa-solid fa-circle-right"></i> <?php echo $itemSub->nama_sub_jenis_dokumen ?></td>
        <td><?php echo $itemSub->kode_sub_jenis_dokumen ?></td>
        <td><?php echo $itemSub->keterangan ?></td>
        <td><?php echo $itemSub->urutan ?></td>
        <td class="text-center">
            <?php if($itemSub->status_sub_jenis_dokumen=='Aktif') { ?>
                <span class="badge bg-success">{{ $itemSub->status_sub_jenis_dokumen }}</span>
            <?php }else{ ?>
                <span class="badge bg-danger">{{ $itemSub->status_sub_jenis_dokumen }}</span>
            <?php } ?>
        </td>
        <td>
            <?php if($itemSub->status_sub_jenis_dokumen=='Aktif') { ?>
                <a href="{{ asset('admin/sub-jenis-dokumen/activate/'.$itemSub->id_sub_jenis_dokumen.'?status=Disable') }}" class="btn btn-dark btn-sm mr-1 disable-link" title="Non Aktifkan"><i class="fa fa-lock"></i></a>
            <?php }else{ ?>
                <a href="{{ asset('admin/sub-jenis-dokumen/activate/'.$itemSub->id_sub_jenis_dokumen.'?status=Activate') }}" class="btn btn-success btn-sm mr-1 approval-link" title="Aktifkan"><i class="fa fa-unlock-alt"></i></a>
            <?php } ?>
            <a href="{{ asset('admin/sub-jenis-dokumen/edit/'.$itemSub->id_sub_jenis_dokumen) }}" 
              class="btn btn-warning btn-sm mr-1"><i class="fa fa-edit"></i></a>

              <a href="{{ asset('admin/sub-jenis-dokumen/delete/'.$itemSub->id_sub_jenis_dokumen) }}" class="btn btn-secondary btn-sm mr-1 delete-link">
                <i class="fa fa-trash"></i></a>
        </td>
    </tr>
<?php }}$i++; } ?>

</tbody>
</table>

</form>

@include('admin/jenis_dokumen/tambah')
@include('admin/sub_jenis_dokumen/tambah')