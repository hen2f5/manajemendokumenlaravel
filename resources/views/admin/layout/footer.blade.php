</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>


<script src="{{ asset('assets/admin/assets/js/vendor.min.js') }}"></script>
<script src="{{ asset('assets/admin/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ asset('assets/admin/assets/libs/simplebar/dist/simplebar.min.js') }}"></script>

<script src="{{ asset('assets/admin/assets/js/theme/app.minisidebar.init.js') }}"></script>
<script src="{{ asset('assets/admin/assets/js/theme/theme.js') }}"></script>
<script src="{{ asset('assets/admin/assets/js/theme/app.min.js') }}"></script>
<script src="{{ asset('assets/admin/assets/js/theme/sidebarmenu.js') }}"></script>

<script src="https://cdn.jsdelivr.net/npm/iconify-icon@1.0.8/dist/iconify-icon.min.js"></script>
<script src="{{ asset('assets/admin/assets/js/highlights/highlight.min.js') }}"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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

<script src="{{ asset('assets/admin/assets/libs/tinymce/tinymce.min.js') }}"></script>
<!-- select2 -->
<script src="{{ asset('assets/admin/assets/libs/select2/dist/js/select2.min.js') }}"></script>
<!-- owl -->
<script src="{{ asset('assets/admin/assets/libs/owl.carousel/dist/owl.carousel.min.js') }}"></script>
<script src="{{ asset('assets/admin/assets/libs/apexcharts/dist/apexcharts.min.js') }}"></script>
<script src="{{ asset('assets/admin/assets/js/dashboards/dashboard.js') }}"></script>

<script>
    // ambil waktu dari server (Laravel)
    let serverTime = new Date({{ now()->timestamp * 1000 }});

    function formatTanggal(tanggal){
        let hari = ["Minggu","Senin","Selasa","Rabu","Kamis","Jumat","Sabtu"];
        let bulan = ["Januari","Februari","Maret","April","Mei","Juni",
                     "Juli","Agustus","September","Oktober","November","Desember"];

        return hari[tanggal.getDay()] + ", " +
               tanggal.getDate() + " " +
               bulan[tanggal.getMonth()] + " " +
               tanggal.getFullYear();
    }

    function updateTime(){

        // tambah 1 detik
        serverTime.setSeconds(serverTime.getSeconds() + 1);

        let h = serverTime.getHours().toString().padStart(2,'0');
        let m = serverTime.getMinutes().toString().padStart(2,'0');
        let s = serverTime.getSeconds().toString().padStart(2,'0');

        $("#serverTime").html(
            formatTanggal(serverTime) + " jam " + h + ":" + m + ":" + s
        );
    }

    $(document).ready(function(){

        // tampil pertama
        updateTime();

        // update tiap detik
        setInterval(updateTime, 1000);

        // sinkronisasi ke server tiap 1 menit (opsional tapi disarankan)
        setInterval(function(){
            $.get("{{ url('server-time') }}", function(res){
                serverTime = new Date(res.time);
            });
        }, 60000);

    });
</script>
<script>
$(document).on('shown.bs.modal', '.modal', function () {
    $(this).find('.select2-modal').each(function () {
        if (!$(this).data('select2')) {
            $(this).select2({
                dropdownParent: $(this).closest('.modal'),
                width: '100%'
            });
        }
    });
});


$('.select2').select2({
    width: '100%'
});

  // tinymce
  tinymce.init({
    selector: ".konten-berita",
  });

document.addEventListener("DOMContentLoaded", function () {

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

});
</script>

