-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.12-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para committedtime
CREATE DATABASE IF NOT EXISTS `committedtime` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `committedtime`;

-- Copiando estrutura para tabela committedtime.tbjob
CREATE TABLE IF NOT EXISTS `tbjob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUser` int(11) NOT NULL,
  `jobName` varchar(100) NOT NULL,
  `jobDetails` varchar(1000) NOT NULL,
  `jobValue` double NOT NULL DEFAULT 0,
  `jobCreateDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `jobFinishDate` timestamp NULL DEFAULT NULL,
  `jobTimer` bigint(20) DEFAULT NULL,
  `isPlaying` char(1) NOT NULL DEFAULT '0',
  `lastStartDate` timestamp NULL DEFAULT NULL,
  `lastPauseDate` timestamp NULL DEFAULT NULL,
  `expectedDateEnd` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_IDUSER` (`idUser`),
  CONSTRAINT `FK1_IDUSER` FOREIGN KEY (`idUser`) REFERENCES `tbuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela committedtime.tbjoblog
CREATE TABLE IF NOT EXISTS `tbjoblog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idJob` int(11) NOT NULL,
  `jobLogType` int(11) NOT NULL COMMENT '1 - job started\\r\\n2 - job paused\\r\\n3 - job finish',
  `jobLogDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `jobLogObs` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1_IDJOB` (`idJob`),
  CONSTRAINT `FK1_IDJOB` FOREIGN KEY (`idJob`) REFERENCES `tbjob` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela committedtime.tbuser
CREATE TABLE IF NOT EXISTS `tbuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(200) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  `lastAcess` timestamp NULL DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `tokenEmail` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Exportação de dados foi desmarcado.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
