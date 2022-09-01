-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2020 at 04:42 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `goritma_coffe`
--

-- --------------------------------------------------------

--
-- Table structure for table `humas`
--

CREATE TABLE `humas` (
  `NIP_Humas` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `humas`
--

INSERT INTO `humas` (`NIP_Humas`, `Nama`) VALUES
('H11113113', 'Fiani'),
('H11141114', 'Hasan'),
('H11211112', 'Febria'),
('H11311111', 'Fathur'),
('H15111115', 'Monica');

-- --------------------------------------------------------

--
-- Table structure for table `kasir`
--

CREATE TABLE `kasir` (
  `NIP_Kasir` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kasir`
--

INSERT INTO `kasir` (`NIP_Kasir`, `Nama`) VALUES
('K11113418', 'Tsaniya'),
('K11121116', 'Nabhila'),
('K11341117', 'Nadya'),
('K12311118', 'Nesya'),
('K16711117', 'Vania');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `Id_Menu` varchar(50) NOT NULL,
  `Harga` varchar(50) NOT NULL,
  `Id_Produk_Kopi` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`Id_Menu`, `Harga`, `Id_Produk_Kopi`, `Nama`) VALUES
('455', '27000', '238', 'Excelsa'),
('456', '15000', '234', 'Arabika'),
('457', '19000', '235', 'Robusta'),
('458', '25000', '236', 'Luwak'),
('459', '30000', '237', 'Liberika');

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `Id_Pegawai` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Gender` char(2) NOT NULL,
  `No_Telp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pegawai`
--

INSERT INTO `pegawai` (`Id_Pegawai`, `Nama`, `Gender`, `No_Telp`) VALUES
('H11113113', 'Fiani', 'P', '081568277733'),
('H11141114', 'Hasan', 'L', '082536777364'),
('H11211112', 'Febria', 'P', '082245363773'),
('H11311111', 'Fathur', 'L', '081335566778'),
('H15111115', 'Monica', 'P', '082372632773'),
('K11113418', 'Tsaniya', 'P', '083746374373'),
('K11121116', 'Nabhila', 'P', '081273773777'),
('K11341117', 'Nadya', 'P', '082326737236'),
('K12311118', 'Nesya', 'P', '082563773644'),
('K16711117', 'Vania', 'P', '082663746388');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `Id_Pelanggan` varchar(50) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `No_HP` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`Id_Pelanggan`, `Nama`, `No_HP`) VALUES
('11223344', 'Naufal', '082355878993'),
('12345678', 'Budi', '081221181315'),
('21222324', 'Kevin', '082129278888'),
('55667788', 'Risa', '082534384383'),
('87654321', 'Ahmadi', '081326557366');

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `Id_Pesanan` varchar(50) NOT NULL,
  `Id_Menu` varchar(50) NOT NULL,
  `Id_Pelanggan` varchar(50) NOT NULL,
  `NIP_Kasir` varchar(50) NOT NULL,
  `Total_Harga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`Id_Pesanan`, `Id_Menu`, `Id_Pelanggan`, `NIP_Kasir`, `Total_Harga`) VALUES
('772', '455', '21222324', 'K16711117', '30000'),
('773', '459', '55667788', 'K11113418', '30000'),
('774', '458', '11223344', 'K12311118', '25000'),
('775', '457', '87654321', 'K11341117', '19000'),
('776', '456', '12345678', 'K11121116', '15000');

-- --------------------------------------------------------

--
-- Table structure for table `produk_kopi`
--

CREATE TABLE `produk_kopi` (
  `Id_Produk_Kopi` varchar(50) NOT NULL,
  `Nama_Produk_Kopi` varchar(50) NOT NULL,
  `Id_Supplier` varchar(50) NOT NULL,
  `Id_Warehouse` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_kopi`
--

INSERT INTO `produk_kopi` (`Id_Produk_Kopi`, `Nama_Produk_Kopi`, `Id_Supplier`, `Id_Warehouse`) VALUES
('234', 'Arabika', '112', '345'),
('235', 'Robusta', '112', '346'),
('236', 'Luwak', '112', '347'),
('237', 'Liberika', '112', '348'),
('238', 'Excelsa', '112', '349');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Id_Supplier` varchar(50) NOT NULL,
  `NamaSupplier` varchar(50) NOT NULL,
  `NIP_Humas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Id_Supplier`, `NamaSupplier`, `NIP_Humas`) VALUES
('112', 'Jaya Gemilang', 'H11311111'),
('113', 'kopi Kapal Selam', 'H11211112'),
('114', 'coffeeland ', 'H11113113'),
('115', 'Ramesia', 'H11141114'),
('116', 'JPW indonesia', 'H15111115');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `Id_Warehouse` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `warehouse`
--

INSERT INTO `warehouse` (`Id_Warehouse`, `Alamat`) VALUES
('345', 'Jl.Bangreng no 10'),
('346', 'Jl.Kiaracondong no 23'),
('347', 'Jl. Martaninata no 2'),
('348', 'Jl. Bojongsoang no 12'),
('349', 'Jl. Biola no 12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `humas`
--
ALTER TABLE `humas`
  ADD PRIMARY KEY (`NIP_Humas`);

--
-- Indexes for table `kasir`
--
ALTER TABLE `kasir`
  ADD PRIMARY KEY (`NIP_Kasir`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id_Menu`),
  ADD KEY `menu_ibfk_1` (`Id_Produk_Kopi`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`Id_Pegawai`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`Id_Pelanggan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`Id_Pesanan`),
  ADD KEY `Id_Menu` (`Id_Menu`),
  ADD KEY `NIP_Kasir` (`NIP_Kasir`),
  ADD KEY `pesanan_ibfk_1` (`Id_Pelanggan`);

--
-- Indexes for table `produk_kopi`
--
ALTER TABLE `produk_kopi`
  ADD PRIMARY KEY (`Id_Produk_Kopi`),
  ADD KEY `Id_Supplier` (`Id_Supplier`),
  ADD KEY `Id_Warehouse` (`Id_Warehouse`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id_Supplier`),
  ADD KEY `NIP_Humas` (`NIP_Humas`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Id_Warehouse`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `humas`
--
ALTER TABLE `humas`
  ADD CONSTRAINT `humas_ibfk_1` FOREIGN KEY (`NIP_Humas`) REFERENCES `pegawai` (`Id_Pegawai`);

--
-- Constraints for table `kasir`
--
ALTER TABLE `kasir`
  ADD CONSTRAINT `kasir_ibfk_1` FOREIGN KEY (`NIP_Kasir`) REFERENCES `pegawai` (`Id_Pegawai`);

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`Id_Produk_Kopi`) REFERENCES `produk_kopi` (`Id_Produk_Kopi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`Id_Pelanggan`) REFERENCES `pelanggan` (`Id_Pelanggan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`Id_Menu`) REFERENCES `menu` (`Id_Menu`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pesanan_ibfk_3` FOREIGN KEY (`NIP_Kasir`) REFERENCES `kasir` (`NIP_Kasir`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `produk_kopi`
--
ALTER TABLE `produk_kopi`
  ADD CONSTRAINT `produk_kopi_ibfk_1` FOREIGN KEY (`Id_Supplier`) REFERENCES `supplier` (`Id_Supplier`),
  ADD CONSTRAINT `produk_kopi_ibfk_2` FOREIGN KEY (`Id_Warehouse`) REFERENCES `warehouse` (`Id_Warehouse`);

--
-- Constraints for table `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`NIP_Humas`) REFERENCES `humas` (`NIP_Humas`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
