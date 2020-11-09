-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.14-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.3.0.5771
-- --------------------------------------------------------


-- Dumping database structure for education
DROP DATABASE IF EXISTS `education`;
CREATE DATABASE IF NOT EXISTS `education` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `education`;


-- Dumping structure for table education.institution
DROP TABLE IF EXISTS `institution`;
CREATE TABLE IF NOT EXISTS `institution` (
  `institutionid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`institutionid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table education.institution: ~2 rows (approximately)
DELETE FROM `institution`;
INSERT INTO `institution` (`institutionid`, `name`) VALUES
	(1, 'University College Dublin'),
	(2, 'University College London');

-- Dumping structure for table education.course
DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `courseid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `institution` int(11) NOT NULL,
  PRIMARY KEY (`courseid`),
  KEY `FK_course_institution` (`institution`),
  CONSTRAINT `FK_course_institution` FOREIGN KEY (`institution`) REFERENCES `institution` (`institutionid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table education.course: ~1 rows (approximately)
DELETE FROM `course`;
INSERT INTO `course` (`courseid`, `name`, `institution`) VALUES
	(2, 'Bsc. Actuarial Science', 1),
	(3, 'MPhil Genomics', 2);



-- Dumping structure for table education.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `studentid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `course` int(11) NOT NULL,
  PRIMARY KEY (`studentid`),
  KEY `FK_student_course` (`course`),
  CONSTRAINT `FK_student_course` FOREIGN KEY (`course`) REFERENCES `course` (`courseid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table education.student: ~6 rows (approximately)
DELETE FROM `student`;
INSERT INTO `student` (`studentid`, `name`, `course`) VALUES
	(2, 'Sam1', 2),
	(3, 'Wanjohi', 2),
	(4, 'Duncan', 2),
	(5, 'Eliud', 2),
	(6, 'Josephine', 3),
	(7, 'Jane', 3);

