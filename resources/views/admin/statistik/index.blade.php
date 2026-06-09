<style type="text/css" media="screen">
	.sticky-menu{
	    position: sticky;
	    top: 80px;
	    z-index: 100;
	}
</style>
<div class="row">
	<div class="col-md-3">
		<div class="card sticky-menu" id="menuStatistik">
			<div class="card-header p-2 bg-light">
				<strong>MENU STATISTIK</strong>
			</div>
			<div class="card-body p-3">
				<p>
					<button type="button" class="btn btn-success btn-sm me-1 mb-1 menu-scroll" href="JenisDokumen">
						<i class="fa-solid fa-tag"></i> Jenis Dokumen
					</button>
					<button type="button" class="btn btn-success btn-sm me-1 mb-1 menu-scroll" href="SubJenisDokumen">
						<i class="fa-solid fa-tags"></i> Sub Jenis Dokumen
					</button>
					<button type="button" class="btn btn-success btn-sm me-1 mb-1 menu-scroll" href="Perkembangan">
						<i class="fa-solid fa-certificate"></i> Perkembangan Dokumen
					</button>
					<button type="button" class="btn btn-success btn-sm me-1 mb-1 menu-scroll" href="Album">
						<i class="fa-solid fa-images"></i> Album Dokumen
					</button>
					<button type="button" class="btn btn-success btn-sm me-1 mb-1 menu-scroll" href="UnitKerja">
						<i class="fa-solid fa-sitemap"></i> Unit Kerja
					</button>
				</p>
			</div>
		</div>
	</div>
	<div class="col-md-9">

		<div class="card mb-3 m-0" id="JenisDokumen">
			<div class="card-header bg-light p-3">
				<strong><i class="text-danger fa-solid fa-tag"></i> STATISTIK BERDASARKAN JENIS DOKUMEN</strong>
			</div>
			<div class="card-body p-3">
				@include('admin/statistik/jenis-dokumen')
			</div>
		</div>

		<div class="card mb-3 m-0" id="SubJenisDokumen">
			<div class="card-header bg-light p-3">
				<strong><i class="text-danger fa-solid fa-tags"></i> STATISTIK BERDASARKAN SUB JENIS DOKUMEN</strong>
			</div>
			<div class="card-body p-3">
				@include('admin/statistik/sub-jenis-dokumen')
			</div>
		</div>

		<div class="card mb-3 m-0" id="Perkembangan">
			<div class="card-header bg-light p-3">
				<strong><i class="text-danger fa-solid fa-certificate"></i> STATISTIK BERDASARKAN TINGKAT PERKEMBANGAN DOKUMEN</strong>
			</div>
			<div class="card-body p-3">
				@include('admin/statistik/perkembangan')
			</div>
		</div>

		<div class="card mb-3 m-0" id="Album">
			<div class="card-header bg-light p-3">
				<strong><i class="text-danger fa-solid fa-images"></i> STATISTIK BERDASARKAN ALBUM</strong>
			</div>
			<div class="card-body p-3">
				@include('admin/statistik/album')
			</div>
		</div>

		<div class="card mb-3 m-0" id="UnitKerja">
			<div class="card-header bg-light p-3">
				<strong><i class="text-danger fa-solid fa-sitemap"></i> STATISTIK BERDASARKAN UNIT KERJA</strong>
			</div>
			<div class="card-body p-3">
				@include('admin/statistik/unit-kerja')
			</div>
		</div>
	
	</div> <!-- end col 8-->
</div>

<script>
$(document).ready(function(){

    $(".menu-scroll").click(function(){

        let targetID = $(this).attr("href");
        let target = $("#" + targetID);

        if(target.length){

            // ambil tinggi card tujuan
            let tinggiCard = target.outerHeight(true);

            // set tinggi menu statistik
            $("#menuStatistik").height(tinggiCard);

            // smooth scroll
            $("html, body").animate({
                scrollTop: target.offset().top - 80
            },600);

        }

    });

});
</script>