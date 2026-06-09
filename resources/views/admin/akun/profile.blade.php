@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{ url('admin/akun/update-profile') }}" method="POST" enctype="multipart/form-data">
    @csrf

    <style>
        .no-click {
            pointer-events: none;
            background-color: #f8f9fa;
            opacity: 0.7;
        }

        .unit-container {
            max-height: 200px;
            overflow-y: auto;
            border: 1px solid #dee2e6;
            padding: 10px;
            border-radius: 5px;
        }
    </style>

    <div class="text-center mb-3">
        <?php if($user->gambar != '') { ?>
         <img id="gambarPreview" src="{{ asset('assets/upload/user/'.$user->gambar) }}"
                    alt="Preview" class="img-thumbnail shadow-sm" style="max-width: 100px; height:auto;">
        <?php }else{ ?>
            <img id="gambarPreview" src="{{ asset('assets/images/profile-user.png') }}"
                    alt="Preview" class="img-thumbnail shadow-sm" style="max-width: 100px; height:auto;">
        <?php } ?>
    </div>
    <hr>

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Upload foto profil</label>
        <div class="col-md-9">
            <input type="file" name="gambar" id="gambarInput" class="form-control" accept="image/*">
            <div class="form-text text-mute">Format: JPG, PNG, JPEG (Max. 8MB)</div>
        </div>
        
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Status User</label>
        <div class="col-sm-9">
            @if($user->status_user == 'Aktif')
            <span class="badge bg-success"><i class="fa fa-check-circle"></i> Aktif</span>
            @else
            <span class="badge bg-danger"><i class="fa fa-times-circle"></i> Non Aktif</span>
            @endif
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Nama lengkap</label>
        <div class="col-sm-9">
            <input type="text" name="nama" class="form-control" placeholder="Nama lengkap" value="{{ old('nama',$user->nama) }}" required>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Email</label>
        <div class="col-sm-9">
            <input type="email" name="email" class="form-control" placeholder="Email" value="{{ old('email',$user->email) }}" required>
        </div>
    </div>              

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Username</label>
        <div class="col-sm-9">
            <input type="text" name="username" class="form-control bg-dark text-white" placeholder="Username" value="{{ old('username',$user->username) }}" readonly>
        </div>
    </div>


    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Level Hak Akses</label>
        <div class="col-sm-9">
            <select name="id_akses_level" class="form-control select2-modal" id="akses_level" required>
                <?php foreach($aksesLevel as $item) { if(session()->get('id_akses_level')==$item->id_akses_level) { ?>
                    <option value="<?php echo $item->id_akses_level ?>"
                        <?php echo old('id_akses_level') == $item->id_akses_level ? 'selected' : '' ?>>
                        <?php echo $item->nama_akses_level ?>
                    </option>
                <?php }} ?>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right">Unit Kerja</label>
        <div class="col-sm-9">
            <select name="id_unit_kerja" class="form-control select2-modal" width="100%" id="id_unit_kerja" required>
                <option value="">Pilih Unit Kerja</option>
                <option value="0" <?php if($user->id_akses_level) { echo 'selected'; } ?>>
                    Semua Unit Kerja
                </option>

                <?php foreach($unitKerja as $unit) { if(session()->get('id_unit_kerja')==$unit->id_unit_kerja) {  ?>
                    <option value="<?php echo $unit->id_unit_kerja ?>"
                        class="Admin-Unit User-Unit Pimpinan-Unit"
                        <?php echo old('id_unit_kerja') == $unit->id_unit_kerja ? 'selected' : '' ?>>
                        <?php echo $unit->nama_unit_kerja ?>
                    </option>
                <?php }} ?>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-sm-3 control-label text-right"></label>
        <div class="col-md-9">
            
                <button type="reset" class="btn btn-secondary border">Reset</button>
                <button type="submit" class="btn btn-primary" id="btnSimpan"><i class="fa fa-save"></i> Simpan User</button>
           
        </div>
        
    </div>

                   
</form>

<script>
// show thumbnail
const inputGambar = document.getElementById('gambarInput');
const preview = document.getElementById('gambarPreview');
const form = document.getElementById('formProfil');
// simpan gambar default
const defaultImage = preview.src;
// preview saat pilih gambar
inputGambar.addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            preview.src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
});
// reset preview saat tombol reset ditekan
form.addEventListener('reset', function() {
    setTimeout(function(){
        preview.src = defaultImage;
    }, 100);
});

</script>