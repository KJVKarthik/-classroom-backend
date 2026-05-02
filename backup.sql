-- MySQL dump 10.13  Distrib 9.6.0, for macos26.2 (arm64)
--
-- Host: localhost    Database: classroom_management
-- ------------------------------------------------------
-- Server version	9.6.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'b2272628-febe-11f0-bcf6-4ac500ac60dd:1-71';

--
-- Table structure for table `attends`
--

DROP TABLE IF EXISTS `attends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attends` (
  `reg_no` varchar(20) NOT NULL,
  `lecture_id` int NOT NULL,
  `status` enum('present','absent','late') DEFAULT 'absent',
  `marked_time` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`reg_no`,`lecture_id`),
  KEY `lecture_id` (`lecture_id`),
  CONSTRAINT `attends_ibfk_1` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attends_ibfk_2` FOREIGN KEY (`lecture_id`) REFERENCES `lectures` (`lecture_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `chk_status` CHECK ((`status` in (_utf8mb4'present',_utf8mb4'absent')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends`
--

LOCK TABLES `attends` WRITE;
/*!40000 ALTER TABLE `attends` DISABLE KEYS */;
INSERT INTO `attends` VALUES ('183',1001,'absent',NULL,'Sick'),('184',1001,'present','2026-02-15 10:05:00','On time'),('184',1002,'present','2026-02-15 11:02:00',''),('200',1001,'present','2026-04-16 04:18:00','Late insert'),('200',1003,'present','2026-02-16 10:01:00','');
/*!40000 ALTER TABLE `attends` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_lowercase_status` BEFORE INSERT ON `attends` FOR EACH ROW BEGIN
    SET NEW.status = LOWER(NEW.status);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_set_marked_time` BEFORE INSERT ON `attends` FOR EACH ROW BEGIN
    IF NEW.marked_time IS NULL THEN
        SET NEW.marked_time = NOW();
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `attends_2nf`
--

DROP TABLE IF EXISTS `attends_2nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attends_2nf` (
  `reg_no` varchar(20) NOT NULL,
  `lecture_id` int DEFAULT '0',
  `status` enum('present','absent','late') DEFAULT 'absent',
  `marked_time` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends_2nf`
--

LOCK TABLES `attends_2nf` WRITE;
/*!40000 ALTER TABLE `attends_2nf` DISABLE KEYS */;
INSERT INTO `attends_2nf` VALUES ('S001',1001,'present','2026-02-15 10:05:00','On time'),('S001',1002,'present','2026-02-15 11:02:00',''),('S002',1001,'absent',NULL,'Sick'),('S003',1003,'present','2026-02-16 10:01:00','');
/*!40000 ALTER TABLE `attends_2nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attends_3nf`
--

DROP TABLE IF EXISTS `attends_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attends_3nf` (
  `reg_no` varchar(20) NOT NULL,
  `lecture_id` int DEFAULT '0',
  `status` enum('present','absent','late') DEFAULT 'absent',
  `marked_time` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attends_3nf`
--

LOCK TABLES `attends_3nf` WRITE;
/*!40000 ALTER TABLE `attends_3nf` DISABLE KEYS */;
INSERT INTO `attends_3nf` VALUES ('S001',1001,'present','2026-02-15 10:05:00','On time'),('S001',1002,'present','2026-02-15 11:02:00',''),('S002',1001,'absent',NULL,'Sick'),('S003',1003,'present','2026-02-16 10:01:00','');
/*!40000 ALTER TABLE `attends_3nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `classroom_1nf`
--

DROP TABLE IF EXISTS `classroom_1nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classroom_1nf` (
  `reg_no` varchar(20) NOT NULL,
  `student_f_name` varchar(50) NOT NULL,
  `student_m_name` varchar(50) DEFAULT NULL,
  `student_l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `student_phone` varchar(20) DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `student_dept` varchar(50) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `student_section` varchar(10) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `admission_year` smallint DEFAULT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `permanent_address` text,
  `pin` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `hostel_name` varchar(100),
  `block` varchar(50) DEFAULT NULL,
  `hostel_room_no` varchar(10),
  `floor` varchar(10) DEFAULT NULL,
  `timetable_id` int DEFAULT '0',
  `timetable_dept` varchar(50) DEFAULT NULL,
  `sem` tinyint DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `timetable_section` varchar(10) DEFAULT NULL,
  `coordinator_id` varchar(20),
  `coordinator_f_name` varchar(50) DEFAULT NULL,
  `coordinator_m_name` varchar(50) DEFAULT NULL,
  `coordinator_l_name` varchar(50) DEFAULT NULL,
  `coordinator_dept` varchar(50) DEFAULT NULL,
  `coordinator_email` varchar(100) DEFAULT NULL,
  `coordinator_phone` varchar(20) DEFAULT NULL,
  `lecture_id` int DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `lecture_subject` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `day_order` varchar(20) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `lecture_room_no` varchar(20) DEFAULT NULL,
  `description` text,
  `teacher_id` varchar(20),
  `lecturer_f_name` varchar(50) DEFAULT NULL,
  `lecturer_m_name` varchar(50) DEFAULT NULL,
  `lecturer_l_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(100) DEFAULT NULL,
  `lecturer_phone` varchar(20) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `lecturer_subject` varchar(100) DEFAULT NULL,
  `status` enum('present','absent','late') DEFAULT 'absent',
  `marked_time` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classroom_1nf`
--

LOCK TABLES `classroom_1nf` WRITE;
/*!40000 ALTER TABLE `classroom_1nf` DISABLE KEYS */;
INSERT INTO `classroom_1nf` VALUES ('S001','Aditi','R','Jain','2005-08-03','aditi.jain@student.edu','9012345678','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','12, College Street','600100','TN','India','MBlock','A','101','1',1,'CSE',4,'v1','A','C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011',1001,'DS - Linked Lists','Data Structures','2026-02-15','1','10:00:00','C101','Linked List intro and operations','T001','Ramesh','K','Iyer','ramesh@college.edu','9900001111','M.Tech','Data Structures','present','2026-02-15 10:05:00','On time'),('S001','Aditi','R','Jain','2005-08-03','aditi.jain@student.edu','9012345678','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','12, College Street','600100','TN','India','MBlock','A','101','1',1,'CSE',4,'v1','A','C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011',1002,'OS - Processes','Operating Systems','2026-02-15','2','11:00:00','C102','Processes and scheduling','T002','Sonia','P','Menon','sonia@college.edu','9900002222','PhD','Operating Systems','present','2026-02-15 11:02:00',''),('S002','Karthik','M','Reddy','2006-10-30','karthik.reddy@student.edu','9012345679','Male','CSE','B.Tech','A','B.Tech',2023,'3rd Year','45, Main Road','600101','TN','India','MBlock','A','102','1',1,'CSE',4,'v1','A','C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011',1001,'DS - Linked Lists','Data Structures','2026-02-15','1','10:00:00','C101','Linked List intro and operations','T001','Ramesh','K','Iyer','ramesh@college.edu','9900001111','M.Tech','Data Structures','absent',NULL,'Sick'),('S003','Meera','S','Patel','2005-05-20','meera.patel@student.edu','9012345680','Female','IT','B.Tech','B','B.Tech',2022,'4th Year','78, Park Lane','600102','TN','India',NULL,NULL,NULL,NULL,2,'IT',6,'v1','B','C002','Priya','M','Rao','IT','priya.rao@college.edu','9876500022',1003,'Algorithms - Sorting','Algorithms','2026-02-16','1','10:00:00','C103','QuickSort & MergeSort','T001','Ramesh','K','Iyer','ramesh@college.edu','9900001111','M.Tech','Data Structures','present','2026-02-16 10:01:00','');
/*!40000 ALTER TABLE `classroom_1nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_coordinator`
--

DROP TABLE IF EXISTS `course_coordinator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_coordinator` (
  `id` varchar(20) NOT NULL,
  `f_name` varchar(50) DEFAULT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_coordinator`
--

LOCK TABLES `course_coordinator` WRITE;
/*!40000 ALTER TABLE `course_coordinator` DISABLE KEYS */;
INSERT INTO `course_coordinator` VALUES ('C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011'),('C002','Priya','M','Rao','IT','priya.rao@college.edu','9876500022');
/*!40000 ALTER TABLE `course_coordinator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_coordinator_3nf`
--

DROP TABLE IF EXISTS `course_coordinator_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_coordinator_3nf` (
  `id` varchar(20),
  `f_name` varchar(50) DEFAULT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_coordinator_3nf`
--

LOCK TABLES `course_coordinator_3nf` WRITE;
/*!40000 ALTER TABLE `course_coordinator_3nf` DISABLE KEYS */;
INSERT INTO `course_coordinator_3nf` VALUES ('C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011'),('C002','Priya','M','Rao','IT','priya.rao@college.edu','9876500022');
/*!40000 ALTER TABLE `course_coordinator_3nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel`
--

DROP TABLE IF EXISTS `hostel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel` (
  `reg_no` varchar(20) NOT NULL,
  `hostel_name` varchar(100) NOT NULL,
  `block` varchar(50) DEFAULT NULL,
  `room_no` varchar(10) NOT NULL,
  `floor` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`reg_no`,`room_no`),
  CONSTRAINT `hostel_ibfk_1` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel`
--

LOCK TABLES `hostel` WRITE;
/*!40000 ALTER TABLE `hostel` DISABLE KEYS */;
INSERT INTO `hostel` VALUES ('183','Oori','A','102','1'),('184','M Block','A','101','2'),('200','ESQ','B','103','1'),('201','Oori','B','201','2'),('202','M Block','C','202','2'),('203','Oori','B','203','2'),('204','M Block','C','204','2'),('205','ESQ','E','205','2');
/*!40000 ALTER TABLE `hostel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hostel_3nf`
--

DROP TABLE IF EXISTS `hostel_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hostel_3nf` (
  `reg_no` varchar(20) NOT NULL,
  `hostel_name` varchar(100),
  `block` varchar(50) DEFAULT NULL,
  `room_no` varchar(10),
  `floor` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hostel_3nf`
--

LOCK TABLES `hostel_3nf` WRITE;
/*!40000 ALTER TABLE `hostel_3nf` DISABLE KEYS */;
INSERT INTO `hostel_3nf` VALUES ('S001','MBlock','A','101','1'),('S002','MBlock','A','102','1');
/*!40000 ALTER TABLE `hostel_3nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `teacher_id` varchar(20) NOT NULL,
  `f_name` varchar(50) DEFAULT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
INSERT INTO `lecturer` VALUES ('T001','Ramesh','K','Iyer','ramesh.iyer@srmist.edu.in','9990001111','M.Tech','Data Structures'),('T002','Sonia','P','Menon','sonia.menon@srmist.edu.in','9900002222','PhD','Operating Systems'),('T003','Anil','R','Kumar','anil.kumar@srmist.edu.in','9100000003','PhD','DBMS'),('T004','Meena','S','Rao','meena.rao@srmist.edu.in','9100000004','M.Tech','Networks'),('T005','Vivek','P','Sharma','vivek.sharma@srmist.edu.in','9100000005','PhD','AI'),('T006','Lakshmi','K','Nair','lakshmi.nair@srmist.edu.in','9100000006','M.Tech','Web Tech');
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_3nf`
--

DROP TABLE IF EXISTS `lecturer_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_3nf` (
  `teacher_id` varchar(20),
  `f_name` varchar(50) DEFAULT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_3nf`
--

LOCK TABLES `lecturer_3nf` WRITE;
/*!40000 ALTER TABLE `lecturer_3nf` DISABLE KEYS */;
INSERT INTO `lecturer_3nf` VALUES ('T001','Ramesh','K','Iyer','ramesh@college.edu','9900001111','M.Tech','Data Structures'),('T002','Sonia','P','Menon','sonia@college.edu','9900002222','PhD','Operating Systems');
/*!40000 ALTER TABLE `lecturer_3nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_phone`
--

DROP TABLE IF EXISTS `lecturer_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_phone` (
  `teacher_id` varchar(20) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  PRIMARY KEY (`teacher_id`,`phone_no`),
  CONSTRAINT `lecturer_phone_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `lecturer` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_phone`
--

LOCK TABLES `lecturer_phone` WRITE;
/*!40000 ALTER TABLE `lecturer_phone` DISABLE KEYS */;
INSERT INTO `lecturer_phone` VALUES ('T001','9000000001'),('T001','9000000002'),('T002','9111111111');
/*!40000 ALTER TABLE `lecturer_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer_qualification`
--

DROP TABLE IF EXISTS `lecturer_qualification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer_qualification` (
  `teacher_id` varchar(20) NOT NULL,
  `qualification` varchar(100) NOT NULL,
  PRIMARY KEY (`teacher_id`,`qualification`),
  CONSTRAINT `lecturer_qualification_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `lecturer` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer_qualification`
--

LOCK TABLES `lecturer_qualification` WRITE;
/*!40000 ALTER TABLE `lecturer_qualification` DISABLE KEYS */;
INSERT INTO `lecturer_qualification` VALUES ('T001','M.Tech'),('T001','PhD'),('T002','M.Tech');
/*!40000 ALTER TABLE `lecturer_qualification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures` (
  `lecture_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `day_order` varchar(20) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `description` text,
  `timetable_id` int DEFAULT NULL,
  `teacher_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`lecture_id`),
  KEY `timetable_id` (`timetable_id`),
  KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `lectures_ibfk_1` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `lectures_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `lecturer` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES (1001,'DS - Linked Lists','Data Structures','2026-02-15','1','10:00:00','C201','Linked List intro and operations',1,'T001'),(1002,'OS - Processes','Operating Systems','2026-02-15','2','11:00:00','C301','Processes and scheduling',1,'T002'),(1003,'Algorithms - Sorting','Algorithms','2026-02-16','1','10:00:00','C103','QuickSort & MergeSort',2,'T001');
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures_2nf`
--

DROP TABLE IF EXISTS `lectures_2nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures_2nf` (
  `lecture_id` int DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `lecture_subject` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `day_order` varchar(20) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `lecture_room_no` varchar(20) DEFAULT NULL,
  `description` text,
  `teacher_id` varchar(20),
  `lecturer_f_name` varchar(50) DEFAULT NULL,
  `lecturer_m_name` varchar(50) DEFAULT NULL,
  `lecturer_l_name` varchar(50) DEFAULT NULL,
  `mail_id` varchar(100) DEFAULT NULL,
  `lecturer_phone` varchar(20) DEFAULT NULL,
  `qualification` varchar(100) DEFAULT NULL,
  `lecturer_subject` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures_2nf`
--

LOCK TABLES `lectures_2nf` WRITE;
/*!40000 ALTER TABLE `lectures_2nf` DISABLE KEYS */;
INSERT INTO `lectures_2nf` VALUES (1001,'DS - Linked Lists','Data Structures','2026-02-15','1','10:00:00','C101','Linked List intro and operations','T001','Ramesh','K','Iyer','ramesh@college.edu','9900001111','M.Tech','Data Structures'),(1002,'OS - Processes','Operating Systems','2026-02-15','2','11:00:00','C102','Processes and scheduling','T002','Sonia','P','Menon','sonia@college.edu','9900002222','PhD','Operating Systems'),(1003,'Algorithms - Sorting','Algorithms','2026-02-16','1','10:00:00','C103','QuickSort & MergeSort','T001','Ramesh','K','Iyer','ramesh@college.edu','9900001111','M.Tech','Data Structures');
/*!40000 ALTER TABLE `lectures_2nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures_3nf`
--

DROP TABLE IF EXISTS `lectures_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures_3nf` (
  `lecture_id` int DEFAULT '0',
  `title` varchar(200) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `day_order` varchar(20) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `room_no` varchar(20) DEFAULT NULL,
  `description` text,
  `teacher_id` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures_3nf`
--

LOCK TABLES `lectures_3nf` WRITE;
/*!40000 ALTER TABLE `lectures_3nf` DISABLE KEYS */;
INSERT INTO `lectures_3nf` VALUES (1001,'DS - Linked Lists','Data Structures','2026-02-15','1','10:00:00','C101','Linked List intro and operations','T001'),(1002,'OS - Processes','Operating Systems','2026-02-15','2','11:00:00','C102','Processes and scheduling','T002'),(1003,'Algorithms - Sorting','Algorithms','2026-02-16','1','10:00:00','C103','QuickSort & MergeSort','T001');
/*!40000 ALTER TABLE `lectures_3nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `reg_no` varchar(20) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `admission_year` smallint DEFAULT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `permanent_address` text,
  `pin` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `timetable_id` int DEFAULT NULL,
  PRIMARY KEY (`reg_no`),
  UNIQUE KEY `uq_student_email` (`email`),
  KEY `timetable_id` (`timetable_id`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`timetable_id`) REFERENCES `timetable` (`timetable_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('183','Karthik','M','KJV','2006-10-30','kk7504@srmist.edu.in','7777777777','Male','CSE','B.Tech','A','B.Tech',2023,'3rd Year','45, Main Road','600101','TN','India',1),('184','Aditi','R','Jain','2005-08-03','aj7594@srmist.edu.in','9999999999','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','12, College Street','600100','TN','India',1),('200','Meera','S','Patel','2005-05-20','mp4468@srmist.edu.in','9012345680','Female','IT','B.Tech','B','B.Tech',2022,'4th Year','78, Park Lane','600102','TN','India',2),('201','Rahul','A','Verma','2005-04-12','rv201@srmist.edu.in','9000000201','Male','CSE','B.Tech','A','B.Tech',2023,'3rd Year','Chennai','600001','TN','India',1),('202','Sneha','R','Nair','2005-06-18','sn202@srmist.edu.in','9000000202','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','Chennai','600002','TN','India',1),('203','Arjun','K','Menon','2005-09-22','am203@srmist.edu.in','9000000203','Male','IT','B.Tech','B','B.Tech',2022,'4th Year','Chennai','600003','TN','India',2),('204','Divya','S','Rao','2006-01-15','dr204@srmist.edu.in','9000000204','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','Chennai','600004','TN','India',1),('205','Vikram','P','Shah','2005-11-08','vs205@srmist.edu.in','9000000205','Male','IT','B.Tech','B','B.Tech',2022,'4th Year','Chennai','600005','TN','India',2),('876','mNISH',NULL,'kumar',NULL,'nm87862@srmist.edu.in',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_2nf`
--

DROP TABLE IF EXISTS `student_2nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_2nf` (
  `reg_no` varchar(20) NOT NULL,
  `student_f_name` varchar(50) NOT NULL,
  `student_m_name` varchar(50) DEFAULT NULL,
  `student_l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `student_email` varchar(100) DEFAULT NULL,
  `student_phone` varchar(20) DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `student_dept` varchar(50) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `student_section` varchar(10) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `admission_year` smallint DEFAULT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `permanent_address` text,
  `pin` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `hostel_name` varchar(100),
  `block` varchar(50) DEFAULT NULL,
  `hostel_room_no` varchar(10),
  `floor` varchar(10) DEFAULT NULL,
  `timetable_id` int DEFAULT '0',
  `timetable_dept` varchar(50) DEFAULT NULL,
  `sem` tinyint DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `timetable_section` varchar(10) DEFAULT NULL,
  `coordinator_id` varchar(20),
  `coordinator_f_name` varchar(50) DEFAULT NULL,
  `coordinator_m_name` varchar(50) DEFAULT NULL,
  `coordinator_l_name` varchar(50) DEFAULT NULL,
  `coordinator_dept` varchar(50) DEFAULT NULL,
  `coordinator_email` varchar(100) DEFAULT NULL,
  `coordinator_phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_2nf`
--

LOCK TABLES `student_2nf` WRITE;
/*!40000 ALTER TABLE `student_2nf` DISABLE KEYS */;
INSERT INTO `student_2nf` VALUES ('S001','Aditi','R','Jain','2005-08-03','aditi.jain@student.edu','9012345678','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','12, College Street','600100','TN','India','MBlock','A','101','1',1,'CSE',4,'v1','A','C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011'),('S002','Karthik','M','Reddy','2006-10-30','karthik.reddy@student.edu','9012345679','Male','CSE','B.Tech','A','B.Tech',2023,'3rd Year','45, Main Road','600101','TN','India','MBlock','A','102','1',1,'CSE',4,'v1','A','C001','Arun','K','Sharma','CSE','arun.sharma@college.edu','9876500011'),('S003','Meera','S','Patel','2005-05-20','meera.patel@student.edu','9012345680','Female','IT','B.Tech','B','B.Tech',2022,'4th Year','78, Park Lane','600102','TN','India',NULL,NULL,NULL,NULL,2,'IT',6,'v1','B','C002','Priya','M','Rao','IT','priya.rao@college.edu','9876500022');
/*!40000 ALTER TABLE `student_2nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_3nf`
--

DROP TABLE IF EXISTS `student_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_3nf` (
  `reg_no` varchar(20) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `m_name` varchar(50) DEFAULT NULL,
  `l_name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `course` varchar(100) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `degree` varchar(50) DEFAULT NULL,
  `admission_year` smallint DEFAULT NULL,
  `academic_year` varchar(20) DEFAULT NULL,
  `permanent_address` text,
  `pin` varchar(15) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `timetable_id` int DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_3nf`
--

LOCK TABLES `student_3nf` WRITE;
/*!40000 ALTER TABLE `student_3nf` DISABLE KEYS */;
INSERT INTO `student_3nf` VALUES ('S001','Aditi','R','Jain','2005-08-03','aditi.jain@student.edu','9012345678','Female','CSE','B.Tech','A','B.Tech',2023,'3rd Year','12, College Street','600100','TN','India',1),('S002','Karthik','M','Reddy','2006-10-30','karthik.reddy@student.edu','9012345679','Male','CSE','B.Tech','A','B.Tech',2023,'3rd Year','45, Main Road','600101','TN','India',1),('S003','Meera','S','Patel','2005-05-20','meera.patel@student.edu','9012345680','Female','IT','B.Tech','B','B.Tech',2022,'4th Year','78, Park Lane','600102','TN','India',2);
/*!40000 ALTER TABLE `student_3nf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_phone`
--

DROP TABLE IF EXISTS `student_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student_phone` (
  `reg_no` varchar(20) NOT NULL,
  `phone_no` varchar(15) NOT NULL,
  PRIMARY KEY (`reg_no`,`phone_no`),
  CONSTRAINT `student_phone_ibfk_1` FOREIGN KEY (`reg_no`) REFERENCES `student` (`reg_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_phone`
--

LOCK TABLES `student_phone` WRITE;
/*!40000 ALTER TABLE `student_phone` DISABLE KEYS */;
INSERT INTO `student_phone` VALUES ('S001','9123456780'),('S001','9876543210'),('S002','9988776655');
/*!40000 ALTER TABLE `student_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `timetable_id` int NOT NULL AUTO_INCREMENT,
  `dept` varchar(50) DEFAULT NULL,
  `sem` tinyint DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `coordinator_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`timetable_id`),
  KEY `coordinator_id` (`coordinator_id`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`coordinator_id`) REFERENCES `course_coordinator` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (1,'CSE',4,'v1','A','C002'),(2,'IT',6,'v1','A','C002');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_3nf`
--

DROP TABLE IF EXISTS `timetable_3nf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_3nf` (
  `timetable_id` int DEFAULT '0',
  `dept` varchar(50) DEFAULT NULL,
  `sem` tinyint DEFAULT NULL,
  `version` varchar(20) DEFAULT NULL,
  `section` varchar(10) DEFAULT NULL,
  `coordinator_id` varchar(20)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_3nf`
--

LOCK TABLES `timetable_3nf` WRITE;
/*!40000 ALTER TABLE `timetable_3nf` DISABLE KEYS */;
INSERT INTO `timetable_3nf` VALUES (1,'CSE',4,'v1','A','C001'),(2,'IT',6,'v1','B','C002');
/*!40000 ALTER TABLE `timetable_3nf` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-02 21:08:25
