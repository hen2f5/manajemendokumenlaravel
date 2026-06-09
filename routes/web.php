<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\Admin\DasborController;
use App\Http\Controllers\Admin\AksesLevelController;
use App\Http\Controllers\Admin\MenuAplikasiController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\KonfigurasiController;
use App\Http\Controllers\Admin\PejabatController;
use App\Http\Controllers\Admin\AkunController;
use App\Http\Controllers\Admin\UnitKerjaController;
use App\Http\Controllers\Admin\JenisDokumenController;
use App\Http\Controllers\Admin\PerkembanganController;
use App\Http\Controllers\Admin\SubJenisDokumenController;
use App\Http\Controllers\Api\MenuAplikasiController AS ApiMenuAplikasiController;
use App\Http\Controllers\Admin\DokumenController;
use App\Http\Controllers\Admin\AlbumController;
use App\Http\Controllers\Admin\StatistikController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
*/

// --- BERANDA & LOGIN ---
Route::get('/', [LoginController::class, 'index']);

Route::get('api/menu-aplikasi', [ApiMenuAplikasiController::class, 'index']);

Route::controller(LoginController::class)->group(function () {
    Route::get('/login', 'index')->name('login');
    Route::post('/proses-login', 'prosesLogin')->name('login.proses');
    Route::post('/refresh-chaptcha', 'refreshChaptcha');
    Route::get('/reset-password', 'resetPassword');
    Route::post('/proses-reset', 'prosesReset');
    Route::get('/ganti-password/{token}', 'gantiPassword');
    Route::post('/proses-ganti-password', 'prosesGantiPassword');
    Route::get('/logout', 'logout')->name('logout');
    Route::get('/migrasi-password', [LoginController::class, 'migrasiKeBcrypt']);
});

