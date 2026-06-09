<!-- Preloader -->
<div class="preloader">
  <img src="{{ asset('assets/upload/image/'.$siteConfig->icon) }}" alt="{{ $siteConfig->namaweb }}" class="lds-ripple img-fluid" />
</div>
<div id="main-wrapper">
  <!-- Sidebar Start -->
  <aside class="left-sidebar with-vertical">
    <div><!-- ---------------------------------- -->
      <!-- Start Vertical Layout Sidebar -->
      <!-- ---------------------------------- -->
      <div class="brand-logo d-flex align-items-center justify-content-between">
        <a href="{{ url('admin/dasbor') }}" class="text-nowrap logo-img">
          <img src="{{ asset('assets/upload/image/'.$siteConfig->logo) }}" class="dark-logo img-thumbnail" alt="{{ $siteConfig->namaweb }}" style="height: 40px; width: auto;" />
          <img src="{{ asset('assets/upload/image/'.$siteConfig->logo) }}" class="light-logo img-thumbnail" alt="{{ $siteConfig->namaweb }}" style="height: 40px; width: auto;" />
        </a>
        <a href="javascript:void(0)" class="sidebartoggler ms-auto text-decoration-none fs-5 d-block d-xl-none">
          <i class="ti ti-x"></i>
        </a>
      </div>

      <nav class="sidebar-nav scroll-sidebar" data-simplebar>
        <ul id="sidebarnav">

          <!-- ---------------------------------- -->
          <!-- Dashboard -->
          <!-- ---------------------------------- -->
          <li class="sidebar-item">
            <a class="sidebar-link" href="{{ url('admin/dasbor') }}" id="get-url" aria-expanded="false">
              <span><i class="fa-solid fa-house-circle-check"></i></span>
              <span class="hide-menu">Dashboard</span>
            </a>
          </li>

          <!-- ---------------------------------- -->
          <!-- Frontend page -->
          <!-- ---------------------------------- -->
          <!-- data master -->
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="fa-solid fa-file-pdf"></i>
              </span>
              <span class="hide-menu">Data Dokumen</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="{{ url('admin/dokumen/tambah') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Tambah Dokumen</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/dokumen') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Data Dokumen</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/dokumen/cari') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Cari Dokumen</span>
                </a>
              </li>

            </ul>
          </li>

          <!-- data master -->
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-table"></i>
              </span>
              <span class="hide-menu">Data Master</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="{{ url('admin/jenis-dokumen') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Jenis &amp; Sub Jenis Dokumen</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/sub-jenis-dokumen') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Data Sub Jenis Dokumen</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/perkembangan') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Tingkat Perkembangan</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/unit-kerja') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Data Unit Kerja</span>
                </a>
              </li>

            </ul>
          </li>

          <!-- data pengguna -->
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-layout-grid"></i>
              </span>
              <span class="hide-menu">Pengguna Sistem</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="{{ url('admin/user') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Penguna Sistem</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/akses-level') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Level Hak Akses</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/menu-aplikasi') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Menu dan Sub Menu</span>
                </a>
              </li>

            </ul>
          </li>

          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="ti ti-settings"></i>
              </span>
              <span class="hide-menu">Konfigurasi</span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <li class="sidebar-item">
                <a href="{{ url('admin/konfigurasi') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Setting Website</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/konfigurasi/logo') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Setting Logo</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/konfigurasi/icon') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Setting Icon</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/konfigurasi/email') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Setting Email</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/pejabat') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Setting Pimpinan</span>
                </a>
              </li>
              <li class="sidebar-item">
                <a href="{{ url('admin/konfigurasi/profil') }}" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="fa-regular fa-circle-right"></i>
                  </div>
                  <span class="hide-menu">Setting Profil</span>
                </a>
              </li>

            </ul>
          </li>

          


        </ul>
      </nav>

      <!-- ---------------------------------- -->
      <!-- Start Vertical Layout Sidebar -->
      <!-- ---------------------------------- -->
    </div>
  </aside>
  <!--  Sidebar End -->