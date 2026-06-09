<?php
use App\Models\Konfigurasi;
$siteConfig = Konfigurasi::listing();
?>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-bs-theme="light" data-color-theme="Blue_Theme" data-layout="vertical">

<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <!-- Favicon icon-->
  <link rel="shortcut icon" type="image/png" href="{{ asset('assets/upload/image/'.$siteConfig->icon) }}" />
  <!-- Core Css -->
  <link rel="stylesheet" href="{{ asset('assets/admin/assets/css/styles.css') }}" />
  <title>{{ $title }}</title>
  <!-- CSRF -->
  <meta name="csrf-token" content="{{ csrf_token() }}">
  <!-- sweetalert -->
  <script src="{{ asset('assets/sweetalert2/sweetalert2.min.js') }}" type="text/javascript"></script>
  <link rel="stylesheet" href="{{ asset('assets/sweetalert2/sweetalert2.min.css') }}">
  <!-- fontawesome -->
  <link rel="stylesheet" href="{{ asset('assets/fontawesome-free-7.2.0/css/all.min.css') }}">
</head>

<body>
  <!-- Preloader -->
  <div class="preloader">
    <img src="{{ asset('assets/upload/image/'.$siteConfig->icon) }}" alt="loader" class="lds-ripple img-fluid" />
  </div>
  <div id="main-wrapper" class="auth-customizer-none">
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 w-100">
      <div class="position-relative z-index-5">
        <div class="row">
          <div class="col-xl-6 col-xxl-6">
            <a href="{{ url('/') }}" class="text-nowrap logo-img d-block px-4 py-9 w-100">
              <img src="{{ asset('assets/upload/image/'.$siteConfig->logo) }}" class="dark-logo" alt="{{ $siteConfig->namaweb }}" style="height: 60px; width: auto;" />
              <img src="{{ asset('assets/upload/image/'.$siteConfig->logo) }}" class="light-logo" alt="{{ $siteConfig->namaweb }}" style="height: 60px; width: auto;" />
            </a>
            <div class="d-none d-xl-flex align-items-center justify-content-center h-n60">
              <img src="{{ asset('assets/upload/image/'.$siteConfig->gambar) }}" alt="{{ $siteConfig->namaweb }}" class="img-fluid img-thumbnail" width="500">
            </div>
          </div>
          <div class="col-xl-6 col-xxl-6">
            @include($content)
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- Import Js Files -->
  <script src="{{ asset('assets/admin/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
  <script src="{{ asset('assets/admin/assets/libs/simplebar/dist/simplebar.min.js') }}"></script>
  <script src="{{ asset('assets/admin/assets/js/theme/app.minisidebar.init.js') }}"></script>
  <script src="{{ asset('assets/admin/assets/js/theme/theme.js') }}"></script>
  <script src="{{ asset('assets/admin/assets/js/theme/app.min.js') }}"></script>
  <!-- solar icons -->
  <script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
  <script>
  @if(session('sukses'))
  Swal.fire({
      title: "Berhasil",
      text: @json(session('sukses')),
      icon: "success",
      timer: 3000,
      timerProgressBar: true,
      showConfirmButton: false
  });
  @endif

  @if(session('warning'))
  Swal.fire({
      title: "Oops..",
      text: @json(session('warning')),
      icon: "warning",
      timer: 3000,
      timerProgressBar: true,
      showConfirmButton: false
  });
  @endif
  </script>

</body>

</html>