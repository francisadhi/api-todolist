-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               10.4.8-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table testdb.bank_balance
CREATE TABLE IF NOT EXISTS `bank_balance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(50) DEFAULT NULL,
  `balance_achieve` int(50) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `enable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.bank_balance: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank_balance` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_balance` ENABLE KEYS */;

-- Dumping structure for table testdb.bank_balance_history
CREATE TABLE IF NOT EXISTS `bank_balance_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bankBalanceId` int(11) DEFAULT NULL,
  `balanceBefore` int(50) DEFAULT NULL,
  `balanceAfter` int(50) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `type` enum('debit','kredit') DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `userAgent` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.bank_balance_history: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank_balance_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_balance_history` ENABLE KEYS */;

-- Dumping structure for table testdb.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.roles: ~3 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `createdAt`, `updatedAt`) VALUES
	(1, 'user', '2022-03-13 06:41:50', '2022-03-13 06:41:50'),
	(2, 'chief', '2022-03-13 06:42:18', '2022-03-13 06:42:18'),
	(3, 'admin', '2022-03-13 06:42:38', '2022-03-13 06:42:38');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table testdb.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(60) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
	(1, 'admin', 'admin@bezkoder.com', '$2a$08$w3cYCF.N0UQZO19z8CQSZ.whzxFS5vMoi9k51g3TQx9r5tkwrIXO2', '2020-01-13 09:21:51', '2020-01-13 09:21:51'),
	(2, 'adhi', 'adhi@adhi.com', '$2a$08$AC3j1isAj4n6D0X35nliTOPXDQm14A0twCA9Pw/IW9HqzFZSGUDu.', '2022-03-13 07:25:23', '2022-03-13 07:25:23'),
	(3, 'adhi2', 'adhi2@adhi.com', '$2a$08$mivgbsdbDElDagQ36mCtc.mZqVfVm283s6K3W/focCfN48Plx8IpG', '2022-03-14 06:22:54', '2022-03-14 06:22:54');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table testdb.user_balances
CREATE TABLE IF NOT EXISTS `user_balances` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balance` int(11) DEFAULT NULL,
  `balanceAchieve` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `user_balances_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.user_balances: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_balances` DISABLE KEYS */;
INSERT INTO `user_balances` (`id`, `balance`, `balanceAchieve`, `createdAt`, `updatedAt`, `userId`) VALUES
	(1, 500000, 500000, '2022-03-14 16:15:24', '2022-03-14 16:15:24', 2),
	(2, 500000, 1000000, '2022-03-14 16:15:45', '2022-03-14 16:15:45', 2),
	(3, 50000, 1050000, '2022-03-14 16:16:03', '2022-03-14 16:16:03', 2),
	(4, 50000, 1100000, '2022-03-14 16:27:29', '2022-03-14 16:27:29', 2);
/*!40000 ALTER TABLE `user_balances` ENABLE KEYS */;

-- Dumping structure for table testdb.user_balance_histories
CREATE TABLE IF NOT EXISTS `user_balance_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `balanceBefore` int(11) DEFAULT NULL,
  `balanceAfter` int(11) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `type` enum('debit','kredit') DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `userAgent` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userBalanceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userBalanceId` (`userBalanceId`),
  CONSTRAINT `user_balance_histories_ibfk_1` FOREIGN KEY (`userBalanceId`) REFERENCES `user_balances` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.user_balance_histories: ~4 rows (approximately)
/*!40000 ALTER TABLE `user_balance_histories` DISABLE KEYS */;
INSERT INTO `user_balance_histories` (`id`, `balanceBefore`, `balanceAfter`, `activity`, `type`, `ip`, `location`, `userAgent`, `author`, `createdAt`, `updatedAt`, `userBalanceId`) VALUES
	(1, 0, 500000, 'Deposit', 'debit', '127.0.0.1', 'magelang', NULL, 'adhi', '2022-03-14 16:15:24', '2022-03-14 16:15:24', 1),
	(2, 500000, 1000000, 'Deposit', 'debit', '127.0.0.1', 'magelang', NULL, 'adhi', '2022-03-14 16:15:45', '2022-03-14 16:15:45', 2),
	(3, 1000000, 1050000, 'Deposit', 'debit', '127.0.0.1', 'magelang', NULL, 'adhi', '2022-03-14 16:16:03', '2022-03-14 16:16:03', 3),
	(4, 1050000, 1100000, 'Deposit', 'debit', '127.0.0.1', 'magelang', NULL, 'adhi', '2022-03-14 16:27:29', '2022-03-14 16:27:29', 4);
/*!40000 ALTER TABLE `user_balance_histories` ENABLE KEYS */;

-- Dumping structure for table testdb.user_roles
CREATE TABLE IF NOT EXISTS `user_roles` (
  `roleId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`roleId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table testdb.user_roles: ~5 rows (approximately)
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` (`roleId`, `userId`, `createdAt`, `updatedAt`) VALUES
	(1, 2, '2022-03-14 23:26:00', '2022-03-14 23:26:02'),
	(1, 3, '2022-03-14 23:26:20', '2022-03-14 23:26:22'),
	(2, 1, '2022-03-14 23:25:14', '2022-03-14 23:25:20'),
	(2, 2, '2022-03-14 23:25:44', '2022-03-14 23:25:46'),
	(3, 1, '2020-01-13 09:22:01', '2020-01-13 09:22:01');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
