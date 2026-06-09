<div class="row">
    <div class="col-md-12">
        {{-- Form Background Icon --}}
        <form action="{{ route('admin.konfigurasi.upload', 'icon') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group row mb-3">
                <label class="col-md-3 font-weight-bold">Upload Icon Baru</label>
                <div class="col-md-6">
                    <input type="file" name="icon" class="form-control @error('icon') is-invalid @enderror" onchange="previewImage(this, 'preview-icon')">
                    <small class="text-muted">Format: JPG, PNG, GIF (Maks. 4MB). Disarankan: 1920x1080px</small>

                    <div class="mt-3">
                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Simpan Icon</button>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <label class="d-block small font-weight-bold">Pratinjau Icon:</label>
                    <img src="{{ asset('assets/upload/image/' . $konfigurasi->icon) 
            ? asset('assets/upload/image/' . $konfigurasi->icon) 
            : asset('assets/upload/image/no-image.png') }}"
                        id="preview-icon"
                        class="img img-thumbnail shadow-sm">
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    /**
     * Fungsi Universal Live Preview Gambar
     */
    function previewImage(input, targetId) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                document.getElementById(targetId).src = e.target.result;
            }
            reader.readAsDataURL(input.files[0]);
        }
    }
</script>