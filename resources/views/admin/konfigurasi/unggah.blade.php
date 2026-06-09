<form action="{{ route('admin.konfigurasi.update-unggah') }}" method="POST">
    @csrf

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">Ukuran Maksimal File Boleh Diunggah</label>
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-6">
                     <input type="number" name="ukuran_file_kb" id="ukuran_file_kb" placeholder="Ukuran File dalam Kb" value="{{ old('ukuran_file_kb', $konfigurasi->ukuran_file_kb) }}" class="form-control">
                    <small class="text-muted">Ukuran dalam Kilobyte</small>
                </div>
                <div class="col-md-6">
                     <input type="number" name="ukuran_file_mb" id="ukuran_file_mb" placeholder="Ukuran File dalam Kb" value="{{ old('ukuran_file_mb', $konfigurasi->ukuran_file_mb) }}" class="form-control bg-light" readonly>
                    <small class="text-muted">Ukuran dalam Megabyte</small>
                </div>
            </div>
           
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">Paginasi Halaman</label>
        <div class="col-md-9">
            <input type="number" name="pagination" placeholder="Misal: 100" value="{{ old('pagination', $konfigurasi->pagination) }}" class="form-control">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">Jumlah File Maksimal dalam Sekali Unggah</label>
        <div class="col-md-9">
            <input type="number" name="jumlah_file_maksimal" placeholder="Misal: 100" value="{{ old('jumlah_file_maksimal', $konfigurasi->jumlah_file_maksimal) }}" class="form-control">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">Ekstensi File yang Boleh Diunggah</label>
        <div class="col-md-9">
            <textarea name="ekstensi_file" id="ekstensi_file" placeholder="Ekstensi File yang Boleh Diunggah" pattern="[a-z0-9,]+" class="form-control text-lowercase">{{ old('ektensi_file', $konfigurasi->ekstensi_file) }}</textarea>
            <small class="text-muted">Tulis dalam huruf kecil dengan pemisah koma. Misal: jpg, png, pdf</small>
        </div>
    </div>

    <hr>
    <div class="form-group row mb-3">
        <label class="col-md-3"></label>
        <div class="col-md-9">
            <button type="submit" class="btn btn-success">
                <i class="fa fa-save"></i> Save Configuration
            </button>
            <button type="reset" class="btn btn-secondary">
                <i class="fa fa-sync"></i> Reset
            </button>
        </div>
    </div>

</form>
<script>
document.addEventListener("DOMContentLoaded", function(){

    const ekstensi = document.getElementById("ekstensi_file");

    function cekFormat(){

        let value = ekstensi.value
            .replace(/\s+/g,'')
            .toLowerCase();

        ekstensi.value = value;

        let regex = /^[a-z0-9]+(,[a-z0-9]+)*$/;

        if(value && !regex.test(value)){

            if(!Swal.isVisible()){
                Swal.fire({
                    icon: 'warning',
                    title: 'Format salah',
                    text: 'Gunakan format: jpg,png,pdf,zip',
                    showConfirmButton:false,
                    timer:2000
                });
            }

        }else{
            Swal.close(); // tutup jika sudah benar
        }
    }

    ekstensi.addEventListener("input", cekFormat);
    ekstensi.addEventListener("blur", cekFormat);

});
</script>

<script id="5c0dso">
document.addEventListener("DOMContentLoaded", function(){

    const kbInput = document.getElementById("ukuran_file_kb");
    const mbInput = document.getElementById("ukuran_file_mb");

    function hitungMB(){
        let kb = parseFloat(kbInput.value);

        if(!isNaN(kb)){
            let mb = kb / 1024;
            mbInput.value = mb.toFixed(2); // 2 angka desimal
        }else{
            mbInput.value = "";
        }
    }

    // saat user mengetik
    kbInput.addEventListener("keyup", hitungMB);

    // saat nilai sudah ada dari database
    hitungMB();

});
</script>

