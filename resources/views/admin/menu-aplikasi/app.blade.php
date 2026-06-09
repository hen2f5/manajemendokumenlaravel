<script>
axios.defaults.headers.common['X-CSRF-TOKEN'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
const { createApp } = Vue;
createApp({
    delimiters: ['[[', ']]'],
    data() {
        return {
            menu_aplikasis: [],
            sub_menus: [],
            menu: [],
            selectedMenu: '',
            form: {
                id_menu_aplikasi: '',
                nama_menu_aplikasi: '',
                icon_menu_aplikasi: 'fa-solid fa-arrow-right',
                alamat_menu_aplikasi: '',
                keterangan: '',
                urutan: '',
                status_menu_aplikasi: 'Aktif'
            },
            formSub: {
                id_menu_aplikasi_sub: '',
                id_menu_aplikasi: '',
                nama_menu_aplikasi_sub: '',
                icon_menu_aplikasi_sub: 'fa-solid fa-arrow-right',
                alamat_menu_aplikasi_sub: '',
                keterangan: '',
                urutan: '',
                status_menu_aplikasi_sub: 'Aktif'
            },
            isEdit: false,
            dataTable: null
        };
    },
    methods: {
        getNomorUrutSubMenu(id_menu_aplikasi) {
            if (!id_menu_aplikasi) return;

            axios.get(`<?php echo url('api/menu-aplikasi/get-nomor-urut-sub-menu') ?>/${id_menu_aplikasi}`)
                .then(response => {
                    this.formSub.urutan = response.data.nomor_urut_sub_menu;
                })
                .catch(error => {
                    console.error("Gagal mengambil nomor urut:", error);
                    this.formSub.urutan = ''; // fallback jika gagal
                });
        },
        fetchSubMenu(id_menu_aplikasi) {
            axios.get(`<?php echo url('api/menu-aplikasi/get-sub-menu/') ?>/${id_menu_aplikasi}`)
                .then(response => {
                    this.sub_menus = response.data;
                    this.selectedMenu = id_menu_aplikasi;
                    $('#dataSubMenu').modal('show');
                })
                .catch(error => {
                    console.error('Gagal mengambil data submenu:', error);
                    this.showNotification('Gagal mengambil data submenu', 'error');
                });
        },
        fetchData() {
            axios.get('<?php echo url('api/menu-aplikasi') ?>')
                .then(response => {
                    this.menu_aplikasis = response.data;

                    this.$nextTick(() => {
                        if ($.fn.DataTable.isDataTable('#tabel-data')) {
                            $('#tabel-data').DataTable().destroy();
                        }
                        $('#tabel-data').DataTable({
                            responsive: true,
                            lengthChange: true,
                            autoWidth: true,
                            lengthMenu: [
                                [100, 500, 1000, -1],
                                [100, 500, 1000, "Semua"]
                            ]
                        });
                    });
                })
                .catch(error => {
                    console.error("Error fetching data:", error);
                });
        },
        fetchMenu() {
            axios.get('<?php echo url('api/menu-aplikasi/get-data-menu') ?>')
                .then(response => {
                    this.menu = response.data;
                    // this.$nextTick(() => this.initSelect2Menu());
                })
                .catch(error => {
                    console.error("Error fetching menu:", error);
                });
        },
        openModal(mode, menu_aplikasi = null) {
            this.isEdit = mode === 'edit';
            if (this.isEdit) {
                this.form = { ...menu_aplikasi, password: '' };
            } else {
                this.resetForm();
            }
            $('#dataModal').modal('show');
        },
        openModalSub(mode, sub_menu = null) {
            this.isEdit = mode === 'edit';
            if (this.isEdit) {
                this.formSub = { ...sub_menu };
            } else {
                this.resetFormSub();
            }
            $('#dataModalSub').modal('show');
        },
        saveData() {
            if (!this.form.nama_menu_aplikasi || !this.form.icon_menu_aplikasi) {
                this.showNotification('Harap isi semua kolom wajib!', 'warning');
                return;
            }
            const request = this.isEdit
                ? axios.put(`<?php echo url('api/menu-aplikasi/edit') ?>`, this.form)
                : axios.post('<?php echo url('api/menu-aplikasi/simpan') ?>', this.form);
            request.then(() => {
                this.showNotification('Data berhasil disimpan', 'success');
                $('#dataModal').modal('hide');
                this.$nextTick(() => {
                    this.fetchMenu();
                    this.fetchData();
                });
            }).catch(() => {
                this.showNotification('Gagal menyimpan data', 'error');
            });
        },
        saveDataSub() {
            if (!this.formSub.nama_menu_aplikasi_sub || !this.formSub.status_menu_aplikasi_sub ) {
                this.showNotification('Harap isi semua kolom wajib!', 'warning');
                return;
            }
            const request = this.isEdit
                ? axios.put(`<?php echo url('api/menu-aplikasi/edit-sub') ?>/${this.formSub.id_menu_aplikasi_sub}`, this.formSub)
                : axios.post('<?php echo url('api/menu-aplikasi/simpan-sub') ?>', this.formSub);
            request.then(() => {
                this.showNotification('Data submenu berhasil disimpan', 'success');
                $('#dataModalSub').modal('hide');
                this.resetFormSub();
                // this.fetchSubMenu(this.formSub.id_menu_aplikasi);
                this.fetchMenu();
                this.fetchData();
            }).catch(() => {
                this.showNotification('Gagal menyimpan submenu', 'error');
            });
        },
        confirmDelete(id) {
            Swal.fire({
                title: 'Konfirmasi Hapus',
                text: 'Apakah Anda yakin ingin menghapus data ini?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.deleteData(id);
                }
            });
        },
        deleteData(id_menu_aplikasi) {
            axios.post(`<?php echo url('api/menu-aplikasi/hapus') ?>`, {
                id_menu_aplikasi: id_menu_aplikasi
            }).then(() => {
                this.showNotification('Data berhasil dihapus', 'success');
                setTimeout(() => {
                    this.fetchMenu();
                    this.fetchData();
                }, 500);
            }).catch(() => this.showNotification('Gagal menghapus data', 'error'));
        },
        confirmDeleteSub(id_menu_aplikasi,id_menu_aplikasi_sub) {
            Swal.fire({
                title: 'Konfirmasi Hapus',
                text: 'Apakah Anda yakin ingin menghapus data ini?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Ya, Hapus',
                cancelButtonText: 'Batal'
            }).then((result) => {
                if (result.isConfirmed) {
                    this.deleteDataSub(id_menu_aplikasi,id_menu_aplikasi_sub);
                }
            });
        },
        deleteDataSub(id_menu_aplikasi, id_menu_aplikasi_sub) {
            axios.post(`<?php echo url('api/menu-aplikasi/hapus-sub') ?>`, {
                id_menu_aplikasi: id_menu_aplikasi,
                id_menu_aplikasi_sub: id_menu_aplikasi_sub
            }).then(() => {
                this.showNotification('Data berhasil dihapus', 'success');
                setTimeout(() => {
                    this.fetchSubMenu(id_menu_aplikasi);
                    this.fetchMenu();
                    this.fetchData();
                }, 500);
            }).catch(() => this.showNotification('Gagal menghapus data', 'error'));
        },
        showNotification(message, type) {
            Swal.fire({
                title: type === 'success' ? 'Berhasil' : 'Gagal',
                text: message,
                icon: type,
                timer: 2000,
                showConfirmButton: false
            });
        },
        resetForm() {
            this.form = {
                id_menu_aplikasi: '',
                nama_menu_aplikasi: '',
                icon_menu_aplikasi: 'fa-solid fa-arrow-right',
                alamat_menu_aplikasi: '',
                keterangan: '',
                urutan: '',
                status_menu_aplikasi: 'Aktif'
            };
        },
        resetFormSub() {
            this.formSub = {
                id_menu_aplikasi_sub: '',
                id_menu_aplikasi: '',
                nama_menu_aplikasi_sub: '',
                icon_menu_aplikasi_sub: 'fa-solid fa-arrow-right',
                alamat_menu_aplikasi_sub: '',
                keterangan: '',
                urutan: '',
                status_menu_aplikasi_sub: 'Aktif'
            };
        }
    },
    mounted() {
        this.fetchMenu();
        this.fetchData();
        this.dataModal = $('#dataModal');
        this.dataModalSub = $('#dataModalSub');

        this.dataModalSub.on('shown.bs.modal', () => {
            const selectElement = $('#id_menu_aplikasi');

            if ($.fn.select2) {
                selectElement.select2({
                    placeholder: "Pilih Menu Utama",
                    allowClear: true,
                    width: '100%'
                });

                // Sinkronisasi Select2 dengan Vue
                selectElement.on('change', () => {
                    this.formSub.id_menu_aplikasi = selectElement.val();
                });

                $('#id_menu_aplikasi').select2({
                    dropdownParent: $('#dataModalSub')
                });

                this.$watch('formSub.id_menu_aplikasi', (newVal) => {
                    selectElement.val(newVal).trigger('change');
                });
            }
        });
    },
    watch: {
        'formSub.id_menu_aplikasi'(newVal) {
            this.getNomorUrutSubMenu(newVal);
        }
    }
}).mount('#app');
</script>
