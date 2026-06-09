@if ($errors->any())
<div class="alert alert-danger border-0 shadow-sm mb-4 animate__animated animate__fadeIn">
    <div class="d-flex">
        <i class="fa fa-exclamation-triangle mt-1 me-3"></i>
        <ul class="mb-0 small">
            @foreach ($errors->all() as $error)
            <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
</div>
@endif

{{-- Include Modal Tambah --}}
@include('admin.pejabat.tambah')


<div class="card-header bg-white py-3 border-bottom">
    <form action="{{ route('admin.pejabat.proses') }}" method="post" id="formProses">
        @csrf
        <div class="row align-items-center">
            <div class="col-md-8 d-flex gap-2 mb-3 mb-md-0">
                {{-- Tombol Hapus Terpilih dengan Badge Counter --}}
                <button class="btn btn-outline-danger btn-sm px-3 d-none animate__animated animate__fadeIn" type="submit" name="hapus" id="btnHapusTerpilih" onclick="return confirm('Yakin ingin menghapus data yang dipilih?')">
                    <i class="fa fa-trash me-1"></i> Hapus (<span id="countSelected">0</span>)
                </button>

                @if(!in_array(Auth::user()->akses_level, ['Admin-Unit', 'Pimpinan-Unit']))
                <div class="btn-group btn-group-sm">
                    <a href="{{ route('admin.pejabat.index') }}" class="btn {{ !request('jenis') ? 'btn-info text-white' : 'btn-outline-info' }}">
                        <i class="fa fa-list me-1"></i> Semua
                    </a>
                    <a href="{{ route('admin.pejabat.index', ['jenis' => 'fakultas']) }}" class="btn {{ request('jenis') == 'fakultas' ? 'btn-primary' : 'btn-outline-primary' }}">
                        <i class="fa fa-university me-1"></i> Fakultas
                    </a>
                </div>
                @endif
            </div>
            <div class="col-md-4 text-md-end">
                <button type="button" class="btn btn-success btn-md px-4 rounded-pill shadow-sm" data-bs-toggle="modal" data-bs-target="#basicModal">
                    <i class="fa fa-plus-circle me-1"></i> Tambah Pejabat
                </button>
            </div>
        </div>
</div>

<div class="table-responsive">
    <table class="table table-hover align-middle mb-0" id="file_export">
        <thead>
            <tr class="bg-light-subtle">
                <th class="text-center px-3" width="50">
                    <div class="form-check d-flex justify-content-center">
                        <input type="checkbox" class="form-check-input border-secondary" id="checkAll">
                    </div>
                </th>
                <th width="30%">IDENTITAS PEJABAT</th>
                <th>JABATAN</th>
                <th>UNIT KERJA</th>
                <th class="text-center">STATUS</th>
                <th class="text-center">URUTAN</th>
                <th class="text-center" width="120">AKSI</th>
            </tr>
        </thead>
        <tbody>
            @foreach($pejabat as $row)
            <tr class="pejabat-row">
                <td class="text-center px-3">
                    <div class="form-check d-flex justify-content-center">
                        <input class="form-check-input check-item border-secondary" type="checkbox" name="id_pejabat[]" value="{{ $row->id_pejabat }}">
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                        <div class="avatar-wrapper me-3">
                            @if($row->gambar)
                            <img src="{{ asset('assets/upload/image/thumbs/'.$row->gambar) }}" class="rounded-circle border shadow-sm profile-img">
                            @else
                            <div class="avatar-placeholder rounded-circle shadow-sm">
                                <i class="fa fa-user text-muted"></i>
                            </div>
                            @endif
                        </div>
                        <div>
                            <h6 class="fw-bold mb-0 text-dark">{{ $row->nama_pejabat }}</h6>
                            <span class="text-muted font-monospace small">NIP: {{ $row->nip }}</span>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="text-dark small fw-medium text-uppercase">{{ $row->jabatan }}</div>
                </td>
                <td>
                    @if($row->id_unit_kerja >= 1)
                    <a href="{{ route('admin.pejabat.unit', $row->id_unit_kerja) }}" class="text-decoration-none d-flex align-items-center">
                        <div class="unit-icon me-2 text-primary"><i class="fa fa-building-o"></i></div>
                        <span class="small text-secondary">{{ $row->nama_unit_kerja }}</span>
                    </a>
                    @else
                    <div class="d-flex align-items-center">
                        <div class="unit-icon me-2 text-muted"><i class="fa fa-university"></i></div>
                        <span class="small text-muted">{{ $row->nama_unit_kerja }}</span>
                    </div>
                    @endif
                </td>
                <td class="text-center">
                    @if($row->status_pimpinan == 'Ya')
                    <span class="badge-status badge-active">AKTIF</span>
                    @else
                    <span class="badge-status badge-inactive">NON-AKTIF</span>
                    @endif
                </td>
                <td class="text-center font-monospace fw-bold text-muted">{{ $row->urutan }}</td>
                <td class="text-center">
                    <div class="action-buttons">
                        <a href="{{ route('admin.pejabat.edit', $row->id_pejabat) }}" class="btn-action edit" title="Edit Data">
                            <i class="fa fa-pencil"></i>
                        </a>
                        <a href="{{ route('admin.pejabat.delete', $row->id_pejabat) }}" class="btn-action delete delete-link" title="Hapus Data">
                            <i class="fa fa-trash"></i>
                        </a>
                    </div>
                </td>
            </tr>
            @endforeach
        </tbody>
    </table>
