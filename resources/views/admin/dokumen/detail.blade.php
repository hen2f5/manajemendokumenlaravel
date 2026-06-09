
<div class="row">
	<div class="col-md-12 d-flex justify-content-end mb-3">
        <a href="<?php echo url('admin/dokumen') ?>" class="btn btn-outline-info me-2">
            <i class="fa-solid fa-arrow-left"></i> Kembali
        </a>
        <a href="<?php echo url('admin/dokumen/unduh/'.$dokumen->kode_dokumen) ?>" class="btn btn-danger">
            <i class="fa-solid fa-download"></i> Unduh
        </a>
        <a href="<?php echo url('admin/dokumen/edit/'.$dokumen->kode_dokumen) ?>" class="btn btn-warning">
            <i class="fa-solid fa-edit"></i> Update
        </a>
    </div>
	<div class="col-md-5">
		<table class="table table-bordered table-sm align-top">
            <thead>
                <tr>
                    <th width="40%" class="align-top">Nama Dokumen</th>
                    <th class="align-top">
                        <div id="nama_dokumen"></div>
                    </th>
                </tr>
            </thead>
            <tbody>
                
                <tr>
                    <td>Jenis Dokumen</td>
                    <td>
                        <div id="nama_jenis_dokumen"></div>
                    </td>
                </tr>
                <tr>
                    <td>Sub Jenis Dokumen</td>
                    <td>
                        <div id="nama_sub_jenis_dokumen"></div>
                    </td>
                </tr>
                <tr>
                    <td>Perkembangan</td>
                    <td>
                        <div id="nama_perkembangan"></div>
                    </td>
                </tr>
                <tr>
                    <td>Album</td>
                    <td>
                        <div id="nama_album"></div>
                    </td>
                </tr>
                <tr>
                    <td>Keterangan</td>
                    <td>
                        <div id="keterangan"></div>
                    </td>
                </tr>
                <tr>
                    <td>Ekstensi</td>
                    <td>
                        <div id="ekstensi_file"></div>
                    </td>
                </tr>
                <tr>
                    <td>Ukuran</td>
                    <td>
                        <div id="ukuran_file"></div>
                    </td>
                </tr>
                
                <tr>
                    <td>Dilihat</td>
                    <td>
                        <div id="hits"></div>
                    </td>
                </tr>
                <tr>
                    <td>Diunduh</td>
                    <td>
                        <div id="unduh"></div>
                    </td>
                </tr>
                
                <tr>
                    <td>Diunggah oleh</td>
                    <td>
                        <div id="createdBy"></div>
                    </td>
                </tr>
                <tr>
                    <td>Diunggah pada</td>
                    <td>
                        <div id="created_at"></div>
                    </td>
                </tr>
            </tbody>
        </table>

	</div>
	<div class="col-md-7">
		<div id="nama_file"></div>

	</div>
</div>

<script>
$(document).ready(function(){

    
        var modal = $(this);

        // daftar field yang akan diisi
        var fields = [
            'nama_dokumen',
            'nama_jenis_dokumen',
            'nama_sub_jenis_dokumen',
            'nama_perkembangan',
            'nama_album',
            'keterangan',
            'ekstensi_file',
            'ukuran_file',
            'hits',
            'unduh',
            'createdBy',
            'created_at'
        ];

        // tampilkan loading
        fields.forEach(function(field){
            modal.find('#'+field).html('<span class="text-muted">Loading...</span>');
        });

        modal.find('#nama_file').html('<div class="text-center p-3">Loading preview...</div>');

        // AJAX request
        $.ajax({
            url: '<?php echo url("admin/dokumen/show/".$dokumen->kode_dokumen) ?>',
            type: 'GET',
            dataType: 'json',
            success: function(data){

                // isi data text
                fields.forEach(function(field){
                    if(data[field] !== null){
                        modal.find('#'+field).text(data[field]);
                    }else{
                        modal.find('#'+field).text('-');
                    }
                });

                // khusus HTML preview file
                modal.find('#nama_file').html(data.nama_file);

            },
            error: function(){
                modal.find('#nama_file').html(
                    '<div class="alert alert-danger">Gagal memuat dokumen</div>'
                );
            }

        });

    });


</script>		
