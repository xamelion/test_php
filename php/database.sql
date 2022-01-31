-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.7.37 - MySQL Community Server (GPL)
-- Операционная система:         Linux
-- HeidiSQL Версия:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных test_db
CREATE DATABASE IF NOT EXISTS `test_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test_db`;

-- Дамп структуры для таблица test_db.visitors
CREATE TABLE IF NOT EXISTS `visitors` (
  `ip_address` varchar(15) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `view_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `page_url` varchar(50) DEFAULT NULL,
  `views_count` int(12) DEFAULT '1',
  UNIQUE KEY `ip_address_user_agent_page_url` (`ip_address`,`user_agent`,`page_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Экспортируемые данные не выделены.

-- Дамп структуры для представление test_db.view_date
-- Удаление временной таблицы и создание окончательной структуры представления
DROP TABLE IF EXISTS `view_date`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `view_date` AS select curdate() AS `CURDATE()`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
