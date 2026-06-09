<form action="{{ route('admin.user.proses') }}" method="post" id="bulkActionForm">
    @csrf
    <input type="hidden" name="pengalihan" value="{{ url()->current() }}">


        <div class="mb-3 d-flex flex-wrap gap-2">
            <button type="submit" name="submit" value="Delete" class="btn btn-dark" id="btnDeleteBulk" title="Hapus Masal">
                <i class="fa fa-trash"></i>
            </button>

            <button type="submit" name="submit" value="Aktif" class="btn btn-success">
                <i class="fa fa-check-circle"></i> Aktifkan
            </button>

            <button type="submit" name="submit" value="Non Aktif" class="btn btn-danger">
                <i class="fa fa-times-circle"></i> Non Aktifkan
            </button>

            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-user">
                <i class="fa fa-plus-circle"></i> Tambah Baru
            </button>
        </div>

            <table id="file_export" class="table table-bordered">
                <thead class="table-secondary">
                    <tr>
                        <th width="2%" class="text-center">
                            <div class="form-check d-flex justify-content-center">
                                <input class="form-check-input" type="checkbox" id="selectAll" style="transform: scale(1.2); cursor: pointer;">
                            </div>
                        </th>
                        <th width="15%">Nama</th>
                        <th width="15%">Username dan Level</th>
                        <th>Unit Kerja</th>
                        <th>Status</th>
                        <th width="10%">Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($user as $row)
                    <tr>
                        <td class="text-center">
                            <div class="form-check d-flex justify-content-center">
                                <input type="checkbox" class="form-check-input contact-chkbox" name="id_user[]" value="{{ $row->id_user }}" style="transform: scale(1.2); cursor: pointer;" />
                            </div>
                        </td>
                        <td><strong>{{ $row->nama }}</strong>
                            <small>
                                <br>Email: <em>{{ $row->email }}</em>
                            </small>
                        </td>
                        <td><code>{{ $row->username }}</code>
                            <br><small class="badge bg-info">{{ $row->akses_level }}</small></td>
                        <td>
                            <?php 
                            if($row->id_unit_kerja==0) { 
                                echo '<span class="badge bg-success"><i class="fa-solid fa-tasks"></i> Semua Unit Kerja</span>';
                            }elseif($row->id_unit_kerja > 0) {
                                
                                echo '<span class="badge bg-danger"><i class="fa-solid fa-check-circle"></i>'.$row->unitKerja->nama_unit_kerja.'</span>';
                            }else{
                                echo '-';
                            }
                            ?>
                            
                        </td>
                        <td>
                            @if($row->status_user == 'Aktif')
                            <span class="badge bg-success"><i class="fa fa-check-circle"></i> Aktif</span>
                            @else
                            <span class="badge bg-danger"><i class="fa fa-times-circle"></i> Non Aktif</span>
                            @endif
                        </td>
                        <td>
                            <div class="action-buttons">
                                <a href="{{ route('admin.user.edit', $row->id_user) }}" class="btn btn-sm btn-warning">
                                    <i class="fa fa-edit"></i>
                                </a>
                                <button type="button" class="btn btn-sm btn-danger" onclick="deleteData('{{ $row->id_user }}')">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>

</form>

@include('admin.user.tambah')

<form id="formDelete" action="" method="POST" style="display:none;">
    @csrf
</form>
<script>
    // 1. Fungsi Hapus Satuan
    function deleteData(id) {
        Swal.fire({
            title: 'Hapus user ini?',
            text: "Data yang dihapus tidak dapat dikembalikan!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#d33',
            confirmButtonText: 'Ya, Hapus!',
            cancelButtonText: 'Batal'
        }).then((result) => {
            if (result.isConfirmed) {
                let url = "{{ route('admin.user.delete', ':id') }}";
                let form = document.getElementById('formDelete');
                form.action = url.replace(':id', id);
                form.submit();
            }
        });
    }

    $(document).ready(function() {
        // 2. Inisialisasi DataTables
        if ($('#file_export').length > 0) {
            $('#file_export').DataTable({
                "paging": true,
                "ordering": true,
                "info": true,
                "autoWidth": false,
                "scrollX": true,
                "columnDefs": [{
                    "targets": 0,
                    "orderable": false,
                    "searchable": false
                }],
                "dom": "<'row mb-3'<'col-md-8'B><'col-md-4'f>>" +
                    "<'row'<'col-sm-12'tr>>" +
                    "<'row mt-3'<'col-md-5'i><'col-md-7'p>>",
                "buttons": [{
                        extend: 'excel',
                        className: 'btn btn-sm btn-outline-info me-1'
                    },
                    {
                        extend: 'pdf',
                        className: 'btn btn-sm btn-outline-info me-1'
                    },
                    {
                        extend: 'print',
                        className: 'btn btn-sm btn-outline-info'
                    }
                ]
            });
            // Merapikan filter search
            $('.dataTables_filter input').addClass('form-control form-control-sm d-inline-block').css('width', '200px');
        }

        // 3. Fitur Select All (Paling Rapi)
        $('#selectAll').on('click', function() {
            let rows = $('#file_export').DataTable().rows({
                'search': 'applied'
            }).nodes();
            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        // Jika salah satu checkbox di-uncheck manual, uncheck Select All di header
        $('#file_export tbody').on('change', 'input[type="checkbox"]', function() {
            if (!this.checked) {
                let el = $('#selectAll').get(0);
                if (el && el.checked && ('indeterminate' in el)) {
                    el.checked = false;
                }
            }
        });

        // 4. Konfirmasi Bulk Action
        $('.mailbox-controls button[type="submit"]').on('click', function(e) {
            e.preventDefault();
            const btn = $(this);
            const btnValue = btn.val();
            const form = btn.closest('form');
            const checkedCount = $('.contact-chkbox:checked').length;

            if (checkedCount === 0) {
                Swal.fire("Peringatan", "Pilih minimal satu data!", "warning");
                return;
            }

            let title = "Konfirmasi Action";
            let text = `Anda memilih ${checkedCount} data. Lanjutkan?`;
            let icon = "question";

            if (btnValue === 'Delete') {
                title = "Hapus Masal?";
                text = `Data yang dipilih (${checkedCount}) akan dihapus permanen!`;
                icon = "error";
            }

            Swal.fire({
                title: title,
                text: text,
                icon: icon,
                showCancelButton: true,
                confirmButtonColor: btnValue === 'Delete' ? '#d33' : '#3085d6',
                confirmButtonText: "Ya, Proses!"
            }).then((res) => {
                if (res.isConfirmed) {
                    // Masukkan nilai button ke form agar backend tahu action-nya (Delete/Aktif/dll)
                    $('<input>').attr({
                        type: 'hidden',
                        name: 'submit',
                        value: btnValue
                    }).appendTo(form);
                    form.submit();
                }
            });
        });
    });
</script>