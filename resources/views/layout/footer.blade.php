<section data-bs-version="5.1" class="footer1 cid-umHCMkRA5y" once="footers" id="footer01-2">
	<div class="container">
		<div class="row mbr-white">
			<div class="col-12 col-md-6 col-lg-6">
				<h5 class="mbr-section-subtitle mbr-fonts-style mb-2 display-4">
					<strong>{{ strtoupper($siteConfig->namaweb) }}</strong>
				</h5>
				<ul class="list mbr-fonts-style">
					<li class="mbr-text item-wrap">About</li>
					<li class="mbr-text item-wrap">Press</li>
					<li class="mbr-text item-wrap">Careers</li>
					<li class="mbr-text item-wrap">Social</li>
					<li class="mbr-text item-wrap">Contact</li>
				</ul>
			</div>

			<div class="col-12 col-md-6 col-lg-6">
				<h5 class="mbr-section-subtitle mbr-fonts-style mb-2 display-4">
					<strong>LINK EKSTERNAL</strong>
				</h5>
				<ul class="list mbr-fonts-style">
					<li class="mbr-text item-wrap">Help</li>
					<li class="mbr-text item-wrap">Info</li>
					<li class="mbr-text item-wrap">Contacts</li>
					<li class="mbr-text item-wrap">FAQ</li>
					<li class="mbr-text item-wrap">Report</li>
				</ul>
			</div>

			<div class="col-12 mt-4">
				<p class="mbr-text mb-0 mbr-fonts-style copyright align-center pt-2" style="border-top: solid thin #eee;">
					© Copyright {{ date('Y') }} by {{ $siteConfig->namaweb }} - All Rights Reserved
				</p>
			</div>
		</div>
	</div>
</section>

<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

<script src="{{ asset('assets/template/assets/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/template/assets/smoothscroll/smooth-scroll.js') }}"></script>
<script src="{{ asset('assets/template/assets/ytplayer/index.js') }}"></script>
<script src="{{ asset('assets/template/assets/dropdown/js/navbar-dropdown.js') }}"></script>
<script src="{{ asset('assets/template/assets/embla/embla.min.js') }}"></script>
<script src="{{ asset('assets/template/assets/embla/script.js') }}"></script>
<script src="{{ asset('assets/template/assets/mbr-switch-arrow/mbr-switch-arrow.js') }}"></script>
<script src="{{ asset('assets/template/assets/theme/js/script.js') }}"></script>
<script src="{{ asset('assets/template/assets/formoid/formoid.min.js') }}"></script>

<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
<script src="https://cdn.datatables.net/responsive/2.5.0/js/dataTables.responsive.min.js"></script>

<script src="https://cdn.datatables.net/buttons/2.4.2/js/dataTables.buttons.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.bootstrap5.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.html5.min.js"></script>
<script src="https://cdn.datatables.net/buttons/2.4.2/js/buttons.print.min.js"></script>

<script>
	$(document).ready(function() {
		// 1. Inisialisasi DataTables Global untuk ID file_export
		if ($('#file_export').length > 0) {
			$('#file_export').DataTable({
				responsive: true,
				dom: "<'row mb-3'<'col-md-6'B><'col-md-6'f>>" +
					"<'row'<'col-sm-12'tr>>" +
					"<'row mt-3'<'col-md-5'i><'col-md-7'p>>",
				buttons: [{
						extend: 'copy',
						className: 'btn btn-secondary btn-sm',
						text: '<i class="fa fa-copy"></i> Copy'
					},
					{
						extend: 'csv',
						className: 'btn btn-info btn-sm',
						text: '<i class="fa fa-file-csv"></i> CSV'
					},
					{
						extend: 'excel',
						className: 'btn btn-success btn-sm',
						text: '<i class="fa fa-file-excel"></i> Excel'
					},
					{
						extend: 'pdf',
						className: 'btn btn-danger btn-sm',
						text: '<i class="fa fa-file-pdf"></i> PDF',
						orientation: 'landscape'
					},
					{
						extend: 'print',
						className: 'btn btn-primary btn-sm',
						text: '<i class="fa fa-print"></i> Print'
					}
				],
				language: {
					search: "",
					searchPlaceholder: "Cari data...",
				}
			});
		}

		// 2. Handler untuk Checkbox Toggle
		$(document).on('click', '.checkbox-toggle', function() {
			var clicks = $(this).data('clicks');
			if (clicks) {
				$(".contact-chkbox").prop("checked", false);
				$(this).find('i').removeClass("fa-check-square").addClass("fa-square");
			} else {
				$(".contact-chkbox").prop("checked", true);
				$(this).find('i').removeClass("fa-square").addClass("fa-check-square");
			}
			$(this).data("clicks", !clicks);
		});

		// 3. SweetAlert Laravel Session
		if (session('sukses'))
			Swal.fire({
				title: "Berhasil",
				text: "{{ session('sukses') }}",
				icon: "success"
			});
		endif

		if (session('warning'))
			Swal.fire({
				title: "Oops..",
				text: "{{ session('warning') }}",
				icon: "warning"
			});
		endif
	});
</script>

@stack('scripts')

</body>

</html>