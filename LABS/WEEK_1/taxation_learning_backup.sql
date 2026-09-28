-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: taxation_learning
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `financial_year`
--

DROP TABLE IF EXISTS `financial_year`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_year` (
  `year_id` int NOT NULL,
  `year_label` varchar(9) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `filing_deadline` date DEFAULT NULL,
  `is_current` tinyint(1) NOT NULL,
  PRIMARY KEY (`year_id`),
  UNIQUE KEY `year_label` (`year_label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_year`
--

LOCK TABLES `financial_year` WRITE;
/*!40000 ALTER TABLE `financial_year` DISABLE KEYS */;
INSERT INTO `financial_year` VALUES (1,'2020-2021','2020-04-01','2021-03-31','2021-07-31',0),(2,'2021-2022','2021-04-01','2022-03-31','2022-07-31',0),(3,'2022-2023','2022-04-01','2023-03-31','2023-07-31',0),(4,'2023-2024','2023-04-01','2024-03-31','2024-07-31',0),(5,'2024-2025','2024-04-01','2025-03-31','2025-07-31',0),(6,'2025-2026','2025-04-01','2026-03-31','2026-07-31',1);
/*!40000 ALTER TABLE `financial_year` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_category`
--

DROP TABLE IF EXISTS `income_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_category` (
  `category_id` int NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `taxable` tinyint(1) NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `category_name` (`category_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_category`
--

LOCK TABLES `income_category` WRITE;
/*!40000 ALTER TABLE `income_category` DISABLE KEYS */;
INSERT INTO `income_category` VALUES (1,'Salary','Income received from employment',1),(2,'Business','Income earned from business activities',1),(3,'House Property','Income received from property or rent',1),(4,'Capital Gains','Income from transfer of eligible assets',1),(5,'Other Sources','Income such as bank interest',1),(6,'Agricultural Income','Income from eligible agricultural activities',0),(7,'Rental Income','Income received from renting property',1);
/*!40000 ALTER TABLE `income_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `income_record`
--

DROP TABLE IF EXISTS `income_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `income_record` (
  `income_id` int NOT NULL,
  `taxpayer_id` int NOT NULL,
  `income_source` varchar(100) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `received_date` date NOT NULL,
  `financial_year` varchar(9) NOT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`income_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `income_record`
--

LOCK TABLES `income_record` WRITE;
/*!40000 ALTER TABLE `income_record` DISABLE KEYS */;
INSERT INTO `income_record` VALUES (1001,101,'TechNova Solutions','Salary',850000.00,'2026-03-31','2025-2026',NULL),(1002,102,'City Care Hospital','Salary',1200000.00,'2026-03-31','2025-2026',NULL),(1003,103,'Reddy Enterprises','Business',1800000.00,'2026-03-31','2025-2026',NULL),(1004,104,'Sunrise School','Salary',620000.00,'2026-03-31','2025-2026',NULL),(1005,105,'Web Design Projects','Business',750000.00,'2026-03-31','2025-2026',NULL),(1006,106,'Professional Consulting','Business',1500000.00,'2026-03-31','2025-2026',NULL);
/*!40000 ALTER TABLE `income_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taxpayer`
--

DROP TABLE IF EXISTS `taxpayer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taxpayer` (
  `taxpayer_id` int NOT NULL,
  `pan_number` varchar(10) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `date_of_birth` date NOT NULL,
  `occupation` varchar(100) NOT NULL,
  `annual_income` decimal(12,2) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`taxpayer_id`),
  UNIQUE KEY `pan_number` (`pan_number`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taxpayer`
--

LOCK TABLES `taxpayer` WRITE;
/*!40000 ALTER TABLE `taxpayer` DISABLE KEYS */;
INSERT INTO `taxpayer` VALUES (101,'ABCDE1234F','Ravi Kumar','1995-06-15','Software Engineer',950000.00,'ravi.kumar@example.com',1,NULL),(102,'BCDEF2345G','Priya Sharma','1992-11-22','Doctor',1200000.00,'priya.sharma@example.com',1,NULL),(103,'CDEFG3456H','Arjun Reddy','1988-03-10','Business Owner',1800000.00,'arjun.reddy@example.com',1,NULL),(104,'DEFGH4567J','Sneha Patel','1998-08-05','Teacher',620000.00,'sneha.patel@example.com',1,NULL),(105,'EFGHJ5678K','Kiran Rao','1990-01-18','Software Consultant',750000.00,'kiran.rao@example.com',1,NULL),(106,'FGHJK6789L','Meera Singh','1985-12-30','Consultant',1500000.00,'meera.singh@example.com',1,NULL);
/*!40000 ALTER TABLE `taxpayer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-27 15:17:27
