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
          <?php 
          use App\Models\MenuAkses; 
          $id_akses_level_aktif = auth()->user()->id_akses_level;
          $menuAktif = MenuAkses::getMenuByAksesLevel($id_akses_level_aktif);

         $noMenu=1; foreach($menuAktif as $menuAktif) {
          $subMenuAktif = $menuAktif->submenu;
          if(count($subMenuAktif) > 0) { 
          ?>

          <!-- <?php echo $menuAktif->nama_menu_aplikasi ?> -->
          <li class="sidebar-item">
            <a class="sidebar-link has-arrow" href="javascript:void(0)" aria-expanded="false">
              <span class="d-flex">
                <i class="<?php echo $menuAktif->icon_menu_aplikasi ?>"></i>
              </span>
              <span class="hide-menu"><?php echo $menuAktif->nama_menu_aplikasi ?></span>
            </a>
            <ul aria-expanded="false" class="collapse first-level">
              <?php foreach($subMenuAktif as $subMenuAktif) { ?>
              <li class="sidebar-item">
                <a href="<?php echo $subMenuAktif->alamat_menu_aplikasi_sub ?>" class="sidebar-link">
                  <div class="round-16 d-flex align-items-center justify-content-center">
                    <i class="<?php echo $subMenuAktif->icon_menu_aplikasi_sub ?>"></i>
                  </div>
                  <span class="hide-menu"><?php echo $subMenuAktif->nama_menu_aplikasi_sub ?></span>
                </a>
              </li>
              
            <?php } ?>
            </ul>
          </li>


        <?php }else{ ?>

          <!-- <?php echo $menuAktif->nama_menu_aplikasi ?> -->
          <li class="sidebar-item">
            <a class="sidebar-link" href="<?php echo $menuAktif->alamat_menu_aplikasi ?>" <?php if($noMenu==1) { ?>id="get-url"<?php } ?> aria-expanded="false">
              <span><i class="<?php echo $menuAktif->icon_menu_aplikasi ?>"></i></span>
              <span class="hide-menu"><?php echo $menuAktif->nama_menu_aplikasi ?></span>
            </a>
          </li>
          
        <?php } $noMenu++; } ?>
        </ul>
      </nav>

      <!-- ---------------------------------- -->
      <!-- Start Vertical Layout Sidebar -->
      <!-- ---------------------------------- -->
    </div>
  </aside>
  <!--  Sidebar End -->

 