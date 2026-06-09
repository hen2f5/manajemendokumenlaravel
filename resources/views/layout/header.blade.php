<section data-bs-version="5.1" class="menu menu1 cid-umHCumae3p" once="menu" id="menu01-0">
	
	<nav class="navbar navbar-dropdown navbar-fixed-top navbar-expand-lg">
		<div class="container">
			<div class="navbar-brand">
				<span class="navbar-logo">
					<a href="index.html">
						<img src="{{ asset('assets/upload/image/'.$siteConfig->logo) }}" alt="Mobirise Website Builder" style="height: 3rem;">
					</a>
				</span>
				
			</div>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-bs-toggle="collapse" data-target="#navbarSupportedContent" data-bs-target="#navbarSupportedContent" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
				<div class="hamburger">
					<span></span>
					<span></span>
					<span></span>
					<span></span>
				</div>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav nav-dropdown" data-app-modern-menu="true">
					<li class="nav-item">
						<a class="nav-link link text-black text-primary display-4" href="{{ url('/') }}">BERANDA</a>
					</li>
					<li class="nav-item">
						<a class="nav-link link text-black text-primary display-4" href="{{ url('berita') }}" aria-expanded="false">BERITA</a>
					</li>
					<li class="nav-item">
						<a class="nav-link link text-black text-primary display-4" href="{{ url('unduh') }}">UNDUH</a>
					</li>
					
					<li class="nav-item"><a class="nav-link link text-black text-primary display-4" href="{{ url('faq') }}">FAQ</a></li></ul>
				
				<div class="navbar-buttons mbr-section-btn">
				    @if(session('nama'))
				        <a class="btn btn-black display-4" href="{{ url('admin/dasbor') }}" title="Kembali ke Dashboard">
				            <span class="mobi-mbri mobi-mbri-user-2 mbr-iconfont mbr-iconfont-btn"></span>
				            {{ explode(' ', session('nama'))[0] }}
				        </a>

				        <a class="btn btn-info display-4" href="{{ url('logout?source=home') }}" title="Logout">
				            <span class="mobi-mbri mobi-mbri-login mbr-iconfont mbr-iconfont-btn"></span>
				        </a>
				    @else
				        <a class="btn btn-black btn-sm display-4 mr-3" href="{{ url('login') }}" title="Login">
				            <span class="mobi-mbri mobi-mbri-user-2 mbr-iconfont mbr-iconfont-btn"></span>
				            Login
				        </a>
				    @endif
				</div>

			</div>
		</div>
	</nav>
</section>