<form action="{{ route('admin.konfigurasi.update') }}" method="POST">
    @csrf

    <h4>Informasi Dasar</h4>
    <hr>
    <div class="form-group row mb-3">
        <label class="col-md-3">Nama Website</label>
        <div class="col-md-9">
            <input type="text" name="namaweb" class="form-control @error('namaweb') is-invalid @enderror" value="{{ old('namaweb', $konfigurasi->namaweb) }}" required>
            @error('namaweb') <div class="invalid-feedback">{{ $message }}</div> @enderror
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Singkatan Website</label>
        <div class="col-md-9">
            <input type="text" name="singkatan" class="form-control" value="{{ old('singkatan', $konfigurasi->singkatan) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Tagline Website</label>
        <div class="col-md-9">
            <input type="text" name="tagline" class="form-control" value="{{ old('tagline', $konfigurasi->tagline) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Alamat Website (URL)</label>
        <div class="col-md-6">
            <input type="text" name="website" class="form-control" value="{{ old('website', $konfigurasi->website) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Setting Pagination</label>
        <div class="col-md-3">
            <input type="number" name="paginasi" class="form-control" value="{{ old('paginasi', $konfigurasi->paginasi) }}">
            <small class="text-gray">Paginasi back end</small>
        </div>
        <div class="col-md-3">
            <input type="number" name="paginasi_depan" class="form-control" value="{{ old('paginasi_depan', $konfigurasi->paginasi_depan) }}">
            <small class="text-gray">Paginasi front end</small>
        </div>
    </div>

    <hr>
    <h4>Informasi Profil Website/Aplikasi</h4>
    <hr>
    <div class="form-group row mb-3">
        <label class="col-md-3">Tentang Website</label>
        <div class="col-md-9">
            <textarea name="tentang" class="form-control konten-berita" rows="5">{{ old('tentang', $konfigurasi->tentang) }}</textarea>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Deskripsi Ringkas</label>
        <div class="col-md-9">
            <textarea name="deskripsi" class="form-control">{{ old('deskripsi', $konfigurasi->deskripsi) }}</textarea>
        </div>
    </div>

    <hr>
    <h4>Kontak dan Alamat</h4>
    <hr>

    <div class="form-group row mb-3">
        <label class="col-md-3">Official Email</label>
        <div class="col-md-6">
            <input type="email" name="email" class="form-control" value="{{ old('email', $konfigurasi->email) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Secondary Email</label>
        <div class="col-md-6">
            <input type="email" name="email_cadangan" class="form-control" value="{{ old('email_cadangan', $konfigurasi->email_cadangan) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Telepon</label>
        <div class="col-md-6">
            <input type="text" name="telepon" class="form-control" value="{{ old('telepon', $konfigurasi->telepon) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">HP</label>
        <div class="col-md-6">
            <input type="text" name="hp" class="form-control" value="{{ old('hp', $konfigurasi->hp) }}">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Alamat</label>
        <div class="col-md-9">
            <textarea name="alamat" class="form-control summernote">{{ old('alamat', $konfigurasi->alamat) }}</textarea>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Google Map</label>
        <div class="col-md-9">
            <textarea name="google_map" class="form-control">{{ old('google_map', $konfigurasi->google_map) }}</textarea>
        </div>
    </div>

    <hr>
    <h4>Kontak Whatsapp</h4>
    <hr>

    <div class="form-group row mb-3">
        <label class="col-md-3">Nomor Whatsapp <i class="fab fa-whatsapp text-success"></i></label>
        <div class="col-md-6">
            <input type="text" name="whatsapp" class="form-control" value="{{ old('whatsapp', $konfigurasi->whatsapp) }}">
            <small class="text-warning">Format nomor: 628122727427</small>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Pesan Whatsapp</label>
        <div class="col-md-9">
            <textarea name="pesan_whatsapp" class="form-control">{{ old('pesan_whatsapp', $konfigurasi->pesan_whatsapp) }}</textarea>
        </div>
    </div>

    <hr>
    <h4>Jejaring Sosial</h4>
    <hr>

    <div class="form-group row mb-3">
        <label class="col-md-3">Facebook <i class="fab fa-facebook"></i></label>
        <div class="col-md-3">
            <input type="text" name="nama_facebook" class="form-control" value="{{ old('nama_facebook', $konfigurasi->nama_facebook) }}" placeholder="Nama akun">
        </div>
        <div class="col-md-6">
            <input type="text" name="facebook" class="form-control" value="{{ old('facebook', $konfigurasi->facebook) }}" placeholder="Link akun">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Instagram <i class="fab fa-instagram text-danger"></i></label>
        <div class="col-md-3">
            <input type="text" name="nama_instagram" class="form-control" value="{{ old('nama_instagram', $konfigurasi->nama_instagram) }}" placeholder="Nama akun">
        </div>
        <div class="col-md-6">
            <input type="text" name="instagram" class="form-control" value="{{ old('instagram', $konfigurasi->instagram) }}" placeholder="Link akun">
        </div>
    </div>

    <hr>
    <h4>Informasi Pendaftaran Online</h4>
    <hr>

    <div class="form-group row mb-3">
        <label class="col-md-3">Fitur Pendaftaran Online</label>
        <div class="col-md-6">
            <select name="fitur_pendaftaran" class="form-control">
                <option value="Off" {{ old('fitur_pendaftaran', $konfigurasi->fitur_pendaftaran) == 'Off' ? 'selected' : '' }}>Off - Non Aktif</option>
                <option value="On" {{ old('fitur_pendaftaran', $konfigurasi->fitur_pendaftaran) == 'On' ? 'selected' : '' }}>On - Aktif</option>
            </select>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Periode Pendaftaran Online</label>
        <div class="col-md-3">
            <input type="date" name="mulai_pendaftaran" class="form-control" value="{{ old('mulai_pendaftaran', $konfigurasi->mulai_pendaftaran) }}">
            <small class="text-muted">Tanggal mulai</small>
        </div>
        <div class="col-md-3">
            <input type="date" name="selesai_pendaftaran" class="form-control" value="{{ old('selesai_pendaftaran', $konfigurasi->selesai_pendaftaran) }}">
            <small class="text-muted">Tanggal selesai</small>
        </div>
        <div class="col-md-3">
            <input type="date" name="pengumuman_pendaftaran" class="form-control" value="{{ old('pengumuman_pendaftaran', $konfigurasi->pengumuman_pendaftaran) }}">
            <small class="text-muted">Tanggal pengumuman</small>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3">Informasi pendaftaran</label>
        <div class="col-md-9">
            <textarea name="keterangan_pendaftaran" class="form-control" rows="5">{{ old('keterangan_pendaftaran', $konfigurasi->keterangan_pendaftaran) }}</textarea>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3"></label>
        <div class="col-md-9">
            <button type="submit" class="btn btn-success"><i class="fa fa-save"></i> Simpan Konfigurasi</button>
        </div>
    </div>
</form>