-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.11-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for user_db
CREATE DATABASE IF NOT EXISTS `user_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `user_db`;

-- Dumping structure for table user_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `nic` varchar(20) NOT NULL,
  `dob` date NOT NULL DEFAULT '0000-00-00',
  `age` int(11) NOT NULL DEFAULT '0',
  `gender` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table user_db.users: ~6 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
REPLACE INTO `users` (`userID`, `user_name`, `address`, `nationality`, `nic`, `dob`, `age`, `gender`) VALUES
	(2, 'Dhanushka', 'Galle', 'sinhala', '34567890', '2021-07-23', 56, 'male'),
	(3, 'Nimal', 'Galle', 'sinhala', '9234567', '2021-07-30', 45, 'male'),
	(4, 'kamal', 'galle', 'english', '56787878', '2021-07-23', 56, 'male'),
	(10, 'naveen', 'berlin', 'english', '943562145V', '1994-12-21', 26, 'Male'),
	(11, 'saman', 'galle', 'tamil', '953654244V', '1995-12-30', 25, 'Male'),
	(12, 'saman ', 'colombo', 'tamil', '965632553V', '1996-03-03', 25, 'Female');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