// --- ADMIN AREA (PROTECTED) ---
// Menggunakan middleware 'checklogin' sesuai file bootstrap/app.php Anda
Route::middleware(['checklogin'])->prefix('admin')->name('admin.')->group(function () {

    // DASBOR
    Route::get('/dasbor', [DasborController::class, 'index'])->name('dasbor');

    // statistik
    Route::get('/statistik', [StatistikController::class, 'index']);
    Route::get('/statistik/jenis-dokumen', [StatistikController::class, 'jenisDokumen']);
    Route::get('/statistik/sub-jenis-dokumen', [StatistikController::class, 'subJenisDokumen']);
    Route::get('/statistik/perkembangan', [StatistikController::class, 'perkembangan']);
    Route::get('/statistik/album', [StatistikController::class, 'album']);
    Route::get('/statistik/unit-kerja', [StatistikController::class, 'unitKerja']);

     // DOKUMEN
    Route::get('/dokumen', [DokumenController::class, 'index'])->name('dasbor');
    Route::get('/dokumen/cari', [DokumenController::class, 'cari'])->name('cari');
    Route::get('/dokumen/detail/{id}', [DokumenController::class, 'detail']);
    Route::get('/dokumen/unduh/{id}', [DokumenController::class, 'unduh']);
    Route::post('/dokumen/tambah', [DokumenController::class, 'tambah']);
    Route::post('/dokumen/tambah-album', [DokumenController::class, 'tambahAlbum']);
    Route::get('/dokumen/delete/{id}', [DokumenController::class, 'delete']);
    Route::get('/dokumen/edit/{id}', [DokumenController::class, 'edit']);
    Route::post('/dokumen/update', [DokumenController::class, 'update']);
    Route::get('/dokumen/show/{id}', [DokumenController::class, 'show']);
    Route::get('/dokumen/jenis/{id}', [DokumenController::class, 'jenisDokumen']);
    Route::get('/dokumen/sub-jenis/{id}', [DokumenController::class, 'subJenisDokumen']);
    Route::get('/dokumen/album/{id}', [DokumenController::class, 'album']);
    Route::get('/dokumen/perkembangan/{id}', [DokumenController::class, 'perkembangan']);
    Route::get('/dokumen/author/{id}', [DokumenController::class, 'author']);

    // unit-kerja
    Route::get('/unit-kerja', [UnitKerjaController::class, 'index'])->name('unitkerja');
    Route::post('/unit-kerja/tambah', [UnitKerjaController::class, 'tambah'])->name('tambah');
    Route::get('/unit-kerja/edit/{par1}', [UnitKerjaController::class, 'edit'])->name('edit');
    Route::get('/unit-kerja/activate/{par1}', [UnitKerjaController::class, 'activate'])->name('activate');
    Route::post('/unit-kerja/proses_edit', [UnitKerjaController::class, 'proses_edit'])->name('proses_edit');
    Route::get('/unit-kerja/delete/{par1}', [UnitKerjaController::class, 'delete'])->name('delete');
    Route::post('/unit-kerja/proses', [UnitKerjaController::class, 'proses'])->name('proses');

    // jenis-dokumen
    Route::get('/jenis-dokumen', [JenisDokumenController::class, 'index'])->name('unitkerja');
    Route::post('/jenis-dokumen/tambah', [JenisDokumenController::class, 'tambah'])->name('tambah');
    Route::get('/jenis-dokumen/edit/{par1}', [JenisDokumenController::class, 'edit'])->name('edit');
    Route::get('/jenis-dokumen/activate/{par1}', [JenisDokumenController::class, 'activate'])->name('activate');
    Route::post('/jenis-dokumen/proses_edit', [JenisDokumenController::class, 'proses_edit'])->name('proses_edit');
    Route::get('/jenis-dokumen/delete/{par1}', [JenisDokumenController::class, 'delete'])->name('delete');
    Route::post('/jenis-dokumen/proses', [JenisDokumenController::class, 'proses'])->name('proses');

    // sub-jenis-dokumen
    Route::get('/sub-jenis-dokumen', [SubJenisDokumenController::class, 'index'])->name('unitkerja');
    Route::post('/sub-jenis-dokumen/tambah', [SubJenisDokumenController::class, 'tambah'])->name('tambah');
    Route::get('/sub-jenis-dokumen/edit/{par1}', [SubJenisDokumenController::class, 'edit'])->name('edit');
    Route::get('/sub-jenis-dokumen/activate/{par1}', [SubJenisDokumenController::class, 'activate'])->name('activate');
    Route::post('/sub-jenis-dokumen/proses_edit', [SubJenisDokumenController::class, 'proses_edit'])->name('proses_edit');
    Route::get('/sub-jenis-dokumen/delete/{par1}', [SubJenisDokumenController::class, 'delete'])->name('delete');
    Route::post('/sub-jenis-dokumen/proses', [SubJenisDokumenController::class, 'proses'])->name('proses');

    // perkembangan
    Route::get('/perkembangan', [PerkembanganController::class, 'index'])->name('unitkerja');
    Route::post('/perkembangan/tambah', [PerkembanganController::class, 'tambah'])->name('tambah');
    Route::get('/perkembangan/edit/{par1}', [PerkembanganController::class, 'edit'])->name('edit');
    Route::get('/perkembangan/activate/{par1}', [PerkembanganController::class, 'activate'])->name('activate');
    Route::post('/perkembangan/proses_edit', [PerkembanganController::class, 'proses_edit'])->name('proses_edit');
    Route::get('/perkembangan/delete/{par1}', [PerkembanganController::class, 'delete'])->name('delete');
    Route::post('/perkembangan/proses', [PerkembanganController::class, 'proses'])->name('proses');

    // album
    Route::get('/album', [AlbumController::class, 'index'])->name('unitkerja');
    Route::post('/album/tambah', [AlbumController::class, 'tambah'])->name('tambah');
    Route::get('/album/edit/{par1}', [AlbumController::class, 'edit'])->name('edit');
    Route::get('/album/activate/{par1}', [AlbumController::class, 'activate'])->name('activate');
    Route::post('/album/proses_edit', [AlbumController::class, 'proses_edit'])->name('proses_edit');
    Route::get('/album/delete/{par1}', [AlbumController::class, 'delete'])->name('delete');
    Route::post('/album/proses', [AlbumController::class, 'proses'])->name('proses');

    // MENU APLIKASI
    Route::controller(MenuAplikasiController::class)->prefix('menu-aplikasi')->name('menu-aplikasi.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::post('/simpan', 'storeMenu')->name('simpan'); // Sesuaikan dengan nama method di controller (storeMenu)
        Route::post('/simpan-sub', 'storeSub')->name('simpan-sub');
        Route::get('/show/{id}', 'show')->name('show');
        Route::get('/show-sub/{id}', 'showSub')->name('show-sub');
        Route::get('/delete/{id}', 'destroy')->name('destroy');
        Route::get('/delete-sub/{id}', 'destroySub')->name('destroy-sub');
        Route::get('/urutkan', 'urutkan')->name('urutkan');
        Route::post('/urutkan-menu', 'urutkanMenu')->name('urutkanMenu');
        Route::get('/get-urutan-sub', 'getUrutanSub')->name('get-urutan-sub');
    });

    // AKSES LEVEL (LEVEL HAK AKSES)
    Route::controller(AksesLevelController::class)->prefix('akses-level')->name('akses-level.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::post('/simpan', 'store')->name('simpan');
        Route::post('/update', 'store');
        Route::get('/activate/{par1}', 'activate')->name('activate');
        Route::get('/show/{id}', 'show')->name('show');
        Route::get('/delete/{id}', 'destroy')->name('destroy');
        Route::get('/menu/{id}', 'menu')->name('menu');
        Route::post('/proses-menu', 'prosesMenu')->name('proses-menu');
    });

    // USER MANAGEMENT
    Route::controller(UserController::class)->prefix('user')->name('user.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/tambah', 'tambah')->name('tambah');
        Route::post('/proses_tambah', 'proses_tambah')->name('proses_tambah');
        Route::get('/edit/{id}', 'edit')->name('edit');
        Route::post('/proses_edit/{id}', 'proses_edit')->name('proses_edit');
        Route::get('/delete/{id}', 'delete')->name('delete');
        Route::post('/proses', 'proses')->name('proses');
    });

    Route::controller(KonfigurasiController::class)->prefix('konfigurasi')->name('konfigurasi.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::post('/update', 'update')->name('update');
        Route::get('/unggah', 'unggah')->name('unggah');
        Route::post('/update-unggah', 'updateUnggah')->name('update-unggah');
        Route::get('/email', 'email')->name('email');
        Route::post('/update-email', 'updateEmail')->name('update-email');
        Route::get('/icon', 'icon')->name('icon');
        Route::get('/logo', 'logo')->name('logo');
        // Satu route post untuk semua jenis upload gambar agar efisien
        Route::post('/upload/{tipe}', [KonfigurasiController::class, 'uploadGambar'])->name('upload');

        Route::get('/profil', 'profil')->name('profil');
        Route::post('/update-profil', 'updateProfil')->name('proses-profil');
    });

    // PEJABAT PENANDA TANGAN
    Route::controller(PejabatController::class)->prefix('pejabat')->name('pejabat.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/unit/{id_unit_kerja}', 'unit')->name('unit');
        Route::get('/edit/{id_pejabat}', 'edit')->name('edit');
        Route::get('/delete/{id_pejabat}', 'delete')->name('delete');

        // Route POST untuk tambah, edit (update), dan proses (bulk delete)
        Route::post('/tambah', 'tambah')->name('tambah');
        Route::post('/proses_edit', 'proses_edit')->name('proses_edit');
        Route::post('/proses', 'proses')->name('proses');
    });

    //AKUN & PROFILE
    Route::controller(AkunController::class)->prefix('akun')->name('akun.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::post('/update-profile', 'updateProfile');
        Route::post('/update-password', 'updatePassword');
    });
});
