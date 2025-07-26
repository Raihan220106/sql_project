-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 01, 2025 at 01:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cuci steam`
--

-- --------------------------------------------------------

--
-- Table structure for table `gaji_pegawai`
--

CREATE TABLE `gaji_pegawai` (
  `id_gaji` varchar(10) NOT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL,
  `bulan` int(11) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `total_gaji` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `potongan` decimal(10,2) DEFAULT NULL,
  `tanggal_transfer` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_cuci`
--

CREATE TABLE `jadwal_cuci` (
  `id_jadwal` varchar(10) NOT NULL,
  `id_kendaraan` varchar(10) DEFAULT NULL,
  `id_layanan` varchar(10) DEFAULT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `estimasi_selesai` time DEFAULT NULL,
  `catatan` text DEFAULT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kendaraan`
--

CREATE TABLE `kendaraan` (
  `id_kendaraan` varchar(10) NOT NULL,
  `id_pelanggan` varchar(10) DEFAULT NULL,
  `jenis_kendaraan` varchar(20) DEFAULT NULL,
  `merk` varchar(30) DEFAULT NULL,
  `warna` varchar(20) DEFAULT NULL,
  `nomor_polisi` varchar(15) DEFAULT NULL,
  `tahun` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komplain`
--

CREATE TABLE `komplain` (
  `id_komplain` varchar(10) NOT NULL,
  `id_pelanggan` varchar(10) DEFAULT NULL,
  `id_transaksi` varchar(10) DEFAULT NULL,
  `isi_komplain` text DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `tanggapan` text DEFAULT NULL,
  `penanganan` text DEFAULT NULL,
  `id_pegawai` varchar(10) DEFAULT NULL,
  `prioritas` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_layanan` varchar(10) NOT NULL,
  `nama_layanan` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `durasi` int(11) DEFAULT NULL,
  `kategori` varchar(20) DEFAULT NULL,
  `diskon` decimal(5,2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `paket_layanan`
--

CREATE TABLE `paket_layanan` (
  `id_paket` varchar(10) NOT NULL,
  `nama_paket` varchar(50) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL,
  `harga` decimal(10,2) DEFAULT NULL,
  `jumlah_layanan` int(11) DEFAULT NULL,
  `bonus` varchar(50) DEFAULT NULL,
  `masa_berlaku` int(11) DEFAULT NULL,
  `diskon` decimal(5,2) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `id_pegawai` varchar(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `jabatan` varchar(30) DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `tanggal_masuk` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `gaji_pokok` decimal(10,2) DEFAULT NULL,
  `bonus` decimal(10,2) DEFAULT NULL,
  `shift` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` varchar(10) NOT NULL,
  `nama` varchar(50) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `no_hp` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `jenis_kelamin` char(1) DEFAULT NULL,
  `tanggal_daftar` date DEFAULT NULL,
  `total_kunjungan` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan_paket`
--

CREATE TABLE `penggunaan_paket` (
  `id_penggunaan` varchar(10) NOT NULL,
  `id_pelanggan` varchar(10) DEFAULT NULL,
  `id_paket` varchar(10) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `jumlah_terpakai` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `sisa_layanan` int(11) DEFAULT NULL,
  `total_diskon` decimal(10,2) DEFAULT NULL,
  `catatan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `persons`
--

CREATE TABLE `persons` (
  `kasir` int(11) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(10) NOT NULL,
  `id_pelanggan` varchar(10) DEFAULT NULL,
  `id_jadwal` varchar(10) DEFAULT NULL,
  `total_bayar` decimal(10,2) DEFAULT NULL,
  `metode_pembayaran` varchar(20) DEFAULT NULL,
  `tanggal_transaksi` date DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `diskon` decimal(10,2) DEFAULT NULL,
  `kembalian` decimal(10,2) DEFAULT NULL,
  `kasir` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `gaji_pegawai`
--
ALTER TABLE `gaji_pegawai`
  ADD PRIMARY KEY (`id_gaji`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `jadwal_cuci`
--
ALTER TABLE `jadwal_cuci`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_kendaraan` (`id_kendaraan`),
  ADD KEY `id_layanan` (`id_layanan`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD PRIMARY KEY (`id_kendaraan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`);

--
-- Indexes for table `komplain`
--
ALTER TABLE `komplain`
  ADD PRIMARY KEY (`id_komplain`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_transaksi` (`id_transaksi`),
  ADD KEY `id_pegawai` (`id_pegawai`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_layanan`);

--
-- Indexes for table `paket_layanan`
--
ALTER TABLE `paket_layanan`
  ADD PRIMARY KEY (`id_paket`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id_pegawai`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `penggunaan_paket`
--
ALTER TABLE `penggunaan_paket`
  ADD PRIMARY KEY (`id_penggunaan`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_paket` (`id_paket`);

--
-- Indexes for table `persons`
--
ALTER TABLE `persons`
  ADD PRIMARY KEY (`kasir`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pelanggan` (`id_pelanggan`),
  ADD KEY `id_jadwal` (`id_jadwal`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `gaji_pegawai`
--
ALTER TABLE `gaji_pegawai`
  ADD CONSTRAINT `gaji_pegawai_ibfk_1` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `jadwal_cuci`
--
ALTER TABLE `jadwal_cuci`
  ADD CONSTRAINT `jadwal_cuci_ibfk_1` FOREIGN KEY (`id_kendaraan`) REFERENCES `kendaraan` (`id_kendaraan`),
  ADD CONSTRAINT `jadwal_cuci_ibfk_2` FOREIGN KEY (`id_layanan`) REFERENCES `layanan` (`id_layanan`),
  ADD CONSTRAINT `jadwal_cuci_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `kendaraan`
--
ALTER TABLE `kendaraan`
  ADD CONSTRAINT `kendaraan_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`);

--
-- Constraints for table `komplain`
--
ALTER TABLE `komplain`
  ADD CONSTRAINT `komplain_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `komplain_ibfk_2` FOREIGN KEY (`id_transaksi`) REFERENCES `transaksi` (`id_transaksi`),
  ADD CONSTRAINT `komplain_ibfk_3` FOREIGN KEY (`id_pegawai`) REFERENCES `pegawai` (`id_pegawai`);

--
-- Constraints for table `penggunaan_paket`
--
ALTER TABLE `penggunaan_paket`
  ADD CONSTRAINT `penggunaan_paket_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `penggunaan_paket_ibfk_2` FOREIGN KEY (`id_paket`) REFERENCES `paket_layanan` (`id_paket`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_pelanggan`) REFERENCES `pelanggan` (`id_pelanggan`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`id_jadwal`) REFERENCES `jadwal_cuci` (`id_jadwal`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
