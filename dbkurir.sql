-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2020 at 03:56 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkurir`
--

-- --------------------------------------------------------

--
-- Table structure for table `counter`
--

CREATE TABLE `counter` (
  `id_counter` int(11) NOT NULL,
  `nama_counter` varchar(50) NOT NULL,
  `alamat_counter` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `counter`
--

INSERT INTO `counter` (`id_counter`, `nama_counter`, `alamat_counter`) VALUES
(1, 'DE Galaxy', 'Bekasi'),
(2, 'DE Mangga Dua', 'Jakarta'),
(3, 'DE Depok Limo', 'Depok'),
(4, 'DE BSD City', 'Tangerang'),
(5, 'DE Sentul', 'Bogor');

-- --------------------------------------------------------

--
-- Table structure for table `dari_kota`
--

CREATE TABLE `dari_kota` (
  `id_darikota` int(11) NOT NULL,
  `nama_darikota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dari_kota`
--

INSERT INTO `dari_kota` (`id_darikota`, `nama_darikota`) VALUES
(1, 'Jakarta'),
(2, 'Bogor'),
(3, 'Depok'),
(4, 'Tangerang'),
(5, 'Bekasi');

-- --------------------------------------------------------

--
-- Table structure for table `detail_user`
--

CREATE TABLE `detail_user` (
  `id_user` int(11) NOT NULL,
  `j_kelamin` enum('laki-laki','perempuan') DEFAULT NULL,
  `tgl_lahir` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_user`
--

INSERT INTO `detail_user` (`id_user`, `j_kelamin`, `tgl_lahir`) VALUES
(1, 'laki-laki', '2020-08-12'),
(2, 'laki-laki', '2020-06-10'),
(16, NULL, '0000-00-00');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pkt`
--

CREATE TABLE `jenis_pkt` (
  `id_jpkt` int(11) NOT NULL,
  `nama_jpkt` varchar(50) NOT NULL,
  `harga` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jenis_pkt`
--

INSERT INTO `jenis_pkt` (`id_jpkt`, `nama_jpkt`, `harga`) VALUES
(1, 'Dokumen', '10000'),
(3, 'Barang', '15000');

-- --------------------------------------------------------

--
-- Table structure for table `ke_kota`
--

CREATE TABLE `ke_kota` (
  `id_kekota` int(11) NOT NULL,
  `nama_kekota` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ke_kota`
--

INSERT INTO `ke_kota` (`id_kekota`, `nama_kekota`) VALUES
(1, 'Jakarta'),
(2, 'Bogor'),
(3, 'Depok'),
(4, 'Tangerang'),
(5, 'Bekasi');

-- --------------------------------------------------------

--
-- Table structure for table `kurir`
--

CREATE TABLE `kurir` (
  `id_kurir` int(11) NOT NULL,
  `nama_kurir` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kurir`
--

INSERT INTO `kurir` (`id_kurir`, `nama_kurir`) VALUES
(1, 'Dicky'),
(2, 'Farhan');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `nama_pembayaran` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `nama_pembayaran`) VALUES
(1, 'Bank Transfer'),
(2, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `id_status` int(11) NOT NULL,
  `nama_status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id_status`, `nama_status`) VALUES
(1, 'Pending Pickup'),
(2, 'Picked Up'),
(3, 'Manifested'),
(4, 'On Process'),
(5, 'On Transit'),
(6, 'Received On Destination'),
(7, 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_resi` int(15) NOT NULL,
  `tgl` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_user` int(11) NOT NULL,
  `id_darikota` int(11) NOT NULL,
  `id_kekota` int(11) NOT NULL,
  `nama_penerima` varchar(50) NOT NULL,
  `alamat_penerima` varchar(100) NOT NULL,
  `id_jpkt` int(11) NOT NULL,
  `id_counter` int(11) DEFAULT NULL,
  `id_pembayaran` int(11) NOT NULL,
  `id_kurir` int(11) DEFAULT NULL,
  `id_status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`no_resi`, `tgl`, `id_user`, `id_darikota`, `id_kekota`, `nama_penerima`, `alamat_penerima`, `id_jpkt`, `id_counter`, `id_pembayaran`, `id_kurir`, `id_status`) VALUES
(220620001, '2020-06-22 03:00:06', 2, 1, 5, 'Jenal', 'Pondok Ungu Permai Blok E16 no 29, Kaliabang Tengah, Bekasi Utara', 3, 2, 2, 1, 3),
(230620002, '2020-06-23 03:10:26', 2, 3, 1, 'Dewi', 'Cijantung, Jakarta Timur', 3, NULL, 2, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(12) NOT NULL,
  `pw` varchar(12) NOT NULL,
  `level` enum('admin','user') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `pw`, `level`) VALUES
(1, 'Zaenal', 'nals', '123', 'admin'),
(2, 'test', 'tes', 'tes', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `counter`
--
ALTER TABLE `counter`
  ADD PRIMARY KEY (`id_counter`);

--
-- Indexes for table `dari_kota`
--
ALTER TABLE `dari_kota`
  ADD PRIMARY KEY (`id_darikota`);

--
-- Indexes for table `detail_user`
--
ALTER TABLE `detail_user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `jenis_pkt`
--
ALTER TABLE `jenis_pkt`
  ADD PRIMARY KEY (`id_jpkt`);

--
-- Indexes for table `ke_kota`
--
ALTER TABLE `ke_kota`
  ADD PRIMARY KEY (`id_kekota`);

--
-- Indexes for table `kurir`
--
ALTER TABLE `kurir`
  ADD PRIMARY KEY (`id_kurir`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id_status`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_resi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `counter`
--
ALTER TABLE `counter`
  MODIFY `id_counter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `dari_kota`
--
ALTER TABLE `dari_kota`
  MODIFY `id_darikota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jenis_pkt`
--
ALTER TABLE `jenis_pkt`
  MODIFY `id_jpkt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ke_kota`
--
ALTER TABLE `ke_kota`
  MODIFY `id_kekota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `kurir`
--
ALTER TABLE `kurir`
  MODIFY `id_kurir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `id_status` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
