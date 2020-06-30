
DROP DATABASE IF EXISTS NotAP;
CREATE DATABASE NotAP;
USE NotAP;

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: notap2
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `building` (
  `building_id` int(11) NOT NULL,
  `building_name` varchar(45) NOT NULL,
  `building_address` varchar(45) NOT NULL,
  PRIMARY KEY (`building_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `building`  VALUES('1', 'Maguire Hall', 'Washington, DC 20007');
INSERT INTO `building`  VALUES('2', 'St Mary Hall', 'Washington, DC 20007');
INSERT INTO `building`  VALUES('3', 'Rosslyn Heights', '1860 N Scott St.');
INSERT INTO `building`  VALUES('4', '711', '1800 N Quinn St.');
INSERT INTO `building`  VALUES('5', 'McDonald', '1800 N Lynn St.');
--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporate_financial`
--

DROP TABLE IF EXISTS `corporate_financial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate_financial` (
  `year` year(4) NOT NULL,
  `quarter_number` int(1) NOT NULL,
  `earnings` int(11) NOT NULL,
  `liabilities` int(11) NOT NULL,
  PRIMARY KEY (`year`,`quarter_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `corporate_financial` VALUES('2018', '1', '5000000', '1000000');
INSERT INTO `corporate_financial` VALUES('2017', '2', '3000000', '2000000');
INSERT INTO `corporate_financial` VALUES('2018', '2', '7000000', '3000000');
INSERT INTO `corporate_financial` VALUES('2019', '1', '9000000', '4000000');
INSERT INTO `corporate_financial` VALUES('2019', '2', '3000000', '500000');
--
-- Dumping data for table `corporate_financial`
--

LOCK TABLES `corporate_financial` WRITE;
/*!40000 ALTER TABLE `corporate_financial` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporate_financial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporate_officer`
--

DROP TABLE IF EXISTS `corporate_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate_officer` (
  `employee_number` int(11) NOT NULL,
  PRIMARY KEY (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `corporate_officer` VALUES('201901');
INSERT INTO `corporate_officer` VALUES('201802');
INSERT INTO `corporate_officer` VALUES('201703');
INSERT INTO `corporate_officer` VALUES('201604');

--
-- Dumping data for table `corporate_officer`
--

LOCK TABLES `corporate_officer` WRITE;
/*!40000 ALTER TABLE `corporate_officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporate_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporate_officer_manage_group`
--

DROP TABLE IF EXISTS `corporate_officer_manage_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate_officer_manage_group` (
  `employee_number` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_number`,`group_id`),
  KEY `corporate_officer_manage_group_ibfk_2_idx` (`group_id`),
  CONSTRAINT `corporate_officer_manage_group_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `corporate_officer` (`employee_number`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `corporate_officer_manage_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `corporate_officer_manage_group` VALUES('201901', '1');
INSERT INTO `corporate_officer_manage_group` VALUES('201901', '2');
INSERT INTO `corporate_officer_manage_group` VALUES('201802', '2');
INSERT INTO `corporate_officer_manage_group` VALUES('201703', '3');
INSERT INTO `corporate_officer_manage_group` VALUES('201604', '4');

--
-- Dumping data for table `corporate_officer_manage_group`
--

LOCK TABLES `corporate_officer_manage_group` WRITE;
/*!40000 ALTER TABLE `corporate_officer_manage_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporate_officer_manage_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporate_officer_project`
--

DROP TABLE IF EXISTS `corporate_officer_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporate_officer_project` (
  `employee_number` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_number`,`project_id`),
  KEY `corporate_officer_project_ibfk_1_idx` (`project_id`),
  CONSTRAINT `corporate_officer_project_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `corporate_officer` (`employee_number`) ON UPDATE RESTRICT,
  CONSTRAINT `corporate_officer_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `corporate_officer_project` VALUES('201901', '20190101');
INSERT INTO `corporate_officer_project` VALUES('201901', '20190201');
INSERT INTO `corporate_officer_project` VALUES('201802', '20190102');
INSERT INTO `corporate_officer_project` VALUES('201703', '20190202');
INSERT INTO `corporate_officer_project` VALUES('201604', '20190301');

--
-- Dumping data for table `corporate_officer_project`
--

LOCK TABLES `corporate_officer_project` WRITE;
/*!40000 ALTER TABLE `corporate_officer_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporate_officer_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distributor`
--

DROP TABLE IF EXISTS `distributor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distributor` (
  `distributor_id` int(11) NOT NULL,
  `distributor_name` varchar(45) NOT NULL,
  PRIMARY KEY (`distributor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `distributor` VALUES('10001', 'Jack');
INSERT INTO `distributor` VALUES('10002', 'Mike');
INSERT INTO `distributor` VALUES('10003', 'Jane');
INSERT INTO `distributor` VALUES('10004', 'Mary');
INSERT INTO `distributor` VALUES('10005', 'Mark');

--
-- Dumping data for table `distributor`
--

LOCK TABLES `distributor` WRITE;
/*!40000 ALTER TABLE `distributor` DISABLE KEYS */;
/*!40000 ALTER TABLE `distributor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_group`
--

DROP TABLE IF EXISTS `employee_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_group` (
  `group_id` int(11) NOT NULL,
  `employee_number` int(11) NOT NULL,
  `responsibility` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`group_id`,`employee_number`),
  KEY `employee_group_ibfk_1_idx` (`employee_number`),
  CONSTRAINT `employee_group_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `employee_group_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `employee_group` VALUES('1', '201903', 'Data analysis');
INSERT INTO `employee_group` VALUES('2', '201903', 'Marketing');
INSERT INTO `employee_group` VALUES('3', '201904', 'Coding');
INSERT INTO `employee_group` VALUES('1', '201905', 'Coding');
INSERT INTO `employee_group` VALUES('2', '201906', 'Marketing');
--
-- Dumping data for table `employee_group`
--

LOCK TABLES `employee_group` WRITE;
/*!40000 ALTER TABLE `employee_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment`
--

DROP TABLE IF EXISTS `equipment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment` (
  `equipment_id` int(11) NOT NULL,
  `equipment_name` varchar(45) NOT NULL,
  `equipment_age` varchar(45) NOT NULL,
  `equipment_shape` varchar(45) NOT NULL,
  `building_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`equipment_id`),
  KEY `equipment_ibfk_1_idx` (`building_id`),
  CONSTRAINT `equipment_ibfk_1` FOREIGN KEY (`building_id`) REFERENCES `building` (`building_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `equipment` VALUES('11', 'car1', '1 year', 'good shape', '1');
INSERT INTO `equipment` VALUES('12', 'computer1', '5 months', 'good shape', '1');
INSERT INTO `equipment` VALUES('13', 'car2', '2 years', 'bad shape', '2');
INSERT INTO `equipment` VALUES('14', 'car3', '1 year', 'good shape', '3');
INSERT INTO `equipment` VALUES('15', 'computer2', '5 years', 'bad shape', '3');

--
-- Dumping data for table `equipment`
--

LOCK TABLES `equipment` WRITE;
/*!40000 ALTER TABLE `equipment` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipment_repairs`
--

DROP TABLE IF EXISTS `equipment_repairs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipment_repairs` (
  `equipment_repairs_id` int(11) NOT NULL,
  `equipment_id` int(11) NOT NULL,
  `record_report` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`equipment_repairs_id`),
  KEY `equipment_repairs_ibfk_1_idx` (`equipment_id`),
  CONSTRAINT `equipment_repairs_ibfk_1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment` (`equipment_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `equipment_repairs` VALUES('1', '11', 'Repair the wheel');
INSERT INTO `equipment_repairs` VALUES('2', '11', 'Repair the break');
INSERT INTO `equipment_repairs` VALUES('3', '12', 'Repair the engine');
INSERT INTO `equipment_repairs` VALUES('4', '14', 'Repair the break');
INSERT INTO `equipment_repairs` VALUES('5', '15', 'Repair the engine');

--
-- Dumping data for table `equipment_repairs`
--

LOCK TABLES `equipment_repairs` WRITE;
/*!40000 ALTER TABLE `equipment_repairs` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipment_repairs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `group` VALUES('1', 'magic group');
INSERT INTO `group` VALUES('2', 'tragic group');
INSERT INTO `group` VALUES('3', 'basic group');
INSERT INTO `group` VALUES('4', 'good group');

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loan`
--

DROP TABLE IF EXISTS `loan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loan` (
  `loan_id` int(11) NOT NULL,
  `loan_name` varchar(45) DEFAULT NULL,
  `amount` int(20) DEFAULT NULL,
  `authorized_employee_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`loan_id`),
  KEY `loan_ibfk_1_idx` (`authorized_employee_number`),
  CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`authorized_employee_number`) REFERENCES `personnel` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `loan` VALUES('111', 'name1', '1500000', '201901');
INSERT INTO `loan` VALUES('112', 'name2', '500000', '201802');
INSERT INTO `loan` VALUES('113', 'name3', '1100000', '201703');
INSERT INTO `loan` VALUES('114', 'name4', '900000', '201903');
INSERT INTO `loan` VALUES('115', 'name5', '700000', '201901');

--
-- Dumping data for table `loan`
--

LOCK TABLES `loan` WRITE;
/*!40000 ALTER TABLE `loan` DISABLE KEYS */;
/*!40000 ALTER TABLE `loan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL,
  `material_name` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


INSERT INTO `material` VALUES('1111', 'graphic card');
INSERT INTO `material` VALUES('1112', 'cpu');
INSERT INTO `material` VALUES('1113', 'ssd');
INSERT INTO `material` VALUES('1114', 'power supply');
INSERT INTO `material` VALUES('1115', 'monitor');

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_to_distributors`
--

DROP TABLE IF EXISTS `payments_to_distributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_to_distributors` (
  `payments_to_distributors_id` int(11) NOT NULL,
  `distributor_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`payments_to_distributors_id`),
  KEY `payments_to_distributors_ibfk_1_idx` (`distributor_id`),
  CONSTRAINT `payments_to_distributors_ibfk_1` FOREIGN KEY (`distributor_id`) REFERENCES `distributor` (`distributor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `payments_to_distributors` VALUES('1', '10001', '40000');
INSERT INTO `payments_to_distributors` VALUES('2', '10001', '50000');
INSERT INTO `payments_to_distributors` VALUES('3', '10002', '40000');
INSERT INTO `payments_to_distributors` VALUES('4', '10003', '60000');
INSERT INTO `payments_to_distributors` VALUES('5', '10004', '40000');
--
-- Dumping data for table `payments_to_distributors`
--

LOCK TABLES `payments_to_distributors` WRITE;
/*!40000 ALTER TABLE `payments_to_distributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_to_distributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel` (
  `employee_number` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `work_address` varchar(45) DEFAULT 'null',
  `home_address` varchar(45) DEFAULT 'null',
  PRIMARY KEY (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `personnel` VALUES('201901', 'Xiao', '1234567890', 'Washington, DC 20007', 'Chevy Chase, Maryland');
INSERT INTO `personnel` VALUES('201903', 'Zhao', '2123434341', '1860 N Scott St.', '1760 S Lynn St.');
INSERT INTO `personnel` VALUES('201904', 'Lin', '8218888888', 'Washington, DC 20007', '1870 N Scott St.');
INSERT INTO `personnel` VALUES('201905', 'Chen', '1111111111', 'Washington, DC 20007', '1851 N Quinn St.');
INSERT INTO `personnel` VALUES('201906', 'Huang', '2222222222', '1800 N Lynn St.', '1600 Wilson BLVD');
INSERT INTO `personnel` VALUES('201802', 'Gong', '3333333333', '1800 N Lynn St.', 'Chevy Chase, Maryland');
INSERT INTO `personnel` VALUES('201703', 'He', '4444444444', '1800 N Quinn St.', '1600 Wilson BLVD');
INSERT INTO `personnel` VALUES('201604', 'Haoran', '5555555555', '1800 N Lynn St.', '1870 N Scott St.');
--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_dependants`
--

DROP TABLE IF EXISTS `personnel_dependants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel_dependants` (
  `personnel_dependants_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_number` int(11) NOT NULL,
  `relation` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`personnel_dependants_id`),
  KEY `personnel_dependants_ibfk_1_idx` (`employee_number`),
  CONSTRAINT `personnel_dependants_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `personnel_dependants` VALUES('1', '201901', 'Jenny', 'mother');
INSERT INTO `personnel_dependants` VALUES('2', '201903', 'Kane', 'father');
INSERT INTO `personnel_dependants` VALUES('3', '201903', 'Kale', 'son');
INSERT INTO `personnel_dependants` VALUES('4', '201904', 'May', 'mother');
INSERT INTO `personnel_dependants` VALUES('5', '201905', 'Danny', 'brother');
INSERT INTO `personnel_dependants` VALUES('6', '201906', 'Jeff', 'brother');
INSERT INTO `personnel_dependants` VALUES('7', '201802', 'Tom', 'father');
INSERT INTO `personnel_dependants` VALUES('8', '201703', 'Tina', 'sister');
INSERT INTO `personnel_dependants` VALUES('9', '201604', 'Tim', 'brother');
--
-- Dumping data for table `personnel_dependants`
--

LOCK TABLES `personnel_dependants` WRITE;
/*!40000 ALTER TABLE `personnel_dependants` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_dependants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_position`
--

DROP TABLE IF EXISTS `personnel_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel_position` (
  `personnel_position_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_number` int(11) NOT NULL,
  `position` varchar(45) NOT NULL,
  `start_time` date DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  PRIMARY KEY (`personnel_position_id`),
  KEY `personnel_position_ibfk_1_idx` (`employee_number`),
  CONSTRAINT `personnel_position_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `personnel_position` VALUES('1', '201901', 'project manager', '2019-03-05', '2019-04-01');
INSERT INTO `personnel_position` VALUES('2', '201901', 'software engineer', '2018-04-07', '2019-09-21');
INSERT INTO `personnel_position` VALUES('3', '201903', 'software engineer', '2017-03-06', '2019-03-01');
INSERT INTO `personnel_position` VALUES('4', '201904', 'developer', '2019-03-05', '2019-10-08');

--
-- Dumping data for table `personnel_position`
--

LOCK TABLES `personnel_position` WRITE;
/*!40000 ALTER TABLE `personnel_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel_project`
--

DROP TABLE IF EXISTS `personnel_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnel_project` (
  `employee_number` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `evaluation` int(1) NOT NULL COMMENT '0:poor1:fair2:good3:great',
  PRIMARY KEY (`employee_number`,`project_id`),
  KEY `personnel_project_ibfk_2_idx` (`project_id`),
  CONSTRAINT `personnel_project_ibfk_1` FOREIGN KEY (`employee_number`) REFERENCES `personnel` (`employee_number`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `personnel_project_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `personnel_project` VALUES('201901', '20190101', '3');
INSERT INTO `personnel_project` VALUES('201903', '20190101', '2');
INSERT INTO `personnel_project` VALUES('201904', '20190201', '0');
INSERT INTO `personnel_project` VALUES('201905', '20190102', '2');
INSERT INTO `personnel_project` VALUES('201906', '20190202', '1');
INSERT INTO `personnel_project` VALUES('201802', '20190301', '0');
INSERT INTO `personnel_project` VALUES('201703', '20190301', '3');
INSERT INTO `personnel_project` VALUES('201604', '20190201', '3');
INSERT INTO `personnel_project` VALUES('201901', '20190201', '3');
INSERT INTO `personnel_project` VALUES('201901', '20190202', '3');
--
-- Dumping data for table `personnel_project`
--

LOCK TABLES `personnel_project` WRITE;
/*!40000 ALTER TABLE `personnel_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `personnel_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(45) NOT NULL,
  `cost` int(20) DEFAULT NULL,
  `earn` int(20) DEFAULT NULL,
  `start_year` year(4) DEFAULT NULL,
  `end_year` year(4) DEFAULT NULL,
  `performance_rating` int(3) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `project` VALUES('20190101', 'sun', '1000000', '1000001', '2017', '2019', '100');
INSERT INTO `project` VALUES('20190102', 'moon', '1000002', '1000001', '2016', '2017', '80');
INSERT INTO `project` VALUES('20190201', 'star', '900000', '1200000', '2017', '2018', '90');
INSERT INTO `project` VALUES('20190202', 'jupiter', '1000000', '1300000', '2018', '2019', '60');
INSERT INTO `project` VALUES('20190301', 'sun', '1000000', '900000', '2019', '2020', '91');

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project_material`
--

DROP TABLE IF EXISTS `project_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_material` (
  `project_id` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`project_id`,`material_id`),
  KEY `project_material_ibfk_2_idx` (`material_id`),
  CONSTRAINT `project_material_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON UPDATE RESTRICT,
  CONSTRAINT `project_material_ibfk_2` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `project_material` VALUES('20190101', '1111');
INSERT INTO `project_material` VALUES('20190101', '1112');
INSERT INTO `project_material` VALUES('20190102', '1113');
INSERT INTO `project_material` VALUES('20190201', '1114');
INSERT INTO `project_material` VALUES('20190202', '1115');
INSERT INTO `project_material` VALUES('20190301', '1111');

--
-- Dumping data for table `project_material`
--

LOCK TABLES `project_material` WRITE;
/*!40000 ALTER TABLE `project_material` DISABLE KEYS */;
/*!40000 ALTER TABLE `project_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'notap2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-08 12:16:12
