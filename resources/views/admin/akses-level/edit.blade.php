<form action="{{ asset('admin/akses-level/update') }}" method="post" id="formEdit" accept-charset="utf-8">
  {{ csrf_field() }}

  <!-- Modal -->
  <div class="modal fade" id="formUpdate" tabindex="-1" aria-labelledby="formUpdate" aria-hidden="true">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Update Data</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">

          <input type="hidden" id="id_akses_level" name="id_akses_level" value="">

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">Nama Akses Level</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="nama_akses_level" name="nama_akses_level" value="{{ old('nama_akses_level') }}" placeholder="Nama Akses Level" required />
            </div>
          </div>


          <div class="mb-3 row">
            <label class="col-md-3" for="alamat_menu_aplikasi">Alamat URL setelah login</label>
            <div class="col-md-9">
              <div class="input-group">
                <span class="input-group-text" id="basic-addon3"><?php echo url('/') ?>/</span>
                <input type="text" id="alamat_url" name="alamat_url" class="form-control" placeholder="Alamat Menu">
              </div>
              <small class="text-secondary">Misal: <em><?php echo url('/') ?>/<span class="text-danger">admin/user</em></small>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">Keterangan</label>
            <div class="col-sm-9">
              <textarea id="keterangan" name="keterangan" class="form-control" placeholder="Keterangan">{{ old('keterangan') }}</textarea>
            </div>
          </div>

          <div class="row mb-3">
            <label class="col-sm-3 col-form-label">Urutan</label>
            <div class="col-sm-9">
              <input type="number" id="urutan" class="form-control" name="urutan" value="{{ old('urutan') }}" placeholder="Urutan" required />
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

<script>
  $(document).ready(function() {
    $('#formUpdate').on('show.bs.modal', function(event) {
      var button = $(event.relatedTarget);
      var id = button.data('id');
      var modal = $(this);

      // Reset form
      $('#formEdit')[0].reset();

      if (id) {
        $.ajax({
          url: '{{ url("admin/akses-level/show") }}/' + id,
          method: 'GET',
          dataType: 'json',
          success: function(response) {
            // KUNCI PERBAIKAN: Ambil properti 'data' dari dalam response
            var item = response.data;

            if (response.status === 'success') {
              $('#id_akses_level').val(item.id_akses_level);
              $('#nama_akses_level').val(item.nama_akses_level);
              $('#keterangan').val(item.keterangan);
              $('#urutan').val(item.urutan);
              $('#alamat_url').val(item.alamat_url);

              // Radio Button
              $('input[name="status_akses_level"]').prop('checked', false);
              $('input[name="status_akses_level"][value="' + item.status_akses_level + '"]').prop('checked', true);
            }
          },
          error: function(xhr) {
            console.error(xhr.responseText);
            alert('Gagal mengambil data. Cek console log.');
          }
        });
      }
    });
  });
</script>