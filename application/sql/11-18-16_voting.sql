# ************************************************************
# Sequel Pro SQL dump
# Version 4529
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.11-debug)
# Database: voting
# Generation Time: 2016-11-18 12:34:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table booth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `booth`;

CREATE TABLE `booth` (
  `booth_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `title` varchar(16) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`booth_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `booth_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `booth` WRITE;
/*!40000 ALTER TABLE `booth` DISABLE KEYS */;

INSERT INTO `booth` (`booth_id`, `event_id`, `title`, `username`, `password`, `status`)
VALUES
	(1,1,'Bilik 1','admin','$2y$10$5N1E3MehGX2p095iCaYAfuHszBHRCBTBITfZHmihp7eNlNjBogOTW',1),
	(3,1,'Bilik 2','admin','$2y$10$i8HlQag8B98RkkvLFhUSQ.2GQJgmEkbn9sDRQmG.vI8IHH5Ir/TK6',1);

/*!40000 ALTER TABLE `booth` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table candidate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `candidate`;

CREATE TABLE `candidate` (
  `candidate_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `identity` varchar(32) NOT NULL DEFAULT '',
  `name` varchar(64) NOT NULL DEFAULT '',
  `motto` text,
  `picture` varchar(128) DEFAULT NULL,
  `serial_number` tinyint(4) NOT NULL,
  `voter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`candidate_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;

INSERT INTO `candidate` (`candidate_id`, `section_id`, `identity`, `name`, `motto`, `picture`, `serial_number`, `voter`)
VALUES
	(6,18,'123456','Awalin Yudhana','Merdeka','b49f4-sticker.png',1,0),
	(14,19,'1237545123','Ipul',NULL,'4757b-sticker.png',1,0);

/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table event
# ------------------------------------------------------------

DROP TABLE IF EXISTS `event`;

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `name` text,
  PRIMARY KEY (`event_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `event_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;

INSERT INTO `event` (`event_id`, `user_id`, `date_created`, `name`)
VALUES
	(1,1,'2016-11-15 07:55:38','Pemilihan Fakultas Teknologi Universitas Brawijaya');

/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `groups`;

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;

INSERT INTO `groups` (`id`, `name`, `description`)
VALUES
	(1,'superadmin','Full Access Application'),
	(2,'admin','Admin Level 2'),
	(3,'operator','Operator System');

/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table login_attempts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login_attempts`;

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(15) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table section
# ------------------------------------------------------------

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `date_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `title` text NOT NULL,
  `note` text NOT NULL,
  `timer_status` tinyint(1) DEFAULT '1',
  `timer` int(11) DEFAULT NULL,
  PRIMARY KEY (`section_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `section_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;

INSERT INTO `section` (`section_id`, `event_id`, `date_created`, `title`, `note`, `timer_status`, `timer`)
VALUES
	(18,1,'2016-11-15 07:05:39','Pemilihan BEM 2016','Fakultas Teknologi Pertanian Universitas Brawijaya',1,30),
	(19,1,'2016-11-15 07:06:50','Pemilihan DPM 2016','Fakultas Teknologi Pertanian Universitas Brawijaya',1,30);

/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `forgotten_password_time`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`)
VALUES
	(1,'127.0.0.1','administrator','$2a$07$SeBknntpZror9uyftVopmu61qg0ms8Qv1yV6FG.kQOSM.9QhmTo36','','admin@admin.com',NULL,NULL,NULL,NULL,1268889823,1479469430,1,'IT Support','Fakultas Teknologi Pertanian','Universitas Brawajaya','0'),
	(2,'127.0.0.1','otoy.destroyed@gmail.com','$2y$08$SgIo7z1sMG17cib2blEeTeImU67t8qZAvp1mzu2HyonI9Ji18vdtS',NULL,'otoy.destroyed@gmail.com',NULL,NULL,NULL,NULL,1479452856,NULL,1,'Awalin','Yudhana','Nanomites','81336661922');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users_groups`;

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`)
VALUES
	(16,1,1),
	(17,1,2),
	(18,1,3),
	(20,2,2),
	(21,2,3);

/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table voter
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voter`;

CREATE TABLE `voter` (
  `voter_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `identity` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL DEFAULT '',
  `gender` enum('male','female') DEFAULT NULL,
  `pob` varchar(64) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `note` text CHARACTER SET latin1 COLLATE latin1_bin,
  `status` enum('open','pending','skip','done') DEFAULT 'open',
  `check_in_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`voter_id`),
  KEY `event_id` (`event_id`),
  CONSTRAINT `voter_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `event` (`event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `voter` WRITE;
/*!40000 ALTER TABLE `voter` DISABLE KEYS */;

INSERT INTO `voter` (`voter_id`, `event_id`, `identity`, `name`, `gender`, `pob`, `dob`, `note`, `status`, `check_in_time`)
VALUES
	(4,1,'1234567890','Hasyim','male',NULL,NULL,NULL,'open','2016-11-15 02:31:57'),
	(5,1,'7153698176','Ahmad',NULL,NULL,NULL,NULL,'pending','2016-11-16 01:39:32');

/*!40000 ALTER TABLE `voter` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table voting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `voting`;

CREATE TABLE `voting` (
  `voting_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) DEFAULT NULL,
  `voter_id` int(11) NOT NULL,
  `candidate_id` int(11) DEFAULT NULL,
  `booth_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`voting_id`),
  KEY `booth_id` (`booth_id`),
  KEY `candidat_id` (`candidate_id`),
  KEY `voter_id` (`voter_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `voting_ibfk_2` FOREIGN KEY (`booth_id`) REFERENCES `booth` (`booth_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `voting_ibfk_3` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `voting_ibfk_4` FOREIGN KEY (`voter_id`) REFERENCES `voter` (`voter_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `voting_ibfk_5` FOREIGN KEY (`section_id`) REFERENCES `section` (`section_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
