<div class="modal fade" id="basicModal">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Tambah Pejabat Penanda Tangan</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="{{ url('admin/pejabat/tambah') }}" enctype="multipart/form-data" method="post" accept-charset="utf-8">
                    @csrf

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">Unit Kerja</label>
                        <div class="col-sm-9">
                            {{-- Cek akses menggunakan Facade Auth yang lebih standar --}}
                            @if(in_array(Auth::user()->akses_level, ['Admin Unit Kerja', 'User-Pusat', 'Admin']))
                            <select name="id_unit_kerja" class="form-select select2" required>
                                <option value="0">{{ $konfigurasi->namaweb }}</option>
                                @foreach($unit_kerja as $unit)
                                <option value="{{ $unit->id_unit_kerja }}" {{ old('id_unit_kerja') == $unit->id_unit_kerja ? 'selected' : '' }}>
                                    {{ $unit->nama_unit_kerja }}
                                </option>
                                @endforeach
                            </select>
                            @else
                            {{-- Jika Admin Unit, input dibuat readonly/hidden sesuai data user yang login --}}
                            <input type="hidden" name="id_unit_kerja" value="{{ Auth::user()->id_unit_kerja }}">
                            <input type="text" class="form-control" value="{{ Auth::user()->unitKerja->nama_unit_kerja ?? config('app.name') }}" readonly>
                            <small class="text-muted">Unit kerja dikunci sesuai otoritas akun Anda.</small>
                            @endif
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">Nama Pejabat</label>
                        <div class="col-sm-9">
                            <input type="text" name="nama_pejabat" class="form-control @error('nama_pejabat') is-invalid @enderror" placeholder="Nama lengkap & gelar" value="{{ old('nama_pejabat') }}" required>
                            @error('nama_pejabat') <div class="invalid-feedback">{{ $message }}</div> @enderror
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">NIP</label>
                        <div class="col-sm-9">
                            <input type="text" name="nip" class="form-control @error('nip') is-invalid @enderror" placeholder="NIP" value="{{ old('nip') }}" required>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">Jabatan</label>
                        <div class="col-sm-9">
                            <input type="text" name="jabatan" class="form-control" placeholder="Contoh: Dekan / Kepala Unit" value="{{ old('jabatan') }}" required>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">Status Aktif?</label>
                        <div class="col-sm-9">
                            <select name="status_pimpinan" class="form-select">
                                <option value="Ya" {{ old('status_pimpinan') == 'Ya' ? 'selected' : '' }}>Ya (Aktif)</option>
                                <option value="Tidak" {{ old('status_pimpinan') == 'Tidak' ? 'selected' : '' }}>Tidak (Non-Aktif)</option>
                            </select>
                            <small class="text-warning">Jika "Ya", pejabat ini akan muncul sebagai penanda tangan utama.</small>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">Nomor Urut</label>
                        <div class="col-sm-9">
                            <input type="number" name="urutan" id="urutan" class="form-control" placeholder="Urutan" value="{{ old('urutan', $urutan ?? 1) }}" readonly>
                        </div>
                    </div>

                    <div class="form-group row mb-3">
                        <label class="col-sm-3 col-form-label text-end">Foto / Tanda Tangan</label>
                        <div class="col-sm-9">
                            <input type="file" name="gambar" class="form-control @error('gambar') is-invalid @enderror">
                            @error('gambar') <div class="invalid-feedback">{{ $message }}</div> @enderror
                            <small class="text-muted">Format: JPG, PNG (Maks. 8MB). Sistem akan otomatis melakukan resize ke 150x150px.</small>
                        </div>
                    </div>

                    <div class="modal-footer px-0 pb-0">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Batal</button>
                        <button type="reset" class="btn btn-info text-white"><i class="fa fa-sync"></i> Reset</button>
                        <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Simpan Pejabat</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>