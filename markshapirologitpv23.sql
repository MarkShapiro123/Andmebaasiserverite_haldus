-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 08, 2025 kell 01:40 PL
-- Serveri versioon: 10.4.32-MariaDB
-- PHP versioon: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Andmebaas: `markshapirologitpv23`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `auto`
--

CREATE TABLE `auto` (
  `autoID` int(11) NOT NULL,
  `autoNr` varchar(30) DEFAULT NULL,
  `mudell` varchar(30) DEFAULT NULL,
  `mark` varchar(30) DEFAULT NULL,
  `vaasta` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `auto`
--

INSERT INTO `auto` (`autoID`, `autoNr`, `mudell`, `mark`, `vaasta`) VALUES
(1, '296YKM', 'Corolla', 'Toyota', 2025),
(2, '456HKG', 'Polo', 'Volkswagen', 1975),
(3, '512ABC', 'Civic', 'Honda', 2023),
(4, '834XYZ', 'Model 3', 'Tesla', 2024),
(5, '178MKL', 'Octavia', 'Škoda', 2022),
(6, '909DFG', 'Mustang', 'Ford', 2021);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `elukoht`
--

CREATE TABLE `elukoht` (
  `elukohtID` int(11) NOT NULL,
  `elukoht` varchar(50) DEFAULT NULL,
  `maakond` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `elukoht`
--

INSERT INTO `elukoht` (`elukohtID`, `elukoht`, `maakond`) VALUES
(1, 'Tallinn', 'Harjumaa'),
(2, 'Tartu', 'Tartumaa'),
(3, 'Pärnu', 'Pärnumaa'),
(4, 'Narva', 'Ida-Virumaa'),
(5, 'Viljandi', 'Viljandimaa'),
(6, 'Rakvere', 'Lääne-Virumaa');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `inimene`
--

CREATE TABLE `inimene` (
  `inimeneID` int(11) NOT NULL,
  `nimi` varchar(50) DEFAULT NULL,
  `synniaeg` date DEFAULT NULL,
  `telefon` char(12) DEFAULT NULL,
  `pikkus` decimal(5,2) DEFAULT NULL,
  `opilaskodu` bit(1) DEFAULT NULL,
  `elukohtID` int(11) DEFAULT NULL,
  `autoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `inimene`
--

INSERT INTO `inimene` (`inimeneID`, `nimi`, `synniaeg`, `telefon`, `pikkus`, `opilaskodu`, `elukohtID`, `autoID`) VALUES
(1, 'Peeter Uus', '2021-12-30', '2568952', 90.50, b'0', 1, 1),
(2, 'Kaarel Oja', '2000-12-30', '2568952', 90.50, b'0', 2, 2),
(3, 'Kask Mati', '1983-12-30', '33333', 140.50, b'0', 3, 3),
(4, 'Peeter Oja', '2021-12-30', '333333', 190.50, b'0', 4, 4),
(5, 'Danila Ivanov', '2021-12-04', '543678', 170.10, b'0', 5, 5),
(6, 'Danila Shapiro', '2021-12-04', '543678', 170.20, b'0', 6, 6);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `loom`
--

CREATE TABLE `loom` (
  `loomID` int(11) NOT NULL,
  `nimi` char(30) DEFAULT NULL,
  `kirjeldus` char(40) DEFAULT NULL,
  `kaal` decimal(5,2) DEFAULT NULL,
  `tyypID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `tyyp`
--

CREATE TABLE `tyyp` (
  `tyypID` int(11) NOT NULL,
  `tyyp` char(30) DEFAULT NULL,
  `kirjeldus` char(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `tyyp`
--

INSERT INTO `tyyp` (`tyypID`, `tyyp`, `kirjeldus`) VALUES
(1, 'kass', 'must'),
(2, 'koer', 'valge'),
(3, 'kilpkonn', 'aeglane'),
(4, 'sisalik', 'kiire'),
(5, 'kapübara', 'lahke'),
(6, 'põder', 'kuri');

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `auto`
--
ALTER TABLE `auto`
  ADD PRIMARY KEY (`autoID`),
  ADD UNIQUE KEY `autoNr` (`autoNr`);

--
-- Indeksid tabelile `elukoht`
--
ALTER TABLE `elukoht`
  ADD PRIMARY KEY (`elukohtID`),
  ADD UNIQUE KEY `elukoht` (`elukoht`);

--
-- Indeksid tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD PRIMARY KEY (`inimeneID`),
  ADD UNIQUE KEY `nimi` (`nimi`),
  ADD KEY `fk_elukoht` (`elukohtID`),
  ADD KEY `fk_auto` (`autoID`);

--
-- Indeksid tabelile `loom`
--
ALTER TABLE `loom`
  ADD PRIMARY KEY (`loomID`),
  ADD KEY `fk_tyyp` (`tyypID`);

--
-- Indeksid tabelile `tyyp`
--
ALTER TABLE `tyyp`
  ADD PRIMARY KEY (`tyypID`),
  ADD UNIQUE KEY `tyyp` (`tyyp`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `auto`
--
ALTER TABLE `auto`
  MODIFY `autoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `elukoht`
--
ALTER TABLE `elukoht`
  MODIFY `elukohtID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `inimene`
--
ALTER TABLE `inimene`
  MODIFY `inimeneID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT tabelile `loom`
--
ALTER TABLE `loom`
  MODIFY `loomID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT tabelile `tyyp`
--
ALTER TABLE `tyyp`
  MODIFY `tyypID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `inimene`
--
ALTER TABLE `inimene`
  ADD CONSTRAINT `fk_auto` FOREIGN KEY (`autoID`) REFERENCES `auto` (`autoID`),
  ADD CONSTRAINT `fk_elukoht` FOREIGN KEY (`elukohtID`) REFERENCES `elukoht` (`elukohtID`);

--
-- Piirangud tabelile `loom`
--
ALTER TABLE `loom`
  ADD CONSTRAINT `fk_tyyp` FOREIGN KEY (`tyypID`) REFERENCES `tyyp` (`tyypID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
