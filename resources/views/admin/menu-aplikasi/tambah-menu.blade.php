<form action="{{ route('admin.menu-aplikasi.simpan') }}" method="POST">
    @csrf
    <input type="hidden" name="id_menu_aplikasi" id="id_menu_aplikasi" value="">

    <div class="modal fade" id="dataModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content shadow-lg border-0">
                <div class="modal-header bg-primary">
                    <h5 class="modal-title text-white" id="modalLabel">Tambah atau Update Menu</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Urutan dan Status</label>
                        <div class="col-md-2">
                            <input type="number" name="urutan" id="urutan" class="form-control bg-light" placeholder="Urutan" value="{{ $urutan ?? 0 }}">
                            <small class="text-muted">Urutan</small>
                        </div>
                        <div class="col-md-3">
                            <select name="status_menu_aplikasi" id="status_menu_aplikasi" class="form-control">
                                <option value="Aktif">Aktif</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                            <small class="text-muted">Status</small>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Nama Menu</label>
                        <div class="col-md-9">
                            <input type="text" name="nama_menu_aplikasi" id="nama_menu_aplikasi" class="form-control" placeholder="Nama Menu" required>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Alamat URL/Link</label>
                        <div class="col-md-9">
                            <div class="input-group">
                                <span class="input-group-text bg-light">{{ url('/') }}/</span>
                                <input type="text" name="alamat_menu_aplikasi" id="alamat_menu_aplikasi" class="form-control" placeholder="admin/user" required>
                            </div>
                        </div>
                    </div>

                    <div class="row mb-3">
                        <label class="col-md-3 col-form-label fw-bold">Icon Menu</label>
                        <div class="col-md-9">
                            <div class="icon-dropdown position-relative">
                                <button type="button"
                                    class="btn btn-outline-secondary d-flex justify-content-between align-items-center w-100"
                                    id="btnIconMenu">
                                    <span id="previewIconMenu">
                                        <i class="fa-solid fa-arrow-right me-2"></i>
                                        fa-solid fa-arrow-right
                                    </span>
                                    <i class="fa-solid fa-caret-down"></i>
                                </button>
                                <div id="iconSearchWrapper" class="border p-2 bg-light d-none">
                                    <input type="text"
                                        id="iconSearch"
                                        class="form-control form-control-sm"
                                        placeholder="Cari icon...">
                                </div>
                                <div id="iconList"
                                    class="border bg-white position-absolute w-100 d-none"
                                    style="max-height:200px; overflow-y:auto; z-index:1050;">
                                </div>
                            </div>
                            <input type="hidden"
                                name="icon_menu_aplikasi"
                                id="icon_menu_aplikasi"
                                value="fa-solid fa-arrow-right">

                        </div>
                    </div>


                    <div class="row mb-0">
                        <label class="col-md-3 col-form-label fw-bold">Keterangan</label>
                        <div class="col-md-9">
                            <textarea name="keterangan" id="keterangan" class="form-control" rows="2" placeholder="Keterangan singkat"></textarea>
                        </div>
                    </div>
                </div>

                <div class="modal-footer bg-light justify-content-between">
                    <button type="button" class="btn btn-dark px-4" data-bs-dismiss="modal">
                        <i class="fa-solid fa-times-circle"></i> Close
                    </button>
                    <button type="submit" class="btn btn-primary px-4">
                        <i class="fa-solid fa-save"></i> Simpan Data
                    </button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>

$(function(){

/*
|--------------------------------------------------------------------------
| ICON LIST
|--------------------------------------------------------------------------
*/

const icons = [

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


/*
|--------------------------------------------------------------------------
| RENDER ICON LIST
|--------------------------------------------------------------------------
*/

function renderIcons(filter = "")
{
    let html = "";

    icons
    .filter(icon => icon.toLowerCase().includes(filter.toLowerCase()))
    .forEach(icon => {

        html += `
        <div class="icon-item p-2 border-bottom"
            data-icon="${icon}"
            style="cursor:pointer">

            <i class="${icon} me-2"></i>
            ${icon}

        </div>`;
    });

    $("#iconList").html(html);
}

/*
|--------------------------------------------------------------------------
| OPEN DROPDOWN
|--------------------------------------------------------------------------
*/

$("#btnIconMenu").click(function(e){

    e.stopPropagation();

    $("#iconList,#iconSearchWrapper").toggleClass("d-none");

    if(!$("#iconList").hasClass("d-none")){
        renderIcons();
        $("#iconSearch").val("").focus();
    }

});

/*
|--------------------------------------------------------------------------
| SEARCH ICON
|--------------------------------------------------------------------------
*/

$("#iconSearch").on("keyup", function(){

    renderIcons($(this).val());

});

/*
|--------------------------------------------------------------------------
| SELECT ICON
|--------------------------------------------------------------------------
*/

$(document).on("click",".icon-item",function(){

    let icon = $(this).data("icon");

    $("#icon_menu_aplikasi").val(icon);

    $("#previewIconMenu").html(`
        <i class="${icon} me-2"></i> ${icon}
    `);

    $("#iconList,#iconSearchWrapper").addClass("d-none");

});

/*
|--------------------------------------------------------------------------
| CLOSE DROPDOWN
|--------------------------------------------------------------------------
*/

$(document).click(function(e){

    if(!$(e.target).closest(".icon-dropdown").length){

        $("#iconList,#iconSearchWrapper").addClass("d-none");

    }

});

/*
|--------------------------------------------------------------------------
| EDIT MENU
|--------------------------------------------------------------------------
*/

$(document).on("click",".edit-btn",function(){

    let id = $(this).data("id");

    $("#modalLabel").text("Edit Menu");

    $.get("{{ url('admin/menu-aplikasi/show') }}/"+id,function(res){

        if(res.status === "success"){

            let d = res.data;

            $("#id_menu_aplikasi").val(d.id_menu_aplikasi);
            $("#nama_menu_aplikasi").val(d.nama_menu_aplikasi);
            $("#urutan").val(d.urutan);
            $("#alamat_menu_aplikasi").val(d.alamat_menu_aplikasi);
            $("#keterangan").val(d.keterangan);
            $("#status_menu_aplikasi").val(d.status_menu_aplikasi);

            let icon = d.icon_menu_aplikasi || "fa-solid fa-home";

            $("#icon_menu_aplikasi").val(icon);

            $("#previewIconMenu").html(`
                <i class="${icon} me-2"></i> ${icon}
            `);

        }

    });

});

/*
|--------------------------------------------------------------------------
| RESET MODAL TAMBAH
|--------------------------------------------------------------------------
*/

$(document).on("click","[data-bs-target='#dataModal']",function(){

    if(!$(this).hasClass("edit-btn")){

        $("#modalLabel").text("Tambah Menu");

        $("#id_menu_aplikasi").val("");
        $("#nama_menu_aplikasi").val("");
        $("#alamat_menu_aplikasi").val("");
        $("#keterangan").val("");

        let defaultIcon = "fa-solid fa-home";

        $("#icon_menu_aplikasi").val(defaultIcon);

        $("#previewIconMenu").html(`
            <i class="${defaultIcon} me-2"></i> ${defaultIcon}
        `);

        $("#status_menu_aplikasi").val("Aktif");

    }

});

});

</script>
