-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Okt 2022 pada 12.18
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pengajuan_aplikasi`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `barang`
--

CREATE TABLE `barang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `spesifikasi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `harga_barang` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `barang`
--

INSERT INTO `barang` (`id`, `nama_barang`, `spesifikasi`, `harga_barang`, `created_at`, `updated_at`) VALUES
(4, 'laptop', 'sdecond', '200000', '2022-09-28 04:08:41', '2022-09-28 04:08:41'),
(5, 'TV', 'second dan baru', '2000004', '2022-09-28 04:18:11', '2022-10-06 02:08:05'),
(6, 'meja', 'meja', '200000', '2022-10-03 08:22:28', '2022-10-03 08:26:28'),
(7, 'sdssdsd', 'sdsdd', '229', '2022-10-05 08:41:02', '2022-10-05 08:41:02'),
(9, 'sas', 'dsd', '2', '2022-10-05 08:43:25', '2022-10-05 08:43:25'),
(11, 'dimmas', 'adad', '2', '2022-10-06 04:18:13', '2022-10-06 04:18:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_pengajuan`
--

CREATE TABLE `detail_pengajuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pengajuan_id` int(11) NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `detail_pengajuan`
--

INSERT INTO `detail_pengajuan` (`id`, `pengajuan_id`, `barang_id`, `jumlah_barang`, `harga_satuan`, `created_at`, `updated_at`) VALUES
(117, 59, 4, 3, 200000, '2022-10-05 07:00:35', '2022-10-05 07:00:35'),
(119, 60, 5, 3, 200000, '2022-10-05 07:40:19', '2022-10-05 07:40:19'),
(138, 63, 4, 3, 200000, '2022-10-05 08:23:15', '2022-10-05 08:23:15'),
(141, 62, 4, 3, 200000, '2022-10-05 08:34:46', '2022-10-05 08:34:46'),
(142, 62, 4, 2, 200000, '2022-10-05 08:35:03', '2022-10-05 08:35:03'),
(152, 65, 4, 2, 200000, '2022-10-06 03:14:38', '2022-10-06 03:14:38'),
(153, 64, 5, 2, 2000004, '2022-10-06 03:15:09', '2022-10-06 03:15:09'),
(155, 62, 6, 2, 200000, '2022-10-06 04:19:34', '2022-10-06 04:19:34'),
(158, 64, 6, 3, 200000, '2022-10-06 04:31:43', '2022-10-06 04:31:43'),
(159, 64, 6, 3, 200000, '2022-10-06 04:31:48', '2022-10-06 04:31:48'),
(160, 64, 5, 3, 2000004, '2022-10-06 04:31:55', '2022-10-06 04:31:55'),
(162, 63, 6, 2, 200000, '2022-10-06 04:35:04', '2022-10-06 04:35:04'),
(165, 63, 5, 3, 2000004, '2022-10-06 07:40:38', '2022-10-06 07:40:38'),
(173, 66, 4, 2, 200000, '2022-10-06 08:16:37', '2022-10-06 08:16:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `keranjang`
--

CREATE TABLE `keranjang` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `barang_id` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keranjang`
--

INSERT INTO `keranjang` (`id`, `barang_id`, `jumlah`, `harga_satuan`, `user_id`, `created_at`, `updated_at`) VALUES
(35, 3, 1, 400000, 1, '2022-09-29 07:31:16', '2022-09-29 07:31:16'),
(93, 5, 2, 2000004, 2, '2022-10-06 07:31:29', '2022-10-06 07:31:29'),
(94, 6, 3, 200000, 2, '2022-10-06 07:40:19', '2022-10-06 07:40:19');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2022_09_28_082808_create_barang_table', 1),
(5, '2022_09_28_082940_create_pengajuan_table', 1),
(6, '2022_09_28_083142_create_detail_pengajuan_table', 1),
(7, '2022_09_28_083300_create_keranjang_table', 1),
(8, '2022_09_28_103649_create_keranjang_table', 2),
(9, '2022_09_29_145339_create_admin_table', 3),
(10, '2022_09_29_145357_create_super_admin_table', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id_pengajuan` int(11) NOT NULL,
  `level_1` int(11) DEFAULT NULL,
  `level_2` int(11) DEFAULT NULL,
  `level_3` int(11) DEFAULT NULL,
  `total_biaya` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengajuan`
--

INSERT INTO `pengajuan` (`id`, `tanggal`, `user_id_pengajuan`, `level_1`, `level_2`, `level_3`, `total_biaya`, `created_at`, `updated_at`) VALUES
(63, '2022-10-05', 2, 1, 4, NULL, 7000012, '2022-10-05 07:40:56', '2022-10-06 07:40:42'),
(64, '2022-10-05', 2, 1, 4, 3, 11200020, '2022-10-05 09:57:50', '2022-10-06 06:00:31'),
(66, '2022-10-06', 2, 1, 4, NULL, 400000, '2022-10-06 07:13:48', '2022-10-06 08:16:41');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `role`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'level_1', 'level_1@gmail.com', 'level_1', NULL, '$2y$10$PmsVZK1Y.0Em2ksuyHIxbulO2jimUTbAp4Rd1MH.uWwMcWUpoVqcu', NULL, '2022-09-28 01:45:11', '2022-09-28 01:45:11'),
(2, 'penyok', 'penyok@gmail.com', NULL, NULL, '$2y$10$v0FmmUU7BoRWj6a7b3AtAemywlMSOiA1FhoAP4IybTcyV80My/yOi', NULL, '2022-09-29 07:37:52', '2022-09-29 07:37:52'),
(3, 'level_3', 'level_3@gmail.com', 'level_3', NULL, '$2y$10$V6.kECGeYD6syPX1NHtwnOY7MIqzyd9F47nGw98cu5CUN0Uyf5oGm', NULL, '2022-09-29 08:30:04', '2022-09-29 08:30:04'),
(4, 'level_2', 'level_2@gmail.com', 'level_2', NULL, '$2y$10$VRShwCaTYe4.YJ3.TOisau1Ur2KN8go6f6DFTx4.9T4sK5mZVorwq', NULL, '2022-10-06 03:18:33', '2022-10-06 03:18:33');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `detail_pengajuan`
--
ALTER TABLE `detail_pengajuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `barang`
--
ALTER TABLE `barang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `detail_pengajuan`
--
ALTER TABLE `detail_pengajuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=174;

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
