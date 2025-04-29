-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Loomise aeg: Aprill 29, 2025 kell 01:04 PL
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
-- Andmebaas: `markshapiro`
--

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `firma`
--

CREATE TABLE `firma` (
  `firmaID` int(11) NOT NULL,
  `firmaNimi` varchar(20) DEFAULT NULL,
  `aadress` varchar(20) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `firma`
--

INSERT INTO `firma` (`firmaID`, `firmaNimi`, `aadress`, `telefon`) VALUES
(1, 'ArvutiOU', 'Pärnu mnt. 441a', '+372 55768495'),
(2, 'AndmebaasOU', 'Seedri tn 11', '+372 54701194'),
(3, 'TTHK', 'Sõpruse pst 182', '+372 55118778'),
(4, 'Maxima', 'Sõpruse pst 171', '+372 56175835'),
(5, 'Rimi', 'Sõpruse pst 174', '+372 52985609');

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `praktijuhendaja`
--

CREATE TABLE `praktijuhendaja` (
  `praktikajuhendajaID` int(11) NOT NULL,
  `eesnimi` varchar(25) DEFAULT NULL,
  `perekonnanimi` varchar(25) DEFAULT NULL,
  `synniaeg` date DEFAULT NULL,
  `telefon` varchar(30) DEFAULT NULL,
  `palk` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `praktijuhendaja`
--

INSERT INTO `praktijuhendaja` (`praktikajuhendajaID`, `eesnimi`, `perekonnanimi`, `synniaeg`, `telefon`, `palk`) VALUES
(1, 'Lury', 'Avik', '1998-01-06', '+372 55803483', 2000),
(2, 'Mikhail', 'Agapov', '1981-05-04', '+372 55315687', 3000),
(3, 'Anton', 'Buketov', '1978-07-01', '+372 55715893', 2400),
(4, 'Sergei', 'Luchkin', '1980-05-03', '+372 55096071', 1800),
(5, 'Gert', 'Pant', '1985-08-21', '+372 55346901', 2350);

-- --------------------------------------------------------

--
-- Tabeli struktuur tabelile `praktikabaas`
--

CREATE TABLE `praktikabaas` (
  `praktikabaasID` int(11) NOT NULL,
  `firmaID` int(11) DEFAULT NULL,
  `praktikatingimused` varchar(20) DEFAULT NULL,
  `arvutiprogramm` varchar(20) DEFAULT NULL,
  `juhendajaID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Andmete tõmmistamine tabelile `praktikabaas`
--

INSERT INTO `praktikabaas` (`praktikabaasID`, `firmaID`, `praktikatingimused`, `arvutiprogramm`, `juhendajaID`) VALUES
(1, 1, 'Linux oskused', 'LINUX ja BSD', 1),
(2, 2, 'OSPF oskused', 'Arvutivõrgud', 2),
(3, 5, 'IT korralduse oskuse', 'IT korralduse alused', 5),
(4, 4, 'Õpitee oskused', 'Õpitee ja töökeskkon', 4),
(5, 3, 'ARDUINO oskused', 'Robootika ', 3);

--
-- Indeksid tõmmistatud tabelitele
--

--
-- Indeksid tabelile `firma`
--
ALTER TABLE `firma`
  ADD PRIMARY KEY (`firmaID`),
  ADD UNIQUE KEY `frimaNimi` (`firmaNimi`);

--
-- Indeksid tabelile `praktijuhendaja`
--
ALTER TABLE `praktijuhendaja`
  ADD PRIMARY KEY (`praktikajuhendajaID`),
  ADD UNIQUE KEY `telefon` (`telefon`);

--
-- Indeksid tabelile `praktikabaas`
--
ALTER TABLE `praktikabaas`
  ADD PRIMARY KEY (`praktikabaasID`),
  ADD KEY `firmaID` (`firmaID`),
  ADD KEY `juhendajaID` (`juhendajaID`);

--
-- AUTO_INCREMENT tõmmistatud tabelitele
--

--
-- AUTO_INCREMENT tabelile `firma`
--
ALTER TABLE `firma`
  MODIFY `firmaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT tabelile `praktijuhendaja`
--
ALTER TABLE `praktijuhendaja`
  MODIFY `praktikajuhendajaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT tabelile `praktikabaas`
--
ALTER TABLE `praktikabaas`
  MODIFY `praktikabaasID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tõmmistatud tabelite piirangud
--

--
-- Piirangud tabelile `praktikabaas`
--
ALTER TABLE `praktikabaas`
  ADD CONSTRAINT `praktikabaas_ibfk_1` FOREIGN KEY (`firmaID`) REFERENCES `firma` (`firmaID`),
  ADD CONSTRAINT `praktikabaas_ibfk_2` FOREIGN KEY (`juhendajaID`) REFERENCES `praktijuhendaja` (`praktikajuhendajaID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
