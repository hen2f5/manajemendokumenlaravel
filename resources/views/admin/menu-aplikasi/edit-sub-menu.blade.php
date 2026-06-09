<form action="{{ url('admin/menu-aplikasi/proses-edit-sub') }}" method="post" accept-charset="utf-8">
    {{ csrf_field() }}
<input type="hidden" name="id_menu_aplikasi_sub" value="<?php echo $menu_aplikasi_sub->id_menu_aplikasi_sub ?>">
<div class="mb-3 row">
    <label class="col-md-3" for="id_menu_aplikasi">Menu Utama</label>
    <div class="col-md-9">
        <select class="form-control" name="id_menu_aplikasi">
            <option value="">Pilih Menu Induk</option>
            <?php foreach($menu_aplikasi as $menu_aplikasi) { ?>
	            <option value="<?php echo $menu_aplikasi->id_menu_aplikasi ?>" <?php if($menu_aplikasi->id_menu_aplikasi==$menu_aplikasi_sub->id_menu_aplikasi) { echo 'selected'; } ?>>
	                <?php echo $menu_aplikasi->nama_menu_aplikasi ?>
	            </option>
	        <?php } ?>
        </select>
    </div>
</div>

<div class="mb-3 row">
    <label class="col-md-3" for="icon_menu_aplikasi_sub">Status, Urutan, &amp; Icon </label>
    <div class="col-md-4">
        <select id="status_menu_aplikasi_sub" name="status_menu_aplikasi_sub" class="form-control" required>
            <option value="">Pilih Status</option>
            <option value="Aktif"  <?php if($menu_aplikasi_sub->status_menu_aplikasi_sub=='Aktif') { echo 'selected'; } ?>>Aktif</option>
            <option value="Inactive"  <?php if($menu_aplikasi_sub->status_menu_aplikasi_sub=='Inactive') { echo 'selected'; } ?>>Inactive</option>
        </select>
        <small class="text-secondary">Status</small>
    </div>
    <div class="col-md-5">
        <input type="number" id="urutan" name="urutan" class="form-control" placeholder="Urutan" value="<?php echo $menu_aplikasi_sub->urutan ?>">
        <small class="text-secondary">Nomor urut Sub menu</small>
    </div>
</div>

<div class="mb-3 row">
    <label class="col-md-3" for="nama_menu_aplikasi_sub">Nama Sub Menu</label>
    <div class="col-md-9">
        <input type="text" id="nama_menu_aplikasi_sub" name="nama_menu_aplikasi_sub" class="form-control" placeholder="Nama Menu Aplikasi" value="<?php echo $menu_aplikasi_sub->nama_menu_aplikasi_sub ?>">
    </div>
</div>

<div class="mb-3 row">
    <label class="col-md-3" for="alamat_menu_aplikasi_sub">Alamat Sub Menu</label>
    <div class="col-md-9">
        <div class="input-group"> 
            <span class="input-group-text" id="basic-addon3"><?php echo url('/') ?>/</span> 
            <input type="text" id="alamat_menu_aplikasi_sub" name="alamat_menu_aplikasi_sub" class="form-control" placeholder="Alamat Menu" value="<?php echo $menu_aplikasi_sub->alamat_menu_aplikasi_sub ?>">
        </div>
        <small class="text-secondary">Misal: <em><?php echo url('/') ?>/<span class="text-danger">admin/user</em></small>
    </div>
</div>

<div class="mb-3 row">
    <label class="col-md-3" for="icon_menu_aplikasi_sub">Icon Sub Menu</label>
    <div class="col-md-9">
        <div class="input-group"> 
            <span class="input-group-text" id="basic-addon4">Misal: fa-solid fa-users</span> 
             <input type="text" id="icon_menu_aplikasi_sub" name="icon_menu_aplikasi_sub" class="form-control" placeholder="Icon" value="<?php echo $menu_aplikasi_sub->icon_menu_aplikasi_sub ?>">
        </div>
        <small class="text-secondary">Referensi: <a href="https://icons.getbootstrap.com/" target="_blank">https://icons.getbootstrap.com/</a></small>
    </div>
</div>


<div class="mb-3 row">
    <label class="col-md-3" for="keterangan">Keterangan</label>
    <div class="col-md-9">
        <textarea id="keterangan" name="keterangan" class="form-control" placeholder="Keterangan"><?php echo $menu_aplikasi_sub->keterangan ?></textarea>
    </div>
</div>



<div class="mb-3 row">
    <label class="col-md-3" for="id_akses_level"></label>
    <div class="col-md-9">
        <div class="btn-group mb-2" role="group" aria-label="Basic example">
            <a href="<?php echo url('admin/menu-aplikasi') ?>" class="btn btn-secondary">
                <i class="fa-solid fa-arrow-left"></i> Kembali
            </a>
            <button type="reset" class="btn btn-dark">
                <i class="fa-solid fa-times-circle"></i> Reset
            </button>
            <button name="submit" class="btn btn-primary" type="submit">Edit Data <i class="fa-solid fa-circle-right"></i></button>
        </div>
    </div>
</div>
</form>