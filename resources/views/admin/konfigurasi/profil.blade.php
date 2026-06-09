
        @if ($errors->any())
        <div class="alert alert-danger shadow-sm">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif

        {{-- Gunakan route() atau url() yang mengarah ke proses_profil --}}
        <form action="{{ url('admin/konfigurasi/update-profil') }}" enctype="multipart/form-data" method="post">
            @csrf
            <input type="hidden" name="id_konfigurasi" value="{{ $konfigurasi->id_konfigurasi }}">

            <div class="row">
                {{-- Bagian Input Teks --}}
                <div class="col-md-8">
                    <div class="mb-3">
                        <label class="fw-bold mb-1">Judul Singkat / Nama Organisasi</label>
                        <input type="text" name="nama_singkat" placeholder="Nama singkat organisasi" value="{{ $konfigurasi->nama_singkat }}" required class="form-control">
                    </div>

                    <div class="mb-3">
                        <label class="fw-bold mb-1">Tentang Perusahaan / Summary</label>
                        <textarea name="tentang" rows="8" class="form-control konten-berita" id="kontenku" placeholder="Tuliskan deskripsi singkat...">{{ $konfigurasi->tentang }}</textarea>
                    </div>
                </div>

                {{-- Bagian Upload Gambar --}}
                <div class="col-md-4">
                    <div class="card bg-light border-0">
                        <div class="card-body text-center">
                            <h4 class="fw-bold d-block mb-3 text-start">Gambar Profil Saat Ini</h4>

                            {{-- Perbaikan Path Gambar (Sesuaikan dengan Controller) --}}
                            <div class="mb-3">
                                <img src="{{ ($konfigurasi->gambar && file_exists('./assets/upload/image/' . $konfigurasi->gambar)) 
                                    ? asset('./assets/upload/image/' . $konfigurasi->gambar) 
                                    : asset('./assets/upload/image/no-image.png') }}"
                                    class="img-fluid rounded shadow-sm border" id="main-preview" style="max-height: 200px; width: 100%; object-fit: cover;">
                            </div>

                            <div class="mb-3 text-start">
                                <label class="fw-bold mb-1 small">Ganti Gambar Baru</label>
                                <input type="file" name="gambar" class="form-control form-control-sm" id="file-upload">
                                <p class="text-muted small mt-1">Format: JPG, PNG, JPEG (Maks. 8MB)</p>
                            </div>

                            {{-- Wadah Preview Baru --}}
                            <div id="new-preview-container" style="display: none;">
                                <label class="fw-bold mb-1 small d-block text-start text-success">Pratinjau Gambar Baru:</label>
                                <div id="imagePreview" class="rounded border shadow-sm"></div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 border-top pt-4 mt-3">
                    <div class="d-flex justify-content-center gap-2">
                        <button type="submit" class="btn btn-success btn-md px-5 shadow">
                            <i class="fas fa-save me-2"></i> Simpan Profil Baru
                        </button>
                        <button type="reset" class="btn btn-outline-secondary btn-md px-4">
                            <i class="fas fa-sync me-2"></i> Reset
                        </button>
                    </div>
                </div>
            </div>
        </form>
    
<style>
    #imagePreview {
        width: 100%;
        height: 150px;
        background-position: center center;
        background-size: cover;
        display: inline-block;
    }

    .card {
        border-radius: 12px;
    }
</style>

<script type="text/javascript">
    $(function() {
        $("#file-upload").on("change", function() {
            var files = !!this.files ? this.files : [];
            if (!files.length || !window.FileReader) return;

            if (/^image/.test(files[0].type)) {
                var reader = new FileReader();
                reader.readAsDataURL(files[0]);

                reader.onloadend = function() {
                    $("#new-preview-container").fadeIn();
                    $("#imagePreview").css("background-image", "url(" + this.result + ")");
                }
            }
        });
    });
</script>