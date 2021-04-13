/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.23 : Database - superschool
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`superschool` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `superschool`;

/*Table structure for table `academic_year` */

DROP TABLE IF EXISTS `academic_year`;

CREATE TABLE `academic_year` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `academic_year` */

insert  into `academic_year`(`id`,`name`) values 
(1,'2017/2018'),
(2,'2018/2019');

/*Table structure for table `attendance` */

DROP TABLE IF EXISTS `attendance`;

CREATE TABLE `attendance` (
  `student` varchar(40) DEFAULT NULL,
  `regno` varchar(40) DEFAULT NULL,
  `week` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `unit` int unsigned DEFAULT NULL,
  `attended` varchar(40) DEFAULT NULL,
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `semester` int unsigned DEFAULT NULL,
  `academicyear` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `student` (`student`),
  KEY `unit` (`unit`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `attendance` */

insert  into `attendance`(`student`,`regno`,`week`,`date`,`unit`,`attended`,`id`,`semester`,`academicyear`) values 
('IT/08/17','IT/08/17','2','2018-02-08',1,'1',1,1,'IT/08/17'),
('BBA/09/16','BBA/09/16','4','2018-02-08',2,'1',2,2,'BBA/09/16'),
('IT/08/17','IT/08/17','4','2018-02-19',2,'1',3,1,'IT/08/17');

/*Table structure for table `courses` */

DROP TABLE IF EXISTS `courses`;

CREATE TABLE `courses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `courses` */

insert  into `courses`(`id`,`name`) values 
(1,'Computer Science'),
(2,'Bussiness Administration'),
(3,'information technology'),
(4,'home science'),
(5,'Technology Education');

/*Table structure for table `marks` */

DROP TABLE IF EXISTS `marks`;

CREATE TABLE `marks` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  `unit` int unsigned DEFAULT NULL,
  `student` varchar(40) DEFAULT NULL,
  `regno` varchar(40) DEFAULT NULL,
  `year` varchar(40) DEFAULT NULL,
  `marks` int DEFAULT NULL,
  `grade` varchar(40) DEFAULT NULL,
  `academicyear` varchar(40) DEFAULT NULL,
  `semester` varchar(40) DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unit` (`unit`),
  KEY `student` (`student`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `marks` */

insert  into `marks`(`id`,`name`,`unit`,`student`,`regno`,`year`,`marks`,`grade`,`academicyear`,`semester`,`date`) values 
(1,'CAT 1',1,'IT/08/17','IT/08/17','IT/08/17',16,NULL,'IT/08/17','1','2018-02-08'),
(2,'CAT 1',1,'BBA/09/16','BBA/09/16','BBA/09/16',12,NULL,'BBA/09/16','1','2018-02-08');

/*Table structure for table `membership_grouppermissions` */

DROP TABLE IF EXISTS `membership_grouppermissions`;

CREATE TABLE `membership_grouppermissions` (
  `permissionID` int unsigned NOT NULL AUTO_INCREMENT,
  `groupID` int DEFAULT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint DEFAULT NULL,
  `allowView` tinyint NOT NULL DEFAULT '0',
  `allowEdit` tinyint NOT NULL DEFAULT '0',
  `allowDelete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

/*Data for the table `membership_grouppermissions` */

insert  into `membership_grouppermissions`(`permissionID`,`groupID`,`tableName`,`allowInsert`,`allowView`,`allowEdit`,`allowDelete`) values 
(1,2,'students',1,3,3,3),
(2,2,'units',1,3,3,3),
(3,2,'courses',1,3,3,3),
(4,2,'attendance',1,3,3,3),
(5,2,'Marks',1,3,3,3),
(6,2,'academic_year',1,3,3,3),
(31,1,'students',0,0,0,0),
(32,1,'units',0,0,0,0),
(33,1,'courses',0,0,0,0),
(34,1,'attendance',0,0,0,0),
(35,1,'Marks',0,0,0,0),
(36,1,'academic_year',0,0,0,0),
(55,3,'students',0,3,0,0),
(56,3,'units',1,1,1,1),
(57,3,'courses',0,3,0,0),
(58,3,'attendance',1,1,1,1),
(59,3,'Marks',1,1,1,1),
(60,3,'academic_year',0,3,0,0),
(61,4,'students',0,3,0,0),
(62,4,'units',0,3,0,0),
(63,4,'courses',0,3,0,0),
(64,4,'attendance',0,3,0,0),
(65,4,'Marks',0,3,0,0),
(66,4,'academic_year',0,3,0,0);

/*Table structure for table `membership_groups` */

DROP TABLE IF EXISTS `membership_groups`;

CREATE TABLE `membership_groups` (
  `groupID` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `description` text,
  `allowSignup` tinyint DEFAULT NULL,
  `needsApproval` tinyint DEFAULT NULL,
  PRIMARY KEY (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `membership_groups` */

insert  into `membership_groups`(`groupID`,`name`,`description`,`allowSignup`,`needsApproval`) values 
(1,'anonymous','Anonymous group created automatically on 2018-02-08',0,0),
(2,'Admins','Admin group created automatically on 2018-02-08',0,1),
(3,'Lecturer','',0,1),
(4,'demo','for demo purposes only',1,0);

/*Table structure for table `membership_userpermissions` */

DROP TABLE IF EXISTS `membership_userpermissions`;

CREATE TABLE `membership_userpermissions` (
  `permissionID` int unsigned NOT NULL AUTO_INCREMENT,
  `memberID` varchar(20) NOT NULL,
  `tableName` varchar(100) DEFAULT NULL,
  `allowInsert` tinyint DEFAULT NULL,
  `allowView` tinyint NOT NULL DEFAULT '0',
  `allowEdit` tinyint NOT NULL DEFAULT '0',
  `allowDelete` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`permissionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `membership_userpermissions` */

/*Table structure for table `membership_userrecords` */

DROP TABLE IF EXISTS `membership_userrecords`;

CREATE TABLE `membership_userrecords` (
  `recID` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tableName` varchar(100) DEFAULT NULL,
  `pkValue` varchar(255) DEFAULT NULL,
  `memberID` varchar(20) DEFAULT NULL,
  `dateAdded` bigint unsigned DEFAULT NULL,
  `dateUpdated` bigint unsigned DEFAULT NULL,
  `groupID` int DEFAULT NULL,
  PRIMARY KEY (`recID`),
  UNIQUE KEY `tableName_pkValue` (`tableName`,`pkValue`),
  KEY `pkValue` (`pkValue`),
  KEY `tableName` (`tableName`),
  KEY `memberID` (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

/*Data for the table `membership_userrecords` */

insert  into `membership_userrecords`(`recID`,`tableName`,`pkValue`,`memberID`,`dateAdded`,`dateUpdated`,`groupID`) values 
(1,'academic_year','1','admin',1518070937,1518070937,2),
(2,'academic_year','2','admin',1518070962,1518070962,2),
(3,'courses','1','admin',1518070983,1518070983,2),
(4,'courses','2','admin',1518071009,1518071009,2),
(5,'courses','3','admin',1518071026,1518071026,2),
(6,'courses','4','admin',1518071042,1518071042,2),
(7,'courses','5','admin',1518071058,1518071058,2),
(8,'units','1','admin',1518071096,1518071096,2),
(9,'units','2','admin',1518071121,1518071121,2),
(10,'units','3','admin',1518071137,1518071137,2),
(11,'students','IT/08/17','admin',1518071198,1518071198,2),
(12,'students','TED/118/16','admin',1518071230,1518071230,2),
(13,'students','BBA/09/16','admin',1518071274,1518071274,2),
(14,'attendance','1','admin',1518071331,1518071331,2),
(15,'attendance','2','admin',1518071371,1518071371,2),
(16,'Marks','1','admin',1518071482,1518071482,2),
(17,'Marks','2','admin',1518071530,1518071530,2),
(18,'students','COS/211/016','admin',1518981761,1518981761,2),
(19,'attendance','3','lecturer',1519027076,1519027076,3),
(20,'students','KVDA/012/2562','admin',1519033035,1519033035,2),
(21,'units','4','admin',1519035762,1519035762,2);

/*Table structure for table `membership_users` */

DROP TABLE IF EXISTS `membership_users`;

CREATE TABLE `membership_users` (
  `memberID` varchar(20) NOT NULL,
  `passMD5` varchar(40) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `signupDate` date DEFAULT NULL,
  `groupID` int unsigned DEFAULT NULL,
  `isBanned` tinyint DEFAULT NULL,
  `isApproved` tinyint DEFAULT NULL,
  `custom1` text,
  `custom2` text,
  `custom3` text,
  `custom4` text,
  `comments` text,
  `pass_reset_key` varchar(100) DEFAULT NULL,
  `pass_reset_expiry` int unsigned DEFAULT NULL,
  PRIMARY KEY (`memberID`),
  KEY `groupID` (`groupID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `membership_users` */

insert  into `membership_users`(`memberID`,`passMD5`,`email`,`signupDate`,`groupID`,`isBanned`,`isApproved`,`custom1`,`custom2`,`custom3`,`custom4`,`comments`,`pass_reset_key`,`pass_reset_expiry`) values 
('admin','21232f297a57a5a743894a0e4a801fc3','admin@admin.com','2018-02-08',2,0,1,NULL,NULL,NULL,NULL,'Admin member created automatically on 2018-02-08\nRecord updated automatically on 2018-02-19\nRecord updated automatically on 2021-04-11',NULL,NULL),
('demo','fe01ce2a7fbac8fafaed7c982a04e229','demo@demo.com','2018-02-19',4,0,1,'demonstration','ssa','aSSD','SDSSD','',NULL,NULL),
('lecturer','e10adc3949ba59abbe56e057f20f883e','lec@lec.com','2018-02-08',3,0,1,'lec','','','','',NULL,NULL),
('student',NULL,NULL,'2018-02-08',1,0,1,NULL,NULL,NULL,NULL,'Anonymous member created automatically on 2018-02-08',NULL,NULL);

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `regno` varchar(40) NOT NULL,
  `name` varchar(100) NOT NULL,
  `course` int unsigned DEFAULT NULL,
  `year` varchar(40) DEFAULT NULL,
  `academicyear` int unsigned DEFAULT NULL,
  PRIMARY KEY (`regno`),
  KEY `course` (`course`),
  KEY `academicyear` (`academicyear`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `students` */

insert  into `students`(`regno`,`name`,`course`,`year`,`academicyear`) values 
('BBA/09/16','Mark Zuckerburg',2,'3RD',1),
('COS/211/016','KIJANA SANA',1,'2ND',1),
('IT/08/17','Anwar Moha',3,'2ND',1),
('KVDA/012/2562','Mwai Kibaki',4,'3RD',2),
('TED/118/16','Ngoda Ronald',5,'2ND',1);

/*Table structure for table `units` */

DROP TABLE IF EXISTS `units`;

CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `units` */

insert  into `units`(`id`,`name`) values 
(1,'IRD 200'),
(2,'COM 211'),
(3,'TED 200'),
(4,'MAT 203');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
