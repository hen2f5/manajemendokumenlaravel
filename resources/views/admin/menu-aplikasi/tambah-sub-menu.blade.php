<form action="{{ route('admin.menu-aplikasi.simpan-sub') }}" method="POST">
    @csrf
    <div class="modal fade" id="dataModalSub" tabindex="-1" aria-labelledby="modalLabelSub" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content border-0 shadow-lg">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title text-white" id="modalLabelSub">Tambah atau Update Sub Menu</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">
                    <input type="hidden" name="id_menu_aplikasi_sub" id="id_menu_aplikasi_sub" value="">

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Menu Utama, Status, &amp; Urutan</label>
                        <div class="col-md-5">
                            <select
                                name="id_menu_aplikasi"
                                id="id_menu_aplikasi_sub_select"
                                class="form-select"
                                data-url="{{ route('admin.menu-aplikasi.get-urutan-sub') }}"
                                required>

                            <option value="">-- Pilih Menu Utama --</option>

                            @foreach($menu_aplikasi as $m)
                            <option value="{{ $m->id_menu_aplikasi }}">
                                {{ $m->nama_menu_aplikasi }}
                            </option>
                            @endforeach

                            </select>
                            <small class="text-muted">Pilih induk menu</small>
                        </div>
                        <div class="col-md-2">
                            <select name="status_menu_aplikasi_sub" id="status_menu_aplikasi_sub" class="form-select">
                                <option value="Aktif">Aktif</option>
                                <option value="Non Aktif">Non Aktif</option>
                            </select>
                            <small class="text-muted">Status Sub Menu</small>
                        </div>
                        <div class="col-md-2">
                            <input type="number" name="urutan_sub" id="urutan_sub" class="form-control" placeholder="Urutan" value="0">

                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Nama Menu</label>
                        <div class="col-md-9">
                            <input type="text" name="nama_menu_aplikasi_sub" id="nama_menu_aplikasi_sub" class="form-control" placeholder="Nama Sub Menu" required>
                        </div>
                        
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Alamat URL/Link</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-text bg-light">{{ url('/') }}/</span>
                                <input type="text" name="alamat_menu_aplikasi_sub" id="alamat_menu_aplikasi_sub" class="form-control" placeholder="admin/sub-link" required>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Icon Sub Menu</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <div class="icon-dropdown-sub w-100">
                                    <button type="button" class="btn btn-outline-secondary d-flex align-items-center justify-content-between w-100" id="tombolIconSub">
                                        <span id="previewIconSub"><i class="fa-solid fa-arrow-right me-2"></i> fa-solid fa-arrow-right</span>
                                        <i class="fa-solid fa-caret-down"></i>
                                    </button>
                                    <div id="iconSearchWrapperSub" style="display:none; border:1px solid #ddd; padding:5px; background:#f8f9fa;">
                                        <input type="text" id="iconSearchSub" class="form-control form-control-sm" placeholder="Cari icon sub...">
                                    </div>
                                    <div class="icon-list-sub" id="iconListSub" style="display:none; max-height:200px; overflow-y:auto; border:1px solid #ddd; background:#fff; position:absolute; z-index:1050; width:100%;">
                                    </div>
                                </div>
                                <input type="hidden" name="icon_menu_aplikasi_sub" id="icon_menu_aplikasi_sub" value="fa-solid fa-arrow-right">
                            </div>
                        </div>
                    </div>

                    <div class="row mb-0">
                        <label class="col-md-3 col-form-label fw-bold">Keterangan Sub</label>
                        <div class="col-md-9">
                            <textarea name="keterangan_sub" id="keterangan_sub" class="form-control" rows="2" placeholder="keterangan sub menu"></textarea>
                        </div>
                    </div>
                </div>

                <div class="modal-footer bg-light justify-content-between">
                    <button type="button" class="btn btn-dark px-4" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success px-4">
                        <i class="fa-solid fa-save"></i> Simpan Sub Menu
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>
    $(document).ready(function() {
        // --- 1. DAFTAR ICON SUB MENU ---
        const iconsSub = [
           /* ===== ICON UMUM ===== */
            "fa-solid fa-home","fa-solid fa-sitemap","fa-solid fa-user","fa-solid fa-users",
            "fa-solid fa-cog","fa-solid fa-cogs","fa-solid fa-bell","fa-solid fa-envelope",
            "fa-solid fa-lock","fa-solid fa-key","fa-solid fa-chart-bar","fa-solid fa-book",
            "fa-solid fa-car","fa-solid fa-phone","fa-solid fa-desktop","fa-solid fa-camera",
            "fa-solid fa-search","fa-solid fa-map","fa-solid fa-calendar","fa-solid fa-star",
            "fa-solid fa-heart","fa-solid fa-shopping-cart","fa-solid fa-tag","fa-solid fa-trash",
            "fa-solid fa-edit","fa-solid fa-save","fa-solid fa-database","fa-solid fa-globe",
            "fa-solid fa-download","fa-solid fa-upload","fa-solid fa-check","fa-solid fa-times","fa-solid fa-tasks",
            "fa-solid fa-check-circle",
            "fa-solid fa-times-circle",

            /* ===== ICON FILE ===== */
            "fa-solid fa-file",
            "fa-solid fa-file-lines",
            "fa-solid fa-file-alt",
            "fa-solid fa-file-text",
            "fa-solid fa-file-pdf",
            "fa-solid fa-file-word",
            "fa-solid fa-file-excel",
            "fa-solid fa-file-powerpoint",
            "fa-solid fa-file-image",
            "fa-solid fa-file-zipper",
            "fa-solid fa-file-archive",
            "fa-solid fa-file-code",
            "fa-solid fa-file-import",
            "fa-solid fa-file-export",
            "fa-solid fa-folder",
            "fa-solid fa-folder-open",
            "fa-solid fa-folder-plus",
            "fa-solid fa-folder-minus",

            /* ===== ICON PANAH ===== */
            "fa-solid fa-arrow-right",
            "fa-solid fa-arrow-left",
            "fa-solid fa-arrow-up",
            "fa-solid fa-arrow-down",
            "fa-solid fa-arrow-right-arrow-left",
            "fa-solid fa-arrow-up-arrow-down",
            "fa-solid fa-arrow-up-right-from-square",
            "fa-solid fa-arrow-up-right-dots",
            "fa-solid fa-arrow-turn-up",
            "fa-solid fa-arrow-turn-down",
            "fa-solid fa-angles-right",
            "fa-solid fa-angles-left",
            "fa-solid fa-angles-up",
            "fa-solid fa-angles-down",
            "fa-solid fa-chevron-right",
            "fa-solid fa-chevron-left",
            "fa-solid fa-chevron-up",
            "fa-solid fa-chevron-down",
            "fa-solid fa-circle-arrow-right",
            "fa-solid fa-circle-arrow-left",
            "fa-solid fa-circle-arrow-up",
            "fa-solid fa-circle-arrow-down",

            /* ===== ICON LINK ===== */
            "fa-solid fa-link",
            "fa-solid fa-link-slash",
            "fa-solid fa-paperclip",
            "fa-solid fa-up-right-from-square",
            "fa-solid fa-external-link",
            "fa-solid fa-share",
            "fa-solid fa-share-nodes",
            "fa-solid fa-square-share-nodes",
            "fa-solid fa-network-wired"
        ];

        // --- 2. LOGIKA PEMILIHAN ICON SUB ---
        function renderIconsSub(filter = "") {
            const $list = $("#iconListSub");
            $list.empty();
            iconsSub.filter(icon => icon.toLowerCase().includes(filter.toLowerCase()))
                .forEach(icon => {
                    $list.append(`<div class="itemSub p-2 border-bottom" style="cursor:pointer;" data-icon="${icon}"><i class="${icon} me-2"></i> ${icon}</div>`);
                });
        }

        // Toggle Dropdown Icon
        $("#tombolIconSub").click(function(e) {
            e.stopPropagation();
            $("#iconListSub, #iconSearchWrapperSub").toggle();
            if ($("#iconListSub").is(":visible")) {
                renderIconsSub();
                $("#iconSearchSub").val("").focus();
            }
        });

        // Pilih Icon dari List
        $(document).on("click", ".itemSub", function() {
            const iconClass = $(this).data("icon");
            $("#icon_menu_aplikasi_sub").val(iconClass);
            $("#previewIconSub").html(`<i class="${iconClass} me-2"></i> ${iconClass}`);
            $("#iconListSub, #iconSearchWrapperSub").hide();
        });

        /*
        |--------------------------------------------------------------------------
        | AUTO GET URUTAN SUB MENU
        |--------------------------------------------------------------------------
        */

        $("#id_menu_aplikasi_sub_select").on("change", function(){

            let id_menu = $(this).val();

            let url = $(this).data("url");

            if(!id_menu){
                $("#urutan_sub").val(0);
                return;
            }

            $.ajax({

                url : url,
                type : "GET",
                data : { id_menu_aplikasi : id_menu },

                success : function(res){

                    if(res.status === "success"){
                        $("#urutan_sub").val(res.urutan_sub);
                    }

                }

            });

        });


        // Pencarian Icon
        $("#iconSearchSub").on("keyup", function() {
            renderIconsSub($(this).val());
        });

        // --- 3. LOGIKA EDIT SUB MENU (AJAX) ---
        $(document).on("click", ".edit-btn-sub", function() {
            let id = $(this).data("id");
            $("#modalLabelSub").text("Edit Sub Menu");

            $.ajax({
                url: "{{ url('admin/menu-aplikasi/show-sub') }}/" + id,
                type: "GET",
                dataType: "json",
                success: function(response) {
                    if (response.status === "success") {
                        let data = response.data;
                        // Isi Form Modal
                        $("#id_menu_aplikasi_sub").val(data.id_menu_aplikasi_sub);
                        $("#id_menu_aplikasi_sub_select").val(data.id_menu_aplikasi);
                        $("#nama_menu_aplikasi_sub").val(data.nama_menu_aplikasi_sub);
                        $("#urutan_sub").val(data.urutan_sub);
                        $("#alamat_menu_aplikasi_sub").val(data.alamat_menu_aplikasi_sub);
                        $("#status_menu_aplikasi_sub").val(data.status_menu_aplikasi_sub);

                        // Gunakan selector name untuk textarea jika ID bentrok
                        $("textarea[name='keterangan_sub']").val(data.keterangan_sub);

                        $("#icon_menu_aplikasi_sub").val(data.icon_menu_aplikasi_sub);
                        $("#previewIconSub").html(`<i class="${data.icon_menu_aplikasi_sub} me-2"></i> ${data.icon_menu_aplikasi_sub}`);
                    }
                }
            });
        });

        // --- 4. RESET FORM SAAT TAMBAH BARU ---
        $(document).on("click", "[data-bs-target='#dataModalSub']", function() {
            if (!$(this).hasClass('edit-btn-sub')) {
                $("#modalLabelSub").text("Tambah Sub Menu");
                $("#id_menu_aplikasi_sub").val("");
                $("#id_menu_aplikasi_sub_select").val("");
                $("#nama_menu_aplikasi_sub").val("");
                $("#alamat_menu_aplikasi_sub").val("");
                $("textarea[name='keterangan_sub']").val("");
                $("#icon_menu_aplikasi_sub").val("fa-solid fa-arrow-right");
                $("#previewIconSub").html(`<i class="fa-solid fa-arrow-right me-2"></i> fa-solid fa-arrow-right`);
            }
        });

        // --- 5. GLOBAL HIDE DROPDOWN ---
        $(document).click(function(e) {
            if (!$(e.target).closest(".icon-dropdown-sub").length) {
                $("#iconListSub, #iconSearchWrapperSub").hide();
            }
        });
    });
</script>

<style>
    /* Styling hover untuk list icon agar terlihat interaktif */
    #iconList .item:hover,
    .itemSub:hover {
        background-color: #0d6efd;
        color: white;
    }

    .icon-dropdown,
    .icon-dropdown-sub {
        position: relative;
    }
</style>