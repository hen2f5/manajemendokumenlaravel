@if ($errors->any())
    <div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
<form action="{{ route('admin.user.proses_edit', $user->id_user) }}" method="POST" enctype="multipart/form-data">
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


<div class="modal-body">
<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Status User</label>
<div class="col-sm-9">
    <div class="form-check">
      <input class="form-check-input" type="radio" name="status_user" value="Aktif"
{{ old('status_user', $user->status_user) == 'Aktif' ? 'checked' : '' }}>
      <label class="form-check-label" for="gridRadios1">
        Aktif
      </label>
    </div>
    <div class="form-check">
      <input class="form-check-input" type="radio" name="status_user" value="Non Aktif"
{{ old('status_user', $user->status_user) == 'Non Aktif' ? 'checked' : '' }}>
      <label class="form-check-label" for="gridRadios2">
        Non Aktif
      </label>
    </div>
</div>
</div>

<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Nama lengkap</label>
<div class="col-sm-9">
    <input type="text" name="nama" class="form-control" placeholder="Nama lengkap" value="{{ old('nama', $user->nama) }}" required>
</div>
</div>

<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Email</label>
<div class="col-sm-9">
    <input type="email" name="email" class="form-control" placeholder="Email" value="{{ old('email', $user->email) }}" required>
</div>
</div>              

<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Username</label>
<div class="col-sm-9">
    <input type="text" name="username" class="form-control" placeholder="Username" value="{{ old('username', $user->username) }}" required>
</div>
</div>

<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Password</label>
<div class="col-sm-9">
    <div class="input-group">
        <input type="password" id="password" name="password" placeholder="Password" value="{{ old('password') }}" class="form-control">
        <button class="btn btn-outline-secondary" type="button" id="togglePassword">
            <i class="fa fa-eye"></i>
        </button>
    </div>
</div>
</div>


<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Level Hak Akses</label>
<div class="col-sm-9">
    <select name="id_akses_level" class="form-control select2" id="akses_level" required>
        <option value="">Pilih Level Hak Akses</option>
        <?php foreach($aksesLevel as $item) { ?>
            <option value="<?php echo $item->id_akses_level ?>"
{{ old('id_akses_level', $user->id_akses_level) == $item->id_akses_level ? 'selected' : '' }}>
                <?php echo $item->nama_akses_level ?>
            </option>
        <?php } ?>
    </select>
</div>
</div>

<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Unit Kerja</label>
<div class="col-sm-9">
    <select name="id_unit_kerja" class="form-control select2" width="100%" id="id_unit_kerja" required>
        <option value="">Pilih Unit Kerja</option>
        <option value="0" {{ old('id_unit_kerja', $user->id_unit_kerja) == '0' ? 'selected' : '' }}>
            Semua Unit Kerja
        </option>

        <?php foreach($unitKerja as $unit) { ?>
            <option value="<?php echo $unit->id_unit_kerja ?>"
                class="Admin-Unit User-Unit Pimpinan-Unit" {{ old('id_unit_kerja', $user->id_unit_kerja) == $unit->id_unit_kerja ? 'selected' : '' }}>
                <?php echo $unit->nama_unit_kerja ?>
            </option>
        <?php } ?>
    </select>
</div>
</div>

<div class="form-group row mb-3">
<label class="col-sm-3 control-label text-right">Upload foto profil</label>
<div class="col-md-6">
    <input type="file" name="gambar" id="gambarInput" class="form-control" accept="image/*">
    <div class="form-text text-muted mb-3">Format: JPG, PNG, JPEG (Max. 8MB)</div>

    <p>
        <button type="reset" class="btn btn-secondary border">Reset</button>
        <button type="submit" class="btn btn-primary" id="btnSimpan"><i class="fa fa-save"></i> Simpan User</button>
    </p>
</div>
<div class="col-md-2 text-center">
    <div class="mt-2">
        <img id="gambarPreview" src="{{ $user->gambar ? asset('assets/upload/user/'.$user->gambar) : asset('assets/images/profile-user.png') }}"
            alt="Preview" class="img-thumbnail shadow-sm">
    </div>
</div>


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
// show password
document.getElementById("togglePassword").addEventListener("click", function () {
    const password = document.getElementById("password");
    const icon = this.querySelector("i");
    if (password.type === "password") {
        password.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    } else {
        password.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
});
</script>