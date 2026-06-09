-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jun 09, 2026 at 11:36 AM
-- Server version: 8.0.44
-- PHP Version: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aplikasi_datavet`
--

-- --------------------------------------------------------

--
-- Table structure for table `akses`
--

CREATE TABLE `akses` (
  `id_akses` int NOT NULL,
  `id_menu` int NOT NULL,
  `id_sub_menu` int NOT NULL,
  `akses_level` varchar(255) NOT NULL,
  `id_user` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `akses_level`
--

CREATE TABLE `akses_level` (
  `id_akses_level` int NOT NULL,
  `nama_akses_level` varchar(255) NOT NULL,
  `status_akses_level` varchar(20) NOT NULL,
  `keterangan` text,
  `urutan` int DEFAULT NULL,
  `unit_kerja` varchar(20) DEFAULT NULL,
  `alamat_url` varchar(255) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `akses_level`
--

INSERT INTO `akses_level` (`id_akses_level`, `nama_akses_level`, `status_akses_level`, `keterangan`, `urutan`, `unit_kerja`, `alamat_url`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(3, 'Admin Unit Kerja', 'Aktif', NULL, 3, NULL, NULL, 0, NULL, NULL, '2026-03-13 14:39:03', NULL, NULL),
(4, 'Pimpinan', 'Aktif', NULL, 4, NULL, NULL, 0, NULL, NULL, '2026-03-13 14:39:08', NULL, NULL),
(5, 'Bidang Laboratorium', 'Aktif', NULL, 5, NULL, NULL, 0, NULL, NULL, '2026-03-13 14:39:11', NULL, NULL),
(6, 'Super Administrator', 'Aktif', NULL, 1, NULL, NULL, 1, '2026-03-13 21:28:29', 1, '2026-03-13 07:55:35', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `album`
--

CREATE TABLE `album` (
  `id_album` int NOT NULL,
  `id_unit_kerja` int NOT NULL,
  `slug_album` varchar(255) NOT NULL,
  `nama_album` varchar(255) NOT NULL,
  `keterangan` text,
  `gambar` varchar(255) DEFAULT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` int NOT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `album`
--

