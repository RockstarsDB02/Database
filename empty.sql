-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Gegenereerd op: 29 feb 2024 om 10:13
-- Serverversie: 10.4.28-MariaDB
-- PHP-versie: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS squadhealth;
USE squadhealth;

--
-- Database: `squadhealth`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateHealthCheckVersionStatus` (IN `input_version_id` INT)   BEGIN
    DECLARE v_invitations_count INT;

    SELECT COUNT(*) INTO v_invitations_count
    FROM `invitation_link`
    WHERE `version_id` = input_version_id;

    IF v_invitations_count > 0 THEN
        UPDATE `healthcheck_version`
        SET `isActive` = 1
        WHERE `version_id` = input_version_id;
    ELSE
        UPDATE `healthcheck_version`
        SET `isActive` = 0
        WHERE `version_id` = input_version_id;
    END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `answer`
--

CREATE TABLE `answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `answerColor` enum('Red','Yellow','Green') DEFAULT NULL,
  `comment` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `company_squad`
--

CREATE TABLE `company_squad` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `invitation_link`
--

CREATE TABLE `invitation_link` (
  `id` int(11) NOT NULL,
  `healthcheck_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `uniqueLink` varchar(255) DEFAULT NULL,
  `isUsed` tinyint(1) DEFAULT 0,
  `expiresAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `invitation_link`
--
DELIMITER $$
CREATE TRIGGER `activate_healthcheck_after_invitation_insert` AFTER INSERT ON `invitation_link` FOR EACH ROW BEGIN
    CALL UpdateHealthCheckVersionStatus(NEW.version_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_healthcheck_version_status_after_invitation_delete` AFTER DELETE ON `invitation_link` FOR EACH ROW BEGIN
    CALL UpdateHealthCheckVersionStatus(OLD.version_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `update_healthcheck_version_status_after_invitation_update` AFTER UPDATE ON `invitation_link` FOR EACH ROW BEGIN
    IF OLD.version_id != NEW.version_id THEN
        CALL UpdateHealthCheckVersionStatus(OLD.version_id);
        CALL UpdateHealthCheckVersionStatus(NEW.version_id);
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `healthcheck_id` int(11) DEFAULT NULL,
  `priority` int(11) DEFAULT 0,
  `text` text DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `version_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Triggers `question`
--
DELIMITER $$
CREATE TRIGGER `prevent_question_change_if_healthcheck_version_active` BEFORE UPDATE ON `question` FOR EACH ROW BEGIN
    DECLARE v_healthcheck_status TINYINT;

    SELECT isActive INTO v_healthcheck_status
    FROM `healthcheck_version`
    WHERE `version_id` = OLD.version_id;

    IF v_healthcheck_status = 1 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot update question when healthcheck version is active';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `healthcheck`
--

CREATE TABLE `healthcheck` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `healthcheck_version`
--

CREATE TABLE `healthcheck_version` (
  `version_id` int(11) NOT NULL,
  `healthcheck_id` int(11) DEFAULT NULL,
  `version_number` int(11) DEFAULT NULL,
  `creation_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `notes` text DEFAULT NULL,
  `isActive` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `squad`
--

CREATE TABLE `squad` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `squad_member`
--

CREATE TABLE `squad_member` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `squad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `squad_healthcheck`
--

CREATE TABLE `squad_healthcheck` (
  `id` int(11) NOT NULL,
  `squad_id` int(11) DEFAULT NULL,
  `healthcheck_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `passwordHash` varchar(255) DEFAULT NULL,
  `role` enum('Manager','Developer') DEFAULT 'Developer',
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexen voor tabel `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `company_squad`
--
ALTER TABLE `company_squad`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `squad_id` (`squad_id`);

--
-- Indexen voor tabel `invitation_link`
--
ALTER TABLE `invitation_link`
  ADD PRIMARY KEY (`id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexen voor tabel `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`),
  ADD KEY `version_id` (`version_id`);

--
-- Indexen voor tabel `healthcheck`
--
ALTER TABLE `healthcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexen voor tabel `healthcheck_version`
--
ALTER TABLE `healthcheck_version`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`);

--
-- Indexen voor tabel `squad`
--
ALTER TABLE `squad`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `squad_member`
--
ALTER TABLE `squad_member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `squad_id` (`squad_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexen voor tabel `squad_healthcheck`
--
ALTER TABLE `squad_healthcheck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `squad_id` (`squad_id`),
  ADD KEY `healthcheck_id` (`healthcheck_id`);

--
-- Indexen voor tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `answer`
--
ALTER TABLE `answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `company_squad`
--
ALTER TABLE `company_squad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `invitation_link`
--
ALTER TABLE `invitation_link`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `healthcheck`
--
ALTER TABLE `healthcheck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `healthcheck_version`
--
ALTER TABLE `healthcheck_version`
  MODIFY `version_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `squad`
--
ALTER TABLE `squad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `squad_member`
--
ALTER TABLE `squad_member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


ALTER TABLE question RENAME COLUMN text TO description;
ALTER TABLE question ADD COLUMN title VARCHAR(255);
ALTER TABLE answer ADD COLUMN flagged BOOLEAN DEFAULT FALSE;

--
-- AUTO_INCREMENT voor een tabel `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
