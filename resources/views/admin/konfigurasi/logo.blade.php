<div class="row">
    <div class="col-md-12">
        {{-- Form Background Logo --}}
        <form action="{{ route('admin.konfigurasi.upload', 'logo') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="form-group row mb-3">
                <label class="col-md-3 font-weight-bold">Upload Logo Baru</label>
                <div class="col-md-6">
                    <input type="file" name="logo" class="form-control @error('logo') is-invalid @enderror" onchange="previewImage(this, 'preview-logo')">
                    <small class="text-muted">Format: JPG, PNG, GIF (Maks. 4MB). Disarankan: 1920x1080px</small>

                    <div class="mt-3">
                        <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Simpan Background</button>
                    </div>
                </div>
                <div class="col-md-3 text-center">
                    <label class="d-block small font-weight-bold">Pratinjau Background:</label>
                    <img src="{{ (asset('assets/upload/image/' . $konfigurasi->logo)) 
    ? asset('assets/upload/image/' . $konfigurasi->logo) 
    : asset('assets/upload/image/no-image.png') }}"
                        id="preview-logo"
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