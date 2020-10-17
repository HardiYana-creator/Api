-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 17 Okt 2020 pada 10.17
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang_db`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `logs`
--

CREATE TABLE `logs` (
  `id_logs` int(11) NOT NULL,
  `type` varchar(100) NOT NULL,
  `created_ad` datetime DEFAULT NULL,
  `adjustment` varchar(100) DEFAULT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `logs`
--

INSERT INTO `logs` (`id_logs`, `type`, `created_ad`, `adjustment`, `quantity`, `id`) VALUES
(11, 'Inbound', '2020-10-09 09:08:22', '-10', '-10', 1),
(12, 'Inbound', '2020-10-09 09:08:22', '6', '-20', 2),
(13, 'Inbound', '2020-10-09 09:24:49', '-10', '-20', 1),
(14, 'Inbound', '2020-10-09 09:24:49', '6', '-30', 2),
(15, 'Inbound', '2020-10-09 09:28:20', '-10', '-40', 1),
(16, 'Inbound', '2020-10-09 09:28:20', '6', '-50', 2),
(17, 'Inbound', '2020-10-09 09:30:51', '6', '-60', 2),
(18, 'Inbound', '2020-10-09 09:32:41', '-10', '-60', 1),
(19, 'Inbound', '2020-10-09 09:32:41', '6', '-70', 2),
(20, 'Inbound', '2020-10-09 09:46:16', '-10', '-180', 1),
(21, 'Inbound', '2020-10-09 09:46:16', '6', '-190', 2),
(22, 'Inbound', '2020-10-09 09:46:32', '-10', '-190', 1),
(23, 'Inbound', '2020-10-09 09:46:32', '6', '-200', 2),
(24, 'Inbound', '2020-10-09 09:48:36', '-10', '-210', 1),
(25, 'Inbound', '2020-10-09 09:48:36', '6', '-220', 2),
(26, 'Inbound', '2020-10-09 09:53:49', '-10', '-230', 1),
(27, 'Inbound', '2020-10-09 09:54:03', '-10', '-240', 1),
(28, 'Inbound', '2020-10-09 09:54:03', '6', '-250', 2),
(29, 'Inbound', '2020-10-09 09:54:19', '-10', '-250', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stok_tbl`
--

CREATE TABLE `stok_tbl` (
  `id` int(11) NOT NULL,
  `location` varchar(100) NOT NULL,
  `quantity` varchar(100) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `stok_tbl`
--

INSERT INTO `stok_tbl` (`id`, `location`, `quantity`, `product`) VALUES
(1, 'A-1-1', '-260', 'Indomie Goreng'),
(2, 'A-1-2', '262', 'Kopi'),
(3, 'A-1-3', '200', 'Yakult');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id_logs`) USING BTREE;

--
-- Indeks untuk tabel `stok_tbl`
--
ALTER TABLE `stok_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `logs`
--
ALTER TABLE `logs`
  MODIFY `id_logs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `stok_tbl`
--
ALTER TABLE `stok_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