<script>
  $(document).ready(function() {
    // 1. Inisialisasi DataTables
    if ($('#file_export').length) {

      // Destroy instance lama jika ada
      if ($.fn.DataTable.isDataTable('#file_export')) {
        $('#file_export').DataTable().destroy();
      }

      const table = $('#file_export').DataTable({

        paging: true,
        ordering: true,
        order: [],
        info: true,
        autoWidth: false,
        responsive: false,
        scrollX: true,
        deferRender: true,

        // Dropdown jumlah data
        lengthMenu: [
          [25, 50, 100, 500, -1],
          [25, 50, 100, 500, "Semua"]
        ],
        pageLength: 25,

        columnDefs: [
          {
            targets: 0,
            orderable: true,
            searchable: false,
            className: "text-end"
          },
          {
            targets: -1,
            orderable: true
          }
        ],

        dom:
          "<'row mb-3'<'col-md-4'l><'col-md-4 text-start'B><'col-md-4 text-end'f>>" +
          "<'row'<'col-sm-12'tr>>" +
          "<'row mt-3'<'col-md-5'i><'col-md-7 text-end'p>>",

        buttons: [
          {
            extend: 'copy',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-copy"></i> Copy'
          },
          {
            extend: 'excel',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-file-excel"></i> Excel'
          },
          {
            extend: 'pdf',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-file-pdf"></i> PDF',
            exportOptions: {
              columns: ':not(:last-child)'
            }
          },
          {
            extend: 'print',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-print"></i> Print'
          }
        ],

        language: {
          search: "",
          searchPlaceholder: "Cari...",
          lengthMenu: "_MENU_",
          info: "Menampilkan _START_ sampai _END_ dari _TOTAL_ data",
          paginate: {
            next: '<i class="fa fa-angle-right"></i>',
            previous: '<i class="fa fa-angle-left"></i>'
          }
        }

      });

      // Styling tambahan
      $('.dataTables_filter input')
        .addClass('form-control form-control-sm d-inline-block')
        .css('width', '100%');

      $('.dataTables_length select')
        .addClass('form-select form-select-sm')
        .css('width', '90px');

      $('.dt-buttons').addClass('d-flex justify-content-start');
    }

    // 1. Inisialisasi DataTables
    if ($('#file_export_all').length) {

      // Destroy instance lama jika ada
      if ($.fn.DataTable.isDataTable('#file_export_all')) {
        $('#file_export_all').DataTable().destroy();
      }

      const table = $('#file_export_all').DataTable({

        paging: true,
        ordering: true,
        order: [],
        info: true,
        autoWidth: false,
        responsive: false,
        scrollX: true,
        deferRender: true,

        // Dropdown jumlah data
        lengthMenu: [
          [250, 500, 1000, 5000, -1],
          [250, 500, 1000, 5000, "Semua"]
        ],
        pageLength: 250,

        columnDefs: [
          {
            targets: 0,
            orderable: true,
            searchable: false,
            className: "text-end"
          },
          {
            targets: -1,
            orderable: true
          }
        ],

        dom:
          "<'row mb-3'<'col-md-4'l><'col-md-4 text-start'B><'col-md-4 text-end'f>>" +
          "<'row'<'col-sm-12'tr>>" +
          "<'row mt-3'<'col-md-5'i><'col-md-7 text-end'p>>",

        buttons: [
          {
            extend: 'copy',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-copy"></i> Copy'
          },
          {
            extend: 'excel',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-file-excel"></i> Excel'
          },
          {
            extend: 'pdf',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-file-pdf"></i> PDF',
            exportOptions: {
              columns: ':not(:last-child)'
            }
          },
          {
            extend: 'print',
            className: 'btn btn-sm btn-info',
            text: '<i class="fa fa-print"></i> Print'
          }
        ],

        language: {
          search: "",
          searchPlaceholder: "Cari...",
          lengthMenu: "_MENU_",
          info: "Menampilkan _START_ sampai _END_ dari _TOTAL_ data",
          paginate: {
            next: '<i class="fa fa-angle-right"></i>',
            previous: '<i class="fa fa-angle-left"></i>'
          }
        }

      });

      // Styling tambahan
      $('.dataTables_filter input')
        .addClass('form-control form-control-sm d-inline-block')
        .css('width', '100%');

      $('.dataTables_length select')
        .addClass('form-select form-select-sm')
        .css('width', '90px');

      $('.dt-buttons').addClass('d-flex justify-content-start');
    }


    // 2. SweetAlert Delete Confirmation (untuk link hapus biasa)
    $(document).on("click", ".delete-link", function(e) {
      e.preventDefault();
      const url = $(this).attr("href");
      Swal.fire({
        title: 'Anda yakin?',
        text: "Data yang dihapus tidak dapat dikembalikan!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Ya, Hapus!',
        cancelButtonText: 'Batal'
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = url;
        }
      });
    });

     // 2. SweetAlert Delete Confirmation (untuk link approval biasa)
    $(document).on("click", ".approval-link", function(e) {
      e.preventDefault();
      const url = $(this).attr("href");
      Swal.fire({
        title: 'Anda yakin?',
        text: "Anda akan mengaktifkan/menyetujui data ini!",
        icon: 'info',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Ya, Aktifkan/Setujui!',
        cancelButtonText: 'Batal'
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = url;
        }
      });
    });

    // 2. SweetAlert Delete Confirmation (untuk link approval biasa)
    $(document).on("click", ".disable-link", function(e) {
      e.preventDefault();
      const url = $(this).attr("href");
      Swal.fire({
        title: 'Anda yakin?',
        text: "Anda akan me-Non Aktifkan data ini!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Ya, Non Aktifkan!',
        cancelButtonText: 'Batal'
      }).then((result) => {
        if (result.isConfirmed) {
          window.location.href = url;
        }
      });
    });

    // 3. Highlight.js Init
    if (typeof hljs !== 'undefined') {
      hljs.highlightAll();
    }
  });
</script>
</body>

</html>