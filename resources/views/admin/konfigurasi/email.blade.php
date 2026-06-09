<form action="{{ route('admin.konfigurasi.update-email') }}" method="POST">
    @csrf

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">Protocol</label>
        <div class="col-md-9">
            <input type="text" name="protocol" placeholder="Misal: smtp" value="{{ old('protocol', $konfigurasi->protocol) }}" class="form-control">
            <small class="text-muted">Gunakan mail, sendmail, atau smtp</small>
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">SMTP Host</label>
        <div class="col-md-9">
            <input type="text" name="smtp_host" placeholder="Misal: smtp.gmail.com" value="{{ old('smtp_host', $konfigurasi->smtp_host) }}" class="form-control">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">SMTP Port</label>
        <div class="col-md-9">
            <input type="text" name="smtp_port" placeholder="Misal: 465 atau 587" value="{{ old('smtp_port', $konfigurasi->smtp_port) }}" class="form-control">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">SMTP Timeout</label>
        <div class="col-md-9">
            <input type="number" name="smtp_timeout" placeholder="Misal: 7" value="{{ old('smtp_timeout', $konfigurasi->smtp_timeout) }}" class="form-control">
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">SMTP User (Email)</label>
        <div class="col-md-9">
            <input type="text" name="smtp_user" placeholder="Email pengirim" value="{{ old('smtp_user', $konfigurasi->smtp_user) }}" class="form-control @error('smtp_user') is-invalid @enderror">
            @error('smtp_user')
            <div class="invalid-feedback">{{ $message }}</div>
            @enderror
        </div>
    </div>

    <div class="form-group row mb-3">
        <label class="col-md-3 font-weight-bold">SMTP Password</label>

        <div class="col-md-9">
            <div class="input-group">
                <input 
                    type="password"
                    id="smtp_pass"
                    name="smtp_pass"
                    placeholder="Password email / App Password"
                    value="{{ old('smtp_pass', $konfigurasi->smtp_pass) }}"
                    class="form-control"
                >

                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                    <i class="fa fa-eye"></i>
                </button>
            </div>

            <small class="text-info">
                Abaikan jika tidak ingin mengganti password lama.
            </small>
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
document.getElementById("togglePassword").addEventListener("click", function () {
    const password = document.getElementById("smtp_pass");
    const icon = this.querySelector("i");

    if (password.type === "password") {
        password.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
    } else {
        password.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
    }
});
</script>