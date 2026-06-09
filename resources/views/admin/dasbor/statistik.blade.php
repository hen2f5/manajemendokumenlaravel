<!--  Owl carousel -->
<div class="owl-carousel counter-carousel owl-theme">

  <div class="item">
    <div class="card border-0 zoom-in bg-primary-subtle shadow-none">
      <div class="card-body">
        <div class="text-center">
          <img src="{{ asset('assets/admin/assets/images/svgs/icon-user-male.svg') }}" width="50" height="50" class="mb-3" alt="modernize-img" />
          <p class="fw-semibold fs-3 text-primary mb-1">
            Pengguna
          </p>
          <h5 class="fw-semibold text-primary mb-0">{{  number_format($user, 0, ',', '.') }}</h5>
        </div>
      </div>
    </div>
  </div>

  <div class="item">
    <div class="card border-0 zoom-in bg-warning-subtle shadow-none">
      <div class="card-body">
        <div class="text-center">
          <img src="{{ asset('assets/admin/assets/images/svgs/icon-briefcase.svg') }}" width="50" height="50" class="mb-3" alt="modernize-img" />
          <p class="fw-semibold fs-3 text-warning mb-1">Dokumen</p>
          <h5 class="fw-semibold text-warning mb-0">{{  number_format($dokumen, 0, ',', '.') }}</h5>
        </div>
      </div>
    </div>
  </div>

  <div class="item">
    <div class="card border-0 zoom-in bg-info-subtle shadow-none">
      <div class="card-body">
        <div class="text-center">
          <img src="{{ asset('assets/admin/assets/images/svgs/icon-mailbox.svg') }}" width="50" height="50" class="mb-3" alt="modernize-img" />
          <p class="fw-semibold fs-3 text-info mb-1">Unit Kerja</p>
          <h5 class="fw-semibold text-info mb-0">{{  number_format($unitkerja, 0, ',', '.') }}</h5>
        </div>
      </div>
    </div>
  </div>



  <div class="item">
    <div class="card border-0 zoom-in bg-danger-subtle shadow-none">
      <div class="card-body">
        <div class="text-center">
          <img src="{{ asset('assets/admin/assets/images/svgs/icon-favorites.svg') }}" width="50" height="50" class="mb-3" alt="modernize-img" />
          <p class="fw-semibold fs-3 text-danger mb-1">Album</p>
          <h5 class="fw-semibold text-danger mb-0">{{  number_format($album, 0, ',', '.') }}</h5>
        </div>
      </div>
    </div>
  </div>

  <div class="item">
    <div class="card border-0 zoom-in bg-success-subtle shadow-none">
      <div class="card-body">
        <div class="text-center">
          <img src="{{ asset('assets/admin/assets/images/svgs/icon-speech-bubble.svg') }}" width="50" height="50" class="mb-3" alt="modernize-img" />
          <p class="fw-semibold fs-3 text-success mb-1">Jenis Dokumen</p>
          <h5 class="fw-semibold text-success mb-0">{{  number_format($jenisdokumen, 0, ',', '.') }}</h5>
        </div>
      </div>
    </div>
  </div>

  <div class="item">
    <div class="card border-0 zoom-in bg-info-subtle shadow-none">
      <div class="card-body">
        <div class="text-center">
          <img src="{{ asset('assets/admin/assets/images/svgs/icon-connect.svg') }}" width="50" height="50" class="mb-3" alt="modernize-img" />
          <p class="fw-semibold fs-3 text-info mb-1">Sub Jenis Dokumen</p>
          <h5 class="fw-semibold text-info mb-0">{{  number_format($subjenisdokumen, 0, ',', '.') }}</h5>
        </div>
      </div>
    </div>
  </div>

</div>