<form action="{{ url('admin/dokumen/tambah-album') }}" enctype="multipart/form-data" method="post">
    {{ csrf_field() }}

    <div class="modal fade" id="basicModalAlbum" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <div class="modal-header bg-light">
                    <h4 class="modal-title">Buat Album Baru</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">

                    <div class="mb-3">
                        <label class="form-label">Nama Album</label>
                        <input type="text" name="nama_album" class="form-control" placeholder="Nama Album" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Keterangan</label>
                        <textarea name="keterangan" class="form-control" rows="3" placeholder="Keterangan"></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Gambar Album</label>
                        <input type="file" name="gambar" class="form-control">
                        <small class="text-muted">Format: JPG, PNG</small>
                    </div>

                </div>

                <div class="modal-footer bg-light">
                    <button type="button" class="btn btn-dark" data-bs-dismiss="modal">
                        <i class="fa-solid fa-times-circle"></i> Close
                    </button>

                    <button type="reset" class="btn btn-success">
                        <i class="fa-solid fa-recycle"></i> Reset
                    </button>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa-solid fa-save"></i> Simpan Album
                    </button>
                </div>

            </div>
        </div>
    </div>

</form>