</div>
</form>


<style>
    /* Global Styling */
    :root {
        --primary-color: #4e73df;
        --success-soft: #e8fadf;
        --danger-soft: #ffeef0;
    }

    /* Table & Rows */
    .table thead th {
        background-color: #f8f9fc;
        color: #4e73df;
        font-size: 0.7rem;
        font-weight: 800;
        text-transform: uppercase;
        letter-spacing: 1px;
        border-top: none;
        padding: 15px;
    }

    .pejabat-row {
        transition: all 0.2s ease;
    }

    .pejabat-row:hover {
        background-color: #f8f9fc !important;
    }

    .pejabat-row.selected {
        background-color: #eff3ff !important;
    }

    /* Avatar Styling */
    .avatar-wrapper {
        position: relative;
        width: 45px;
        height: 45px;
    }

    .profile-img {
        width: 45px;
        height: 45px;
        object-fit: cover;
    }

    .avatar-placeholder {
        width: 45px;
        height: 45px;
        background: #f1f3f9;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
    }

    /* Badge Custom */
    .badge-status {
        padding: 5px 12px;
        border-radius: 50px;
        font-size: 0.65rem;
        font-weight: 700;
        display: inline-block;
    }

    .badge-active {
        background: var(--success-soft);
        color: #28a745;
        border: 1px solid #c3e6cb;
    }

    .badge-inactive {
        background: var(--danger-soft);
        color: #dc3545;
        border: 1px solid #f5c6cb;
    }

    /* Action Buttons */
    .action-buttons {
        display: flex;
        gap: 5px;
        justify-content: center;
    }

    .btn-action {
        width: 32px;
        height: 32px;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 8px;
        transition: all 0.2s;
        text-decoration: none;
        border: 1px solid #eee;
        background: white;
    }

    .btn-action.edit:hover {
        background: #fff4e5;
        border-color: #ffc107;
        color: #ffc107;
    }

    .btn-action.delete:hover {
        background: #ffebee;
        border-color: #f44336;
        color: #f44336;
    }

    /* Form Check */
    .form-check-input:checked {
        background-color: var(--primary-color);
        border-color: var(--primary-color);
    }
</style>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const checkAll = document.getElementById('checkAll');
        const items = document.querySelectorAll('.check-item');
        const btnHapus = document.getElementById('btnHapusTerpilih');
        const countDisplay = document.getElementById('countSelected');

        function updateUI() {
            const checkedCount = document.querySelectorAll('.check-item:checked').length;
            countDisplay.textContent = checkedCount;

            // Tampilkan/Sembunyikan tombol hapus massal
            if (checkedCount > 0) {
                btnHapus.classList.remove('d-none');
            } else {
                btnHapus.classList.add('d-none');
            }
        }

        checkAll.addEventListener('change', function() {
            items.forEach(item => {
                item.checked = this.checked;
                // Toggle class background pada baris
                item.closest('tr').classList.toggle('selected', this.checked);
            });
            updateUI();
        });

        items.forEach(item => {
            item.addEventListener('change', function() {
                // Toggle class background pada baris
                this.closest('tr').classList.toggle('selected', this.checked);

                // Sync checkAll state
                const allChecked = document.querySelectorAll('.check-item:checked').length === items.length;
                checkAll.checked = allChecked;
                checkAll.indeterminate = !allChecked && document.querySelectorAll('.check-item:checked').length > 0;

                updateUI();
            });
        });
    });
</script>