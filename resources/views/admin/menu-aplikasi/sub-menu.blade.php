<!-- Modal Bootstrap -->
    <div class="modal fade" id="dataSubMenu" ref="dataSubMenu" tabindex="1" aria-labelledby="dataSubMenuLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="dataModalLabel">Detail Sub Menu</h5>
                    
              </button>
                </div>
                <div class="modal-body">

                    
                    <table class="table table-sm table-bordered">
                        <thead>
                            <tr>
                                <th width="2%">No</th>
                                <th width="20%">Nama</th>
                                <th width="45%">Menu</th>
                                <th width="10%">Urutan</th>
                                <th width="10%">Status</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="(submenu, index) in sub_menus" :key="submenu.id_menu_aplikasi_sub">
                                <td class="text-center">[[ index + 1 ]]</td>
                                <td><strong>[[ submenu.nama_menu_aplikasi_sub ]]</strong>
                                    <small class="text-secondary">
                                        <br><i class="fas fa-sort"></i> Icon: [[ submenu.icon_menu_aplikasi_sub ]]
                                    </small>
                                </td>
                                <td><?php echo url('/') ?>/[[ submenu.alamat_menu_aplikasi_sub ]]
                                    <small class="text-secondary">
                                        <br><i class="fas fa-newspaper"></i> Note: [[ submenu.keterangan ]]
                                    </small>
                                </td>
                                <td>[[ submenu.urutan ]]</td>
                                <td>
                                    <span :class="['badge ', submenu.status_menu_aplikasi_sub === 'Aktif' ? 'text-bg-success' : 'text-bg-secondary']">
                                        <i :class="['bi ', submenu.status_menu_aplikasi_sub === 'Aktif' ? 'bi-check-circle' : 'bi-x-circle']"></i> [[ submenu.status_menu_aplikasi_sub ]]
                                    </span>
                                </td>
                                <td>
                                    <a :href="`../admin/menu-aplikasi/edit-sub-menu/${submenu.id_menu_aplikasi_sub}`" class="btn btn-dark btn-sm me-2">
                                        <i class="bi bi-pencil"></i>
                                    </a>
                                    <button class="btn btn-danger btn-sm  me-2" @click="confirmDeleteSub(submenu.id_menu_aplikasi,submenu.id_menu_aplikasi_sub)">
                                        <i class="bi bi-trash"></i>
                                    </button>
                                </td>
                            </tr>
                           
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer justify-content-end">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bi bi-times-circle"></i> Tutup
                    </button>
                </div>
            </div>
        </div>
    </div>
