<div class="authentication-login min-vh-100 bg-body row justify-content-center align-items-center p-4">
  <div class="auth-max-width col-sm-8 col-md-6 col-xl-7 px-4">
    <h2 class="mb-1 fs-7 fw-bolder">{{ $title }}</h2>
    <p class="mb-7">{{ $konfigurasi->namaweb }}</p>

    <div class="alert customize-alert alert-dismissible text-primary alert-light-primary bg-primary-subtle fade show remove-close-icon" role="alert">
      <span class="side-line bg-primary"></span>

      <div class="d-flex align-items-center ">
        <i class="ti ti-info-circle fs-5 me-2 flex-shrink-0 text-primary"></i>
        <span class="text-truncate">Masukkan email untuk reset password.</span>
      </div>
    </div>
    
    <form action="{{ url('proses-reset') }}" method="post">
          @csrf



      <div class="mb-3">
        <label for="exampleInputEmail1" class="form-label">Email Anda</label>
        <input type="email" name="email" class="form-control" id="email" aria-describedby="Email" placeholder="Email">
      </div>
     
      
      <button type="submit" name="submit" value="submit" class="btn btn-primary w-100 py-8 mb-4 rounded-2">Reset Password</button>
      <div class="d-flex align-items-center justify-content-center">
        <p class="fs-4 mb-0 fw-medium">Kembali ke 
        <a class="text-primary fw-medium ms-2" href="{{ url('login') }}">Login</a></p>
      </div>
    </form>

  </div>
</div>