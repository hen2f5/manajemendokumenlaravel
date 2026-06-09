<style type="text/css" media="screen">
    li.list-group-item:hover {
        background-color: #d1dff6;
    }

    li li.list-group-item:hover {
        background-color: #fff;
    }

    li i.fa-bars {
        cursor: grab;
    }

    li i.fa-bars:active {
        cursor: grabbing;
    }

    li i.fa-bars:hover {
        color: #000 !important;
    }
</style>

<p class="alert alert-info">
    Klik dan drag pada icon &nbsp;<strong class="text-danger"><i class="fa-solid fa-bars me-2"></i></strong> untuk mengurutkan Menu dan Sub Menu. Untuk kembali, klik tombol
    <a href="{{ route('admin.menu-aplikasi.index') }}" class="btn btn-outline-primary btn-sm">
        <i class="fa-solid fa-arrow-left"></i> Kembali ke Daftar Menu.
    </a>
</p>

<div id="menu-wrapper">
    <ul id="menu-list" class="list-group">
        {{-- MENU UTAMA --}}
        @foreach ($menu as $item)
        <li class="list-group-item" data-menu="{{ $item->id_menu_aplikasi }}">
            <i class="fa-solid fa-bars me-2 text-danger"></i> <strong>{{ $item->nama_menu_aplikasi }}</strong>

            {{-- SUBMENU --}}
            @if ($item->submenus->isNotEmpty())
            <ul class="list-group ms-4 mt-2 submenu-list" data-parent="{{ $item->id_menu_aplikasi }}">
                @foreach ($item->submenus as $sub)
                <li class="list-group-item d-flex justify-content-between align-items-center"
                    data-submenu="{{ $sub->id_menu_aplikasi_sub }}">
                    <span><i class="fa-solid fa-bars me-2 text-primary"></i>{{ $sub->nama_menu_aplikasi_sub }}</span>
                </li>
                @endforeach
            </ul>
            @endif
        </li>
        @endforeach
    </ul>
</div>

{{-- Library SortableJS --}}
<script src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const csrfToken = "{{ csrf_token() }}";

        // === URUTKAN MENU UTAMA ===
        Sortable.create(document.getElementById("menu-list"), {
            animation: 150,
            handle: "i.fa-bars",
            draggable: "li[data-menu]",
            onEnd: function() {
                let data = [];
                document.querySelectorAll("li[data-menu]").forEach((row, i) => {
                    data.push({
                        id_menu: row.dataset.menu,
                        urutan: i + 1
                    });
                });

                fetch("{{ route('admin.menu-aplikasi.urutkanMenu') }}", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json",
                            "X-CSRF-TOKEN": csrfToken
                        },
                        body: JSON.stringify({
                            menus: data
                        })
                    })
                    .then(res => res.json())
                    .then(response => {
                        if (response.status === "success") {
                            showToast('Urutan menu berhasil disimpan');
                        }
                    });
            }
        });

        // === URUTKAN SUBMENU PER MENU ===
        document.querySelectorAll(".submenu-list").forEach(ul => {
            Sortable.create(ul, {
                animation: 150,
                handle: "i.fa-bars",
                draggable: "li[data-submenu]",
                onEnd: function() {
                    let data = [];
                    ul.querySelectorAll("li[data-submenu]").forEach((row, i) => {
                        data.push({
                            id_menu_sub: row.dataset.submenu,
                            urutan_sub: i + 1
                        });
                    });

                    fetch("{{ route('admin.menu-aplikasi.urutkanMenu') }}", {
                            method: "POST",
                            headers: {
                                "Content-Type": "application/json",
                                "X-CSRF-TOKEN": csrfToken
                            },
                            body: JSON.stringify({
                                submenus: data
                            })
                        })
                        .then(res => res.json())
                        .then(response => {
                            if (response.status === "success") {
                                showToast('Urutan submenu berhasil disimpan');
                            }
                        });
                }
            });
        });

        function showToast(message) {
            Swal.fire({
                toast: true,
                icon: 'success',
                title: message,
                position: 'top-end',
                showConfirmButton: false,
                timer: 2000,
                timerProgressBar: true
            });
        }
    });
</script>