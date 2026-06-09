@if ($errors->any())
<div class="alert alert-danger border-0 shadow-sm mb-4 animate__animated animate__fadeIn">
    <div class="d-flex">
        <i class="fa fa-exclamation-triangle mt-1 me-3"></i>
        <ul class="mb-0 small">
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
</div>
@endif

<form action="{{ url('admin/pejabat/proses_edit') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
    @csrf
    <input type="hidden" name="id_pejabat" value="{{ $pejabat->id_pejabat }}">

    <div class="row">
        <div class="col-md-8">
            <div class="card border-0 shadow-sm rounded-3">
                <div class="card-body p-4">

                    {{-- Unit Kerja --}}
                    <div class="form-group row mb-4">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">Unit Kerja</label>
                        <div class="col-sm-9">
                            @if(in_array(Auth::user()->akses_level, ['Admin', 'User-Pusat', 'Admin Unit Kerja']))
                            <select name="id_unit_kerja" class="form-select select2 border-secondary-subtle">
                                <option value="0">{{ $konfigurasi->namaweb }}</option>
                                @foreach($unit_kerja as $unit)
                                <option value="{{ $unit->id_unit_kerja }}" {{ $pejabat->id_unit_kerja == $unit->id_unit_kerja ? 'selected' : '' }}>
                                    {{ $unit->nama_unit_kerja }}
                                </option>
                                @endforeach
                            </select>
                            @else
                            <input type="hidden" name="id_unit_kerja" value="{{ $pejabat->id_unit_kerja }}">
                            <input type="text" class="form-control bg-light border-0 fw-medium" value="{{ $pejabat->nama_unit_kerja }}" readonly>
                            <small class="text-muted italic">*Unit kerja dikunci sesuai otoritas Anda.</small>
                            @endif
                        </div>
                    </div>

                    {{-- Nama & NIP --}}
                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">Nama Pejabat</label>
                        <div class="col-sm-9">
                            <input type="text" name="nama_pejabat" class="form-control shadow-sm" placeholder="Nama Lengkap & Gelar" value="{{ old('nama_pejabat', $pejabat->nama_pejabat) }}" required>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">NIP</label>
                        <div class="col-sm-9">
                            <input type="text" name="nip" class="form-control shadow-sm" placeholder="Nomor Induk Pegawai" value="{{ old('nip', $pejabat->nip) }}" required>
                        </div>
                    </div>

                    {{-- Jabatan --}}
                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">Jabatan</label>
                        <div class="col-sm-9">
                            <input type="text" name="jabatan" class="form-control shadow-sm" placeholder="Contoh: Dekan Fakultas Teknik" value="{{ old('jabatan', $pejabat->jabatan) }}" required>
                        </div>
                    </div>

                    <hr class="my-4 text-secondary-subtle">

                    {{-- Pengaturan Tampilan --}}
                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">Status Aktif</label>
                        <div class="col-sm-9">
                            <div class="form-check form-switch mt-2">
                                <input class="form-check-input" type="checkbox" name="status_pimpinan" value="Ya" id="statusSwitch" {{ $pejabat->status_pimpinan == 'Ya' ? 'checked' : '' }}>
                                <label class="form-check-label ms-2" for="statusSwitch">Tampilkan sebagai Pejabat Utama</label>
                            </div>
                            <small class="text-muted">Jika diaktifkan, tanda tangan akan muncul secara otomatis di dokumen terkait.</small>
                        </div>
                    </div>

                    <div class="form-group row mb-4">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">Nomor Urut</label>
                        <div class="col-sm-3">
                            <input type="number" name="urutan" class="form-control shadow-sm text-center fw-bold" value="{{ $pejabat->urutan }}" required>
                        </div>
                        <div class="col-sm-6 d-flex align-items-center">
                            <small class="text-muted">*Menentukan urutan posisi di halaman depan.</small>
                        </div>
                    </div>

                    <div class="form-group row mb-4">
                        <label class="col-sm-3 col-form-label text-md-end fw-semibold">Ganti TTD/Foto</label>
                        <div class="col-sm-9">
                            <div class="input-group">
                                <span class="input-group-text bg-light"><i class="fa fa-upload"></i></span>
                                <input type="file" name="gambar" class="form-control shadow-sm">
                            </div>
                            <div class="form-text text-danger small">*Format: JPG, PNG (Maks. 8MB). Kosongkan jika tidak diganti.</div>
                        </div>
                    </div>

                    {{-- Footer Button --}}
                    <div class="form-group row mt-5">
                        <div class="col-sm-9 offset-sm-3 d-flex gap-2">
                            <button type="submit" class="btn btn-primary px-4 shadow-sm">
                                <i class="fa fa-save me-2"></i>Simpan Perubahan
                            </button>
                            <a href="{{ url('admin/pejabat') }}" class="btn btn-outline-secondary px-4">
                                Batal
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        {{-- Sidebar Pratinjau --}}
        <div class="col-md-4">
            <div class="card border-0 shadow-sm rounded-3 overflow-hidden">
                <div class="card-header bg-light py-3 border-bottom text-center">
                    <h6 class="card-title mb-0 fw-bold">PRATINJAU TTD/FOTO</h6>
                </div>
                <div class="card-body p-4 text-center bg-white">
                    <div class="img-preview-container mb-3 p-2 border rounded bg-light">
                        @if($pejabat->gambar)
                        <img src="{{ asset('assets/upload/image/thumbs/'.$pejabat->gambar) }}" class="img-fluid rounded shadow-sm" id="main-preview">
                        @else
                        <div class="py-5 text-muted">
                            <i class="fa fa-image fa-3x mb-2 opacity-25"></i>
                            <p class="small mb-0">Belum ada lampiran file</p>
                        </div>
                        @endif
                    </div>
                    @if($pejabat->gambar)
                    <span class="badge bg-light text-dark border px-3 py-2 fw-normal">
                        <i class="fa fa-file-image-o me-1"></i> {{ $pejabat->gambar }}
                    </span>
                    @endif
                </div>
            </div>

            {{-- Info Card Tambahan --}}
            <div class="card border-0 shadow-sm rounded-3 mt-4 bg-primary text-white">
                <div class="card-body p-4">
                    <h6 class="fw-bold mb-3"><i class="fa fa-info-circle me-2"></i>Info Pembaruan</h6>
                    <p class="small mb-0 opacity-75">
                        Pembaruan data ini akan langsung berdampak pada seluruh dokumen sistem yang menggunakan identitas pejabat ini. Pastikan NIP dan Nama Gelar sudah sesuai dengan SK terbaru.
                    </p>
                </div>
            </div>
        </div>
    </div>
</form>

<style>
    .form-control:focus {
        border-color: #4e73df;
        box-shadow: 0 0 0 0.25rem rgba(78, 115, 223, 0.1);
    }

    .img-preview-container img {
        max-height: 250px;
        width: auto;
    }

    .form-switch .form-check-input {
        width: 3em;
        height: 1.5em;
        cursor: pointer;
    }
</style>