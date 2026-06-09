<form action="{{ route('admin.user.proses_tambah') }}" method="POST" enctype="multipart/form-data">
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

    <div class="modal fade" id="modal-user" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header bg-light">
                    <h5 class="modal-title" id="modalLabel"><i class="fa fa-user-plus text-primary"></i> Tambah User Baru</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Level Hak Akses</label>
                            <select name="nama_akses_level" class="form-select" required>
                                <option value="">Pilih Hak Akses</option>
                                @foreach($aksesLevel as $item)
                                <option value="{{ $item->nama_akses_level }}">{{ $item->nama_akses_level }}</option>
                                @endforeach
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Status User</label>
                            <select name="status_user" class="form-select">
                                <option value="Aktif">Aktif</option>
                                <option value="Non Aktif">Non Aktif</option>
                            </select>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Nama Lengkap</label>
                            <input type="text" name="nama" id="nama" class="form-control" placeholder="Masukkan nama" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Email</label>
                            <input type="email" name="email" id="email" class="form-control" placeholder="alamat@email.com" required>
                        </div>
                    </div>

                    <div class="row mb-4">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Username</label>
                            <input type="text" name="username" class="form-control" placeholder="Username untuk login" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Password</label>
                            <div class="input-group">
                                <input type="password" name="password" id="password" class="form-control" placeholder="Min. 6 karakter" required>
                                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                    <i class="fa fa-eye" id="eyeIcon"></i>
                                </button>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Foto Profil</label>
                            <input type="file" name="gambar" id="gambarInput" class="form-control" accept="image/*">
                            <div class="form-text text-muted">Format: JPG, PNG, JPEG (Max. 8MB)</div>
                        </div>
                        <div class="col-md-6 text-center">
                            <label class="form-label fw-bold d-block">Preview Foto</label>
                            <div class="mt-2">
                                <img id="gambarPreview" src="{{ asset('assets/img/no-image.png') }}"
                                    alt="Preview" class="img-thumbnail shadow-sm"
                                    style="max-height: 150px; min-width: 150px; object-fit: cover;">
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-12 form-label fw-bold text-primary"><i class="fa fa-sitemap"></i> Akses Unit Kerja</label>
                        <div class="col-12">
                            <div class="card card-body pt-2 pb-2 shadow-sm">
                                <div class="form-check mb-2 border-bottom pb-2">
                                    <input type="checkbox" class="form-check-input" id="SemuaUnit" name="unit_all" value="1">
                                    <label class="form-check-label fw-bold" for="SemuaUnit">Pilih Semua Unit Kerja</label>
                                </div>
                                <div class="row unit-container m-0">
                                    @foreach($unitKerja as $item)
                                    <div class="col-md-4 mb-2">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input check-unit" id="uk{{ $item->id_unit_kerja }}" name="id_unit_kerja[]" value="{{ $item->id_unit_kerja }}">
                                            <label class="form-check-label" for="uk{{ $item->id_unit_kerja }}">{{ $item->nama_unit_kerja }}</label>
                                        </div>
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer px-0 pb-0 mt-3">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="reset" class="btn btn-light border">Reset</button>
                        <button type="submit" class="btn btn-primary" id="btnSimpan"><i class="fa fa-save"></i> Simpan User</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const semuaUnit = document.getElementById("SemuaUnit");
        const unitList = document.querySelectorAll(".check-unit");
        const btnSimpan = document.getElementById("btnSimpan");

        // 1. Fungsi Lock/Unlock Unit Kerja
        function lockUnit(status) {
            unitList.forEach(cb => {
                if (status) {
                    cb.checked = true;
                    cb.classList.add("no-click");
                    cb.setAttribute("onclick", "return false;"); // Mencegah interaksi manual
                } else {
                    cb.classList.remove("no-click");
                    cb.removeAttribute("onclick");
                }
            });
        }

        // Toggle Pilih Semua
        semuaUnit.addEventListener("change", function() {
            if (this.checked) {
                lockUnit(true);
            } else {
                lockUnit(false);
                unitList.forEach(cb => cb.checked = false);
            }
        });

        // 2. Validasi Form Sebelum Submit
        const formTambah = btnSimpan.closest('form');
        formTambah.addEventListener("submit", function(e) {
            const anyUnitChecked = [...unitList].some(cb => cb.checked);

            if (!semuaUnit.checked && !anyUnitChecked) {
                e.preventDefault();
                Swal.fire({
                    icon: 'warning',
                    title: 'Unit Kerja Kosong',
                    text: 'Harap pilih minimal satu Unit Kerja!'
                });
            }
        });

        // Fitur Show/Hide Password
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const eyeIcon = document.getElementById('eyeIcon');

        togglePassword.addEventListener('click', function() {
            // Toggle tipe input
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);

            // Toggle ikon mata
            eyeIcon.classList.toggle('fa-eye');
            eyeIcon.classList.toggle('fa-eye-slash');
        });

        // Fitur Preview Gambar
        const gambarInput = document.getElementById('gambarInput');
        const gambarPreview = document.getElementById('gambarPreview');

        gambarInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                // Validasi ukuran (Opsional, contoh 8MB)
                if (file.size > 8 * 1024 * 1024) {
                    Swal.fire("Ukuran Terlalu Besar", "Maksimal ukuran gambar adalah 8MB", "error");
                    this.value = "";
                    return;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    gambarPreview.src = e.target.result;
                }
                reader.readAsDataURL(file);
            } else {
                // Jika batal pilih file, kembalikan ke gambar default
                gambarPreview.src = "{{ asset('assets/img/no-image.png') }}";
            }
        });
    });
</script>