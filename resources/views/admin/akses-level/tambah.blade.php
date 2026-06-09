<p>
  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
    <i class="fa-solid fa-circle-plus"></i> Tambah Baru
  </button>
</p>
<form action="{{ asset('admin/akses-level/simpan') }}" method="POST" accept-charset="utf-8">
  {{ csrf_field() }}

  <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Tambah Baru</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">Nama Akses Level</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" name="nama_akses_level" value="{{ old('nama_akses_level') }}" placeholder="Nama Akses Level" required />
            </div>
          </div>


          <div class="mb-3 row">
            <label class="col-md-3" for="alamat_menu_aplikasi">Alamat URL setelah login</label>
            <div class="col-md-9">
              <div class="input-group">
                <span class="input-group-text" id="basic-addon3"><?php echo url('/') ?>/</span>
                <input type="text" name="alamat_url" class="form-control" placeholder="Alamat Menu">
              </div>
              <small class="text-secondary">Misal: <em><?php echo url('/') ?>/<span class="text-danger">admin/user</em></small>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">Keterangan</label>
            <div class="col-sm-9">
              <textarea name="keterangan" class="form-control" placeholder="Keterangan">{{ old('keterangan') }}</textarea>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">Urutan</label>
            <div class="col-sm-9">
              <input type="number" class="form-control" name="urutan" value="{{ old('urutan', $urutan) }}" placeholder="Urutan" readonly />
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-form-label col-sm-3 pt-0">Status</label>
            <div class="col-sm-9">
              <div class="form-check">
                <input class="form-check-input" type="radio" name="status_akses_level" id="status_akses_level1" value="Aktif" checked />
                <label class="form-check-label" for="status_akses_level1"> Aktif</label>
              </div>
              <div class="form-check">
                <input class="form-check-input" type="radio" name="status_akses_level" id="status_akses_level2" value="Inaktif" />
                <label class="form-check-label" for="status_akses_level2"> Non Aktif</label>
              </div>
            </div>
          </div>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
            <i class="bi bi-x-circle"></i> Tutup
          </button>
          <button type="submit" class="btn btn-primary">
            <i class="bi bi-save"></i> Simpan
          </button>
        </div>
      </div>
    </div>
  </div>
</form>