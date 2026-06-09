<div class="container-fluid">
    <form action="{{ route('admin.user.proses_edit', $user->id_user) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')

        <style>
            .no-click {
                pointer-events: none;
                background-color: #e9ecef;
                opacity: 0.7;
                cursor: not-allowed;
            }

            .unit-container {
                max-height: 200px;
                overflow-y: auto;
                border: 1px solid #dee2e6;
                padding: 15px;
                border-radius: 5px;
                background-color: #f8f9fa;
            }
        </style>

        <div class="form-group row mb-3">
            <label class="col-md-3 col-form-label fw-bold">Level & Status</label>
            <div class="col-md-4">
                <select name="nama_akses_level" class="form-select" required> {{-- Pastikan name sesuai dengan yang ditangkap Controller --}}
                    <option value="">Pilih Level Hak Akses</option>
                    @foreach($aksesLevel as $item)
                    <option value="{{ $item->nama_akses_level }}"
                        {{-- Bandingkan nama_akses_level (dari loop) dengan akses_level (dari data user) --}}
                        {{ $item->nama_akses_level == $user->akses_level ? 'selected' : '' }}>
                        {{ $item->nama_akses_level }}
                    </option>
                    @endforeach
                </select>
            </div>
            <div class="col-md-5">
                <select name="status_user" id="status_user" class="form-select">
                    <option value="Aktif" {{ old('status_user', $user->status_user) == 'Aktif' ? 'selected' : '' }}>Aktif</option>
                    <option value="Non Aktif" {{ old('status_user', $user->status_user) == 'Non Aktif' ? 'selected' : '' }}>Non Aktif</option>
                </select>
            </div>
        </div>

        <div class="form-group row mb-3">
            <label class="col-md-3 col-form-label fw-bold">Nama Lengkap</label>
            <div class="col-md-9">
                <input type="text" name="nama" class="form-control" placeholder="Nama user" value="{{ old('nama', $user->nama) }}" required>
            </div>
        </div>

        <div class="form-group row mb-3">
            <label class="col-md-3 col-form-label fw-bold">Email</label>
            <div class="col-md-9">
                <input type="email" name="email" class="form-control" placeholder="Email" value="{{ old('email', $user->email) }}" required>
            </div>
        </div>

        <div class="form-group row mb-3">
            <label class="col-md-3 col-form-label fw-bold">Username</label>
            <div class="col-md-9">
                <input type="text" name="username" class="form-control bg-light" value="{{ $user->username }}" readonly>
            </div>
        </div>

        <div class="form-group row mb-3">
            <label class="col-md-3 col-form-label fw-bold">Password Baru</label>
            <div class="col-md-9">
                <div class="input-group">
                    <input type="password" name="password" id="password" class="form-control" placeholder="Kosongkan jika tidak ingin mengganti">
                    <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                        <i class="fa fa-eye" id="eyeIcon"></i>
                    </button>
                </div>
                <small class="text-danger mt-1 d-block">Minimal 6 karakter jika ingin mengganti.</small>
            </div>
        </div>

        <div class="form-group row mb-3">
            <label class="col-md-3 col-form-label fw-bold">Foto Profil</label>
            <div class="col-md-5">
                <input type="file" name="gambar" id="gambarInput" class="form-control" accept="image/*">
                <div class="form-text text-muted">Format: JPG, PNG, JPEG (Max. 8MB). Kosongkan jika tidak ingin ganti foto.</div>
            </div>
            <div class="col-md-4 text-center">
                <label class="form-label fw-small d-block text-muted">Preview Foto</label>
                <div class="mt-2 text-center">
                    @php
                    $namaFile = $user->gambar;
                    // Check fisik untuk memastikan file ada
                    $pathFisik = public_path('assets/upload/user/thumbs/' . $namaFile);

                    if ($namaFile && file_exists($pathFisik)) {
                    // Paksa arahkan ke folder public karena server Anda membacanya dari sana
                    $urlGambar = asset('public/assets/upload/user/thumbs/' . $namaFile);
                    } else {
                    $urlGambar = asset('public/assets/img/no-image.png');
                    }
                    @endphp

                    <img id="gambarPreview"
                        src="{{ $urlGambar }}"
                        alt="Preview" class="img-thumbnail shadow-sm"
                        style="width: 150px; height: 150px; object-fit: cover; border-radius: 10px;">
                </div>
                @if($user->gambar)
                <small class="text-primary">Foto saat ini aktif</small>
                @endif
            </div>
        </div>

        <div class="form-group row mb-4">
            <label class="col-md-3 col-form-label fw-bold">Akses Unit Kerja</label>
            <div class="col-md-9">
                <div class="card card-body shadow-sm">
                    <div class="form-check mb-2">
                        {{-- Centang otomatis jika user memiliki akses ke semua unit yang ada --}}
                        <input type="checkbox" class="form-check-input" id="SemuaUnit" name="unit_all" value="1"
                            {{ count($userUnitIds) == count($unitKerja) ? 'checked' : '' }}>
                        <label class="form-check-label fw-bold text-primary" for="SemuaUnit">Pilih Semua Unit Kerja</label>
                    </div>
                    <hr class="my-2">
                    <div class="row unit-container m-0">
                        @foreach($unitKerja as $item)
                        <div class="col-md-4 mb-2">
                            <div class="form-check">
                                {{-- Menggunakan is_array untuk memastikan variabel bisa dihitung --}}
                                <input type="checkbox" class="form-check-input check-unit" id="unit{{ $item->id_unit_kerja }}" name="id_unit_kerja[]" value="{{ $item->id_unit_kerja }}"
                                    {{ (is_array($userUnitIds) && in_array($item->id_unit_kerja, $userUnitIds)) ? 'checked' : '' }}>
                                <label class="form-check-label" for="unit{{ $item->id_unit_kerja }}">
                                    {{ $item->nama_unit_kerja }}
                                </label>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group row mb-3">
            <div class="col-md-9 offset-md-3">
                <a href="{{ route('admin.user.index') }}" class="btn btn-outline-secondary px-4">
                    <i class="fa fa-arrow-left"></i> Kembali
                </a>
                <button type="submit" class="btn btn-primary px-4" id="btnSimpan">
                    <i class="fa fa-save"></i> Simpan Perubahan
                </button>
            </div>
        </div>
    </form>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const semuaUnit = document.getElementById("SemuaUnit");
        const unitList = document.querySelectorAll(".check-unit");
        const btnSimpan = document.getElementById("btnSimpan");
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const eyeIcon = document.getElementById('eyeIcon');

        // 1. Fitur Show/Hide Password
        togglePassword.addEventListener('click', function() {
            const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordInput.setAttribute('type', type);
            eyeIcon.classList.toggle('fa-eye');
            eyeIcon.classList.toggle('fa-eye-slash');
        });

        // 2. Inisialisasi: Jika "Semua Unit" tercentang di awal, kunci pilihan
        if (semuaUnit.checked) {
            lockUnit(true);
        }

        function minimalSatuUnit() {
            return [...unitList].some(cb => cb.checked);
        }

        function lockUnit(status) {
            unitList.forEach(cb => {
                if (status) {
                    cb.classList.add("no-click");
                    cb.setAttribute("onclick", "return false;");
                } else {
                    cb.classList.remove("no-click");
                    cb.removeAttribute("onclick");
                }
            });
        }

        // 3. Trigger saat "Semua Unit" diklik
        semuaUnit.addEventListener("change", function() {
            if (this.checked) {
                unitList.forEach(cb => cb.checked = true);
                lockUnit(true);
            } else {
                lockUnit(false);
            }
        });

        // 4. Trigger saat salah satu unit diklik manual
        unitList.forEach(cb => {
            cb.addEventListener("change", function() {
                if ([...unitList].every(item => item.checked)) {
                    semuaUnit.checked = true;
                    lockUnit(true);
                }
            });
        });

        // 5. Validasi akhir sebelum Submit
        btnSimpan.closest('form').addEventListener("submit", function(e) {
            if (!semuaUnit.checked && !minimalSatuUnit()) {
                e.preventDefault();
                Swal.fire({
                    icon: "error",
                    title: "Oops!",
                    text: "Anda harus memilih minimal satu Unit Kerja!"
                });
            }
        });

        // Fitur Preview Gambar Baru
        const gambarInput = document.getElementById('gambarInput');
        const gambarPreview = document.getElementById('gambarPreview');
        // Simpan URL gambar lama untuk reset jika batal pilih file
        const gambarLama = gambarPreview.src;

        gambarInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                // Validasi Ukuran (Contoh 8MB)
                if (file.size > 8 * 1024 * 1024) {
                    Swal.fire("Ukuran Terlalu Besar", "Maksimal ukuran gambar adalah 8MB", "error");
                    this.value = "";
                    gambarPreview.src = gambarLama;
                    return;
                }

                const reader = new FileReader();
                reader.onload = function(e) {
                    gambarPreview.src = e.target.result; // Tampilkan gambar baru
                }
                reader.readAsDataURL(file);
            } else {
                // Jika batal pilih, kembalikan ke foto lama
                gambarPreview.src = gambarLama;
            }
        });
    });
</script>