INSERT INTO `album` (`id_album`, `id_unit_kerja`, `slug_album`, `nama_album`, `keterangan`, `gambar`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 1, 'n2qa2-album-kenangan', 'Album Kenangan', NULL, NULL, 1, '2026-03-15 10:36:28', 1, '2026-03-14 21:57:58', 0, NULL),
(2, 1, '1us9x-album-kesehatan', 'Album Kesehatan', NULL, NULL, 1, '2026-03-27 00:10:05', 1, '2026-03-26 10:10:05', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dokumen`
--

CREATE TABLE `dokumen` (
  `id_dokumen` int NOT NULL,
  `id_jenis_dokumen` int NOT NULL,
  `id_sub_jenis_dokumen` int NOT NULL,
  `id_perkembangan` int NOT NULL,
  `id_unit_kerja` int NOT NULL,
  `id_album` int DEFAULT NULL,
  `kode_dokumen` varchar(64) NOT NULL,
  `nama_dokumen` varchar(255) NOT NULL,
  `keterangan` text,
  `nama_file` varchar(255) NOT NULL,
  `ekstensi_file` varchar(10) NOT NULL,
  `ukuran_file` decimal(10,8) NOT NULL,
  `tahun` varchar(4) DEFAULT NULL,
  `thbl` varchar(6) DEFAULT NULL,
  `hits` int NOT NULL DEFAULT '0',
  `unduh` int NOT NULL DEFAULT '0',
  `created_by` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `dokumen`
--

INSERT INTO `dokumen` (`id_dokumen`, `id_jenis_dokumen`, `id_sub_jenis_dokumen`, `id_perkembangan`, `id_unit_kerja`, `id_album`, `kode_dokumen`, `nama_dokumen`, `keterangan`, `nama_file`, `ekstensi_file`, `ukuran_file`, `tahun`, `thbl`, `hits`, `unduh`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 1, 1, 1, 1, NULL, 'EISQETBTFW6C', 'Andrio Dwi Plasga (nrk. 177931) - 12 April 2022 (2).pdf', NULL, '2026_202603_p1TPORom42.pdf', 'pdf', 0.16000000, '2026', '202603', 18, 1, 1, '2026-03-14 10:35:27', NULL, '2026-03-14 20:21:27', NULL, NULL),
(2, 1, 1, 1, 1, NULL, 'D3TKALOTO46C', '5. Absen Pkc Kr Jati (mei) 2022.xls', NULL, '2026_202603_KCZVHeyuYP.xls', 'xls', 1.47000000, '2026', '202603', 3, 0, 1, '2026-03-14 10:35:27', NULL, '2026-03-14 20:09:36', NULL, NULL),
(3, 2, 4, 1, 1, NULL, 'BD1LWQEA3ZVJ', 'Andrio Dwi Plasga (nrk. 177931) - 12 April 2022 (1).pdf', NULL, '2026_202603_xppoadZq32.pdf', 'pdf', 0.16000000, '2026', '202603', 0, 0, 1, '2026-03-14 10:38:57', NULL, '2026-03-14 11:10:48', NULL, '2026-03-15 01:10:48'),
(4, 2, 2, 1, 1, NULL, 'SBKBHRA2RCDS', 'Rekapitulasi Final Assessor Meeting Es Iii_intake 02 Juni 22.xlsx', NULL, '2026_202603_rlGYAawuaQ.xlsx', 'xlsx', 0.05000000, '2026', '202603', 0, 1, 1, '2026-03-14 10:39:17', NULL, '2026-03-14 11:09:30', NULL, '2026-03-15 01:09:30'),
(5, 2, 2, 1, 1, NULL, 'OH2ATLMGJC1N', 'Pak Andoyo_140622_sharig Knowledge Akreditasi Jkb.pdf', NULL, '2026_202603_HYggg1y7j8.pdf', 'pdf', 0.14000000, '2026', '202603', 0, 1, 1, '2026-03-14 10:39:17', NULL, '2026-03-14 11:10:26', NULL, '2026-03-15 01:10:26'),
(6, 2, 4, 1, 1, NULL, '7V8YZ4QKKZQ9', 'Hero-img.png', NULL, '2026_202603_JixBVcYQXH.png', 'png', 0.07000000, '2026', '202603', 2, 0, 1, '2026-03-14 20:07:24', NULL, '2026-03-14 20:21:23', NULL, NULL),
(7, 2, 4, 1, 1, NULL, 'FREAYBNWXYXK', 'Logo-javawebmedia.png', NULL, '2026_202603_PH3dk4CHyD.png', 'png', 0.01000000, '2026', '202603', 1, 0, 1, '2026-03-14 20:07:24', NULL, '2026-03-14 20:07:35', NULL, NULL),
(8, 1, 1, 1, 1, 1, 'XTRBJZKLBPTQ', 'Pengguna Website.pdf', NULL, '2026_202603_FMkaIazHQ5.pdf', 'pdf', 0.03000000, '2026', '202603', 1, 0, 1, '2026-03-14 20:36:51', NULL, '2026-03-14 20:36:57', NULL, NULL),
(9, 1, 1, 1, 1, NULL, 'GLZIBILJAUYN', 'Laporan-kontrak-kinerja-22-06-2022-12-44-27.pdf', NULL, '2026_202603_mqKmZqkino.pdf', 'pdf', 0.08000000, '2026', '202603', 0, 0, 1, '2026-03-14 22:14:49', NULL, '2026-03-14 22:14:49', NULL, NULL),
(10, 1, 1, 1, 1, NULL, 'EAH0KZJQLXNM', '312-article Text-1356-1-10-20211025.pdf', NULL, '2026_202603_qKBF0f1drX.pdf', 'pdf', 0.27000000, '2026', '202603', 0, 0, 1, '2026-03-14 22:14:49', NULL, '2026-03-14 22:14:49', NULL, NULL),
(11, 2, 4, 1, 1, NULL, 'SONV84QCV2VC', '2026_202603_hyggg1y7j8.pdf', NULL, '2026_202603_ys85t5uJ1z.pdf', 'pdf', 0.14000000, '2026', '202603', 1, 0, 1, '2026-03-15 00:32:06', NULL, '2026-03-15 00:32:06', NULL, NULL),
(12, 1, 3, 1, 1, 1, 'F7KVE7SCLQQL', 'Laporan Simpeg Dashboard Pimpinan Uus', NULL, '2026_202603_ySUwGig6lw.docx', 'docx', 0.29000000, '2026', '202603', 13, 0, 1, '2026-03-15 07:17:29', NULL, '2026-03-15 10:52:52', NULL, NULL),
(13, 1, 3, 1, 1, 1, 'WCTX8PEQJZ0X', 'Usia Status Pegawai (1)', NULL, '2026_202603_BvMz4o1xcy.pdf', 'pdf', 0.01000000, '2026', '202603', 2, 0, 1, '2026-03-15 00:35:25', NULL, '2026-03-15 10:52:58', NULL, NULL),
(14, 1, 3, 1, 1, 1, 'FE5BHUQ1MPZI', 'Usia Status Pegawai', NULL, '2026_202603_mRWnUVIEsX.xlsx', 'xlsx', 0.02000000, '2026', '202603', 0, 0, 1, '2026-03-15 00:35:25', NULL, '2026-03-15 00:35:25', NULL, NULL),
(15, 1, 3, 1, 1, 1, 'JG0OGBES2UJD', 'Usia Status Pegawai', NULL, '2026_202603_28roXI5Jhn.pdf', 'pdf', 0.01000000, '2026', '202603', 0, 0, 1, '2026-03-15 00:35:25', NULL, '2026-03-15 00:35:25', NULL, NULL),
(16, 1, 3, 1, 1, 1, 'TGVHOUZEBGC8', 'Gender Stapeg (5)', NULL, '2026_202603_iXuMLyctfc.pdf', 'pdf', 0.01000000, '2026', '202603', 3, 0, 1, '2026-03-15 00:35:25', NULL, '2026-03-15 11:00:17', NULL, NULL),
(17, 2, 2, 1, 1, NULL, 'TJOTUJFWAZVY', 'Data Hasil Karya (3)', NULL, '2026_202603_jR3M4wT6jN.pdf', 'pdf', 0.03000000, '2026', '202603', 1, 0, 1, '2026-03-16 19:40:18', NULL, '2026-03-16 19:40:31', NULL, NULL),
(18, 2, 2, 1, 1, NULL, 'SXI1UNLATXQN', 'Data Jenis Dokumen', NULL, '2026_202603_82dnrE726t.pdf', 'pdf', 0.01000000, '2026', '202603', 0, 0, 1, '2026-03-16 19:40:18', NULL, '2026-03-16 19:40:18', NULL, NULL),
(19, 2, 2, 1, 1, NULL, 'EDUMPNDR954W', 'Chatgpt Image Mar 16, 2026, 04 01 07 Am', NULL, '2026_202603_xfhJiei8Mr.png', 'png', 1.00000000, '2026', '202603', 0, 0, 1, '2026-03-16 19:40:18', NULL, '2026-03-16 19:40:18', NULL, NULL),
(20, 2, 4, 1, 1, NULL, 'C402A9MYL791', '2026 202603 Rlgyaawuaq (1)', NULL, '2026_202603_VweFkq9M1F.xlsx', 'xlsx', 0.05000000, '2026', '202603', 2, 0, 1, '2026-03-16 19:41:05', NULL, '2026-03-16 19:41:27', NULL, NULL),
(21, 1, 3, 1, 1, 2, 'ETFI4CI1NI4F', '[new] Google Analytics Audience Overview  9 9 22, 5 51 Pm (1)', NULL, '2026_202603_juAIM8pOhn.pdf', 'pdf', 0.16000000, '2026', '202603', 1, 0, 1, '2026-03-26 10:10:42', NULL, '2026-05-23 01:54:07', NULL, NULL),
(22, 1, 3, 1, 1, 2, 'JPSJW4Z40BFO', '1 Surat Penawaran', NULL, '2026_202603_l8BRHYqjDF.docx', 'docx', 0.01000000, '2026', '202603', 0, 0, 1, '2026-03-26 10:10:42', NULL, '2026-03-26 10:10:42', NULL, NULL),
(23, 2, 4, 1, 1, 1, 'LXEVLW9TWFWM', '[devportal] Siasnapi Simpeg Wso2 Apim', NULL, '2026_202605_JT4E0t3k0L.pdf', 'pdf', 2.98000000, '2026', '202605', 1, 0, 1, '2026-05-23 01:54:31', NULL, '2026-05-23 01:54:39', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jenis_dokumen`
--

CREATE TABLE `jenis_dokumen` (
  `id_jenis_dokumen` int NOT NULL,
  `id_user` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `kode_jenis_dokumen` varchar(32) NOT NULL,
  `nama_jenis_dokumen` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int DEFAULT NULL,
  `status_jenis_dokumen` varchar(20) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `jenis_dokumen`
--

INSERT INTO `jenis_dokumen` (`id_jenis_dokumen`, `id_user`, `updated_by`, `kode_jenis_dokumen`, `nama_jenis_dokumen`, `keterangan`, `urutan`, `status_jenis_dokumen`, `gambar`, `updated_at`, `tanggal_update`) VALUES
(1, 1, 1, '001', 'Dokumen Keuangan', NULL, 1, 'Aktif', NULL, '2026-03-12 06:56:41', '2026-03-11 23:56:41'),
(2, 1, 1, '002', 'Dokumen Kepegawaian', NULL, 2, 'Aktif', NULL, '2026-03-12 06:56:54', '2026-03-11 23:56:54');

-- --------------------------------------------------------

--
-- Table structure for table `konfigurasi`
--

CREATE TABLE `konfigurasi` (
  `id_konfigurasi` int NOT NULL,
  `id_user` int NOT NULL,
  `namaweb` varchar(200) NOT NULL,
  `singkatan` varchar(255) DEFAULT NULL,
  `nama_singkat` varchar(255) DEFAULT NULL,
  `tagline` varchar(200) DEFAULT NULL,
  `tagline2` varchar(255) DEFAULT NULL,
  `tentang` text,
  `deskripsi` text,
  `website` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `email_cadangan` varchar(255) DEFAULT NULL,
  `alamat` text,
  `telepon` varchar(50) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `hp` varchar(50) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `keywords` varchar(400) DEFAULT NULL,
  `metatext` text,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `nama_facebook` varchar(255) DEFAULT NULL,
  `nama_twitter` varchar(255) DEFAULT NULL,
  `nama_instagram` varchar(255) DEFAULT NULL,
  `nama_youtube` varchar(255) DEFAULT NULL,
  `google_map` text,
  `protocol` varchar(255) NOT NULL,
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int NOT NULL,
  `smtp_timeout` int NOT NULL,
  `smtp_user` varchar(255) NOT NULL,
  `smtp_pass` varchar(255) NOT NULL,
  `paginasi` int NOT NULL DEFAULT '12',
  `gambar` varchar(255) DEFAULT NULL,
  `ukuran_file_kb` decimal(10,0) DEFAULT NULL,
  `ukuran_file_mb` decimal(10,0) DEFAULT NULL,
  `pagination` int DEFAULT NULL,
  `ekstensi_file` varchar(255) DEFAULT NULL,
  `jumlah_file_maksimal` int DEFAULT '10',
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `konfigurasi`
--

INSERT INTO `konfigurasi` (`id_konfigurasi`, `id_user`, `namaweb`, `singkatan`, `nama_singkat`, `tagline`, `tagline2`, `tentang`, `deskripsi`, `website`, `email`, `email_cadangan`, `alamat`, `telepon`, `fax`, `hp`, `logo`, `icon`, `keywords`, `metatext`, `facebook`, `twitter`, `instagram`, `youtube`, `nama_facebook`, `nama_twitter`, `nama_instagram`, `nama_youtube`, `google_map`, `protocol`, `smtp_host`, `smtp_port`, `smtp_timeout`, `smtp_user`, `smtp_pass`, `paginasi`, `gambar`, `ukuran_file_kb`, `ukuran_file_mb`, `pagination`, `ekstensi_file`, `jumlah_file_maksimal`, `tanggal`) VALUES
(1, 1, 'Sistem Informasi Manajemen Data dan File', 'DATAVET', 'Kementerian Pertanian Republik Indonesia', 'Melangkah Pasti Menuju yang Terbaik', NULL, '<p><strong data-start=\"0\" data-end=\"62\" data-is-only-node=\"\">Sistem Informasi Pengelolaan Dokumen Kementerian Pertanian</strong> merupakan sebuah platform digital yang dirancang untuk memudahkan proses pengelolaan, penyimpanan, pencarian, dan distribusi dokumen secara terstruktur, aman, dan efisien. Sistem ini membantu setiap unit kerja dalam mengelola berbagai jenis dokumen seperti surat, laporan, arsip digital, serta dokumen administratif lainnya dalam satu sistem terintegrasi. Dengan memanfaatkan teknologi informasi, sistem ini memungkinkan pengguna untuk melakukan pengunggahan dokumen, pengelompokan berdasarkan kategori, pencarian dokumen secara cepat, serta pengaturan hak akses sesuai dengan kewenangan pengguna. Melalui sistem ini diharapkan proses administrasi menjadi lebih tertib, transparan, dan terdokumentasi dengan baik sehingga dapat mendukung peningkatan kinerja organisasi serta pelayanan yang lebih efektif di lingkungan Kementerian Pertanian.</p>', 'SIKONJA (Sistem Informasi Kontrak Kinerja) FKUI adalah sistem yang dikembangkan oleh FKUI untuk menyimpan dan memonitor laporan dan bukti pendukung capaian kinerja unit kerja di FK setiap triwulan. Data capaian kinerja beserta bukti dukung dari SIKONJA akan dilaporkan ke dalam sistem Oracle BSC UI sebagai bentuk laporan fakultas ke universitas.', 'http://datavet.com', 'office@fk.ui.ac.id', 'office@fk.ui.ac.id', 'Jl. Salemba Raya No. 6, Jakarta Pusat 10430.', '(021) 31930373', NULL, NULL, 'g4eQbHGHrab4SnED1gOSirIJGfzDbQN8aka3otzq.jpg', '4iesOVv0HOgrNv2PMcWD8IOUFN2Km1zJF0Cq6eus.png', NULL, NULL, 'https://www.facebook.com/fk.univ.indonesia/', NULL, 'https://www.instagram.com/medicine_ui/?hl=en', 'https://www.youtube.com/channel/UCaVu4Zts76y90MerdjqeK0g', 'Fakultas Kedokteran Universitas Indonesia', NULL, 'Faculty of Medicine UI', 'Halo Toba', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3966.519780243916!2d106.84679165028122!3d-6.194938362394074!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e69f530aa98e499%3A0xb3054a2076a1a32b!2sFakultas%20Kedokteran%20Universitas%20Indonesia!5e0!3m2!1sen!2sid!4v1647995836039!5m2!1sen!2sid\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\"></iframe>', 'smtp', 'ssl://smtp.ui.ac.id', 465, 7, 'dc-imeri@ui.ac.id', 'imeri123', 6, 'landing-1781000865.png', 102400, 100, 50, 'pdf,zip,jpg,jpeg,png,doc,docx,xls,xlsx,ppt,pptx,odp,psd,ai', 10, '2026-06-09 10:27:45');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id_menu` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_menu` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `alamat_menu` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id_menu`, `id_user`, `nama_menu`, `icon`, `alamat_menu`, `keterangan`, `urutan`, `tanggal`) VALUES
(1, 1, 'Dashboard', 'fa fa-graduation-cap', 'admin/dasbor', NULL, 1, '2022-03-22 06:41:41');

-- --------------------------------------------------------

--
-- Table structure for table `menu_akses`
--

CREATE TABLE `menu_akses` (
  `id_menu_akses` int NOT NULL,
  `created_by` int DEFAULT NULL,
  `id_akses_level` int NOT NULL,
  `id_menu_aplikasi` int NOT NULL,
  `id_menu_aplikasi_sub` int NOT NULL,
  `urutan_menu_aplikasi` int NOT NULL,
  `urutan_menu_aplikasi_sub` int NOT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu_akses`
--

INSERT INTO `menu_akses` (`id_menu_akses`, `created_by`, `id_akses_level`, `id_menu_aplikasi`, `id_menu_aplikasi_sub`, `urutan_menu_aplikasi`, `urutan_menu_aplikasi_sub`, `tanggal_update`) VALUES
(78, 1, 6, 1, 0, 1, 0, '2026-06-09 11:14:23'),
(79, 1, 6, 2, 0, 2, 0, '2026-06-09 11:14:23'),
(80, 1, 6, 6, 0, 3, 0, '2026-06-09 11:14:23'),
(81, 1, 6, 3, 0, 4, 0, '2026-06-09 11:14:23'),
(82, 1, 6, 4, 0, 5, 0, '2026-06-09 11:14:23'),
(83, 1, 6, 5, 0, 11, 0, '2026-06-09 11:14:23'),
(84, 1, 6, 3, 1, 4, 1, '2026-06-09 11:14:23'),
(85, 1, 6, 3, 2, 4, 2, '2026-06-09 11:14:23'),
(86, 1, 6, 3, 3, 4, 3, '2026-06-09 11:14:23'),
(87, 1, 6, 3, 17, 4, 4, '2026-06-09 11:14:23'),
(88, 1, 6, 3, 18, 4, 5, '2026-06-09 11:14:23'),
(89, 1, 6, 4, 4, 5, 1, '2026-06-09 11:14:23'),
(90, 1, 6, 4, 5, 5, 2, '2026-06-09 11:14:23'),
(91, 1, 6, 4, 6, 5, 3, '2026-06-09 11:14:23'),
(92, 1, 6, 5, 7, 11, 1, '2026-06-09 11:14:23'),
(93, 1, 6, 5, 8, 11, 2, '2026-06-09 11:14:23'),
(94, 1, 6, 5, 9, 11, 3, '2026-06-09 11:14:23'),
(95, 1, 6, 5, 10, 11, 4, '2026-06-09 11:14:23'),
(96, 1, 6, 5, 11, 11, 5, '2026-06-09 11:14:23'),
(97, 1, 6, 5, 12, 11, 6, '2026-06-09 11:14:23'),
(98, 1, 6, 5, 16, 11, 7, '2026-06-09 11:14:23');

-- --------------------------------------------------------

--
-- Table structure for table `menu_aplikasi`
--

CREATE TABLE `menu_aplikasi` (
  `id_menu_aplikasi` int NOT NULL,
  `id_divisi` int DEFAULT NULL,
  `nama_menu_aplikasi` varchar(255) NOT NULL,
  `icon_menu_aplikasi` varchar(255) NOT NULL,
  `alamat_menu_aplikasi` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int NOT NULL,
  `status_menu_aplikasi` varchar(20) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu_aplikasi`
--

INSERT INTO `menu_aplikasi` (`id_menu_aplikasi`, `id_divisi`, `nama_menu_aplikasi`, `icon_menu_aplikasi`, `alamat_menu_aplikasi`, `keterangan`, `urutan`, `status_menu_aplikasi`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, NULL, 'Dashboard', 'fa-solid fa-home', 'http://localhost/datavet/admin/dasbor', NULL, 1, 'Aktif', 1, '2026-03-13 22:34:36', 1, '2026-03-14 07:49:54', NULL, NULL),
(2, NULL, 'Kelola Dokumen', 'fa-solid fa-file-pdf', 'admin/dokumen', NULL, 2, 'Aktif', 1, '2026-03-13 22:46:25', 1, '2026-03-14 08:30:49', NULL, NULL),
(3, NULL, 'Data Master', 'fa-solid fa-database', '#', NULL, 4, 'Aktif', 1, '2026-03-13 22:47:24', 1, '2026-03-15 10:20:30', NULL, NULL),
(4, NULL, 'Pengguna Sistem', 'fa-solid fa-users', '#', NULL, 5, 'Aktif', 1, '2026-03-13 22:47:48', 1, '2026-03-15 10:20:38', NULL, NULL),
(5, NULL, 'Konfigurasi', 'fa-solid fa-cog', '#', NULL, 11, 'Aktif', 1, '2026-03-13 22:48:06', 1, '2026-03-15 10:20:08', NULL, NULL),
(6, NULL, 'Statistik Dokumen', 'fa-solid fa-chart-bar', 'admin/statistik', NULL, 3, 'Aktif', 1, '2026-03-16 00:19:21', 1, '2026-03-15 10:19:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `menu_aplikasi_sub`
--

CREATE TABLE `menu_aplikasi_sub` (
  `id_menu_aplikasi_sub` int NOT NULL,
  `id_menu_aplikasi` int DEFAULT NULL,
  `nama_menu_aplikasi_sub` varchar(255) NOT NULL,
  `icon_menu_aplikasi_sub` varchar(255) NOT NULL,
  `alamat_menu_aplikasi_sub` varchar(255) NOT NULL,
  `keterangan_sub` text,
  `urutan_sub` int NOT NULL,
  `status_menu_aplikasi_sub` varchar(20) NOT NULL,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_by` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `menu_aplikasi_sub`
--

INSERT INTO `menu_aplikasi_sub` (`id_menu_aplikasi_sub`, `id_menu_aplikasi`, `nama_menu_aplikasi_sub`, `icon_menu_aplikasi_sub`, `alamat_menu_aplikasi_sub`, `keterangan_sub`, `urutan_sub`, `status_menu_aplikasi_sub`, `created_by`, `created_at`, `updated_by`, `updated_at`, `deleted_by`, `deleted_at`) VALUES
(1, 3, 'Jenis Dokumen', 'fa-solid fa-sitemap', 'http://localhost/datavet/admin/jenis-dokumen', NULL, 1, 'Aktif', 1, '2026-03-13 22:48:54', 1, '2026-03-14 07:43:16', NULL, NULL),
(2, 3, 'Tingkat Perkembangan', 'fa-solid fa-tasks', 'admin/perkembangan', NULL, 2, 'Aktif', 1, '2026-03-13 22:49:36', 1, '2026-03-13 08:49:36', NULL, NULL),
(3, 3, 'Unit Kerja', 'fa-solid fa-home', 'admin/unit-kerja', NULL, 3, 'Aktif', 1, '2026-03-13 22:50:19', 1, '2026-03-13 08:50:19', NULL, NULL),
(4, 4, 'Pengguna Sistem', 'fa-solid fa-users', 'admin/user', NULL, 1, 'Aktif', 1, '2026-03-13 22:52:42', 1, '2026-03-13 08:54:08', NULL, NULL),
(5, 4, 'Level Hak Akses', 'fa-solid fa-lock', 'admin/akses-level', NULL, 2, 'Aktif', 1, '2026-03-13 22:53:06', 1, '2026-03-13 08:54:45', NULL, NULL),
(6, 4, 'Menu dan Sub Menu', 'fa-solid fa-sitemap', 'admin/menu-aplikasi', NULL, 3, 'Aktif', 1, '2026-03-13 22:55:05', 1, '2026-03-13 08:55:05', NULL, NULL),
(7, 5, 'Konfigurasi Umum', 'fa-solid fa-book', 'admin/konfigurasi', NULL, 1, 'Aktif', 1, '2026-03-13 22:57:29', 1, '2026-03-13 08:57:46', NULL, NULL),
(8, 5, 'Update Logo', 'fa-solid fa-file-image', 'admin/konfigurasi/logo', NULL, 2, 'Aktif', 1, '2026-03-13 22:58:17', 1, '2026-03-13 08:58:27', NULL, NULL),
(9, 5, 'Update Icon', 'fa-solid fa-star', 'http://localhost/datavet/admin/konfigurasi/icon', NULL, 3, 'Aktif', 1, '2026-03-13 22:59:17', 1, '2026-03-15 06:57:31', NULL, NULL),
(10, 5, 'Update Profil Organisasi', 'fa-solid fa-edit', 'admin/konfigurasi/profil', NULL, 4, 'Aktif', 1, '2026-03-13 22:59:40', 1, '2026-03-13 09:01:31', NULL, NULL),
(11, 5, 'Setting Email', 'fa-solid fa-envelope', 'admin/konfigurasi/email', NULL, 5, 'Aktif', 1, '2026-03-13 23:01:07', 1, '2026-03-13 09:01:07', NULL, NULL),
(12, 5, 'Pejabat dan Pimpinan', 'fa-solid fa-user', 'admin/pejabat', NULL, 6, 'Aktif', 1, '2026-03-13 23:02:12', 1, '2026-03-13 09:02:12', NULL, NULL),
(16, 5, 'Setting Unggahan', 'fa-solid fa-upload', 'admin/konfigurasi/unggah', NULL, 7, 'Aktif', 1, '2026-03-15 10:53:20', 1, '2026-03-14 20:53:20', NULL, NULL),
(17, 3, 'Album Dokumen', 'fa-solid fa-file-image', 'admin/album', NULL, 4, 'Aktif', 1, '2026-03-15 11:44:19', 1, '2026-03-14 21:44:19', NULL, NULL),
(18, 3, 'Kelompok Substansi', 'fa-solid fa-arrow-right', 'admin/poksi', NULL, 5, 'Aktif', 1, '2026-06-09 11:14:07', 1, '2026-06-09 04:14:07', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pejabat`
--

CREATE TABLE `pejabat` (
  `id_pejabat` int NOT NULL,
  `id_unit_kerja` int DEFAULT '0',
  `id_user` int NOT NULL,
  `nama_pejabat` varchar(255) DEFAULT NULL,
  `nip` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `nama_unit_kerja` varchar(255) DEFAULT NULL,
  `status_pimpinan` enum('Tidak','Ya') NOT NULL DEFAULT 'Tidak',
  `urutan` int NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `pejabat`
--

INSERT INTO `pejabat` (`id_pejabat`, `id_unit_kerja`, `id_user`, `nama_pejabat`, `nip`, `jabatan`, `nama_unit_kerja`, `status_pimpinan`, `urutan`, `gambar`, `tanggal`) VALUES
(2, 101, 113, 'Dr. dr. Rahyussalim, SpOT, K-Spine', '0108050351', 'Manajer Riset dan Pengabdian Masyarakat', 'Manajer Riset dan Pengabdian Masyarakat', 'Ya', 1, NULL, '2022-06-29 23:53:43'),
(6, 0, 9, 'dr. Anis Karuniawati, Sp.MK(K)., Ph.D.', '196509171991102001', 'Wakil Dekan Bidang Sumber Daya, Ventura, dan Administrasi Umum', 'Fakultas Kedokteran Universitas Indonesia', 'Ya', 3, NULL, '2022-06-13 18:45:50'),
(7, 0, 9, 'Prof. Dr. dr. Dwiana Ocviyanti, Sp.O.G., M.P.H.', '196110041987032002', 'Wakil Dekan Bidang Pendidikan, Penelitian, dan Kemahasiswaan', 'Fakultas Kedokteran Universitas Indonesia', 'Ya', 2, NULL, '2022-06-13 18:45:56'),
(8, 0, 1, 'Dr. dr. Murti Andriastuti, SpA(K)', '0106050154', 'Manajer Pendidikan dan Kemahasiswaan Program Sarjana, Profesi Dokter, Magister dan Doktor', 'Fakultas Kedokteran Universitas Indonesia', 'Tidak', 5, 'ds-1666440004.jpg', '2022-10-22 05:00:04'),
(9, 0, 1, 'Dr. dr. Em Yunir, SpPD-KEMD', '140321909', 'Manajer Pendidikan dan Kemahasiswaan Program Dokter Spesialis dan Subspesialis', 'Fakultas Kedokteran Universitas Indonesia', 'Tidak', 6, NULL, '2022-12-03 20:40:19'),
(10, 0, 9, 'Dr. dr. Yuli Budiningsih, SpFM(K)', '196007291988112001', 'Sekretaris Pimpinan Fakultas', 'Fakultas Kedokteran Universitas Indonesia', 'Tidak', 4, 'signature-1657086691.jpg', '2022-07-06 20:28:19'),
(11, 102, 9, 'Prof. Dr. dr. Andon Hestiantoro, SpOG(K), MPH', '196011271985121001', 'Manajer Kerjasama, Ventura dan Hubungan Alumni', 'Manajer Kerjasama, Ventura dan Hubungan Alumni', 'Ya', 9, NULL, '2022-06-24 02:06:28'),
(12, 16, 28, 'Dr. dr. Aria Kekalih, MTI', '198104172008121003', 'Koordinator E-Learning', 'E- Learning', 'Ya', 9, 'tandatangan-aria-kekalih-1657295118.jpeg', '2022-07-08 08:45:18'),
(13, 2, 14, 'Prof. dr. Badriul Hegar., Ph.D, Sp.A (K)', '195809211983121001', 'Direktur IMERI', 'UKK PI IMERI', 'Ya', 1, 'whatsapp-image-2022-04-04-at-211620-1657211592.jpeg', '2022-07-07 09:33:12'),
(14, 5, 17, 'dr. Fera Ibrahim, M.Sc, PhD, SpMK(K)', '196002171989032002', 'Ketua', 'UKK  PPM Laboratorium Mikrobiologi Klinik', 'Ya', 1, NULL, '2022-06-13 19:49:43'),
(15, 25, 37, 'dr. Adhrie Sugiarto, Sp.An-KIC', '198010162012121001', 'Ketua Program Studi', 'Spesialis Anestesiologi', 'Ya', 1, 'picture2-1657274333.png', '2022-07-08 02:58:53'),
(16, 12, 9, 'Winarsih, S.Sos., S.S., M.Si', '196902051991032001', 'Koordinator Umum dan Fasilitas', 'Umum dan Fasilitas', 'Ya', 1, NULL, '2022-06-20 19:50:37'),
(17, 100, 9, 'Adi Setiadi Nugraha, A.Md.', '011113003', 'Koordinator Hubungan Masyarakat', 'Hubungan Masyarakat', 'Ya', 1, NULL, '2022-06-20 19:57:20'),
(18, 47, 59, 'Dr. dr. Mardiastuti H Wahid, M.Sc., SpMK(K)', '196206101988112001', 'Ketua Program Studi', 'Spesialis Mikrobiologi Klinik', 'Ya', 1, 'ttd-dr-asti-kps-ppdsmk-1657266607.jpg', '2022-07-08 00:50:07'),
(19, 26, 38, 'Dr. dr. Erwin Danil Yulian, SpB, Subsp.Onk(K)', '196401081989121001', 'Ketua Program Studi', 'Spesialis Ilmu Bedah', 'Ya', 1, NULL, '2023-01-05 22:51:13'),
(20, 40, 52, 'dr. Yusra, SpPK(K), PhD', '197208161997022001', 'Ketua Program Studi', 'Spesialis Patologi Klinik', 'Ya', 1, NULL, '2022-06-29 19:32:11'),
(21, 40, 52, 'dr. July Kumalawati, SpPK(K), DMM', '196102241986022002', 'Seketaris Program Studi', 'Spesialis Patologi Klinik', 'Ya', 2, NULL, '2022-06-29 19:34:49'),
(22, 52, 64, 'Prof. dr. Budi Sampurna, DFM, SH, Sp.F(K), Sp.KP', '195407231980031003', 'Ketua Program Studi Sp1 Kedokteran Penerbangan', 'Spesialis Kedokteran Penerbangan', 'Ya', 2, NULL, '2022-06-29 19:53:09'),
(23, 49, 61, 'Prof.Muchtaruddin Mansyur,MS,SpOk,SubSp.Toksiko(K),Ph.D', '195812181983121002', 'Ketua Program Studi Sp1 Kedokteran Okupasi', 'Spesialis Kedokteran Okupasi', 'Ya', 1, NULL, '2022-10-07 02:51:24'),
(28, 48, 60, 'dr. Instiaty, Ph.D, Sp.FK', '0108050305', 'Ketua Program Studi', 'Spesialis Farmakologi Klinik', 'Ya', 1, NULL, '2022-07-07 23:11:57'),
(29, 46, 58, 'Dr. dr. Nani Cahyani Sudarsono, Sp.KO', '196305231988122002', 'Ketua Program Studi Sp1 Ilmu Kedokteran Olahraga', 'Spesialis Ilmu Kedokteran Olahraga', 'Ya', 2, NULL, '2022-06-29 19:54:17'),
(30, 46, 58, 'Dr. dr. Retno Asti Werdhani, M.Epid, Sp.KKLP', '197508252008122001', 'Ketua Departemen Ilmu Kedokteran Komunitas', 'Spesialis Ilmu Kedokteran Olahraga', 'Ya', 1, NULL, '2022-06-29 19:53:41'),
(31, 52, 64, 'Dr. dr. Retno Asti Werdhani, M.Epid, Sp.KKLP', '197508252008122001', 'Ketua Departemen Ilmu Kedokteran Komunitas', 'Spesialis Kedokteran Penerbangan', 'Ya', 1, NULL, '2022-06-29 19:52:46'),
(32, 59, 71, 'Dr. dr. Nastiti Kaswandani, Sp.A(K)', '197011121999072001', 'Ketua Program Studi', 'Subspesialis Ilmu Kesehatan Anak', 'Ya', 1, NULL, '2022-07-07 23:11:04'),
(34, 31, 43, 'Dr. Natalia Widiasih Raharjanti, SpKJ(K). MPdKed', '197312092008122002', 'Ketua Program Studi', 'Spesialis Ilmu Kedokteran Jiwa', 'Ya', 2, 'ttd-dr-natalia-1657250611.jpeg', '2022-07-07 20:23:31'),
(35, 49, 61, 'dr.Retno Asti Werdhani,M.Epid,Sp.KKLP', '197508252008122001', 'Ketua Departemen Ilmu Kedokteran Komunitas', 'Spesialis Kedokteran Okupasi', 'Ya', 2, NULL, '2022-10-07 02:52:09'),
(36, 27, 39, 'Prof. Dr. dr. Dyah Purnamasari, SpPD, K-EMD', '197605132009122001', 'Ketua Program Studi', 'Spesialis Ilmu Penyakit Dalam', 'Ya', 1, NULL, '2023-10-05 23:29:09'),
(37, 43, 55, 'Dr.dr. Renindra Ananda Aman, Sp.BS(K)', '196412211990101001', 'Ketua Prodi Ilmu Bedah Saraf FKUI', 'Spesialis Ilmu Bedah Saraf', 'Ya', 2, NULL, '2022-06-29 19:56:12'),
(38, 36, 48, 'dr. Triya Damayanti, SpP(K), PhD', '197604262010122001', 'Ketua Program Studi', 'Spesialis Pulmonologi dan Ilmu Kedokteran Respirasi', 'Ya', 2, 'tanda-tangan-dr-triya-1657183483.jpg', '2022-07-07 01:44:43'),
(39, 62, 74, 'Prof.Dr.dr. Tjhin wiguna. SpKJ(K)', '196204191990111001', 'Ketua Program Studi Subspesialis', 'Subspesialis Ilmu Kedokteran Jiwa', 'Ya', 2, 'whatsapp-image-2022-07-02-at-94612-am-1657254389.jpeg', '2022-07-07 21:26:29'),
(40, 34, 46, 'Dr.dr. Harim Priyono, Sp.T.H.T.K.L.B.K.L., Subsp.Oto.(K)', '197210162009121001', 'Ketua Program Studi', 'Spesialis Kesehatan Telinga Hidung Tenggorok, Kepala Leher', 'Ya', 1, NULL, '2023-01-04 19:27:11'),
(42, 23, 35, 'Prof. Dr. rer. nat. Dra. Asmarinah.,M.S', '196511211991032001', 'Ketua Program Doktor Ilmu Biomedik', 'Doktor Ilmu Biomedik', 'Ya', 1, 'ttd-prof-asmarinah-1672988447.jpg', '2023-01-06 00:00:47'),
(43, 54, 66, 'dr. Yenny Djuardi, PhD, Sp.Par.K.', '010603202', 'Ketua Program Studi', 'Spesialis Parasitologi Klinik', 'Ya', 2, NULL, '2022-06-29 19:56:04'),
(44, 61, 73, 'Dr. dr. Hamzah Shatri, SpPD-KPsi, M.Epid', '195906301985021001', 'Ketua Program Studi', 'Subspesialis Ilmu Penyakit Dalam', 'Ya', 1, NULL, '2024-04-04 21:20:13'),
(45, 29, 41, 'dr. Fernandi, SpOG(K)', '197512022009121001', 'Ketua Program Studi', 'Spesialis Obstetri dan Ginekologi', 'Tidak', 1, 'ttd-dr-fernandi-1657245764.jpeg', '2023-03-30 00:21:19'),
(46, 56, 68, 'Dr. dr. Dhanasari Vidiawati Sanyoto, M.Sc, Sp.KKLP.', '196503131991032001', 'Ketua Program Studi Kedokteran Keluarga Layanan Primer', 'Spesialis Kedokteran Keluarga Layanan Primer', 'Ya', 2, 'ttd-dr-dhanasari-1688715441.png', '2023-07-07 00:37:21'),
(47, 58, 70, 'Dr. dr. Agi Satria Putranto, Sp.B., Subsp.BD(K)', '195908221986031001', 'Ketua Program Studi', 'Subspesialis Ilmu Bedah', 'Ya', 2, 'ttd-kps-1657250133.jpeg', '2024-04-04 00:22:28'),
(48, 19, 31, 'Prof. Dr. dr. Dewi Sumarjani Soemarko, MS, SpOk, Subsp PsiKO (K)', '196211291988112001', 'Ketua Program Studi', 'Magister Kedokteran Kerja', 'Ya', 1, 'ttd-ds-grayscale-1672972418.png', '2024-01-07 21:51:13'),
(49, 42, 54, 'Prof. dr. Agus Rizal A.H Hamid, SpU(K), PhD', '197706112009121002', 'Ketua Program Studi', 'Spesialis Urologi', 'Ya', 1, NULL, '2024-10-08 19:37:58'),
(50, 32, 44, 'Dr. dr. Syntia Nusanti, SpM(K), MPd.Ked', '19780212209122002', 'Ketua Program Studi Ilmu Kesehatan Mata', 'Spesialis Ilmu Kesehatan Mata', 'Ya', 1, NULL, '2024-04-04 00:46:27'),
(52, 50, 62, 'Dr. dr. Pribadi Wiranda Busro, SpBTKV(K)', '197206292008011012', 'Ketua Program Studi Bedah Toraks, Kardiak dan Vaskular', 'Spesialis Bedah Toraks Kardiovaskular', 'Ya', 2, NULL, '2022-06-29 19:56:11'),
(54, 21, 33, 'Prof. Dr. dr. Suhendro, Sp.PD-KPTI', '196008281985121001', 'Ketua Program Studi', 'Doktor Ilmu Kedokteran', 'Ya', 1, NULL, '2022-07-09 00:52:24'),
(55, 60, 72, 'Dr. dr. I Putu Gede Kayika, SpOG(K), MPH', '196405231991021001', 'Ketua Program Studi', 'Subspesialis Obstetri dan Ginekologi', 'Ya', 2, NULL, '2022-06-29 19:56:54'),
(56, 59, 71, 'dr. Fatima Safira Alatas, PhD, Sp.A(K)', '197209272009122001', 'Ketua Departemen', 'Subspesialis Ilmu Kesehatan Anak', 'Ya', 2, NULL, '2022-07-07 23:11:25'),
(57, 24, 36, 'Dr. dr. Riwanti Estiasari, SpS(K)', '0108050310', 'Ketua Program Studi Pendidikan & Profesi Dokter', 'Sarjana dan Profesi Dokter', 'Ya', 1, NULL, '2022-06-29 19:56:32'),
(58, 41, 53, 'Dr.dr. Ihsan Oesman, Sp.OT(K)', '197911302010121002', 'Ketua Program Studi Spesialis', 'Spesialis Orthopaedi dan Traumatologi', 'Ya', 1, 'ttd-dr-io-1735615921.jpg', '2024-12-30 20:32:01'),
(59, 33, 45, 'dr. Hanny Nilasari, Sp.KK(K)', '01.070.50.226', 'Ketua Departemen Dermatologi dan Venereologi', 'Spesialis Dermatologi dan Venereologi', 'Ya', 1, '116324645-1719066851.jpg', '2024-06-22 07:34:11'),
(60, 28, 40, 'dr. Fatima Safira Alatas Sp.A(K)., Ph.D.', '197209272009122001', 'Ketua Departemen', 'Spesialis Ilmu Kesehatan Anak', 'Ya', 2, NULL, '2022-07-08 00:37:10'),
(61, 42, 54, 'Prof. Dr. dr. Irfan Wahyudi, SpU(K)', '197107152000031001', 'Ketua Departemen', 'Spesialis Urologi', 'Ya', 2, NULL, '2024-10-08 19:38:17'),
(62, 38, 50, 'Prof. Dr. dr. Agus Purwadianto, Sp.F.M, Subsp.F.K(K), SH, Msi, DFM', 'NIP: 195411091980031004', 'Ketua Program Studi Spesialis Kedokteran Forensik dan Studi Medikolegal', 'Spesialis Kedokteran Forensik dan Medikolegal', 'Ya', 1, NULL, '2023-04-03 07:16:59'),
(63, 32, 44, 'Dr. dr. Ari Djatikusumo, SpM(K)', '196912122009121002', 'Kepala Departemen Ilmu Kesehatan Mata', 'Spesialis Ilmu Kesehatan Mata', 'Ya', 2, NULL, '2024-04-04 00:47:33'),
(64, 34, 46, 'dr. Ika Dewi Mayangsari, Sp.T.H.T.K.L.B.K.L., Subsp.Onk.(K)', '196812142014122001', 'Kepala Departemen THT-KL', 'Spesialis Kesehatan Telinga Hidung Tenggorok, Kepala Leher', 'Ya', 2, NULL, '2023-01-04 19:27:00'),
(65, 51, 63, 'Dr. dr. Arie Munandar, Sp.Onk.Rad(K)', '19820306201412001', 'Ketua Program Studi Onkologi Radiasi', 'Spesialis Onkologi Radiasi', 'Ya', 1, NULL, '2022-06-29 19:57:12'),
(66, 44, 56, 'Dr. dr. Luh Karunia Wahyuni, SpKFR(K)', '196101281988122001', 'Ketua Departemen Ilmu Kedokteran Fisik dan Rehabilitasi', 'Spesialis Ilmu Kedokteran Fisik dan Rehabilitasi', 'Tidak', 1, NULL, '2024-01-07 21:55:55'),
(67, 55, 67, 'Dr. dr. Hasan Mihardja, M.Kes, Sp.Ak, SubSp.Ak - G(K)', '195302081982031001', 'Ketua Program Studi', 'Spesialis Akupuntur Medik', 'Ya', 1, 'whatsapp-image-2022-06-30-at-95557-am-1656557839.jpeg', '2022-07-05 19:58:27'),
(68, 44, 56, 'Prof. Dr. dr. Widjajalaksmi K, SpKFR(K), MSc', '195506071981032001', 'Ketua Program Studi Ilmu Kedokteran Fisik dan Rehabilitasi FKUI', 'Spesialis Ilmu Kedokteran Fisik dan Rehabilitasi', 'Ya', 1, 'ttd-prfwida-transparan-1712307182.jpg', '2024-04-05 01:53:02'),
(69, 48, 60, 'dr. Vivian Soetikno, Ph.D, Sp.FK', '197111092002122005', 'Ketua Departemen', 'Spesialis Farmakologi Klinik', 'Ya', 2, NULL, '2022-07-07 23:11:48'),
(70, 26, 38, 'Dr. dr. Diani Kartini, SpB, Subsp.Onk(K)', '197501242009122001', 'Ketua Departemen Klinik Ilmu Bedah', 'Spesialis Ilmu Bedah', 'Ya', 2, NULL, '2023-01-05 22:51:34'),
(71, 33, 45, 'Dr. dr. Windy Keumala Budianti, Sp.KK(K)', '197209072014122001', 'Ketua Program Studi', 'Spesialis Dermatologi dan Venereologi', 'Ya', 2, 'ttd-dr-windy-1657247021.png', '2022-07-07 19:23:41'),
(72, 20, 32, 'Dr. dr. Rita Mustika, MEpid', '011003022', 'Ketua Departemen', 'Magister Pendidikan Kedokteran', 'Ya', 2, 'e-sign-dr-rita-1665135455.jpeg', '2022-10-07 02:37:35'),
(73, 61, 73, 'Prof. Dr. dr. Dadang Makmun, SpPD-KGEH', '195911191985121001', 'Ketua Departemen Klinik', 'Subspesialis Ilmu Penyakit Dalam', 'Ya', 2, NULL, '2024-04-04 21:19:46'),
(74, 37, 49, 'Dr. dr. Reyhan Eddy Yunus, Sp.Rad., Subsp.NKL (K), M.Sc', '100120910221215891', 'Ketua Departemen', 'Spesialis Radiologi', 'Ya', 1, NULL, '2024-10-03 19:53:27'),
(75, 53, 65, 'dr. Nurul Ratna Mutu Manikam, M.Gizi, SpGK (K)', '100220710252509791', 'Ketua Departemen Ilmu Gizi FKUI-RSCM', 'Spesialis Ilmu Gizi Klinik', 'Ya', 1, NULL, '2022-06-29 19:59:44'),
(76, 18, 30, 'dr. Nurul Ratna Mutu Manikam, M.Gizi, SpGK(K)', '100220710252509791', 'Ketua Departemen Ilmu Gizi FKUI-RSCM', 'Magister Ilmu Gizi', 'Ya', 1, NULL, '2022-06-29 19:59:46'),
(77, 20, 32, 'dr. Diantha Soemantri, MMedEd, PhD', '198110152008122002', 'Ketua Program Studi', 'Magister Pendidikan Kedokteran', 'Ya', 1, 'e-sign-dr-diantha-1665135473.jpeg', '2022-10-07 02:37:53'),
(79, 53, 65, 'Dr. dr. Diana Sunardi, M.Gizi, SpGK (K)', '100240310291219691', 'Ketua Program Studi', 'Spesialis Ilmu Gizi Klinik', 'Ya', 2, NULL, '2022-06-29 20:00:55'),
(80, 18, 30, 'Dr. dr. Dian Novita Chandra, M.Gizi', '100240310261116791', 'Ketua Program Studi', 'Magister Ilmu Gizi', 'Ya', 2, NULL, '2022-06-29 20:24:04'),
(81, 60, 72, 'Dr. dr. Suskhan Djusad, SpOG(K)', '196304101989031006', 'Ketua Departemen', 'Subspesialis Obstetri dan Ginekologi', 'Ya', 1, NULL, '2022-06-29 20:06:12'),
(82, 41, 53, 'dr. Wildan Latief, Sp.OT(K)', '198507132018011001', 'Ketua Departemen', 'Spesialis Orthopaedi dan Traumatologi', 'Ya', 2, 'ttd-dr-wildan-latief-1735615936.png', '2024-12-30 20:32:16'),
(83, 56, 68, 'Dr. dr. Retno Asti Werdhani, M.Epid, Sp.KKLP.', '197508252008122001', 'Ketua Departemen Ilmu Kedokteran Komunitas', 'Spesialis Kedokteran Keluarga Layanan Primer', 'Ya', 1, 'whatsapp-image-2023-07-07-at-143907-1688715561.jpeg', '2023-07-07 00:39:21'),
(84, 29, 41, 'Dr. dr. Suskhan Djusad, SpOG(K)', '196304101989031006', 'Ketua Departemen', 'Spesialis Obstetri dan Ginekologi', 'Ya', 2, NULL, '2022-07-08 00:00:02'),
(86, 38, 50, 'Dr. dr. Ade Firmansyah Sugiharto, Sp.F.M, Subsp.F.K(K)', '198108272010121002', 'Ketua Departemen Ilmu Kedokteran Forensik dan Medikolegal', 'Spesialis Kedokteran Forensik dan Medikolegal', 'Ya', 2, NULL, '2023-04-03 07:16:34'),
(90, 3, 15, 'dr. Irzan Nurman, MSc., EPC., FINEM', '110903110', 'Wakil Kepala Bisnis dan Pengembangan UKK Pusbangki', 'UKK PPM PUSBANGKI', 'Ya', 3, NULL, '2023-12-16 01:04:33'),
(91, 89, 102, 'dr. Mohammad Kurniawan SpS(K), MSc, FICA', '197902082009121002', 'Ketua Departemen', 'Departemen Neurologi', 'Ya', 1, 'ttd-dr-mk-1665152456.png', '2022-10-07 07:20:56'),
(92, 89, 102, 'dr. Taufik Mesiano SpS(K)', '197905012014121002', 'Koordinator Administrasi Keuangan', 'Departemen Neurologi', 'Ya', 2, 'ttd-dr-omy-1665152468.png', '2023-08-06 21:12:45'),
(95, 30, 42, 'dr. Rakhmad Hidayat, SpS(), MARS', '198101112012121002', 'Ketua Program Studi', 'Spesialis Neurologi', 'Ya', 2, 'ttd-dr-dayat-1665152840.png', '2022-10-07 07:27:20'),
(98, 90, 103, 'Dr. dr. Suskhan, SpOG(K)', '196304101989031006', 'Kepala Departemen', 'Departemen Obstetri dan Ginekologi', 'Ya', 1, NULL, '2022-06-29 23:38:09'),
(100, 71, 84, 'Dr. dr. Retno Asti Werdhani, M.Epid., Sp.KKLP', '197508252008122001', 'Ketua Departemen', 'Departemen Ilmu Kedokteran Komunitas', 'Ya', 1, NULL, '2022-06-29 23:56:28'),
(101, 71, 84, 'drg. Agus Sugiharto, M.A.R.S', '010603162', 'Koordinator Administrasi Keuangan Departemen', 'Departemen Ilmu Kedokteran Komunitas', 'Tidak', 2, NULL, '2022-07-06 01:21:14'),
(102, 79, 92, 'Dr.dr.Setyo Widi Nugroho, Sp.BS(K)', '196209291996031001', 'Ketua Departemen Ilmu Bedah Saraf', 'Departemen Bedah Saraf', 'Ya', 1, NULL, '2022-06-29 23:52:27'),
(103, 72, 85, 'Dr. Fadilah, M.Si', '141103007', 'Ketua Departemen Kimia Kedokteran', 'Departemen Kimia Kedokteran', 'Ya', 1, NULL, '2022-06-29 23:41:26'),
(104, 66, 79, 'Dr. dr. Silvia Werdhy Lestari, M.Biomed., Sp.And.', '197612022009122002', 'Ketua Departemen', 'Departemen Biologi', 'Ya', 1, NULL, '2022-06-29 23:41:50'),
(105, 71, 84, 'dr. Dian Kusumadewi, M.Gizi, Sp.KKLP', '010603160', 'Koordinator Pendidikan Departemen', 'Departemen Ilmu Kedokteran Komunitas', 'Tidak', 3, NULL, '2022-07-06 01:21:26'),
(106, 91, 104, 'dr. Wildan Latief, Sp.OT(K)', '198507132018011001', 'Ketua Departemen', 'Departemen Orthopaedi dan Traumatologi', 'Ya', 1, 'ttd-dr-wildan-latief-1735617853.png', '2024-12-30 21:04:13'),
(108, 30, 42, 'dr. Mohammad Kurniawan, SpS(K), M.Sc, FICA', '197902082009121002', 'Kepala Departemen Klinik', 'Spesialis Neurologi', 'Ya', 1, 'ttd-dr-mk-1665153063.png', '2022-10-07 07:31:03'),
(110, 67, 80, 'dr. Vivian Soetikno, Sp.FK, Ph.D', '197111092002122005', 'Ketua', 'Departemen Farmakologi dan Terapeutik', 'Ya', 1, NULL, '2022-06-30 00:15:59'),
(111, 76, 89, 'Dr.dr. Andi Ade Wijaya Ramlan, Sp.An-KAP', '197109282000032001', 'Ketua Departemen', 'Departemen Anestesiologi dan Intensive Care', 'Ya', 1, NULL, '2022-06-29 23:44:33'),
(112, 95, 108, 'Dr. dr. Irfan Wahyudi, SpU(K)', '197107152000031001', 'Ketua Departemen', 'Departemen Urologi', 'Ya', 1, NULL, '2022-06-29 23:45:19'),
(113, 87, 100, 'dr. Bambang Widyantoro,PhD, SpJP(K)', '197710082023093001', 'Ketua Departemen', 'Departemen Kardiologi dan Kedokteran Vaskuler', 'Ya', 1, 'ttd-bwijpeg-1720169830.jpg', '2024-07-05 01:57:10'),
(114, 71, 84, 'dr. Dewi Friska, MKK, Sp.KKLP', '197804132009122002', 'Koordinator Penelitian dan Pengabdian Masyarakat', 'Departemen Ilmu Kedokteran Komunitas', 'Tidak', 4, NULL, '2022-07-06 01:21:35'),
(116, 97, 110, 'Sopiyan, S.E., M.A.', '100140310270403891', 'Koordinator', 'Keselamatan, Kesehatan Kerja, dan Lingkungan (K3L)', 'Ya', 1, NULL, '2024-03-31 18:59:26'),
(117, 71, 84, 'Rensa Aimeri, S.E', '012125004', 'PIC/Admin SIKONJA', 'Departemen Ilmu Kedokteran Komunitas', 'Tidak', 5, NULL, '2022-07-06 01:21:41'),
(118, 80, 93, 'dr. Nurul Ratna Mutu Manikam, M.Gizi, Sp.GK(K)', '100220710252509791', 'Ketua Departemen Ilmu Gizi', 'Departemen Ilmu Gizi', 'Ya', 1, NULL, '2022-06-29 23:57:56'),
(119, 13, 25, 'Budi Santoso, S.Kom', '197209051999031005', 'Koordinator Pengadaan Barang/Jasa', 'Pengadaan Barang', 'Ya', 1, NULL, '2022-06-30 00:15:15'),
(121, 85, 98, 'dr. Ika Dewi Mayangsari, Sp.T.H.T.B.K.L, Subsp.Onk(K)', '196812142014122001', 'Ketua Departemen', 'Departemen Telinga Hidung Tenggorok (THT) KL', 'Ya', 1, NULL, '2023-03-28 19:31:21'),
(123, 73, 86, 'Dr.dr. Anna Rozaliyani,M.Biomed, Sp.P(K)', '1972110320081220001', 'Ketua Departemen', 'Departemen Parasitologi', 'Ya', 1, NULL, '2022-07-05 18:27:53'),
(124, 68, 81, 'Dr. dr. Adisti Dwijayanti, M.Biomed', '198403072009122005', 'Ketua Departemen', 'Departemen Farmasi Kedokteran', 'Ya', 1, NULL, '2022-06-29 23:54:28'),
(125, 82, 95, 'Dr. dr. Ade Firmansyah Sugiharto, Sp.F.M(K)', '198108272010121002', 'Ketua Departemen', 'Departemen Ilmu Kedokteran Forensik dan Medikolegal', 'Ya', 1, NULL, '2022-06-29 23:54:29'),
(126, 88, 101, 'dr. Yulia Rosa Saharman, PhD, SpMK(K)', '197007181998022001', 'Ketua Departemen', 'Departemen Mikrobiologi Klinik', 'Ya', 1, NULL, '2022-06-29 23:54:29'),
(127, 10, 22, 'Mira Hartiningsih, S.Kom.', '010713021', 'Koordinator Sumber Daya Manusia', 'Sumber Daya Manusia', 'Ya', 1, 'poc-1678767374.png', '2025-01-05 20:39:26'),
(128, 64, 77, 'Sasanthy kusumaningtyas', '0108050363', 'ketua Departemen', 'Departemen Anatomi', 'Ya', 1, 'foto-santhy-1664436730.jpg', '2022-09-29 00:32:10'),
(129, 94, 107, 'dr. Reyhan Eddy Yunus, Sp.Rad, MSc', '100120910221215891', 'Ketua Departemen', 'Departemen Radiologi', 'Ya', 1, 'ttd-dr-reyhan-1657166078.png', '2022-07-06 20:54:38'),
(131, 69, 82, 'Prof. Dr. dr. Neng Tine Kartinah, M.Kes, AIFO', '197209032001122001', 'Ketua Departemen', 'Departemen Fisiologi dan Biofisika', 'Ya', 1, 'ttd-nt-1657296731.png', '2022-07-08 09:12:11'),
(132, 77, 90, 'Dr. dr. Windy Keumala Budianti, SpDVE, Subsp. D.A.I', '197209072014122001', 'Ketua Departemen', 'Departemen Dermatologi dan Venereologi', 'Ya', 1, 'avatarphp-1719512615.png', '2024-12-18 22:01:22'),
(134, 15, 27, 'Prof. Dr. dr. Imam Subekti, SpPD-KEMD', '195806221984031003', 'Ketua', 'Unit Penjaminan Mutu Akademik', 'Ya', 1, NULL, '2022-06-30 00:21:32'),
(135, 75, 88, 'Dr. dr. Rita Mustika, M.Epid', '011003022', 'Ketua Departemen', 'Departemen Pendidikan Kedokteran', 'Ya', 1, NULL, '2022-06-29 23:54:39'),
(136, 84, 97, 'dr Ari Djatikusumo, SpM (K)', '196912122009121002', 'Ketua Departemen', 'Departemen Ilmu Kesehatan Mata', 'Ya', 1, NULL, '2022-06-29 23:54:41'),
(137, 65, 78, 'Dr.dr. Febriana Catur Iswanti, M.Biomed', '10024031029020971', 'Ketua Departemen', 'Departemen Biokimia dan Biologi Molekuler', 'Ya', 1, NULL, '2022-06-29 23:54:42'),
(138, 4, 16, 'Dr. Drs. Heri Wibowo, M. Biomed', '0100400024', 'Ketua', 'UKK PPM  Laboratorium Terpadu', 'Ya', 1, NULL, '2022-06-29 23:54:48'),
(139, 8, 20, 'dr. Tommy Dharmawan, Sp.BTKV, Ph.D', '198312062021113001', 'Koordinator Alumni dan CDC', 'Hubungan Alumni dan CDC', 'Ya', 1, NULL, '2022-06-29 23:54:50'),
(140, 14, 26, 'Dr. dr. Anggi Gayatri, Sp.FK', '100240310201504891', 'Koordinator Kemahasiswaan', 'Kemahasiswaan', 'Ya', 1, NULL, '2022-06-29 23:55:34'),
(141, 6, 18, 'Prof. dr. Ardi Findyartini, PhD.', '197710272009122002', 'Ketua', 'Medical Education Unit', 'Ya', 1, NULL, '2023-01-24 19:37:46'),
(142, 63, 75, 'dr. Wildan Latief, Sp.OT(K)', '198507132018011001', 'Plt Ketua Departemen', 'Subspesialis Orthopaedi dan Traumatologi', 'Ya', 2, NULL, '2023-07-06 18:54:29'),
(143, 63, 75, 'Prof. Dr.dr. Achmad Fauzi Kamal, Sp.OT(K)', '0107050252', 'Ketua Program Studi Subspesialis', 'Subspesialis Orthopaedi dan Traumatologi', 'Ya', 1, NULL, '2022-07-04 20:37:30'),
(144, 80, 93, 'dr. Diyah Eka Andayani,MGizi,SpGK(K)', '197709092022212001', 'Koordinator Administrasi dan Keuangan', 'Departemen Ilmu Gizi', 'Ya', 2, NULL, '2022-06-30 23:45:49'),
(145, 80, 93, 'dr. Wiji Lestari, MGizi,SpGK(K)', '198305232018032001', 'Koordinator Pendidikan S1', 'Departemen Ilmu Gizi', 'Ya', 3, NULL, '2022-06-30 23:49:50'),
(146, 80, 93, 'Dr.dr. Diana Sunardi, MGizi, SpGK(K)', '100240310291219691', 'Koordinator Penelitian dan Pengembangan', 'Departemen Ilmu Gizi', 'Ya', 4, NULL, '2022-06-30 23:54:30'),
(147, 81, 94, 'Dr. dr. Kristiana Siste, SpKJ(K)', '197512252014122001', 'Kepala Departemen', 'Departemen Ilmu Kesehatan Jiwa', 'Ya', 1, 'esign-drdr-kristiana-siste-spkjk-1657291600.png', '2022-07-08 07:46:40'),
(148, 39, 51, 'Dr. dr. Lisnawati, SpPA (K)', '19670510 199203 2 003', 'Ketua Departemen PA', 'Spesialis Patologi Anatomik', 'Ya', 2, NULL, '2022-07-08 07:25:40'),
(149, 39, 51, 'Dr. dr. Diah Rini Handjari, SpPA (K)', '010 705 0184', 'Ketua Program Studi', 'Spesialis Patologi Anatomik', 'Ya', 1, NULL, '2022-07-08 07:25:49'),
(150, 74, 87, 'Dr. dr. Lisnawati, Sp.PA(K)', '196705101992032003', 'Ketua Departemen', 'Departemen Patologi Anatomik', 'Ya', 1, NULL, '2022-07-01 00:57:44'),
(151, 45, 57, 'dr. Prasetyanugraheni Kreshanti, SpBP-RE(KKF)', '197512172015032001', 'Ketua Program Studi', 'Spesialis Ilmu Bedah Plastik Rekonstruksi dan Estetik', 'Ya', 2, 'hnijpg-1657247288.jpg', '2022-07-07 19:28:08'),
(152, 45, 57, 'Dr. dr. Diani Kartini, SpB(K)Onk', '197501242009122001', 'Ketua Depatemen Ilmu Bedah', 'Spesialis Ilmu Bedah Plastik Rekonstruksi dan Estetik', 'Ya', 1, 'esign-kadeptjpg-1657247303.PNG', '2022-07-07 19:28:23'),
(153, 62, 74, 'Dr. dr. Kristiana Siste, SpKJ(K)', '197512252014122001', 'Kepala Departemen', 'Subspesialis Ilmu Kedokteran Jiwa', 'Ya', 1, NULL, '2022-07-03 23:59:54'),
(154, 22, 34, 'Prof. Dr. dr. Aryono Hendarto, Sp.A(K), MPH', '196004291985121001', 'Ketua Program Studi', 'Doktor Ilmu Gizi', 'Ya', 1, 'ttd-prof-1657176711.jpg', '2022-07-06 23:51:51'),
(157, 27, 39, 'Prof. Dr. dr. Dadang Makmun, SpPD, K-GEH', '195911191985121001', 'Ketua Departemen', 'Spesialis Ilmu Penyakit Dalam', 'Ya', 2, NULL, '2022-07-07 23:11:56'),
(158, 9, 21, 'Zhafirah Salsabila, MKM, CRMP', '199410172022074001', 'Penanggung Jawab', 'Transformasi, Manajemen Risiko, dan Monitoring Evaluasi (TREM)', 'Ya', 1, 'ttd-1679382261.jpg', '2024-01-04 19:43:45'),
(159, 37, 49, 'dr. Damayanti Sekarsari, Sp.Rad., Subsp. RA (K), M.Pd.Ked', '197004072014122002', 'Ketua Program Studi', 'Spesialis Radiologi', 'Ya', 2, NULL, '2024-04-03 19:09:25'),
(160, 92, 105, 'Dr. dr. Dewi Wulandari, SpPK(K), MSc', '197009051997022002', 'Ketua Departemen', 'Departemen Patologi Klinik', 'Ya', 1, NULL, '2023-03-29 08:12:10'),
(161, 78, 91, 'Dr. dr. Diani Kartini, Sp.B(K)-Onk', '197501242009122001', 'Ketua Departemen', 'Departemen Ilmu Bedah', 'Ya', 1, NULL, '2022-07-05 18:52:30'),
(162, 35, 47, 'dr. Suko Adiarto, PhD, SpJP(K)', '1973031920091210001', 'KPS', 'Spesialis Ilmu Penyakit Jantung dan Pembuluh Darah', 'Ya', 1, NULL, '2022-07-05 23:44:09'),
(163, 86, 99, 'Prof. Dr. dr. Dadang Makmun, SpPD, K-GEH', '195911191985121001', 'Ketua Departemen', 'Departemen Ilmu Penyakit Dalam', 'Ya', 1, 'ttd-prof-dadang-1657171007.jpg', '2022-07-06 22:16:47'),
(164, 93, 106, 'dr. Prasenohadi, Sp.P(K), Ph.D, KIC', '196503191995031002', 'Ketua Departemen', 'Departemen Pulmonologi dan Kedokteran Respirasi', 'Ya', 1, 'scan-tdt-kadep-1657268361.jpeg', '2022-07-08 01:19:21'),
(165, 36, 48, 'dr. Prasenohadi, PhD, SpP(K), KIC', '196503191995031002', 'Ketua Departemen', 'Spesialis Pulmonologi dan Ilmu Kedokteran Respirasi', 'Ya', 1, 'phd-1657183544.jpeg', '2022-07-07 01:45:44'),
(166, 57, 69, 'dr. R. Besthadi Sukmono,Sp.An-KAR', '1982207252014121002', 'Ketua Program Studi', 'Subspesialis Anestesiologi dan Terapi Intensif', 'Ya', 1, 'dr-sukmono-1657184467.jpg', '2022-07-07 02:01:07'),
(167, 31, 43, 'DR. Dr. K Siste K, Sp.KJ(K)', '19751225 201412 2 001', 'Ketua Departemen', 'Spesialis Ilmu Kedokteran Jiwa', 'Ya', 1, 'kristiana-siste-kurniasanti-1657251398.jpg', '2022-07-07 20:36:38'),
(168, 7, 19, 'Rohana Ceria Siahaan', '100240310212708891', 'Koordinator Kelembagaan, Protokoler & Kesekretariatan', 'Kelembagaan, Protokoler & Kesekretariatan', 'Ya', 1, NULL, '2022-07-08 08:51:55'),
(169, 11, 23, 'Annisa Harikin Priwiendari, S.Kom', '010713004', 'Koordinator Anggaran', 'Anggaran', 'Ya', 1, NULL, '2022-10-06 18:41:22'),
(170, 70, 83, 'dr. Dewi Sukmawati, M.Kes., Ph.D', '197506172009122002', 'Ketua Departemen', 'Departemen Histologi', 'Ya', 1, NULL, '2022-10-07 00:57:33'),
(171, 0, 76, 'Prof. Dr. dr. Ari Fahrial Syam, SpPD-KGEH., MMB', '196606191997011001', 'Dekan', 'Fakultas Kedokteran Universitas Indonesia', 'Ya', 1, NULL, '2023-01-04 22:18:57'),
(172, 19, 31, 'Dr. dr. Retno Asti Werdhani, MEpid, SpKKLP', '197508252008122001', 'Ketua Departemen', 'Magister Kedokteran Kerja', 'Ya', 2, 'dr-asti-1672972398.png', '2023-01-05 19:33:18'),
(173, 17, 29, 'Prof. dr. Wawaimuli Arozal, M.Biomed., Ph.D.', '197006191998021003', 'Ketua Program Studi', 'Magister Ilmu Biomedik', 'Ya', 1, 'ttd-prof-muli-new-1679627540.png', '2023-03-23 20:12:20'),
(174, 104, 118, 'Indah Susanti, S.Hum, M.M', '010713015', 'Koordinator', 'International Relations Office (IRO)', 'Ya', 1, 'ttd-mba-indah-1679988039.jpg', '2023-03-28 00:20:39'),
(176, 3, 15, 'Prof. Dr. dr. Rini Sekartini, SpA(K)', '196506021991012001', 'Plt. Wakil Kepala UKK Pusbangki Bidang Operasional', 'UKK PPM PUSBANGKI', 'Ya', 2, NULL, '2023-12-16 01:04:21'),
(177, 29, 41, 'Dr. dr. Achmad Kemal Harzif, Sp.O.G, Subsp.F.E.R', '100140310281608791', 'Ketua Program Studi', 'Spesialis Obstetri dan Ginekologi', 'Ya', 1, NULL, '2024-01-07 23:02:55'),
(178, 28, 40, 'Dr. dr. Titis Prawitasari, Sp.A(K)', '197111072000032001', 'Ketua Program Studi', 'Spesialis Ilmu Kesehatan Anak', 'Ya', 1, NULL, '2023-03-30 18:17:06'),
(179, 105, 1, 'Reta Purwaningrum, SE', '197810072014092002', 'Koordinator Keuangan dan Akuntansi', 'Keuangan dan Akuntansi', 'Ya', 1, 'anuphp-1683197175.jpg', '2023-05-04 03:46:15'),
(180, 83, 96, 'dr. Fatima Safira Alatas, Sp.A(K), PhD', '19720927 200912 2 001', 'Ketua Departemen', 'Departemen Ilmu Kesehatan Anak', 'Ya', 1, 'ttd-dr-safira-1-001-1680747123.png', '2023-04-10 00:42:42'),
(181, 111, 11, 'Dr. dr. Syarifah Dewi, MBiomed', '198001242009122001', 'Koordinator Program S2 dan S3', 'Program Magister dan Doktor', 'Ya', 1, 'ttd-sd-1687846535.jpeg', '2024-03-30 23:50:45'),
(182, 106, 11, 'Agus Utomo, ST, MPd', '197604122000031001', 'Koordinator Pendidikan Program Spesialis dan Subspesialis', 'Pendidikan Spesialis dan Subspesialis', 'Ya', 1, 'ttd-agus-1695799764.jpeg', '2024-03-30 23:51:07'),
(183, 3, 15, 'Dr. dr. Riyadh Firdaus, Sp.AN-KNA', '197706112009121003', 'Kepala UKK Pusbangki', 'UKK PPM PUSBANGKI', 'Ya', 1, NULL, '2024-01-04 23:52:32'),
(184, 96, 109, 'dr. Rizky Kusuma Wardhani, SpKFR-K', '198004082006042028', 'Kepala Departemen Ilmu Kedokteran Fisik & Rehabilitasi', 'Departemen Ilmu Kedokteran Fisik dan Rehabilitasi', 'Ya', 1, 'ttd-dokkyblue-1704445256.jpg', '2024-01-05 02:00:56'),
(185, 44, 56, 'dr. Rizky Kusuma W.,SpKFR(K)', '198904082006042028', 'Ketua Departemen Ilmu Kedokteran Fisik dan Rehabilitasi FKUI', 'Spesialis Ilmu Kedokteran Fisik dan Rehabilitasi', 'Ya', 1, '2024-01-05-09-57-19-page-0001-1704698057.jpg', '2024-01-08 00:34:08');

-- --------------------------------------------------------

--
-- Table structure for table `perkembangan`
--

CREATE TABLE `perkembangan` (
  `id_perkembangan` int NOT NULL,
  `id_user` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `kode_perkembangan` varchar(32) NOT NULL,
  `nama_perkembangan` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int DEFAULT NULL,
  `status_perkembangan` varchar(30) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `perkembangan`
--

INSERT INTO `perkembangan` (`id_perkembangan`, `id_user`, `updated_by`, `kode_perkembangan`, `nama_perkembangan`, `keterangan`, `urutan`, `status_perkembangan`, `gambar`, `tanggal_update`) VALUES
(1, 1, 1, 'ASLI', 'Dokumen Asli', NULL, 1, 'Aktif', NULL, '2026-03-14 12:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `poksi`
--

CREATE TABLE `poksi` (
  `id_poksi` int NOT NULL,
  `id_user` int NOT NULL,
  `kode_poksi` varchar(255) NOT NULL,
  `nama_poksi` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int DEFAULT NULL,
  `status_poksi` enum('Aktif','Non Aktif') DEFAULT 'Aktif',
  `gambar` varchar(255) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `poksi`
--

INSERT INTO `poksi` (`id_poksi`, `id_user`, `kode_poksi`, `nama_poksi`, `keterangan`, `urutan`, `status_poksi`, `gambar`, `updated_by`, `tanggal`) VALUES
(106, 1, '001', 'Program PP', NULL, 1, 'Aktif', NULL, NULL, '2026-06-09 18:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `sub_jenis_dokumen`
--

CREATE TABLE `sub_jenis_dokumen` (
  `id_sub_jenis_dokumen` int NOT NULL,
  `id_jenis_dokumen` int DEFAULT NULL,
  `id_user` int NOT NULL,
  `updated_by` int DEFAULT NULL,
  `kode_sub_jenis_dokumen` varchar(32) NOT NULL,
  `nama_sub_jenis_dokumen` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int DEFAULT NULL,
  `status_sub_jenis_dokumen` varchar(30) NOT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `sub_jenis_dokumen`
--

INSERT INTO `sub_jenis_dokumen` (`id_sub_jenis_dokumen`, `id_jenis_dokumen`, `id_user`, `updated_by`, `kode_sub_jenis_dokumen`, `nama_sub_jenis_dokumen`, `keterangan`, `urutan`, `status_sub_jenis_dokumen`, `gambar`, `updated_at`, `tanggal_update`) VALUES
(1, 1, 1, NULL, '001', 'Struk Gaji Pegawai', 'Data Informasi Gaji Pegawai', 1, 'Aktif', NULL, '2026-03-13 19:45:37', '2026-03-13 12:45:37'),
(2, 2, 1, 1, '002', 'SK PNS', 'Surat Keputusan Pengkatan Pegawai Negeri Sipil', 2, 'Aktif', NULL, '2026-03-13 19:45:14', '2026-03-13 12:45:14'),
(3, 1, 1, NULL, '003', 'Uji Coba', NULL, 3, 'Aktif', NULL, NULL, '2026-03-14 16:48:05'),
(4, 2, 1, NULL, '004', 'SK Gaji', NULL, 3, 'Aktif', NULL, NULL, '2026-03-14 12:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `id_sub_menu` int NOT NULL,
  `id_menu` int NOT NULL,
  `id_user` int NOT NULL,
  `nama_sub_menu` varchar(255) NOT NULL,
  `alamat_sub_menu` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int NOT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Table structure for table `unit_kerja`
--

CREATE TABLE `unit_kerja` (
  `id_unit_kerja` int NOT NULL,
  `id_poksi` int DEFAULT NULL,
  `id_user` int NOT NULL,
  `kode_unit_kerja` varchar(255) NOT NULL,
  `nama_unit_kerja` varchar(255) NOT NULL,
  `keterangan` text,
  `urutan` int DEFAULT NULL,
  `status_unit_kerja` enum('Aktif','Non Aktif') DEFAULT 'Aktif',
  `gambar` varchar(255) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tanggal` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `unit_kerja`
--

INSERT INTO `unit_kerja` (`id_unit_kerja`, `id_poksi`, `id_user`, `kode_unit_kerja`, `nama_unit_kerja`, `keterangan`, `urutan`, `status_unit_kerja`, `gambar`, `updated_by`, `updated_at`, `tanggal`) VALUES
(2, NULL, 1, '001', 'UKK PI IMERI', 'UKK', 1, 'Aktif', '', 1, NULL, '2022-06-13 14:07:05'),
(3, NULL, 1, '002', 'UKK PPM PUSBANGKI', 'UKK', 2, 'Aktif', NULL, 1, NULL, '2022-06-13 14:07:12'),
(4, NULL, 1, '003', 'UKK PPM  Laboratorium Terpadu', 'UKK', 3, 'Aktif', NULL, 1, NULL, '2022-06-13 14:07:22'),
(5, NULL, 1, '004', 'UKK  PPM Laboratorium Mikrobiologi Klinik', 'UKK', 4, 'Aktif', NULL, 9, NULL, '2022-06-13 14:13:02'),
(6, NULL, 76, '005', 'Medical Education Unit (MEU)', 'Unit', 5, 'Aktif', NULL, 76, NULL, '2023-03-13 12:54:12'),
(7, NULL, 1, '006', 'Kelembagaan, Protokoler & Kesekretariatan', 'Unit', 6, 'Aktif', NULL, 1, NULL, '2022-06-13 14:13:50'),
(8, NULL, 1, '007', 'Hubungan Alumni dan CDC', 'Unit', 7, 'Aktif', NULL, 1, NULL, '2022-06-13 14:13:44'),
(9, NULL, 12, '008', 'Transformasi, Manajemen Risiko, dan Monitoring Evaluasi (TREM)', 'Unit', 8, NULL, NULL, 1, NULL, '2023-03-23 12:30:10'),
(10, NULL, 1, '009', 'Sumber Daya Manusia', 'Unit', 9, 'Aktif', NULL, 1, NULL, '2022-06-13 14:13:29'),
(11, NULL, 1, '010', 'Anggaran', 'Unit', 10, 'Aktif', 'a-1670225488.jpg', 76, NULL, '2023-03-13 12:52:19'),
(12, NULL, 1, '011', 'Umum dan Fasilitas', 'Unit', 11, 'Aktif', NULL, 1, NULL, '2022-06-13 14:13:16'),
(13, NULL, 1, '012', 'Pengadaan Barang', 'Unit', 12, 'Aktif', NULL, 1, NULL, '2022-06-13 14:13:08'),
(14, NULL, 1, '013', 'Kemahasiswaan', 'Unit', 13, 'Aktif', NULL, 1, NULL, '2022-06-13 14:13:01'),
(15, NULL, 76, '014', 'Unit Penjaminan Mutu Akademik (UPMA)', 'Unit', 15, 'Aktif', NULL, 76, NULL, '2023-03-13 12:54:24'),
(16, NULL, 1, '015', 'E- Learning', 'Unit', 15, 'Aktif', NULL, 1, NULL, '2022-06-13 14:12:49'),
(17, NULL, 1, '016', 'Magister Ilmu Biomedik', 'S2', 16, 'Aktif', NULL, 1, NULL, '2022-06-13 14:12:43'),
(18, NULL, 30, '017', 'Magister Ilmu Gizi', 'S2', 17, 'Aktif', 'logo-fkui-landscape-hitam-english-1664855733.png', 1, NULL, '2022-10-04 10:55:34'),
(19, NULL, 31, '018', 'Magister Kedokteran Kerja', 'S2', 18, 'Aktif', 'makara-ui-full-1664767934.png', 1, NULL, '2022-10-03 10:32:14'),
(20, NULL, 1, '019', 'Magister Pendidikan Kedokteran', 'S2', 19, 'Aktif', NULL, 1, NULL, '2022-06-13 14:12:18'),
(21, NULL, 1, '020', 'Doktor Ilmu Kedokteran', 'S3', 20, 'Aktif', NULL, 1, NULL, '2022-06-13 14:12:12'),
(22, NULL, 1, '021', 'Doktor Ilmu Gizi', 'S3', 21, 'Aktif', NULL, 1, NULL, '2022-06-13 14:12:03'),
(23, NULL, 1, '022', 'Doktor Ilmu Biomedik', 'S3', 22, 'Aktif', 'conservation-1648089635.png', 1, NULL, '2022-06-13 14:11:55'),
(24, NULL, 1, '023', 'Sarjana dan Profesi Dokter', 'S1', 23, 'Aktif', NULL, 1, NULL, '2022-06-13 14:11:37'),
(25, NULL, 1, '024', 'Spesialis Anestesiologi', 'Sp1', 24, 'Aktif', NULL, 1, NULL, '2022-06-13 14:11:31'),
(26, NULL, 1, '025', 'Spesialis Ilmu Bedah', 'Sp1', 25, 'Aktif', NULL, 1, NULL, '2022-06-13 14:11:26'),
(27, NULL, 1, '026', 'Spesialis Ilmu Penyakit Dalam', 'Sp1', 26, 'Aktif', NULL, 1, NULL, '2022-06-13 14:10:04'),
(28, NULL, 1, '027', 'Spesialis Ilmu Kesehatan Anak', 'Sp1', 27, 'Aktif', NULL, 1, NULL, '2022-06-13 14:09:59'),
(29, NULL, 1, '028', 'Spesialis Obstetri dan Ginekologi', 'Sp1', 28, 'Aktif', NULL, 1, NULL, '2022-06-13 14:09:54'),
(30, NULL, 1, '029', 'Spesialis Neurologi', 'Sp1', 29, 'Aktif', NULL, 1, NULL, '2022-06-13 14:09:48'),
(31, NULL, 1, '030', 'Spesialis Ilmu Kedokteran Jiwa', 'Sp1', 30, 'Aktif', NULL, 1, NULL, '2022-06-13 14:09:42'),
(32, NULL, 1, '031', 'Spesialis Ilmu Kesehatan Mata', 'Sp1', 31, 'Aktif', NULL, 1, NULL, '2022-06-13 14:09:05'),
(33, NULL, 1, '032', 'Spesialis Dermatologi dan Venereologi', 'Sp1', 32, 'Aktif', NULL, 1, NULL, '2022-06-13 14:07:29'),
(34, NULL, 1, '033', 'Spesialis Kesehatan Telinga Hidung Tenggorok, Kepala Leher', 'Sp1', 33, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:59'),
(35, NULL, 1, '034', 'Spesialis Ilmu Penyakit Jantung dan Pembuluh Darah', 'Sp1', 34, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:54'),
(36, NULL, 1, '035', 'Spesialis Pulmonologi dan Ilmu Kedokteran Respirasi', 'Sp1', 35, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:49'),
(37, NULL, 1, '036', 'Spesialis Radiologi', 'Sp1', 36, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:43'),
(38, NULL, 1, '037', 'Spesialis Kedokteran Forensik dan Medikolegal', 'Sp1', 37, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:38'),
(39, NULL, 1, '038', 'Spesialis Patologi Anatomik', 'Sp1', 38, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:33'),
(40, NULL, 1, '039', 'Spesialis Patologi Klinik', 'Sp1', 39, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:28'),
(41, NULL, 1, '040', 'Spesialis Orthopaedi dan Traumatologi', 'Sp1', 40, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:23'),
(42, NULL, 1, '041', 'Spesialis Urologi', 'Sp1', 41, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:19'),
(43, NULL, 1, '042', 'Spesialis Ilmu Bedah Saraf', 'Sp1', 42, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:13'),
(44, NULL, 1, '043', 'Spesialis Ilmu Kedokteran Fisik dan Rehabilitasi', 'Sp1', 43, 'Aktif', NULL, 1, NULL, '2022-06-13 14:06:08'),
(45, NULL, 57, '044', 'Spesialis Ilmu Bedah Plastik Rekonstruksi dan Estetik', 'Sp1', 44, 'Aktif', 'logo-final-1664244109.png', 1, NULL, '2022-09-27 09:01:49'),
(46, NULL, 58, '045', 'Spesialis Ilmu Kedokteran Olahraga', 'Sp1', 45, 'Aktif', 'artboard-1-copy1-1672995134.png', 1, NULL, '2023-01-06 15:52:14'),
(47, NULL, 59, '046', 'Spesialis Mikrobiologi Klinik', 'Sp1', 46, 'Aktif', NULL, 1, NULL, '2023-01-05 12:51:54'),
(48, NULL, 1, '047', 'Spesialis Farmakologi Klinik', 'Sp1', 47, 'Aktif', NULL, 1, NULL, '2022-06-13 14:01:55'),
(49, NULL, 1, '048', 'Spesialis Kedokteran Okupasi', 'Sp1', 48, 'Aktif', NULL, 1, NULL, '2022-06-13 14:01:47'),
(50, NULL, 1, '049', 'Spesialis Bedah Toraks Kardiovaskular', 'Sp1', 49, 'Aktif', NULL, 1, NULL, '2022-06-13 14:01:43'),
(51, NULL, 1, '050', 'Spesialis Onkologi Radiasi', 'Sp1', 50, 'Aktif', NULL, 1, NULL, '2022-06-13 14:01:37'),
(52, NULL, 64, '051', 'Spesialis Kedokteran Penerbangan', 'Sp1', 51, 'Aktif', 'nyqnlpuj-400x400-1679968267.jpg', 1, NULL, '2023-03-28 08:51:07'),
(53, NULL, 1, '052', 'Spesialis Ilmu Gizi Klinik', 'Sp1', 52, 'Aktif', NULL, 1, NULL, '2022-06-13 14:00:06'),
(54, NULL, 1, '053', 'Spesialis Parasitologi Klinik', 'Sp1', 53, 'Aktif', NULL, 1, NULL, '2022-06-13 14:00:01'),
(55, NULL, 1, '054', 'Spesialis Akupuntur Medik', 'Sp1', 54, 'Aktif', NULL, 1, NULL, '2022-06-13 13:59:56'),
(56, NULL, 1, '055', 'Spesialis Kedokteran Keluarga Layanan Primer', 'Sp1', 55, 'Aktif', NULL, 1, NULL, '2022-06-13 13:59:52'),
(57, NULL, 1, '056', 'Subspesialis Anestesiologi dan Terapi Intensif', 'Sp2', 56, 'Aktif', NULL, 1, NULL, '2022-06-13 13:59:49'),
(58, NULL, 1, '057', 'Subspesialis Ilmu Bedah', 'Sp2', 57, 'Aktif', NULL, 1, NULL, '2022-06-13 13:59:45'),
(59, NULL, 1, '058', 'Subspesialis Ilmu Kesehatan Anak', 'Sp2', 58, 'Aktif', NULL, 1, NULL, '2022-06-13 13:59:41'),
(60, NULL, 1, '059', 'Subspesialis Obstetri dan Ginekologi', 'Sp2', 59, 'Aktif', NULL, 1, NULL, '2022-06-13 13:59:33'),
(61, NULL, 1, '060', 'Subspesialis Ilmu Penyakit Dalam', 'Sp2', 60, 'Aktif', NULL, 1, NULL, '2022-06-13 13:57:32'),
(62, NULL, 9, '061', 'Subspesialis Ilmu Kedokteran Jiwa', 'Sp2', 61, 'Aktif', 'makara-ui-fk1-1656659460.png', 12, NULL, '2023-03-14 14:05:19'),
(63, NULL, 1, '062', 'Subspesialis Orthopaedi dan Traumatologi', 'Sp2', 62, 'Aktif', NULL, 1, NULL, '2022-06-13 13:57:20'),
(64, NULL, 77, '063', 'Departemen Anatomi', 'Dept', 63, 'Aktif', '20161216-170158-1663214780.jpg', 1, NULL, '2022-09-15 11:06:20'),
(65, NULL, 1, '064', 'Departemen Biokimia dan Biologi Molekuler', 'Dept', 64, 'Aktif', NULL, 1, NULL, '2022-06-16 10:24:23'),
(66, NULL, 1, '065', 'Departemen Biologi', 'Dept', 65, 'Aktif', NULL, 1, NULL, '2022-06-16 10:24:17'),
(67, NULL, 80, '066', 'Departemen Farmakologi dan Terapeutik', 'Dept', 66, 'Aktif', 'whatsapp-image-2022-07-07-at-151725-1657181925.jpeg', 1, NULL, '2022-07-07 15:18:45'),
(68, NULL, 1, '067', 'Departemen Farmasi Kedokteran', 'Dept', 67, 'Aktif', NULL, 1, NULL, '2022-06-16 10:24:03'),
(69, NULL, 82, '068', 'Departemen Fisiologi dan Biofisika', 'Dept', 68, 'Aktif', 'makara-ui-fk-1659018648.png', 1, NULL, '2022-07-28 21:30:48'),
(70, NULL, 1, '069', 'Departemen Histologi', 'Dept', 69, 'Aktif', NULL, 1, NULL, '2022-06-16 10:23:50'),
(71, NULL, 76, '070', 'Departemen Ilmu Kedokteran Komunitas', 'Dept', 70, 'Aktif', 'images-4-1657001753.jpeg', 76, NULL, '2023-03-13 12:55:45'),
(72, NULL, 1, '071', 'Departemen Kimia Kedokteran', 'Dept', 71, 'Aktif', NULL, 1, NULL, '2022-06-16 10:23:37'),
(73, NULL, 1, '072', 'Departemen Parasitologi', 'Dept', 72, 'Aktif', NULL, 1, NULL, '2022-06-16 10:23:30'),
(74, NULL, 1, '073', 'Departemen Patologi Anatomik', 'Dept', 73, 'Aktif', NULL, 1, NULL, '2022-06-16 10:23:19'),
(75, NULL, 1, '074', 'Departemen Pendidikan Kedokteran', 'Dept', 74, 'Aktif', NULL, 1, NULL, '2022-06-16 10:23:12'),
(76, NULL, 1, '075', 'Departemen Anestesiologi dan Intensive Care', 'Dept', 75, 'Aktif', NULL, 1, NULL, '2022-06-16 10:23:05'),
(77, NULL, 1, '076', 'Departemen Dermatologi dan Venereologi', 'Dept', 76, 'Aktif', NULL, 1, NULL, '2022-06-16 10:22:58'),
(78, NULL, 1, '077', 'Departemen Ilmu Bedah', 'Dept', 77, 'Aktif', NULL, 1, NULL, '2022-06-16 10:22:52'),
(79, NULL, 1, '078', 'Departemen Bedah Saraf', 'Dept', 78, 'Aktif', NULL, 1, NULL, '2022-06-16 10:22:33'),
(80, NULL, 1, '079', 'Departemen Ilmu Gizi', 'Dept', 79, 'Aktif', NULL, 1, NULL, '2022-06-16 10:22:24'),
(81, NULL, 1, '080', 'Departemen Ilmu Kesehatan Jiwa', 'Dept', 80, 'Aktif', NULL, 1, NULL, '2022-06-16 10:20:31'),
(82, NULL, 1, '081', 'Departemen Ilmu Kedokteran Forensik dan Medikolegal', 'Dept', 81, 'Aktif', NULL, 1, NULL, '2022-06-16 10:20:23'),
(83, NULL, 1, '082', 'Departemen Ilmu Kesehatan Anak', 'Dept', 82, 'Aktif', NULL, 1, NULL, '2022-06-16 10:19:41'),
(84, NULL, 1, '083', 'Departemen Ilmu Kesehatan Mata', 'Dept', 83, 'Aktif', NULL, 1, NULL, '2022-06-16 10:19:27'),
(85, NULL, 12, '084', 'Departemen Telinga Hidung Tenggorok (THT) Bedah Kepala Leher (BKL)', 'Dept', 84, NULL, NULL, 1, NULL, '2024-03-21 13:11:02'),
(86, NULL, 1, '085', 'Departemen Ilmu Penyakit Dalam', 'Dept', 85, 'Aktif', NULL, 1, NULL, '2022-06-16 10:19:09'),
(87, NULL, 1, '086', 'Departemen Kardiologi dan Kedokteran Vaskuler', 'Dept', 86, 'Aktif', NULL, 1, NULL, '2022-06-16 10:19:02'),
(88, NULL, 1, '087', 'Departemen Mikrobiologi Klinik', 'Dept', 87, 'Aktif', NULL, 1, NULL, '2022-06-16 10:18:55'),
(89, NULL, 102, '088', 'Departemen Neurologi', 'Dept', 88, 'Aktif', 'otak-1656570888.jpg', 1, NULL, '2022-06-30 13:34:48'),
(90, NULL, 1, '089', 'Departemen Obstetri dan Ginekologi', 'Dept', 89, 'Aktif', NULL, 1, NULL, '2022-06-16 10:18:43'),
(91, NULL, 1, '090', 'Departemen Orthopaedi dan Traumatologi', 'Dept', 90, 'Aktif', NULL, 1, NULL, '2022-06-16 10:18:37'),
(92, NULL, 1, '091', 'Departemen Patologi Klinik', 'Dept', 91, 'Aktif', NULL, 1, NULL, '2022-06-16 10:18:32'),
(93, NULL, 1, '092', 'Departemen Pulmonologi dan Kedokteran Respirasi', 'Dept', 92, 'Aktif', NULL, 1, NULL, '2022-06-16 10:18:20'),
(94, NULL, 1, '093', 'Departemen Radiologi', 'Dept', 93, 'Aktif', NULL, 1, NULL, '2022-06-16 10:17:52'),
(95, NULL, 1, '094', 'Departemen Urologi', 'Dept', 94, 'Aktif', NULL, 1, NULL, '2022-06-16 10:05:03'),
(96, NULL, 1, '095', 'Departemen Ilmu Kedokteran Fisik dan Rehabilitasi', 'Dept', 95, 'Aktif', NULL, 1, NULL, '2022-06-16 09:58:46'),
(97, NULL, 110, '096', 'Keselamatan, Kesehatan Kerja, dan Lingkungan (K3L)', 'Unit', 96, 'Aktif', 'sedang-1660215422-k3-1-1679973284.jpg', 1, NULL, '2023-03-28 10:14:44'),
(99, NULL, 1, '097', 'Continuing Medical Education (CME)', 'Unit', 97, 'Aktif', NULL, 1, NULL, '2026-03-07 14:56:56'),
(100, NULL, 1, '098', 'Hubungan Masyarakat', 'Unit', 98, 'Aktif', NULL, 1, NULL, '2022-06-16 10:35:42'),
(101, NULL, 76, '099', 'Manajer Riset dan Pengabdian Masyarakat', 'Dekanat', 99, 'Aktif', NULL, 76, NULL, '2022-06-21 11:49:17'),
(102, NULL, 76, '100', 'Manajer Kerjasama, Ventura dan Hubungan Alumni', 'Dekanat', 100, 'Aktif', NULL, 76, NULL, '2022-06-21 11:48:59'),
(104, NULL, 76, '101', 'International Relations Office (IRO)', 'Unit', 101, 'Aktif', NULL, 76, NULL, '2023-03-13 12:44:21'),
(105, 106, 1, '102', 'Keuangan dan Akuntansi', 'Unit', 102, 'Aktif', NULL, 1, '2026-06-09 11:35:05', '2026-06-09 18:35:05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `id_akses_level` int DEFAULT NULL,
  `posted_by` int DEFAULT NULL,
  `id_unit_kerja` int DEFAULT NULL,
  `nama` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(64) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `akses_level` varchar(20) NOT NULL,
  `kode_rahasia` varchar(255) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `keterangan` text,
  `status_user` enum('Aktif','Non Aktif') NOT NULL DEFAULT 'Aktif',
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `deleted_by` int DEFAULT NULL,
  `tanggal` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `id_akses_level`, `posted_by`, `id_unit_kerja`, `nama`, `email`, `username`, `password`, `password_hash`, `akses_level`, `kode_rahasia`, `gambar`, `keterangan`, `status_user`, `created_by`, `updated_by`, `deleted_by`, `tanggal`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 6, NULL, NULL, 'Andoyo Ganteng', 'andoyoandoyo@gmail.com', 'javawebmedia', 'dc28d4424ece38803650f440d7eb1cb2b3fb6651', '$2y$12$Cx.uAohoZdEN417l5YiN1ej0fC2/qO4Sx5EYIg6WojGkmn1wXk7au', 'Admin', NULL, 'syifa-gadis-cantik-yang-hilang-43-1684059070.jpeg', '', 'Aktif', NULL, 1, NULL, '2026-03-15 13:15:02', '2026-03-13 16:18:52', '2026-03-15 13:15:02', NULL),
(5, 6, NULL, NULL, 'Winda Ayu Lestari', 'lalu-kekah@bkkbn.go.id', 'andoyo', '1ac1f34abe8fcced2ab68edfd4418405f8cc47ce', NULL, 'User-Pusat', NULL, 'user7-128x128-1650358070.jpg', NULL, 'Aktif', NULL, NULL, NULL, '2026-03-13 17:11:10', '2026-03-13 16:18:52', '2026-03-13 17:11:10', NULL),
(6, 6, 1, 64, 'Kheira Alexandrina Andoyo', 'kheira@gmail.com', 'kheira', 'fb61cc07d60735719fff32b247cbf966a784b845', NULL, 'Super Administrator', NULL, NULL, NULL, 'Aktif', NULL, 1, NULL, '2026-03-14 14:39:01', '2026-03-14 07:13:14', '2026-03-14 14:39:01', NULL),
(7, 6, 1, 99, 'Izra Rashid Andoyo', 'izra@gmail.com', 'izrarashid', '412851973c835739a22d409b3a0a672d8c01306b', NULL, 'Super Administrator', NULL, NULL, NULL, 'Aktif', 1, 1, NULL, '2026-03-14 14:17:32', '2026-03-14 07:17:32', '2026-03-14 14:17:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_logs`
--

CREATE TABLE `user_logs` (
  `id_user_log` int NOT NULL,
  `id_user` int NOT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `user_agent` text,
  `tanggal_updates` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_logs`
--

INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `user_agent`, `tanggal_updates`) VALUES
(1, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_edit/5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:18:59'),
(2, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:19:32'),
(3, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:20:02'),
(4, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:20:19'),
(5, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:20:34'),
(6, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:22:38'),
(7, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:24:58'),
(8, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:25:04'),
(9, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:25:11'),
(10, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:25:11'),
(11, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:32:07'),
(12, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:32:45'),
(13, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:33:09'),
(14, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.3 Safari/605.1.15', '2026-03-13 16:37:02'),
(15, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 16:54:49'),
(16, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 16:57:18'),
(17, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:07:08'),
(18, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:11:18'),
(19, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:17:59'),
(20, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:18:08'),
(21, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:27:42'),
(22, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:28:05'),
(23, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:29:11'),
(24, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:31:28'),
(25, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:32:51'),
(26, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:34:46'),
(27, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:37:35'),
(28, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:39:32'),
(29, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:40:00'),
(30, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:40:24'),
(31, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:42:42'),
(32, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:43:08'),
(33, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:43:19'),
(34, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:43:26'),
(35, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:43:29'),
(36, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:43:38'),
(37, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-13 17:44:20'),
(38, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:49:45'),
(39, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:49:54'),
(40, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:50:02'),
(41, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:50:08'),
(42, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/sub-jenis-dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:50:21'),
(43, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:50:22'),
(44, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:50:31'),
(45, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:50:58'),
(46, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan/edit/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:51:02'),
(47, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan/proses_edit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:51:06'),
(48, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:51:07'),
(49, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 12:51:26'),
(50, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:09:12'),
(51, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:09:58'),
(52, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:10:21'),
(53, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:11:57'),
(54, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:12:23'),
(55, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:13:48'),
(56, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:16:17'),
(57, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:16:39'),
(58, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:17:38'),
(59, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:18:47'),
(60, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:19:06'),
(61, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:19:32'),
(62, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:19:54'),
(63, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:22:48'),
(64, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:24:33'),
(65, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:24:46'),
(66, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:26:02'),
(67, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:26:42'),
(68, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:26:58'),
(69, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:28:26'),
(70, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:53:21'),
(71, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:55:20'),
(72, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:55:56'),
(73, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:58:16'),
(74, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 13:59:50'),
(75, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:01:16'),
(76, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:02:38'),
(77, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:03:00'),
(78, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:04:22'),
(79, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:07:47'),
(80, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:08:32'),
(81, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:08:32'),
(82, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:09:09'),
(83, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:09:09'),
(84, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:11:25'),
(85, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:11:48'),
(86, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:13:14'),
(87, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:13:15'),
(88, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:17:32'),
(89, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:17:33'),
(90, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:18:05'),
(91, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:22:15'),
(92, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:23:09'),
(93, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:23:21'),
(94, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:28:17'),
(95, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:28:49'),
(96, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:29:10'),
(97, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:29:31'),
(98, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:30:02'),
(99, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:30:36'),
(100, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:30:36'),
(101, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:32:09'),
(102, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:32:30'),
(103, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:34:02'),
(104, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:35:08'),
(105, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:35:13'),
(106, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:35:14'),
(107, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:35:35'),
(108, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:35:52'),
(109, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:36:04'),
(110, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:36:23'),
(111, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:36:27'),
(112, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:36:32'),
(113, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:36:32'),
(114, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:37:38'),
(115, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:38:09'),
(116, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:38:27'),
(117, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:38:56'),
(118, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user/proses_edit/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:39:01'),
(119, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:39:02'),
(120, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:39:15'),
(121, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:40:43'),
(122, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:41:56'),
(123, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:42:07'),
(124, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:42:51'),
(125, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:43:03'),
(126, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show-sub/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:43:07'),
(127, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan-sub', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:43:16'),
(128, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:43:16'),
(129, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:43:21'),
(130, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:47:02'),
(131, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:47:28'),
(132, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:47:50'),
(133, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:48:28'),
(134, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:48:56'),
(135, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:23'),
(136, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:45'),
(137, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:48'),
(138, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:51'),
(139, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:54'),
(140, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:54'),
(141, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 14:49:58'),
(142, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:29:35'),
(143, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:08'),
(144, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/delete-sub/13', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:25'),
(145, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:26'),
(146, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/delete-sub/15', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:32'),
(147, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:33'),
(148, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/delete-sub/14', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:38'),
(149, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:39'),
(150, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:43'),
(151, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:48'),
(152, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:49'),
(153, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:30:56'),
(154, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:36:21'),
(155, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:43:01'),
(156, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:51:12'),
(157, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:51:21'),
(158, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:52:19'),
(159, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:53:43'),
(160, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:54:21'),
(161, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:54:38'),
(162, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:58:05'),
(163, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:58:34'),
(164, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:59:04'),
(165, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 15:59:16'),
(166, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:00:32'),
(167, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=xxx', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:02:08'),
(168, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:04:22'),
(169, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=dada', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:04:33'),
(170, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=dada', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:04:57'),
(171, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:08:09'),
(172, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:09:19'),
(173, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:11:42'),
(174, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:11:59'),
(175, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:12:47'),
(176, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:14:19'),
(177, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:16:19'),
(178, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:16:49'),
(179, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:17:29'),
(180, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:17:47'),
(181, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:18:03'),
(182, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:20:52'),
(183, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:21:03'),
(184, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:21:23'),
(185, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:23:49'),
(186, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:24:39'),
(187, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:25:25'),
(188, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:25:50'),
(189, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:26:07'),
(190, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:26:30'),
(191, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:26:48'),
(192, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:33:55'),
(193, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:38:50'),
(194, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:39:30'),
(195, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:41:33'),
(196, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:41:51'),
(197, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:42:46'),
(198, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:43:11'),
(199, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:44:52'),
(200, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:45:24'),
(201, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:45:43'),
(202, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:46:08'),
(203, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:46:36'),
(204, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:47:26'),
(205, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:48:13'),
(206, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:48:49'),
(207, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:49:37'),
(208, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:50:45'),
(209, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:53:26'),
(210, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:54:07'),
(211, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:58:26'),
(212, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:58:40'),
(213, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:59:23'),
(214, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 16:59:38'),
(215, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:00:00'),
(216, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:00:15'),
(217, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:06:12'),
(218, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:06:29'),
(219, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:08:42'),
(220, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:08:57'),
(221, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:08:59'),
(222, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:15:21'),
(223, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:16:26'),
(224, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:17:29'),
(225, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:31:13'),
(226, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:31:50'),
(227, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:32:04'),
(228, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:32:23');
INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `user_agent`, `tanggal_updates`) VALUES
(229, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:32:58'),
(230, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:33:11'),
(231, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:35:11'),
(232, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:35:27'),
(233, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:35:29'),
(234, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:38:15'),
(235, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:38:34'),
(236, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:38:57'),
(237, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:38:59'),
(238, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:39:17'),
(239, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:39:19'),
(240, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:44:02'),
(241, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:44:23'),
(242, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:44:39'),
(243, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:45:03'),
(244, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:45:53'),
(245, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:46:48'),
(246, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:47:31'),
(247, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:47:44'),
(248, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:51:07'),
(249, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:51:38'),
(250, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:53:28'),
(251, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:53:39'),
(252, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:54:09'),
(253, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:55:13'),
(254, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:55:23'),
(255, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/SBKBHRA2RCDS', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 17:57:30'),
(256, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/SBKBHRA2RCDS', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:00:17'),
(257, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/SBKBHRA2RCDS', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:01:31'),
(258, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/SBKBHRA2RCDS', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:01:40'),
(259, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/SBKBHRA2RCDS', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:02:41'),
(260, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:02:59'),
(261, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/OH2ATLMGJC1N', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:03:02'),
(262, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/delete/SBKBHRA2RCDS', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:09:30'),
(263, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:09:30'),
(264, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/delete/OH2ATLMGJC1N', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:10:26'),
(265, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:10:27'),
(266, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:10:45'),
(267, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/delete/BD1LWQEA3ZVJ', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:10:48'),
(268, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:10:48'),
(269, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:11:27'),
(270, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:14:07'),
(271, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:14:21'),
(272, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:15:22'),
(273, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:21:57'),
(274, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:23:07'),
(275, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:23:22'),
(276, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:23:45'),
(277, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:24:28'),
(278, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-14 18:24:39'),
(279, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:29:21'),
(280, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:31:15'),
(281, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:31:44'),
(282, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:32:15'),
(283, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:33:09'),
(284, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:33:52'),
(285, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:34:20'),
(286, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:35:36'),
(287, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:35:48'),
(288, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:37:00'),
(289, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:37:15'),
(290, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:37:28'),
(291, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:39:12'),
(292, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:46:48'),
(293, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:47:53'),
(294, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:48:06'),
(295, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:49:09'),
(296, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:50:27'),
(297, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:50:55'),
(298, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:51:37'),
(299, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:52:46'),
(300, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:53:12'),
(301, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:53:26'),
(302, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:53:49'),
(303, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/unduh/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:53:52'),
(304, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:56:05'),
(305, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:56:11'),
(306, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:58:22'),
(307, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 01:59:10'),
(308, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:02:46'),
(309, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:02:53'),
(310, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:03:05'),
(311, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:03:29'),
(312, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:04:49'),
(313, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:09:30'),
(314, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:09:50'),
(315, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:45:21'),
(316, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:45:33'),
(317, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:45:45'),
(318, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:47:51'),
(319, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:53:46'),
(320, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:53:50'),
(321, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:53:52'),
(322, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:55:19'),
(323, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:55:44'),
(324, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:58:38'),
(325, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 02:59:20'),
(326, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:03:38'),
(327, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:03:40'),
(328, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:02'),
(329, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:04'),
(330, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:25'),
(331, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:26'),
(332, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/D3TKALOTO46C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:32'),
(333, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:48'),
(334, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/D3TKALOTO46C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:04:50'),
(335, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:05:04'),
(336, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:05:06'),
(337, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:05:40'),
(338, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:05:41'),
(339, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:05:51'),
(340, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:05:53'),
(341, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:06:06'),
(342, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:06:08'),
(343, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:06:38'),
(344, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:06:40'),
(345, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:07:03'),
(346, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:07:24'),
(347, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:07:26'),
(348, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/7V8YZ4QKKZQ9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:07:31'),
(349, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/FREAYBNWXYXK', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:07:35'),
(350, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:09:15'),
(351, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/D3TKALOTO46C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:09:36'),
(352, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:12:22'),
(353, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:13:52'),
(354, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=Dwi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:14:07'),
(355, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=Dwi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:15:12'),
(356, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=Dwi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:15:20'),
(357, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:15:25'),
(358, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:16:50'),
(359, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:17:04'),
(360, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:18:52'),
(361, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:19:05'),
(362, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:20:15'),
(363, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:20:20'),
(364, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=dwi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:20:30'),
(365, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:20:34'),
(366, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:20:47'),
(367, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:21:18'),
(368, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/7V8YZ4QKKZQ9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:21:23'),
(369, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/EISQETBTFW6C', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:21:27'),
(370, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:26:40'),
(371, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:27:30'),
(372, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:27:58'),
(373, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:28:22'),
(374, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:29:16'),
(375, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:29:35'),
(376, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:30:52'),
(377, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:32:00'),
(378, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah-album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:32:09'),
(379, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:32:10'),
(380, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah-album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:32:34'),
(381, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:32:34'),
(382, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:34:36'),
(383, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah-album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:34:43'),
(384, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:34:43'),
(385, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:35:39'),
(386, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah-album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:35:44'),
(387, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah-album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:36:28'),
(388, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:36:28'),
(389, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:36:51'),
(390, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:36:53'),
(391, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/XTRBJZKLBPTQ', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:36:57'),
(392, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:48:16'),
(393, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:48:32'),
(394, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:49:09'),
(395, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:49:20'),
(396, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:52:47'),
(397, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/get-urutan-sub?id_menu_aplikasi=5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:52:53'),
(398, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan-sub', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:53:20'),
(399, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:53:20'),
(400, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:53:25'),
(401, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:53:27'),
(402, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/proses-menu?6=', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:53:31'),
(403, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:53:32'),
(404, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:55:20'),
(405, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:59:13'),
(406, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:59:30'),
(407, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 03:59:40'),
(408, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:00:07'),
(409, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:03:36'),
(410, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:04:02'),
(411, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:04:02'),
(412, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:04:27'),
(413, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:04:45'),
(414, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:04:53'),
(415, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:05:09'),
(416, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:05:33'),
(417, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:05:33'),
(418, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:22:44'),
(419, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:43:57'),
(420, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/get-urutan-sub?id_menu_aplikasi=3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:02'),
(421, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan-sub', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:19'),
(422, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:20'),
(423, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:25'),
(424, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:27'),
(425, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/proses-menu?6=', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:32'),
(426, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:44:33'),
(427, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:48:40'),
(428, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:53:13'),
(429, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:54:29'),
(430, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:55:01'),
(431, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:55:15'),
(432, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album/edit/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:55:57'),
(433, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album/edit/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:57:13'),
(434, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album/edit/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:57:32'),
(435, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album/proses_edit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:57:36'),
(436, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album/proses_edit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:57:58'),
(437, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:57:59'),
(438, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 04:58:13'),
(439, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:01:35'),
(440, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:02:25'),
(441, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:02:37'),
(442, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:02:42'),
(443, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:04:12'),
(444, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:04:29'),
(445, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:04:42'),
(446, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:04:45'),
(447, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:06:28'),
(448, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:09:22'),
(449, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:09:45'),
(450, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:11:07'),
(451, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:11:48');
INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `user_agent`, `tanggal_updates`) VALUES
(452, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:11:58'),
(453, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:12:30'),
(454, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:14:30'),
(455, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:14:49'),
(456, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:14:51'),
(457, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:16:07'),
(458, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:16:10'),
(459, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:19:51'),
(460, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:22:16'),
(461, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:22:39'),
(462, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:22:39'),
(463, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:24:35'),
(464, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:24:55'),
(465, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:24:57'),
(466, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 05:25:00'),
(467, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:05:18'),
(468, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:07:29'),
(469, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:07:53'),
(470, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:08:34'),
(471, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:09:14'),
(472, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:09:28'),
(473, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:10:19'),
(474, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:12:34'),
(475, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:16:54'),
(476, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:18:38'),
(477, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:18:59'),
(478, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:19:14'),
(479, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:19:29'),
(480, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/TRDBAIUQESSP', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:20:30'),
(481, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:20:51'),
(482, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:20:54'),
(483, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:21:08'),
(484, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:21:24'),
(485, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:21:32'),
(486, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:22:24'),
(487, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:23:15'),
(488, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:23:37'),
(489, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:23:56'),
(490, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:25:45'),
(491, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/IKYABA6LBMO3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:25:55'),
(492, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:26:04'),
(493, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:26:36'),
(494, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/HNYRWEMNXWTW', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:26:44'),
(495, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/HNYRWEMNXWTW', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:27:32'),
(496, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:27:43'),
(497, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/HNYRWEMNXWTW', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:27:48'),
(498, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:28:01'),
(499, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:28:48'),
(500, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:28:56'),
(501, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:29:12'),
(502, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:29:17'),
(503, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:30:23'),
(504, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:30:35'),
(505, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:30:44'),
(506, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:31:02'),
(507, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:31:49'),
(508, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:31:56'),
(509, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:31:57'),
(510, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:32:05'),
(511, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:32:06'),
(512, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/SONV84QCV2VC', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:33:10'),
(513, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:33:13'),
(514, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:34:48'),
(515, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:35:25'),
(516, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:35:27'),
(517, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:38:36'),
(518, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:39:03'),
(519, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:40:00'),
(520, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:40:13'),
(521, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:40:34'),
(522, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:41:01'),
(523, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:41:09'),
(524, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:43:03'),
(525, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:45:24'),
(526, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:46:00'),
(527, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:46:35'),
(528, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:47:08'),
(529, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:48:20'),
(530, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:48:29'),
(531, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:48:39'),
(532, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:48:49'),
(533, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:48:59'),
(534, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:49:09'),
(535, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:49:18'),
(536, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:49:30'),
(537, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:49:56'),
(538, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:50:07'),
(539, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:51:22'),
(540, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:51:26'),
(541, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:51:44'),
(542, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:51:59'),
(543, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:53:48'),
(544, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 07:54:53'),
(545, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:02:24'),
(546, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:02:42'),
(547, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:03:50'),
(548, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:04:23'),
(549, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:04:35'),
(550, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:04:55'),
(551, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:05:56'),
(552, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:06:14'),
(553, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:06:49'),
(554, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:07:12'),
(555, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:07:40'),
(556, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:08:39'),
(557, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:09:16'),
(558, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:12:32'),
(559, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:14:54'),
(560, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun/update-profile', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:15:01'),
(561, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:15:02'),
(562, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:15:30'),
(563, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:21:10'),
(564, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:22:19'),
(565, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:24:43'),
(566, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:25:39'),
(567, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:25:48'),
(568, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:26:06'),
(569, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:27:08'),
(570, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:30:12'),
(571, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:31:36'),
(572, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:32:30'),
(573, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun/update-password', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:33:18'),
(574, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:33:19'),
(575, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:33:29'),
(576, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:34:31'),
(577, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:54:56'),
(578, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:55:12'),
(579, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:55:12'),
(580, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:55:54'),
(581, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:08'),
(582, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:20'),
(583, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show-sub/9', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:24'),
(584, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan-sub', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:31'),
(585, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:31'),
(586, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:37'),
(587, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/upload/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:44'),
(588, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:57:45'),
(589, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:58:36'),
(590, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/upload/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:58:43'),
(591, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 13:58:43'),
(592, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:01:16'),
(593, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:01:24'),
(594, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:02:20'),
(595, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:02:20'),
(596, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:06:48'),
(597, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:08:10'),
(598, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:08:35'),
(599, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:08:59'),
(600, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:09:41'),
(601, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:09:57'),
(602, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:10:27'),
(603, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:10:48'),
(604, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:11:00'),
(605, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:11:12'),
(606, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:11:15'),
(607, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:11:27'),
(608, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:13:07'),
(609, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:15:33'),
(610, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:16:14'),
(611, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:16:26'),
(612, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/WCTX8PEQJZ0X', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:16:30'),
(613, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:17:05'),
(614, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/update', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:17:29'),
(615, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/edit/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:17:29'),
(616, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:17:34'),
(617, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:19:02'),
(618, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:20:06'),
(619, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:20:19'),
(620, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:20:40'),
(621, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:21:16'),
(622, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:21:31'),
(623, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:21:55'),
(624, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:22:23'),
(625, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:22:44'),
(626, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:22:56'),
(627, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:23:05'),
(628, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=2026', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:23:30'),
(629, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=uus', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:23:42'),
(630, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:23:44'),
(631, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:26:46'),
(632, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:27:37'),
(633, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:27:53'),
(634, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:28:15'),
(635, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:28:23'),
(636, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:28:35'),
(637, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:28:57'),
(638, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=uus', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:29:21'),
(639, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:29:28'),
(640, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=a', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:29:46'),
(641, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:29:49'),
(642, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 14:29:55'),
(643, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:18:39'),
(644, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:18:52'),
(645, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:19:21'),
(646, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:19:22'),
(647, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:19:26'),
(648, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:19:28'),
(649, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:19:43'),
(650, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/5', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:03'),
(651, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:08'),
(652, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:09'),
(653, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:27'),
(654, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:30'),
(655, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:30'),
(656, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/show/4', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:35'),
(657, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:38'),
(658, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:39'),
(659, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:20:43'),
(660, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:21:08'),
(661, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/proses-menu?6=', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:21:14'),
(662, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:21:15'),
(663, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:21:23'),
(664, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:22:06'),
(665, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:22:38'),
(666, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:22:50'),
(667, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:10'),
(668, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:16'),
(669, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:16'),
(670, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:21'),
(671, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:28'),
(672, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:30'),
(673, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:36'),
(674, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=kontrak', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:43');
INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `user_agent`, `tanggal_updates`) VALUES
(675, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:23:46'),
(676, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:26:31'),
(677, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/album/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:30:49'),
(678, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/album/1?page=2', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:30:55'),
(679, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:33:18'),
(680, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:34:16'),
(681, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/sub-jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:35:13'),
(682, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/sub-jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:35:25'),
(683, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/sub-jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:35:41'),
(684, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/sub-jenis/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:35:56'),
(685, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/perkembangan/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:36:57'),
(686, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/perkembangan/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:37:10'),
(687, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/author/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:37:51'),
(688, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/author/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:39:12'),
(689, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/author/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:39:29'),
(690, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/author/1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:40:50'),
(691, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:40:53'),
(692, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:41:14'),
(693, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:41:50'),
(694, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:42:06'),
(695, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:42:22'),
(696, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:46:34'),
(697, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:47:21'),
(698, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:47:22'),
(699, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:48:39'),
(700, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:48:40'),
(701, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:49:09'),
(702, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:49:10'),
(703, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:50:12'),
(704, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:50:13'),
(705, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:50:39'),
(706, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:50:40'),
(707, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:50:50'),
(708, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:50:51'),
(709, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:00'),
(710, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:01'),
(711, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:16'),
(712, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:17'),
(713, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:38'),
(714, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:39'),
(715, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:48'),
(716, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:51:49'),
(717, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:04'),
(718, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:05'),
(719, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:50'),
(720, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/F7KVE7SCLQQL', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:52'),
(721, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:53'),
(722, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/WCTX8PEQJZ0X', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:57'),
(723, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/WCTX8PEQJZ0X', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:52:58'),
(724, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:53:53'),
(725, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/TGVHOUZEBGC8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:54:34'),
(726, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/TGVHOUZEBGC8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:54:35'),
(727, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/TGVHOUZEBGC8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:54:46'),
(728, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/TGVHOUZEBGC8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 17:54:47'),
(729, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/TGVHOUZEBGC8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 18:00:16'),
(730, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/TGVHOUZEBGC8', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 18:00:17'),
(731, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:20:30'),
(732, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:21:38'),
(733, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:22:25'),
(734, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:31:49'),
(735, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:32:35'),
(736, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:34:23'),
(737, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:38:59'),
(738, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:41:07'),
(739, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:41:29'),
(740, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:42:07'),
(741, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:43:14'),
(742, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:45:17'),
(743, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:45:30'),
(744, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:45:45'),
(745, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:46:20'),
(746, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:47:54'),
(747, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:49:13'),
(748, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:49:28'),
(749, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:49:50'),
(750, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:50:18'),
(751, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:50:54'),
(752, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:52:33'),
(753, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:52:44'),
(754, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:53:12'),
(755, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:54:18'),
(756, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:54:36'),
(757, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:54:56'),
(758, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:58:45'),
(759, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 20:59:00'),
(760, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:01:03'),
(761, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:01:38'),
(762, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:02:43'),
(763, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:03:32'),
(764, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:03:53'),
(765, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:06:43'),
(766, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:06:45'),
(767, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:08:23'),
(768, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:08:24'),
(769, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:12:39'),
(770, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 21:12:41'),
(771, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:51:44'),
(772, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:51:52'),
(773, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:51:55'),
(774, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773643912972', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:51:55'),
(775, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:52:20'),
(776, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:52:22'),
(777, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773643940545', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:52:22'),
(778, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:52:50'),
(779, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:52:53'),
(780, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773643970868', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-15 23:52:53'),
(781, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:16:28'),
(782, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:16:36'),
(783, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:16:38'),
(784, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706596885', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:16:39'),
(785, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:16:57'),
(786, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:16:59'),
(787, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706617978', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:17:00'),
(788, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:17:18'),
(789, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:17:20'),
(790, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706639217', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:17:21'),
(791, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:11'),
(792, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:13'),
(793, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706691473', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:13'),
(794, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:30'),
(795, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:32'),
(796, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706711234', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:33'),
(797, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:47'),
(798, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:49'),
(799, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706727699', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:18:49'),
(800, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:19:00'),
(801, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:19:01'),
(802, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706740214', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:19:01'),
(803, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:20:45'),
(804, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:20:47'),
(805, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773706846044', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:20:48'),
(806, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:24:12'),
(807, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:24:15'),
(808, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707053140', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:24:16'),
(809, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:24:37'),
(810, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:24:40'),
(811, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707078252', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:24:40'),
(812, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:02'),
(813, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:04'),
(814, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707103094', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:04'),
(815, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:22'),
(816, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:23'),
(817, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707122382', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:24'),
(818, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:37'),
(819, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:40'),
(820, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707138157', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:25:40'),
(821, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:27:04'),
(822, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:27:07'),
(823, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707225314', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:27:07'),
(824, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:28:48'),
(825, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:28:50'),
(826, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707329189', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:28:51'),
(827, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:30:44'),
(828, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:30:46'),
(829, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707444751', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:30:46'),
(830, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:10'),
(831, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:12'),
(832, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707470671', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:12'),
(833, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:19'),
(834, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:21'),
(835, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707480036', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:22'),
(836, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:41'),
(837, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:43'),
(838, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707501413', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:31:43'),
(839, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:32:32'),
(840, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:32:34'),
(841, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707553049', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:32:34'),
(842, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:32:53'),
(843, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:32:54'),
(844, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707573366', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:32:54'),
(845, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:33:33'),
(846, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:33:35'),
(847, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707613791', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:33:35'),
(848, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:33:59'),
(849, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:00'),
(850, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707639196', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:00'),
(851, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:07'),
(852, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:08'),
(853, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707647555', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:08'),
(854, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:22'),
(855, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:23'),
(856, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773707662257', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:34:23'),
(857, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:37:03'),
(858, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:38:47'),
(859, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:40:12'),
(860, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:41:23'),
(861, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:44:17'),
(862, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:44:20'),
(863, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:44:21'),
(864, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773708257908', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:44:22'),
(865, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1773708257909', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:44:22'),
(866, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:14'),
(867, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:18'),
(868, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:19'),
(869, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:19'),
(870, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1773708375857', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:19'),
(871, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773708375856', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:20'),
(872, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan?_=1773708375858', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:46:20'),
(873, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:48:11'),
(874, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:49:56'),
(875, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:00'),
(876, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:00'),
(877, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:00'),
(878, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:01'),
(879, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773708597593', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:01'),
(880, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1773708597594', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:01'),
(881, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan?_=1773708597595', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:02'),
(882, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album?_=1773708597596', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:02'),
(883, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja?_=1773708597597', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:02'),
(884, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:27'),
(885, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:30'),
(886, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:31'),
(887, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:31'),
(888, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:31'),
(889, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:31');
INSERT INTO `user_logs` (`id_user_log`, `id_user`, `ip_address`, `username`, `url`, `user_agent`, `tanggal_updates`) VALUES
(890, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773708628161', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:33'),
(891, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1773708628162', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:33'),
(892, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan?_=1773708628163', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:33'),
(893, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album?_=1773708628164', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:33'),
(894, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja?_=1773708628165', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:50:33'),
(895, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:51:59'),
(896, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:55:23'),
(897, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 17:57:34'),
(898, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 18:07:35'),
(899, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 18:07:53'),
(900, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 18:15:06'),
(901, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 18:16:30'),
(902, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 18:16:56'),
(903, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 18:17:21'),
(904, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-16 19:18:06'),
(905, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:37:31'),
(906, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:21'),
(907, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:27'),
(908, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:28'),
(909, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:28'),
(910, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:28'),
(911, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:28'),
(912, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1773740363391', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:31'),
(913, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1773740363392', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:31'),
(914, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja?_=1773740363395', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:31'),
(915, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan?_=1773740363393', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:31'),
(916, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album?_=1773740363394', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:31'),
(917, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:39:36'),
(918, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:40:18'),
(919, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:40:21'),
(920, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/TJOTUJFWAZVY', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:40:31'),
(921, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:05'),
(922, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:09'),
(923, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/C402A9MYL791', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:18'),
(924, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/detail/C402A9MYL791', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:24'),
(925, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/C402A9MYL791', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:27'),
(926, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:33'),
(927, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=hasil%20karya', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:45'),
(928, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/cari?keywords=java', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:53'),
(929, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:41:59'),
(930, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:48:21'),
(931, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:49:13'),
(932, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:50:34'),
(933, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/unggah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:50:35'),
(934, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:50:49'),
(935, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:50:59'),
(936, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/email', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:51:35'),
(937, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:52:33'),
(938, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:53:14'),
(939, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 02:53:44'),
(940, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:16:03'),
(941, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:27:58'),
(942, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akun', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:28:12'),
(943, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:31:40'),
(944, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:34:06'),
(945, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:34:13'),
(946, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:34:52'),
(947, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:38:07'),
(948, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:38:23'),
(949, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:39:07'),
(950, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:40:30'),
(951, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:41:05'),
(952, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:41:27'),
(953, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:41:53'),
(954, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36', '2026-03-17 14:42:18'),
(955, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-24 15:33:49'),
(956, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 17:08:42'),
(957, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 17:08:50'),
(958, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah-album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 17:10:05'),
(959, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 17:10:06'),
(960, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 17:10:42'),
(961, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/146.0.0.0 Safari/537.36', '2026-03-26 17:10:45'),
(962, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:09'),
(963, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:16'),
(964, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:17'),
(965, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:17'),
(966, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:17'),
(967, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:17'),
(968, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:17'),
(969, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1775974756234', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:18'),
(970, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1775974756233', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:18'),
(971, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan?_=1775974756235', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:18'),
(972, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album?_=1775974756236', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:18'),
(973, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja?_=1775974756237', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:18'),
(974, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:19:36'),
(975, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:20:20'),
(976, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:21:02'),
(977, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/sub-jenis-dokumen?_=1775975135324', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:25:38'),
(978, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/perkembangan?_=1775975135325', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:25:38'),
(979, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/jenis-dokumen?_=1775975135323', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:25:38'),
(980, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/unit-kerja?_=1775975135327', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:25:38'),
(981, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/statistik/album?_=1775975135326', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:25:38'),
(982, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:25:41'),
(983, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:29:28'),
(984, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:38:49'),
(985, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:40:14'),
(986, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:41:28'),
(987, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/perkembangan', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:41:56'),
(988, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:41:59'),
(989, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:45:08'),
(990, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:45:12'),
(991, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:45:57'),
(992, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:46:01'),
(993, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/147.0.0.0 Safari/537.36', '2026-04-11 23:46:49'),
(994, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-21 23:59:24'),
(995, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-21 23:59:36'),
(996, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/upload/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-21 23:59:56'),
(997, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-21 23:59:57'),
(998, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-22 00:00:06'),
(999, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-22 00:00:24'),
(1000, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-23 08:53:47'),
(1001, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-23 08:53:59'),
(1002, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/ETFI4CI1NI4F', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-23 08:54:07'),
(1003, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-23 08:54:30'),
(1004, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-23 08:54:33'),
(1005, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen/show/LXEVLW9TWFWM', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-05-23 08:54:39'),
(1006, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:05'),
(1007, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:13'),
(1008, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/upload/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:32'),
(1009, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/icon', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:33'),
(1010, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:41'),
(1011, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/upload/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:49'),
(1012, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/logo', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:49'),
(1013, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:23:58'),
(1014, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:24:30'),
(1015, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:24:50'),
(1016, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:27:18'),
(1017, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:27:33'),
(1018, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/update-profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:27:44'),
(1019, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:27:45'),
(1020, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/konfigurasi/profil', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:27:52'),
(1021, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:28:22'),
(1022, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:49:58'),
(1023, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:50:07'),
(1024, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/jenis-dokumen', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 10:50:15'),
(1025, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/dasbor', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:08:33'),
(1026, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:08:48'),
(1027, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/user', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:09:05'),
(1028, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:13:47'),
(1029, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/get-urutan-sub?id_menu_aplikasi=3', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:13:54'),
(1030, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi/simpan-sub', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:07'),
(1031, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/menu-aplikasi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:07'),
(1032, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:14'),
(1033, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:17'),
(1034, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/proses-menu?6=', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:23'),
(1035, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level/menu/6', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:24'),
(1036, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/akses-level', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:14:31'),
(1037, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:21:48'),
(1038, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:22:16'),
(1039, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:23:12'),
(1040, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:23:27'),
(1041, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:23:49'),
(1042, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi/tambah', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:24:08'),
(1043, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:24:08'),
(1044, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:26:33'),
(1045, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:27:22'),
(1046, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:28:44'),
(1047, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:28:58'),
(1048, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:32:47'),
(1049, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja/edit/105', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:32:58'),
(1050, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja/proses_edit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:33:01'),
(1051, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja/proses_edit', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:35:05'),
(1052, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/unit-kerja', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:35:05'),
(1053, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:35:12'),
(1054, 1, '::1', 'javawebmedia', 'http://localhost/datavet/admin/poksi', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/148.0.0.0 Safari/537.36', '2026-06-09 11:35:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akses`
--
ALTER TABLE `akses`
  ADD PRIMARY KEY (`id_akses`);

--
-- Indexes for table `akses_level`
--
ALTER TABLE `akses_level`
  ADD PRIMARY KEY (`id_akses_level`),
  ADD UNIQUE KEY `nama_akses_level` (`nama_akses_level`);

--
-- Indexes for table `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`),
  ADD UNIQUE KEY `slug_album` (`slug_album`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `dokumen`
--
ALTER TABLE `dokumen`
  ADD PRIMARY KEY (`id_dokumen`),
  ADD UNIQUE KEY `kode_dokumen` (`kode_dokumen`),
  ADD UNIQUE KEY `nama_file` (`nama_file`);

--
-- Indexes for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  ADD PRIMARY KEY (`id_jenis_dokumen`),
  ADD UNIQUE KEY `kode_jenis_dokumen` (`kode_jenis_dokumen`),
  ADD UNIQUE KEY `nama_jenis_dokumen` (`nama_jenis_dokumen`);

--
-- Indexes for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  ADD PRIMARY KEY (`id_konfigurasi`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`),
  ADD UNIQUE KEY `nama_menu` (`nama_menu`);

--
-- Indexes for table `menu_akses`
--
ALTER TABLE `menu_akses`
  ADD PRIMARY KEY (`id_menu_akses`);

--
-- Indexes for table `menu_aplikasi`
--
ALTER TABLE `menu_aplikasi`
  ADD PRIMARY KEY (`id_menu_aplikasi`);

--
-- Indexes for table `menu_aplikasi_sub`
--
ALTER TABLE `menu_aplikasi_sub`
  ADD PRIMARY KEY (`id_menu_aplikasi_sub`),
  ADD KEY `menu_aplikasi_sub_menu_aplikasi_FK` (`id_menu_aplikasi`);

--
-- Indexes for table `pejabat`
--
ALTER TABLE `pejabat`
  ADD PRIMARY KEY (`id_pejabat`);

--
-- Indexes for table `perkembangan`
--
ALTER TABLE `perkembangan`
  ADD PRIMARY KEY (`id_perkembangan`);

--
-- Indexes for table `poksi`
--
ALTER TABLE `poksi`
  ADD PRIMARY KEY (`id_poksi`),
  ADD UNIQUE KEY `kode_poksi` (`kode_poksi`),
  ADD UNIQUE KEY `nama_poksi` (`nama_poksi`);

--
-- Indexes for table `sub_jenis_dokumen`
--
ALTER TABLE `sub_jenis_dokumen`
  ADD PRIMARY KEY (`id_sub_jenis_dokumen`);

--
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`id_sub_menu`),
  ADD UNIQUE KEY `nama_sub_menu` (`nama_sub_menu`);

--
-- Indexes for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  ADD PRIMARY KEY (`id_unit_kerja`),
  ADD UNIQUE KEY `kode_unit_kerja` (`kode_unit_kerja`),
  ADD UNIQUE KEY `nama_unit_kerja` (`nama_unit_kerja`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_logs`
--
ALTER TABLE `user_logs`
  ADD PRIMARY KEY (`id_user_log`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akses`
--
ALTER TABLE `akses`
  MODIFY `id_akses` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `akses_level`
--
ALTER TABLE `akses_level`
  MODIFY `id_akses_level` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dokumen`
--
ALTER TABLE `dokumen`
  MODIFY `id_dokumen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `jenis_dokumen`
--
ALTER TABLE `jenis_dokumen`
  MODIFY `id_jenis_dokumen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `konfigurasi`
--
ALTER TABLE `konfigurasi`
  MODIFY `id_konfigurasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_akses`
--
ALTER TABLE `menu_akses`
  MODIFY `id_menu_akses` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `menu_aplikasi`
--
ALTER TABLE `menu_aplikasi`
  MODIFY `id_menu_aplikasi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `menu_aplikasi_sub`
--
ALTER TABLE `menu_aplikasi_sub`
  MODIFY `id_menu_aplikasi_sub` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `pejabat`
--
ALTER TABLE `pejabat`
  MODIFY `id_pejabat` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `perkembangan`
--
ALTER TABLE `perkembangan`
  MODIFY `id_perkembangan` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poksi`
--
ALTER TABLE `poksi`
  MODIFY `id_poksi` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT for table `sub_jenis_dokumen`
--
ALTER TABLE `sub_jenis_dokumen`
  MODIFY `id_sub_jenis_dokumen` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `id_sub_menu` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unit_kerja`
--
ALTER TABLE `unit_kerja`
  MODIFY `id_unit_kerja` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_logs`
--
ALTER TABLE `user_logs`
  MODIFY `id_user_log` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1055;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menu_aplikasi_sub`
--
ALTER TABLE `menu_aplikasi_sub`
  ADD CONSTRAINT `menu_aplikasi_sub_menu_aplikasi_FK` FOREIGN KEY (`id_menu_aplikasi`) REFERENCES `menu_aplikasi` (`id_menu_aplikasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
