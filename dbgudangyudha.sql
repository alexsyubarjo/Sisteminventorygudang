-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2023 at 10:35 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbgudangyudha`
--

-- --------------------------------------------------------

--
-- Table structure for table `backoffice`
--

CREATE TABLE `backoffice` (
  `id_bo` int(11) NOT NULL,
  `usn_bo` varchar(50) NOT NULL,
  `pass_bo` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `backoffice`
--

INSERT INTO `backoffice` (`id_bo`, `usn_bo`, `pass_bo`) VALUES
(1234, 'Admin1', 'admin'),
(5678, 'Admin2', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(100) NOT NULL,
  `kategori_brg` varchar(50) NOT NULL,
  `stock_awal` int(11) NOT NULL,
  `hrg_jual` int(11) NOT NULL,
  `hrg_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `distributor`
--

CREATE TABLE `distributor` (
  `id_distributor` int(11) NOT NULL,
  `nama_distributor` varchar(100) NOT NULL,
  `inf_bayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `distributor`
--

INSERT INTO `distributor` (`id_distributor`, `nama_distributor`, `inf_bayar`) VALUES
(1254, 'PT. Yudha Makmur', 'Sudah lunas beberapa cicilan bulan ini'),
(2423, 'PT. Riwanto Oye', 'Lunas Boss'),
(5466, 'PT. Purwanto', 'Lunas Bos');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_splr` int(11) NOT NULL,
  `nama_splr` varchar(100) NOT NULL,
  `inf_pembayar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transin`
--

CREATE TABLE `transin` (
  `id_in` int(11) NOT NULL,
  `tgl_beli` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jml_beli` int(11) NOT NULL,
  `ttl_beli` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `id_splr` int(11) NOT NULL,
  `id_bo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transout`
--

CREATE TABLE `transout` (
  `id_out` int(11) NOT NULL,
  `tgl_jual` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jml_jual` int(11) NOT NULL,
  `ttl_jual` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `id_distributor` int(11) NOT NULL,
  `id_bo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `updatestock`
--

CREATE TABLE `updatestock` (
  `id_upstock` int(11) NOT NULL,
  `tgl_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jml_update` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `backoffice`
--
ALTER TABLE `backoffice`
  ADD PRIMARY KEY (`id_bo`);

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `distributor`
--
ALTER TABLE `distributor`
  ADD PRIMARY KEY (`id_distributor`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_splr`);

--
-- Indexes for table `transin`
--
ALTER TABLE `transin`
  ADD PRIMARY KEY (`id_in`),
  ADD KEY `id_bo` (`id_bo`),
  ADD KEY `id_splr` (`id_splr`),
  ADD KEY `idBrg` (`id_brg`);

--
-- Indexes for table `transout`
--
ALTER TABLE `transout`
  ADD PRIMARY KEY (`id_out`),
  ADD KEY `idbrng` (`id_brg`),
  ADD KEY `idbo` (`id_bo`),
  ADD KEY `id_distributor` (`id_distributor`);

--
-- Indexes for table `updatestock`
--
ALTER TABLE `updatestock`
  ADD PRIMARY KEY (`id_upstock`),
  ADD KEY `id_brg` (`id_brg`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transin`
--
ALTER TABLE `transin`
  ADD CONSTRAINT `idBrg` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`);

--
-- Constraints for table `transout`
--
ALTER TABLE `transout`
  ADD CONSTRAINT `id_distributor` FOREIGN KEY (`id_distributor`) REFERENCES `distributor` (`id_distributor`);

--
-- Constraints for table `updatestock`
--
ALTER TABLE `updatestock`
  ADD CONSTRAINT `id_brg` FOREIGN KEY (`id_brg`) REFERENCES `barang` (`id_brg`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
