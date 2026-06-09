<div class="authentication-login min-vh-100 bg-body row justify-content-center align-items-center p-4">
  <div class="auth-max-width col-sm-8 col-md-6 col-xl-7 px-4">
    <h2 class="mb-1 fs-7 fw-bolder">{{ $title }}</h2>
    <p class="mb-7">{{ $konfigurasi->namaweb }}</p>
    
    <form action="{{ url('proses-login') }}" method="post">
          @csrf
          <input type="hidden" name="redirect_page" value="<?php if(isset($_GET['redirect'])) { echo $_GET['redirect']; }else{ } ?>">

      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Username</label>
        <input type="text" name="username" class="form-control" id="username" aria-describedby="Username" placeholder="Username" required>
        @error('username')
          <div class="invalid-feedback">{{ $message }}</div>
        @enderror
      </div>
      <div class="mb-4">
        <label for="exampleInputPassword1" class="form-label">Password</label>
        <input type="password" name="password" class="form-control" id="password" placeholder="Password" required>
         @error('password')
          <div class="invalid-feedback">{{ $message }}</div>
        @enderror
      </div>

      <div class="mb-4 row">
        <div class="col-md-6">
          <div id="gambarChaptcha">
            <img src="{{ asset($captcha) }}" class="img img-fluid rounded">
          </div>
        </div>
        <div class="col-md-6">
          <div class="input-group">
            <input type="text" name="captcha" class="form-control" id="captcha" placeholder="Captcha" value="<?php if(url('/login')=='http://localhost/datavet/login') { echo $randomString; } ?>" required>
            <div class="input-group-prepend">
              <button type="button" class="btn btn-secondary" id="btnCaptcha" data-bs-toggle="tooltip" data-bs-placement="top" title="Refresh Captcha" required><i class="fa-solid fa-sync"></i></button>
            </div>
          </div>
          @error('captcha')
            <div class="invalid-feedback d-block">{{ $message }}</div>
          @enderror
        </div>
      </div>

      <div class="d-flex align-items-center justify-content-between mb-4">
        <div class="form-check">
          <input class="form-check-input primary" name="saveAkun" type="checkbox" value="" id="flexCheckChecked" checked>
          <label class="form-check-label text-dark fs-3" for="flexCheckChecked">
            Ingat Saya
          </label>
        </div>
        <a class="text-primary fw-medium fs-3" href="{{ url('reset-password') }}">Lupa Password?</a>
      </div>
      <button type="submit" name="submit" value="submit" class="btn btn-primary w-100 py-8 mb-4 rounded-2">Login</button>
      <div class="d-flex align-items-center justify-content-center">
        <p class="fs-4 mb-0 fw-medium">Kembali ke 
        <a class="text-primary fw-medium ms-2" href="{{ url('/') }}">Beranda</a></p>
      </div>
    </form>

  </div>
</div>

<script>
document.getElementById('btnCaptcha').addEventListener('click', function () {

    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch("{{ url('refresh-chaptcha') }}", {
        method: "POST",
        headers: {
            "X-CSRF-TOKEN": csrfToken,
            "X-Requested-With": "XMLHttpRequest",
            "Accept": "application/json"
        }
    })
    .then(async response => {
        if (!response.ok) {
            throw new Error("Gagal mengambil captcha baru");
        }
        return response.json();
    })
    .then(data => {
        document.getElementById('gambarChaptcha').innerHTML =
            `<img src="${data.captcha}?t=${Date.now()}" class="img img-thumbnail">`;

        document.getElementById('captcha').value = '';

        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'success',
            title: data.message,
            timer: 2000,
            timerProgressBar: true,
            showConfirmButton: false
        });

    })
    .catch(error => {
        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'error',
            title: error.message || "Terjadi kesalahan saat refresh captcha",
            timer: 3000,
            timerProgressBar: true,
            showConfirmButton: false
        });

    });
});
</script>

