-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 22, 2020 at 04:45 AM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sewamobil`
--

-- --------------------------------------------------------

--
-- Table structure for table `armada`
--

CREATE TABLE `armada` (
  `kode_mobil` varchar(3) NOT NULL,
  `jenis_mobil` char(10) NOT NULL,
  `merk_mobil` char(10) NOT NULL,
  `jml_penumpang` int(2) NOT NULL,
  `jml_mobil` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `armada`
--

INSERT INTO `armada` (`kode_mobil`, `jenis_mobil`, `merk_mobil`, `jml_penumpang`, `jml_mobil`) VALUES
('a01', 'sedan', 'civic', 4, 1),
('a02', 'sedan', 'avega', 4, 2),
('b01', 'MPV', 'innova', 7, 2),
('b02', 'MPV', 'xpander', 7, 2),
('c01', 'SUV', 'terrios', 6, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detailsewa`
--

CREATE TABLE `detailsewa` (
  `kode_sewa` varchar(5) NOT NULL,
  `kode_mobil` varchar(3) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailsewa`
--

INSERT INTO `detailsewa` (`kode_sewa`, `kode_mobil`) VALUES
('s0001', 'a01'),
('s0006', 'a01'),
('s0010', 'a01'),
('s0011', 'a01'),
('s0013', 'a01'),
('s0014', 'a01'),
('s0015', 'a01'),
('s0016', 'a01'),
('s0004', 'a02'),
('s0007', 'a02'),
('s0008', 'a02'),
('s0012', 'a02'),
('s0017', 'a02'),
('s0001', 'b01'),
('s0016', 'b01'),
('s0002', 'b02'),
('s0003', 'b02'),
('s0005', 'b02'),
('s0011', 'b02'),
('s0003', 'c01'),
('s0005', 'c01'),
('s0007', 'c01'),
('s0008', 'c01'),
('s0010', 'c01'),
('s0012', 'c01'),
('s0013', 'c01'),
('s0014', 'c01'),
('s0015', 'c01');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `no_pel` int(3) NOT NULL,
  `jenis_pel` char(10) NOT NULL,
  `nama_pel` char(10) NOT NULL,
  `alamat_pel` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`no_pel`, `jenis_pel`, `nama_pel`, `alamat_pel`) VALUES
(1, 'personal', 'andi', 'bandung'),
(2, 'perusahaan', 'budi', 'cimahi'),
(3, 'personal', 'cindi', 'bandung');

-- --------------------------------------------------------

--
-- Table structure for table `sewa`
--

CREATE TABLE `sewa` (
  `kode_sewa` varchar(5) NOT NULL,
  `no_pel` int(3) NOT NULL,
  `tgl_sewa` date NOT NULL,
  `tot_mobil` int(2) NOT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `tot_harga` int(20) NOT NULL,
  `denda` int(20) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sewa`
--

INSERT INTO `sewa` (`kode_sewa`, `no_pel`, `tgl_sewa`, `tot_mobil`, `tgl_kembali`, `tot_harga`, `denda`) VALUES
('s0001', 2, '2019-01-02', 2, '2019-01-02', 750000, 0),
('s0002', 1, '2019-01-04', 1, '2019-01-05', 800000, 0),
('s0003', 2, '2019-01-10', 2, '2020-04-22', 850000, 85000),
('s0004', 3, '2019-01-15', 1, '2019-01-16', 700000, 0),
('s0005', 1, '2020-04-22', 2, NULL, 850000, 0),
('s0006', 3, '2020-04-13', 2, NULL, 350000, 0),
('s0007', 1, '2020-04-20', 2, NULL, 800000, 0),
('s0008', 2, '2020-04-17', 2, NULL, 800000, 0),
('s0010', 2, '2020-04-16', 2, '2020-04-22', 800000, 80000),
('s0011', 1, '2020-04-08', 2, NULL, 750000, 150000),
('s0012', 2, '2020-04-15', 2, NULL, 0, 0),
('s0013', 1, '2020-04-14', 2, NULL, 0, 0),
('s0014', 3, '2020-04-16', 2, NULL, 0, 0),
('s0015', 2, '2020-04-23', 2, NULL, 0, 0),
('s0016', 3, '2020-04-21', 2, NULL, 750000, 0),
('s0017', 2, '2020-04-13', 2, NULL, 350000, 35000);

-- --------------------------------------------------------

--
-- Table structure for table `tipemobil`
--

CREATE TABLE `tipemobil` (
  `jenis_mobil` char(10) NOT NULL,
  `harga_sewa` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipemobil`
--

INSERT INTO `tipemobil` (`jenis_mobil`, `harga_sewa`) VALUES
('MPV', 400000),
('sedan', 350000),
('SUV', 450000),
('TRUK', 1000000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `armada`
--
ALTER TABLE `armada`
  ADD PRIMARY KEY (`kode_mobil`),
  ADD KEY `jenis_mobil` (`jenis_mobil`);

--
-- Indexes for table `detailsewa`
--
ALTER TABLE `detailsewa`
  ADD PRIMARY KEY (`kode_sewa`,`kode_mobil`),
  ADD KEY `kode_mobil` (`kode_mobil`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`no_pel`);

--
-- Indexes for table `sewa`
--
ALTER TABLE `sewa`
  ADD PRIMARY KEY (`kode_sewa`),
  ADD KEY `no_pel` (`no_pel`);

--
-- Indexes for table `tipemobil`
--
ALTER TABLE `tipemobil`
  ADD PRIMARY KEY (`jenis_mobil`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `armada`
--
ALTER TABLE `armada`
  ADD CONSTRAINT `armada_ibfk_1` FOREIGN KEY (`jenis_mobil`) REFERENCES `tipemobil` (`jenis_mobil`);

--
-- Constraints for table `detailsewa`
--
ALTER TABLE `detailsewa`
  ADD CONSTRAINT `detailsewa_ibfk_1` FOREIGN KEY (`kode_mobil`) REFERENCES `armada` (`kode_mobil`),
  ADD CONSTRAINT `detailsewa_ibfk_2` FOREIGN KEY (`kode_sewa`) REFERENCES `sewa` (`kode_sewa`);

--
-- Constraints for table `sewa`
--
ALTER TABLE `sewa`
  ADD CONSTRAINT `sewa_ibfk_1` FOREIGN KEY (`no_pel`) REFERENCES `pelanggan` (`no_pel`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
