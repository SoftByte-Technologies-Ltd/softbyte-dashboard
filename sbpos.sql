-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: sbpos
-- ------------------------------------------------------
-- Server version	8.0.21-0ubuntu0.20.04.4

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

--
-- Table structure for table `access_right`
--

DROP TABLE IF EXISTS `access_right`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_right` (
  `access_right_id` int NOT NULL,
  `access_right_description` varchar(50) DEFAULT NULL,
  `active` varchar(1) DEFAULT NULL,
  `indorder` int DEFAULT NULL,
  `posbutton` char(1) DEFAULT NULL,
  PRIMARY KEY (`access_right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_right`
--

LOCK TABLES `access_right` WRITE;
/*!40000 ALTER TABLE `access_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_right` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_right_module`
--

DROP TABLE IF EXISTS `access_right_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_right_module` (
  `access_right_module_id` varchar(36) NOT NULL,
  `access_right_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `staff_category_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`access_right_module_id`),
  KEY `access_right_access_right_module_FK1` (`access_right_id`),
  CONSTRAINT `access_right_access_right_module_FK1` FOREIGN KEY (`access_right_id`) REFERENCES `access_right` (`access_right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_right_module`
--

LOCK TABLES `access_right_module` WRITE;
/*!40000 ALTER TABLE `access_right_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_right_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES ('fb6f183f7a03');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_trans`
--

DROP TABLE IF EXISTS `bank_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_trans` (
  `bank_trans_id` varchar(36) NOT NULL,
  `bank_id` varchar(36) DEFAULT NULL,
  `bank_trans_type_id` varchar(36) DEFAULT NULL,
  `trans_ref` varchar(50) DEFAULT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `trans_amount` decimal(18,2) DEFAULT NULL,
  `trans_running_bal` decimal(18,2) DEFAULT NULL,
  `trans_comment` varchar(250) DEFAULT NULL,
  `trans_complete` char(1) DEFAULT NULL,
  `trans_completed_by` varchar(36) DEFAULT NULL,
  `trans_completed_on` datetime(6) DEFAULT NULL,
  `trans_cancelled` char(1) DEFAULT NULL,
  `trans_cancelled_by` varchar(36) DEFAULT NULL,
  `trans_cancelled_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `due_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`bank_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_trans`
--

LOCK TABLES `bank_trans` WRITE;
/*!40000 ALTER TABLE `bank_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bank_trans_type`
--

DROP TABLE IF EXISTS `bank_trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bank_trans_type` (
  `bank_trans_type_id` varchar(36) NOT NULL,
  `bank_trans_type_description` varchar(50) DEFAULT NULL,
  `bank_trans_type_sign` char(1) DEFAULT NULL,
  `bank_trans_type_count` double DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `pair_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`bank_trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bank_trans_type`
--

LOCK TABLES `bank_trans_type` WRITE;
/*!40000 ALTER TABLE `bank_trans_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `bank_id` varchar(36) NOT NULL,
  `bank_acc_no` varchar(50) DEFAULT NULL,
  `bank_name` varchar(250) DEFAULT NULL,
  `bank_running_bal` decimal(18,2) DEFAULT NULL,
  `total_credit` decimal(18,2) DEFAULT NULL,
  `total_debit` decimal(18,2) DEFAULT NULL,
  `account_manager` varchar(250) DEFAULT NULL,
  `account_details` varchar(250) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch_table`
--

DROP TABLE IF EXISTS `batch_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch_table` (
  `batch_id` varchar(36) DEFAULT NULL,
  `batchno` longtext,
  `batchexpiry` datetime(6) DEFAULT NULL,
  `batch_quantity` bigint DEFAULT NULL,
  `batch_balance` bigint DEFAULT NULL,
  `del_ref` varchar(50) DEFAULT NULL,
  `batch_comment` longtext,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `location_product_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `grnref` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch_table`
--

LOCK TABLES `batch_table` WRITE;
/*!40000 ALTER TABLE `batch_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bom`
--

DROP TABLE IF EXISTS `bom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bom` (
  `bom_id` varchar(36) NOT NULL,
  `parent_location_product_id` varchar(36) DEFAULT NULL,
  `location_product_id` varchar(36) DEFAULT NULL,
  `quantity` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`bom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bom`
--

LOCK TABLES `bom` WRITE;
/*!40000 ALTER TABLE `bom` DISABLE KEYS */;
/*!40000 ALTER TABLE `bom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `booking_id` varchar(36) NOT NULL,
  `booking_desc` varchar(250) DEFAULT NULL,
  `booking_amount` decimal(18,2) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch`
--

DROP TABLE IF EXISTS `branch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch` (
  `branch_id` int NOT NULL,
  `branch_name` longtext,
  `company_id` int DEFAULT NULL,
  `cat_levy_charged` char(1) DEFAULT NULL,
  `period` datetime(6) DEFAULT NULL,
  `reprint` char(1) DEFAULT NULL,
  `printcaptain` char(1) DEFAULT NULL,
  `billheader` char(1) DEFAULT NULL,
  `randomnames` char(1) DEFAULT NULL,
  `routetrips` char(1) DEFAULT NULL,
  `string1` int DEFAULT NULL,
  `string2` int DEFAULT NULL,
  `custbalinrct` char(1) DEFAULT NULL,
  `changeqty` char(1) DEFAULT NULL,
  `customertrcpt` char(1) DEFAULT NULL,
  `expdate` varchar(36) DEFAULT NULL,
  `branchcontact` longtext,
  `sms_api_key` longtext,
  `sms_user_name` varchar(50) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `modem_enabled` char(1) DEFAULT NULL,
  `modem_port` varchar(50) DEFAULT NULL,
  `mpesa` char(1) DEFAULT NULL,
  `wsale` char(1) DEFAULT NULL,
  `postouch` char(1) DEFAULT NULL,
  `mpesaurl` varchar(250) DEFAULT NULL,
  `courierservices` char(1) DEFAULT NULL,
  `online_sync` char(1) DEFAULT NULL,
  `selforder` char(1) DEFAULT NULL,
  `print_credetails` char(1) DEFAULT NULL,
  `sendsms` char(1) DEFAULT NULL,
  `tallyinter` char(1) DEFAULT NULL,
  `tallyserver` longtext,
  PRIMARY KEY (`branch_id`),
  KEY `Company_Branch_FK1` (`company_id`),
  CONSTRAINT `Company_Branch_FK1` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch`
--

LOCK TABLES `branch` WRITE;
/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` VALUES (122,'NAROK',122,'N','2020-09-30 23:59:59.000000','N','N','N','','Y',48,48,'Y','N','Y','7/31/2016 12:00:00 AM','','','','Y','N','','N','Y','N','','','Y','','','','','');
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bulk_sms`
--

DROP TABLE IF EXISTS `bulk_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bulk_sms` (
  `sms_id` varchar(36) NOT NULL,
  `bulk_sms_ref` longtext,
  `sms_to` longtext,
  `sms_to_name` varchar(250) DEFAULT NULL,
  `sms_message` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `sms_by` varchar(36) DEFAULT NULL,
  `sms_on` datetime(6) DEFAULT NULL,
  `sms_sent` char(1) DEFAULT NULL,
  `sms_sent_on` datetime(6) DEFAULT NULL,
  `sms_cancelled` char(1) DEFAULT NULL,
  `sms_cancelled_by` varchar(36) DEFAULT NULL,
  `sms_cancelled_on` datetime(6) DEFAULT NULL,
  `status` longtext,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`sms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bulk_sms`
--

LOCK TABLES `bulk_sms` WRITE;
/*!40000 ALTER TABLE `bulk_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `bulk_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` varchar(36) NOT NULL,
  `category_desc` varchar(50) DEFAULT NULL,
  `category_count` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `rmargin` decimal(18,2) DEFAULT NULL,
  `wmargin` decimal(18,2) DEFAULT NULL,
  `category_code` char(5) DEFAULT NULL,
  `category_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('3e96ad9a-879a-421c-ac31-837df0ce1b3a','MILK PRODUCT',3,122,'Y',1.30,1.25,'01','');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL,
  `company_name` varchar(225) DEFAULT NULL,
  `company_reg_no` varchar(50) DEFAULT NULL,
  `company_pinno` varchar(225) DEFAULT NULL,
  `company_vatno` varchar(100) DEFAULT NULL,
  `company_tel` varchar(225) DEFAULT NULL,
  `company_town` varchar(100) DEFAULT NULL,
  `company_county` varchar(100) DEFAULT NULL,
  `company_address` varchar(100) DEFAULT NULL,
  `company_shortname` varchar(100) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `nssf_number` varchar(100) DEFAULT NULL,
  `nhif_number` varchar(100) DEFAULT NULL,
  `logo` longblob,
  `payment_details` longtext,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (122,'ENKANASA MARKET LTD','Reg','P051404110G','REG','MILK MAN : 0727 933 140','PAYBILL 891355 ACC : NAME','NAROK,KENYA','P.O BOX 913 NAROK','','Y','','','','');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier`
--

DROP TABLE IF EXISTS `courier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier` (
  `courier_id` varchar(36) DEFAULT NULL,
  `courier_name` varchar(250) DEFAULT NULL,
  `courier_running_bal` decimal(18,2) DEFAULT NULL,
  `courier_total_credit` decimal(18,2) DEFAULT NULL,
  `courier_total_debit` decimal(18,2) DEFAULT NULL,
  `supplier_pin` varchar(50) DEFAULT NULL,
  `supplier_bank_acc` varchar(10) DEFAULT NULL,
  `supplier_phone_no` varchar(16) DEFAULT NULL,
  `supplier_address` varchar(50) DEFAULT NULL,
  `supplier_contact_person` varchar(30) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `active` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier`
--

LOCK TABLES `courier` WRITE;
/*!40000 ALTER TABLE `courier` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_settings`
--

DROP TABLE IF EXISTS `courier_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_settings` (
  `courier_setting_id` varchar(36) DEFAULT NULL,
  `courier_id` varchar(36) DEFAULT NULL,
  `base_amount` decimal(18,2) DEFAULT NULL,
  `base_kg` decimal(18,2) DEFAULT NULL,
  `per_extra_kg` decimal(18,2) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_settings`
--

LOCK TABLES `courier_settings` WRITE;
/*!40000 ALTER TABLE `courier_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_trans`
--

DROP TABLE IF EXISTS `courier_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_trans` (
  `courier_trans_id` varchar(36) NOT NULL,
  `courier_id` varchar(36) DEFAULT NULL,
  `courier_setting_id` varchar(36) DEFAULT NULL,
  `courier_type_id` varchar(36) DEFAULT NULL,
  `trans_ref` varchar(50) DEFAULT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `base_amount` decimal(18,2) DEFAULT NULL,
  `extra_kg_amount` decimal(18,2) DEFAULT NULL,
  `trans_comment` varchar(250) DEFAULT NULL,
  `trans_by` varchar(36) DEFAULT NULL,
  `trans_on` datetime(6) DEFAULT NULL,
  `trans_cancelled` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `trans_running_bal` decimal(18,2) DEFAULT NULL,
  `client_contact` varchar(250) DEFAULT NULL,
  `client_name` varchar(250) DEFAULT NULL,
  `destination` varchar(250) DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `trans_status` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`courier_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_trans`
--

LOCK TABLES `courier_trans` WRITE;
/*!40000 ALTER TABLE `courier_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courier_type`
--

DROP TABLE IF EXISTS `courier_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courier_type` (
  `courier_type_id` int NOT NULL,
  `courier_type_name` varchar(250) DEFAULT NULL,
  `courier_type_sign` char(1) DEFAULT NULL,
  PRIMARY KEY (`courier_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courier_type`
--

LOCK TABLES `courier_type` WRITE;
/*!40000 ALTER TABLE `courier_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `courier_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` varchar(36) NOT NULL,
  `customer_acc` varchar(50) DEFAULT NULL,
  `customer_name` longtext,
  `customer_running_bal` decimal(18,2) DEFAULT NULL,
  `customer_bank_acc` char(20) DEFAULT NULL,
  `customer_phone_no` char(16) DEFAULT NULL,
  `customer_address` char(50) DEFAULT NULL,
  `customer_contact_person` varchar(50) DEFAULT NULL,
  `customer_credit_limit` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `customer_total_credit` decimal(18,2) DEFAULT NULL,
  `customer_total_debit` decimal(18,2) DEFAULT NULL,
  `route_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `credit_period` int DEFAULT NULL,
  `credit_status` varchar(250) DEFAULT NULL,
  `pin_number` varchar(50) DEFAULT NULL,
  `clearpbalance` char(1) DEFAULT NULL,
  `request_orderno` char(1) DEFAULT NULL,
  `fprint` longblob,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('019eb285-fb6b-4105-941b-301a75f1af04','00023','Dama Reson',20000.00,'','0725244299','','',0.00,122,'Y',0.00,20000.00,'0','Y',NULL,'','','','N',''),('023c54ab-7d64-4e9e-a993-8f29b98c52f5','00067','Latasca ',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('03ec5086-6c3a-4d07-a24a-4832bceb6b80','00012','Asmara Restaurant Ltd',0.00,'','0727466263','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('0538104b-3f8e-4b19-afe2-ab250b53ecff','00054','JK Bosek',0.00,'','0727418405','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('053bc7ba-db9f-44ad-a44c-55a5738c9600','00005','Witaly LTD',0.00,'kcb 1236694058','0741932254','Vision Plaza 3rd Floor \r\nMombasa Road, Nairobi','Walter Zacchello',40000.00,122,'Y',0.00,0.00,'0','Y',NULL,'','P051710691I','','N',''),('05f11ca1-b87b-4aa1-9c7a-0dd102f13d61','00062','Julius Nyagwoka',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('0830cd2e-d60f-41fb-a94c-1fe770118612','00068','Leilah',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('148eea7e-d7e3-40e9-809e-2ce71bf5b939','00064','Knight Mukilima',6000.00,'','0722686728','','',0.00,122,'Y',0.00,6000.00,'0','Y',NULL,'','','','N',''),('16a88fbf-82d6-47c5-a08d-004104f779db','00002','GOV KUTI',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('16ea2928-ac8c-48dd-9177-146ddcc5174c','00104','Samson Wanjala',0.00,'','','Farm Sales','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('1a344da6-e992-499f-8216-bd782596a8e1','00124','Edward Ngothe',12000.00,'','','','',0.00,122,'Y',0.00,12000.00,'0','Y',NULL,'','','','N',''),('1d3d0a06-b0d9-40ac-965b-de63cdb0a031','00029','Eddy Ouma',11500.00,'','','','',0.00,122,'Y',0.00,11500.00,'0','Y',NULL,'','','','N',''),('20199206-2246-44c9-a8f0-03d36822ddeb','00061','Judy Nasieku',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('22083926-3167-41d6-a3f6-0aefb8afcbc2','00013','Auka John Gecheo',10000.00,'','0700869604','','',0.00,122,'Y',0.00,10000.00,'0','Y',NULL,'','','','N',''),('23a7532c-384e-401a-b2b2-0fc681f32b5e','00123','Diana Koech',15000.00,'','','','',0.00,122,'Y',0.00,15000.00,'0','Y',NULL,'','','','N',''),('25fd7d95-069c-4f0f-9826-6ec972075dbd','00052','Isaac Opondo',2000.00,'','','','',0.00,122,'Y',0.00,2000.00,'0','Y',NULL,'','','','N',''),('263b154f-26f0-46db-aa7f-7634a5e13eee','00042','Gideon Leparon Morintat',16000.00,'','','','',0.00,122,'Y',0.00,16000.00,'0','Y',NULL,'','','','N',''),('2baa9f9a-5db9-46b5-a376-7e4727bc0016','00038','Faith Pashile',0.00,'','0723665681','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('2e22aefb-0e9d-40c1-ba6a-d1fb93daa81d','00113','Tukero Ole Kina',20000.00,'','0722658508','','',0.00,122,'Y',0.00,20000.00,'0','Y',NULL,'','','','N',''),('3243309d-ba09-4813-89fc-c9525e6f7c33','00026','Dorcas',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('33579477-074a-40b3-8b42-fb61ea0697e8','00014','Boniface Mwangi',12000.00,'','0721791460','','',0.00,122,'Y',0.00,12000.00,'0','Y',NULL,'','','','N',''),('34c12585-21cd-4bc3-b941-bf49d697a062','00020','Connie Metto',1000.00,'','0723978806','','',0.00,122,'Y',0.00,1000.00,'0','Y',NULL,'','','','N',''),('37190d49-949e-49a4-babd-8f1cdc9dbdb2','00033','Evans Ondiek',25000.00,'','','','',0.00,122,'Y',0.00,25000.00,'0','Y',NULL,'','','','N',''),('380a1971-53dc-4f97-a3a0-bb7e462aec59','00025','Denis Mosota',12000.00,'','','','',0.00,122,'Y',0.00,12000.00,'0','Y',NULL,'','','','N',''),('411432a4-06e5-42e7-832a-b0ea85f75f64','00072','Loice Kiringo',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('436d2dc4-41da-4d07-a273-889c5df3b54b','00117','Viva Lounge',92000.00,'','0712296953','','',0.00,122,'Y',0.00,92000.00,'0','Y',NULL,'','','','N',''),('445cd44a-0b41-4548-8798-1526dd6b17ef','00099','Roselyn Omolo',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('45d68596-8472-4915-98f8-daa399178f77','00089','Pauline Okumu',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('45e64f29-c908-4606-800d-c4b9a6ca6e12','00049','Hon Joshua Kimilu',0.00,'','0722101252','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('47672c4a-c14d-47df-9c91-e230517a0c8f','00088','Patrick Osero',1000.00,'','','','',0.00,122,'Y',0.00,1000.00,'0','Y',NULL,'','','','N',''),('4a04fb09-8ca5-421e-ada3-d61f2ac84803','00079','Melody Nchoe - Kiyapi',0.00,'','0712426165','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('4a7f5298-9116-42bb-9d8c-d09ba560971a','00015','Brenda Boinett',1600.00,'','0728800165','','',0.00,122,'Y',0.00,1600.00,'0','Y',NULL,'','','','N',''),('4c67c3a0-611b-43b2-908f-54259ee15697','00007','Ann Kundu',0.00,'','0711392500','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('50ef70f1-a361-4887-8575-bd2403cb76aa','00041','Gerry Kweya',21000.00,'','0722723337','','',0.00,122,'Y',0.00,21000.00,'0','Y',NULL,'','','','N',''),('5179d62f-2e70-44c9-9ce0-2bc7665e8d2e','00102','Saito Salon',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('58d24a27-b821-429e-9d3e-de07db3184c9','00016','Catherine Mburu',1000.00,'','0777855855','','',0.00,122,'Y',0.00,1000.00,'0','Y',NULL,'','','','N',''),('58dea83e-c7a1-4fce-8e1a-38cbe8ca2af2','00070','Lenana Car Wash',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('5a5ffb15-25bf-4e6a-9ba3-e69eaa042d1f','00045','Ham Langat ',0.00,'','','Viraj Millenium','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('5a83c259-a4c6-443b-b693-898bfa476059','00034','Everlyn Langata',4000.00,'','','','',0.00,122,'Y',0.00,4000.00,'0','Y',NULL,'','','','N',''),('5d072989-96ce-41c3-a796-5692784e6283','00047','Hellen Masiyoi',13000.00,'','','','',0.00,122,'Y',0.00,13000.00,'0','Y',NULL,'','','','N',''),('61a4cbd2-646f-491a-85c0-9add54f95345','00037','Faith Mbogori',0.00,'','0723352623','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('6399faad-d4bf-410b-a5bc-fa7c22c0fdd6','00091','Peter Oiboo Morintat',44000.00,'','','','',0.00,122,'Y',0.00,44000.00,'0','Y',NULL,'','','','N',''),('6749be4e-5a02-4c10-867c-169543273d7a','00055','Joan Birir',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('67cf6522-2540-4bc4-8bbb-309f841c7130','00046','Haven Wines',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('6ddca388-d6f7-49fd-ac41-5d95582ed345','00098','Robert Njoroge',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('6f8385ca-df2b-4afc-b3b9-2479e4a55774','00053','Jerry Olekina',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('6fcb5958-073c-46ee-8b53-ee114df6d256','00009','Annette Abuya',8000.00,'','','','',0.00,122,'Y',0.00,8000.00,'0','Y',NULL,'','','','N',''),('728ea9fe-ec29-4472-90a0-bcba463bc9a6','00008','Annette Wekesa',0.00,'','0722731703','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('72ecda10-5a12-42fc-9004-50267cb1edde','00097','Robert Burale Wanguria',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('756de24f-be0f-4cdd-9d19-39a3691c33e9','00074','Lydia Kwamboka',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('76952d84-dfec-4a37-b3d2-a4484d8ce417','00108','Silvester Ole Ntutu',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('78ac07b9-e4e9-4b02-bbb7-d10390eb3459','00019','Chemutai Goin',19000.00,'','0721773426','','',0.00,122,'Y',0.00,19000.00,'0','Y',NULL,'','','','N',''),('79449829-a7fa-44e9-b169-2ccf81ab61e2','00078','Maureen Juma',17000.00,'','','','',0.00,122,'Y',0.00,17000.00,'0','Y',NULL,'','','','N',''),('7cb9c6cd-a50e-402c-868e-c9edf9591214','00036','Everlyne Murey',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('7e06dc43-b1dd-45f0-beec-58ced297a6b0','00040','Florence Wairimu La Tasca',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('7eaf60f7-5021-4de9-9003-926ae842aba7','00058','Josie',1000.00,'','','','',0.00,122,'Y',0.00,1000.00,'0','Y',NULL,'','','','N',''),('7f504574-c1d3-4af7-a70f-97f9c665db62','00103','Samson Cherarkey',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('81425063-77f7-4c70-ab12-b54130a1d24e','00106','Sharon',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('8390d6c5-5d13-445b-94b0-71c09270e2ac','00112','Tom P.A',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('8412cea6-bff2-4efd-9c9f-001f31490924','00024','David Kiama',46000.00,'','0719504747','','',0.00,122,'Y',0.00,46000.00,'0','Y',NULL,'','','','N',''),('845cc15a-e486-436f-924d-fd963d906513','00077','Martin Gitonga',51000.00,'','','','',0.00,122,'Y',0.00,51000.00,'0','Y',NULL,'','','','N',''),('855bdda2-2c5c-4923-b07f-f54075ec9443','00120','Wine Shop',2000.00,'','','','',0.00,122,'Y',0.00,2000.00,'0','Y',NULL,'','','','N',''),('85f96d09-50ff-4fb0-a59c-12088b886ffe','00092','Peter oiboo Mornintat',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('85fa71cd-60c0-4c8b-a9f6-cfc05c44e16b','00107','Shiro',12000.00,'','','','',0.00,122,'Y',0.00,12000.00,'0','Y',NULL,'','','','N',''),('86d6e3bc-6049-480d-ab9e-37693111eab8','00109','Somoina Kimojino ',42000.00,'','','','',0.00,122,'Y',0.00,42000.00,'0','Y',NULL,'','','','N',''),('8b937369-281f-4fc7-973f-38727ffe8928','00031','Esmael Mohammed Jibri',32000.00,'','0722238239','','',0.00,122,'Y',0.00,32000.00,'0','Y',NULL,'','','','N',''),('8e015b40-e05b-4157-a038-131599663d98','00071','Linda Cheruto',4000.00,'','0724897674','','',0.00,122,'Y',0.00,4000.00,'0','Y',NULL,'','','','N',''),('9110cb12-e495-4126-9d1c-f1495a8a06a1','00035','Everlyn Wanja',5000.00,'','','','',0.00,122,'Y',0.00,5000.00,'0','Y',NULL,'','','','N',''),('93c278e3-e5a9-4549-a198-fe8a2e58ad77','00111','Tom Ngoya',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('95c74c90-bf21-4f39-abb2-17810a707d32','00073','Lilian Birir',0.00,'','','Ngei 91','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('976edbcc-0b52-43ba-82eb-112d8b07fdfa','00027','Dr. Okello',0.00,'','0722426447','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('9b2aec5f-3572-42a7-b03f-337fbe4adba1','00118','Warda Jamal',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('9e4f2d13-90e6-4fdc-937f-417d15f61cb2','00116','Virginia ',1000.00,'','','Siaya Road','',0.00,122,'Y',0.00,1000.00,'0','Y',NULL,'','','','N',''),('a216429d-f5d5-47f5-aa30-377b3f58ab39','00030','Edward Kanchuel',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('a7124fca-86bf-477f-8dda-6c9dbd8b8f9f','00110','Steve Letoo',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('a845c835-9b1d-475c-92d7-b2e3594a786b','00075','Magdalene Solai',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('aa019e32-e4fb-4c50-bcd1-dd6ca62bb1be','00010','Anthony Mwenda',2000.00,'','0702481450','','',0.00,122,'Y',0.00,2000.00,'0','Y',NULL,'','','','N',''),('ab8d48f3-85d9-4db4-a7c5-2e021717125c','00125','Maureen Cherono',15000.00,'','','','',0.00,122,'Y',0.00,15000.00,'0','Y',NULL,'','','','N',''),('ac7af801-387e-4935-a489-c68923cbeed6','00094','Pilot',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('b28a431b-a091-4ff0-805d-28714fb840f1','00085','Natu',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('b32ec1e0-1970-443f-8895-0f8f17f13ab6','00059','Jotham Okome Arwa',18000.00,'','0722527575','','',0.00,122,'Y',0.00,18000.00,'0','Y',NULL,'','','','N',''),('b658214b-6485-4a48-b130-344fd3f14cb0','00080','Mercy Karen',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('b6ca3c67-00a4-4e7d-8b14-41a07cb95373','00090','Peter Kamaling / Patricia',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('b727e12d-be78-4b7a-a432-6b4bb9ce0bd8','00101','Ruth Mushi',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('b7bffd2f-9847-498c-8ad9-5ec04ca7a34a','00081','Mini',7000.00,'','','','',0.00,122,'Y',0.00,7000.00,'0','Y',NULL,'','','','N',''),('b97dff3d-ccd5-42f1-87e4-f78bb68bdae4','00018','Celine Muema',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('bd7221c2-f28e-4f45-b5f0-2cc09a3a1057','00069','Lel Kiprop',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('be2cfdff-1d40-41ce-abc2-5f13edb141a0','00048','Hon Irene Kasalu',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('c0eb9e5c-208c-423c-8b39-f1b46e668341','00096','Rashid Echesa',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('c530698a-582d-4209-8935-f2e4a985bc62','00017','Catherine Noosel',8000.00,'','','','',0.00,122,'Y',0.00,8000.00,'0','Y',NULL,'','','','N',''),('c6e5a364-b1e9-4a5c-9058-c5ba7bf7cf08','00095','Rachel Evans',13000.00,'','','','',0.00,122,'Y',0.00,13000.00,'0','Y',NULL,'','','','N',''),('c77a22a4-771f-426e-9f81-da967b117156','00119','Wilson Nderitu',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('c83b7ca6-d7f5-47ef-80fc-b5c1781423e3','00122','Yvonne Khamati',0.00,'','0725964850','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('cabca910-430f-40fd-b040-829d28816054','00050','Hon Nzambia Kilome',0.00,'','0723292223','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d2c20147-c140-4562-8865-148a02aca45a','00093','Petronila Were',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d353b998-f029-41b2-9a1c-5f3f088f6631','00076','Maggie Aduk',0.00,'','0721941547','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d4f700e9-ed98-435d-89bd-9e4cf0d3d761','00065','Lanoi Karia',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d54e7169-ff4e-4757-8188-05d97d052f7b','00043','Gladys Wanga',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d5af0e48-9db2-4626-9f63-0db7fb09de6d','00011','Anthony Nyawara',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d623797d-98e3-46de-81a7-201d580bbb3e','00082','Moses Njenga',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d6c3cd01-a852-4dd0-acc3-76feed24e020','00056','Joel Kiiru',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('d72fd6ad-d79b-4f3b-987f-e6b0b21fb9dc','00087','Noreen Nthiga',25000.00,'','','','',0.00,122,'Y',0.00,25000.00,'0','Y',NULL,'','','','N',''),('d96840e1-d1fc-4ea6-acc2-146364715005','00051','Hon Sam Atandi',13000.00,'','','','',0.00,122,'Y',0.00,13000.00,'0','Y',NULL,'','','','N',''),('e01c9983-6a73-49d0-a0a4-caf0c8953371','00121','Winnie Ayuma',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('e155e40a-c46e-474e-8053-7cdec6f96079','00022','Cyrus Ombati',5000.00,'','0722644025','','',0.00,122,'Y',0.00,5000.00,'0','Y',NULL,'','','','N',''),('e1a973f2-5fc8-43f4-a61e-6bf29bf1b485','00001','ROSE NGUGI',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('e2f54d2f-0ac2-4355-9ea3-8b2c3716c8d9','00021','Cortingham Park',2000.00,'','','','',0.00,122,'Y',0.00,2000.00,'0','Y',NULL,'','','','N',''),('e3c8b1c3-fb05-4108-b4ae-fd5a81bfc4f2','00039','Fatuma Gedi',13000.00,'','','','',0.00,122,'Y',0.00,13000.00,'0','Y',NULL,'','','','N',''),('e48d4616-aefa-4a39-8aeb-e6f0d35a123b','00084','Naisula Julian',10000.00,'','0722598765','','',0.00,122,'Y',0.00,10000.00,'0','Y',NULL,'','','','N',''),('e62cf748-a83c-4c14-b196-0777c5e1723c','00060','Judith Cheruiyot',0.00,'','0727288242','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('e7b3447e-0bf9-4f81-9670-ef054db1f0f3','00083','Mutinda Kiosk',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('edbfb622-b9f1-4d9b-8922-537680041836','00100','Reuben Ndolo',9000.00,'','','','',0.00,122,'Y',0.00,9000.00,'0','Y',NULL,'','','','N',''),('ee184bad-e85f-468f-8e62-999c00f7769d','00032','Esther Baraga',16600.00,'','0710646230','','',0.00,122,'Y',0.00,16600.00,'0','Y',NULL,'','','','N',''),('efeea884-593e-4bb2-8514-53720e826821','00063','Justice Isaac Lenaola',62000.00,'','','','',0.00,122,'Y',0.00,62000.00,'0','Y',NULL,'','','','N',''),('f028a114-715a-488e-9433-2281de93c139','00057','Joseph Kanyweiri',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('f03c7e98-4187-4b90-9ca6-94fda712d54b','00006','Ann Kabue',27000.00,'','','','',0.00,122,'Y',0.00,27000.00,'0','Y',NULL,'','','','N',''),('f625c9db-df65-4b0c-b29d-0a18c2b3987d','00105','Sankei',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('f66a7f4c-5abb-4953-bf15-34a67597e318','00066','Lassoi Lekanayia',0.00,'','0716798864','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('f68c5b0f-9a0e-404f-b8f2-69e48b5aa444','00044','Gov Oparanya',25000.00,'','','','',0.00,122,'Y',0.00,25000.00,'0','Y',NULL,'','','','N',''),('f7b68c36-3407-42ee-98d7-8d966a6fcb0a','00086','Nick',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('f9b9adb9-04af-43e6-b525-f8c28aade08d','00115','Vicky Kiplagat',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('f9f2ab6c-41c8-4319-a490-46f34bd663fa','00028','Dr. Porenzo',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N',''),('fa9746f2-4a47-4af8-ab13-e1811d3d2b0e','00114','Urban Coffee',0.00,'','','','',0.00,122,'Y',0.00,0.00,'0','Y',NULL,'','','','N','');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_trans`
--

DROP TABLE IF EXISTS `customer_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_trans` (
  `customer_trans_id` varchar(36) NOT NULL,
  `transaction_ref` varchar(50) DEFAULT NULL,
  `transaction_date` datetime(6) DEFAULT NULL,
  `transaction_amount` decimal(18,2) DEFAULT NULL,
  `transaction_approved` char(1) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  `trans_type_id` int DEFAULT NULL,
  `transaction_comment` longtext,
  `running_bal` decimal(18,2) DEFAULT NULL,
  `trip_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `trans_by` varchar(50) DEFAULT NULL,
  `transaction_vat` decimal(18,2) DEFAULT NULL,
  `discount` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`customer_trans_id`),
  KEY `Customer_customer_trans_FK1` (`customer_id`),
  KEY `Trans_type_customer_trans_FK1` (`trans_type_id`),
  CONSTRAINT `Customer_customer_trans_FK1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `Trans_type_customer_trans_FK1` FOREIGN KEY (`trans_type_id`) REFERENCES `trans_type` (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_trans`
--

LOCK TABLES `customer_trans` WRITE;
/*!40000 ALTER TABLE `customer_trans` DISABLE KEYS */;
INSERT INTO `customer_trans` VALUES ('058ce573-b416-40a9-a118-7830e5dff8fe','Customer/69','2020-09-06 18:44:45.000000',21000.00,'1','f625c9db-df65-4b0c-b29d-0a18c2b3987d',12,'',21000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:45:56.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:45:56.000000','',0.00,0.000),('05d1edc4-e12f-466c-8aac-f0101508c359','Customer/24','2020-09-06 18:09:29.000000',12000.00,'1','1a344da6-e992-499f-8216-bd782596a8e1',12,'',12000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:09:54.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:09:54.000000','',0.00,0.000),('09a7fba3-e9bf-497f-98b7-3ee3cc8baaef','Customer/6','2020-09-06 17:15:59.000000',10000.00,'1','22083926-3167-41d6-a3f6-0aefb8afcbc2',12,'',10000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:20:13.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:20:13.000000','',0.00,0.000),('0b871fad-073f-4f47-973f-0ee551a0debe','Customer/18','2020-09-06 17:58:48.000000',20000.00,'1','019eb285-fb6b-4105-941b-301a75f1af04',12,'',40000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:01:11.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:01:11.000000','',0.00,0.000),('0e1c31ca-ad15-4ea3-a58a-b8e919579f52','Customer/49','2020-09-06 18:29:01.000000',51000.00,'1','845cc15a-e486-436f-924d-fd963d906513',12,'',51000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:30:44.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:30:44.000000','',0.00,0.000),('1036ed9a-4d69-4863-84fc-fdb6759bffb5','Customer/17','2020-09-06 17:58:48.000000',20000.00,'1','019eb285-fb6b-4105-941b-301a75f1af04',12,'',20000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:00:00.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:00:00.000000','',0.00,0.000),('12488195-8580-4ca1-9cae-ea85d68ea2c0','Customer/27','2020-09-06 18:09:29.000000',25000.00,'1','37190d49-949e-49a4-babd-8f1cdc9dbdb2',12,'',25000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:12:01.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:12:01.000000','',0.00,0.000),('144ce1f9-6ea1-4bc4-bfc2-196fb599b28a','Customer/35','2020-09-06 18:09:29.000000',72000.00,'1','16a88fbf-82d6-47c5-a08d-004104f779db',12,'',72000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:19:04.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:19:04.000000','',0.00,0.000),('1bbbc088-8164-435b-ab57-45621535988d','Customer/71','2020-09-06 18:50:19.000000',42000.00,'1','86d6e3bc-6049-480d-ab9e-37693111eab8',12,'',42000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:50:46.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:50:46.000000','',0.00,0.000),('1c829c35-6441-4a63-9a68-2f776be44095','Customer/65','2020-09-06 18:41:44.000000',1000.00,'1','6ddca388-d6f7-49fd-ac41-5d95582ed345',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:43:24.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:43:24.000000','',0.00,0.000),('1e3a1f87-4c83-4dc5-8158-d20f1f2bc723','Customer/51','2020-09-06 18:32:25.000000',17000.00,'1','79449829-a7fa-44e9-b169-2ccf81ab61e2',12,'',17000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:33:24.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:33:24.000000','',0.00,0.000),('20f02774-0ee8-4c8c-bdbb-85e5170af975','Customer/63','2020-09-06 18:41:44.000000',13000.00,'1','c6e5a364-b1e9-4a5c-9058-c5ba7bf7cf08',12,'',13000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:42:36.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:42:36.000000','',0.00,0.000),('22afcf2a-78ba-4623-995c-00ccd4775bf7','Customer/46','2020-09-06 18:09:29.000000',1000.00,'1','0830cd2e-d60f-41fb-a94c-1fe770118612',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:28:35.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:28:35.000000','',0.00,0.000),('26429e73-99d1-4e68-8748-884af79a2fc0','Customer/42','2020-09-06 18:09:29.000000',18000.00,'1','b32ec1e0-1970-443f-8895-0f8f17f13ab6',12,'',18000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:23:31.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:23:31.000000','',0.00,0.000),('27051bf4-03ad-441e-a36a-8ed11c14af9a','Customer/73','2020-09-06 18:50:19.000000',3000.00,'1','8390d6c5-5d13-445b-94b0-71c09270e2ac',12,'',3000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:51:42.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:51:42.000000','',0.00,0.000),('2d329741-d6c0-461b-919a-b3328e8db61e','Customer/25','2020-09-06 18:09:29.000000',32000.00,'1','8b937369-281f-4fc7-973f-38727ffe8928',12,'',32000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:10:42.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:10:42.000000','',0.00,0.000),('31cce239-6ddb-4963-bee6-db51b9ae542c','Customer/37','2020-09-06 18:09:29.000000',33000.00,'1','5a5ffb15-25bf-4e6a-9ba3-e69eaa042d1f',12,'',33000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:20:39.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:20:39.000000','',0.00,0.000),('335164f8-a208-47e3-aefe-1c1de9e32911','Customer/5','2020-09-06 17:15:59.000000',2000.00,'1','aa019e32-e4fb-4c50-bcd1-dd6ca62bb1be',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:19:40.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:19:40.000000','',0.00,0.000),('383ecf41-4fc0-46b8-a2de-01566c191198','Customer/59','2020-09-06 18:36:28.000000',10000.00,'1','45d68596-8472-4915-98f8-daa399178f77',12,'',10000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:39:13.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:39:13.000000','',0.00,0.000),('38b35364-c919-4aad-83e2-37255a07e593','Customer/52','2020-09-06 18:32:25.000000',12000.00,'1','4a04fb09-8ca5-421e-ada3-d61f2ac84803',12,'',12000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:33:50.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:33:50.000000','',0.00,0.000),('3ed90548-b78f-4f9c-89e6-6f979ee56b85','Customer/77','2020-09-06 18:50:19.000000',92000.00,'1','436d2dc4-41da-4d07-a273-889c5df3b54b',12,'',92000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:53:53.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:53:53.000000','',0.00,0.000),('43b08673-979a-4b42-a666-95170cda3985','Customer/74','2020-09-06 18:50:19.000000',20000.00,'1','2e22aefb-0e9d-40c1-ba6a-d1fb93daa81d',12,'',20000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:52:29.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:52:29.000000','',0.00,0.000),('46f95df7-b9c5-4f9f-9bff-e7ebf8f9a2d9','Customer/47','2020-09-06 18:29:01.000000',4000.00,'1','8e015b40-e05b-4157-a038-131599663d98',12,'',4000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:29:32.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:29:32.000000','',0.00,0.000),('48cb5cfd-de95-405e-bb63-c00f61b59c86','Customer/21','2020-09-06 18:05:36.000000',15000.00,'1','23a7532c-384e-401a-b2b2-0fc681f32b5e',12,'',15000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:06:29.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:06:29.000000','',0.00,0.000),('4bbc0ab0-2fce-4d02-91d0-d9ed2d82f427','Customer/15','2020-09-06 17:15:59.000000',2000.00,'1','e2f54d2f-0ac2-4355-9ea3-8b2c3716c8d9',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:41:43.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:41:43.000000','',0.00,0.000),('50f3ed88-1064-41b8-8e79-4d867556c3d0','Customer/53','2020-09-06 18:32:25.000000',2600.00,'1','b658214b-6485-4a48-b130-344fd3f14cb0',12,'',2600.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:34:17.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:34:17.000000','',0.00,0.000),('559fc873-e17d-41fd-9d92-d7725fb9445c','Customer/40','2020-09-06 18:09:29.000000',2000.00,'1','25fd7d95-069c-4f0f-9826-6ec972075dbd',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:22:31.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:22:31.000000','',0.00,0.000),('5c081155-763b-46f5-ba59-9ae7e553b403','Customer/80','2020-09-06 18:50:19.000000',2000.00,'1','855bdda2-2c5c-4923-b07f-f54075ec9443',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:55:06.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:55:06.000000','',0.00,0.000),('5dd25522-2ea9-42b1-aaf9-932118c546f6','Customer/9','2020-09-06 17:15:59.000000',1600.00,'1','4a7f5298-9116-42bb-9d8c-d09ba560971a',12,'',3200.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:22:21.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:22:21.000000','',0.00,0.000),('5e3db9ba-ef97-4f4d-a129-5f0daf7588e9','Customer/48','2020-09-06 18:29:01.000000',3500.00,'1','411432a4-06e5-42e7-832a-b0ea85f75f64',12,'',3500.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:30:04.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:30:04.000000','',0.00,0.000),('5f94edb2-b67b-4a1a-bb78-6dee5af5130f','Customer/30','2020-09-06 18:09:29.000000',5000.00,'1','9110cb12-e495-4126-9d1c-f1495a8a06a1',12,'',10000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:14:29.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:14:29.000000','',0.00,0.000),('6157579c-8ad0-4e2b-b7f9-336496abf946','Customer/14','2020-09-06 17:15:59.000000',1000.00,'1','34c12585-21cd-4bc3-b941-bf49d697a062',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:37:53.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:37:53.000000','',0.00,0.000),('6c4a6147-55a9-4d50-bb89-d2e3ad771323','Customer/36','2020-09-06 18:09:29.000000',25000.00,'1','f68c5b0f-9a0e-404f-b8f2-69e48b5aa444',12,'',25000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:19:57.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:19:57.000000','',0.00,0.000),('6e2d4eb4-8c63-4356-8306-2273e70f6b10','Customer/57','2020-09-06 18:36:28.000000',25000.00,'1','d72fd6ad-d79b-4f3b-987f-e6b0b21fb9dc',12,'',25000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:37:36.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:37:36.000000','',0.00,0.000),('6e56d820-f5c2-4080-b04d-87ffd1720359','Customer/72','2020-09-06 18:50:19.000000',2000.00,'1','a7124fca-86bf-477f-8dda-6c9dbd8b8f9f',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:51:12.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:51:12.000000','',0.00,0.000),('6e8bdae9-3bc0-4dea-b319-4034e1185136','Customer/26','2020-09-06 18:09:29.000000',5000.00,'1','ee184bad-e85f-468f-8e62-999c00f7769d',12,'',21600.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:11:19.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:11:19.000000','',0.00,0.000),('70d6c3f2-4204-4054-bf0d-1cbe1a43b249','Customer/56','2020-09-06 18:36:28.000000',10000.00,'1','e48d4616-aefa-4a39-8aeb-e6f0d35a123b',12,'',10000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:37:13.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:37:13.000000','',0.00,0.000),('722d8728-2913-4f1b-82c9-bc67a8c10465','Customer/43','2020-09-06 18:09:29.000000',6000.00,'1','148eea7e-d7e3-40e9-809e-2ce71bf5b939',12,'',6000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:24:46.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:24:46.000000','',0.00,0.000),('725167e5-e6ac-4e8a-b0d9-db316ce89ddb','Customer/31','2020-09-06 18:09:29.000000',13000.00,'1','e3c8b1c3-fb05-4108-b4ae-fd5a81bfc4f2',12,'',13000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:15:34.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:15:34.000000','',0.00,0.000),('730b4cfd-af67-4890-9559-51842bc2e28f','Customer/13','2020-09-06 17:15:59.000000',19000.00,'1','78ac07b9-e4e9-4b02-bbb7-d10390eb3459',12,'',19000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:37:06.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:37:06.000000','',0.00,0.000),('801e037e-9b80-44ed-b3c0-e73386422dd9','Customer/22','2020-09-06 18:05:36.000000',4000.00,'1','f9f2ab6c-41c8-4319-a490-46f34bd663fa',12,'',4000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:07:06.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:07:06.000000','',0.00,0.000),('86a00f91-b602-469d-a86d-17edfdd7a3f7','Customer/68','2020-09-06 18:44:45.000000',4000.00,'1','7f504574-c1d3-4af7-a70f-97f9c665db62',12,'',4000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:45:28.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:45:28.000000','',0.00,0.000),('90ce126f-89dd-49d0-b2f5-680b32d75df3','Customer/23','2020-09-06 18:05:36.000000',11500.00,'1','1d3d0a06-b0d9-40ac-965b-de63cdb0a031',12,'',11500.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:07:51.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:07:51.000000','',0.00,0.000),('9292d2b3-0c1f-47d1-be14-b2c226581f4f','Customer/66','2020-09-06 18:41:44.000000',43000.00,'1','e1a973f2-5fc8-43f4-a61e-6bf29bf1b485',12,'',43000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:43:53.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:43:53.000000','',0.00,0.000),('938f7689-ad7c-48c9-9b0b-0918bfe92033','Customer/76','2020-09-06 18:50:19.000000',1000.00,'1','9e4f2d13-90e6-4fdc-937f-417d15f61cb2',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:53:24.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:53:24.000000','',0.00,0.000),('9a435fc6-6f6e-4ef0-883f-3742c39581c1','Customer/32','2020-09-06 18:09:29.000000',21000.00,'1','50ef70f1-a361-4887-8575-bd2403cb76aa',12,'',21000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:16:12.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:16:12.000000','',0.00,0.000),('9eb424f7-c13b-4d05-a44a-bf0b99b6c22c','Customer/44','2020-09-06 18:09:29.000000',24000.00,'1','d4f700e9-ed98-435d-89bd-9e4cf0d3d761',12,'',24000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:26:39.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:26:39.000000','',0.00,0.000),('9fabef62-a7ab-4586-b0f4-45a18b5faaa8','Customer/79','2020-09-06 18:50:19.000000',10000.00,'1','c77a22a4-771f-426e-9f81-da967b117156',12,'',10000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:54:43.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:54:43.000000','',0.00,0.000),('a430525e-889f-4817-9031-348d6ae92b42','Customer/33','2020-09-06 18:09:29.000000',16000.00,'1','263b154f-26f0-46db-aa7f-7634a5e13eee',12,'',16000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:17:08.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:17:08.000000','',0.00,0.000),('a4b01278-642c-417e-9153-9162516795ab','Customer/29','2020-09-06 18:09:29.000000',5000.00,'1','9110cb12-e495-4126-9d1c-f1495a8a06a1',12,'',5000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:13:34.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:13:34.000000','',0.00,0.000),('a72cd2ef-6493-48a8-96fb-9e392310132f','Customer/81','2020-09-06 18:50:19.000000',4000.00,'1','c83b7ca6-d7f5-47ef-80fc-b5c1781423e3',12,'',4000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:55:32.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:55:32.000000','',0.00,0.000),('a8670e8e-15cc-4dfc-98d9-5e69db5fe1d4','Customer/2','2020-09-06 17:15:59.000000',27000.00,'1','f03c7e98-4187-4b90-9ca6-94fda712d54b',12,'',27000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:17:24.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:17:24.000000','',0.00,0.000),('aa21ef7c-4e24-4290-90dd-6079baea38e5','Customer/45','2020-09-06 18:09:29.000000',1000.00,'1','0830cd2e-d60f-41fb-a94c-1fe770118612',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:27:50.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:27:50.000000','',0.00,0.000),('aba95aba-0538-45b6-9561-414abe5eb8de','Customer/1','2020-09-06 17:08:00.000000',62000.00,'1','efeea884-593e-4bb2-8514-53720e826821',12,'',62000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:09:27.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:09:27.000000','',0.00,0.000),('af4e4cb5-d878-43b7-abee-f850471471ad','Customer/12','2020-09-06 17:15:59.000000',8000.00,'1','c530698a-582d-4209-8935-f2e4a985bc62',12,'',8000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:27:57.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:27:57.000000','',0.00,0.000),('af81d81e-e1f5-48b4-8a42-91355d0bdf59','Customer/41','2020-09-06 18:09:29.000000',1000.00,'1','7eaf60f7-5021-4de9-9003-926ae842aba7',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:22:55.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:22:55.000000','',0.00,0.000),('b3eca13f-3aea-46ff-afa9-18129062a522','Customer/61','2020-09-06 18:36:28.000000',44000.00,'1','6399faad-d4bf-410b-a5bc-fa7c22c0fdd6',12,'',44000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:40:21.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:40:21.000000','',0.00,0.000),('b8c50049-35c8-4bbc-bae6-5b6cefbae2dd','000001','2020-09-06 17:32:26.000000',70000.00,'1','efeea884-593e-4bb2-8514-53720e826821',10,'paid outstanding bill and overpaid by 8k ',-8000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:34:11.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:34:11.000000','',0.00,0.000),('b994e311-95e9-4554-b3ef-cd0c564b7d01','Customer/70','2020-09-06 18:44:45.000000',12000.00,'1','85fa71cd-60c0-4c8b-a9f6-cfc05c44e16b',12,'',12000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:46:22.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:46:22.000000','',0.00,0.000),('bb361e6d-abac-4273-a734-3932b37d9541','Customer/50','2020-09-06 18:32:25.000000',15000.00,'1','ab8d48f3-85d9-4db4-a7c5-2e021717125c',12,'',15000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:32:55.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:32:55.000000','',0.00,0.000),('c31b648f-3cd1-41d0-8ed4-d9bbbe79550a','Customer/10','2020-09-06 17:15:59.000000',1000.00,'1','58d24a27-b821-429e-9d3e-de07db3184c9',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:23:58.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:23:58.000000','',0.00,0.000),('c4b1228c-f20f-4737-98a0-7d596ba6dc81','Customer/75','2020-09-06 18:50:19.000000',26700.00,'1','f9b9adb9-04af-43e6-b525-f8c28aade08d',12,'',26700.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:52:57.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:52:57.000000','',0.00,0.000),('c73e5a9f-2918-482c-8edc-6f01e3e35b23','Customer/3','2020-09-06 17:15:59.000000',8000.00,'1','6fcb5958-073c-46ee-8b53-ee114df6d256',12,'',8000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:18:33.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:18:33.000000','',0.00,0.000),('cd26bc6f-069d-4a88-b1dd-a2ec6490fd54','Customer/64','2020-09-06 18:41:44.000000',6000.00,'1','c0eb9e5c-208c-423c-8b39-f1b46e668341',12,'',6000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:42:58.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:42:58.000000','',0.00,0.000),('cdbceb7a-6308-4076-a627-dce45dea887a','Customer/11','2020-09-06 17:15:59.000000',1000.00,'1','58d24a27-b821-429e-9d3e-de07db3184c9',12,'',2000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:26:14.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:26:14.000000','',0.00,0.000),('ce11954e-ccb6-4670-8d6d-c54e86c89d5f','Customer/67','2020-09-06 18:44:45.000000',9000.00,'1','edbfb622-b9f1-4d9b-8922-537680041836',12,'',9000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:45:06.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:45:06.000000','',0.00,0.000),('d4f23d73-1beb-4fde-ad8c-f0c1490dcbae','Customer/39','2020-09-06 18:09:29.000000',13000.00,'1','d96840e1-d1fc-4ea6-acc2-146364715005',12,'',13000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:21:45.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:21:45.000000','',0.00,0.000),('d9336c57-5af1-46d3-a8ea-4f72c5d87be7','Customer/54','2020-09-06 18:32:25.000000',2600.00,'1','b658214b-6485-4a48-b130-344fd3f14cb0',12,'',5200.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:34:57.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:34:57.000000','',0.00,0.000),('d9bd6622-d85b-42d8-88a2-cd0e3f0d2170','Customer/16','2020-09-06 17:58:48.000000',5000.00,'1','e155e40a-c46e-474e-8053-7cdec6f96079',12,'',5000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:59:27.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:59:27.000000','',0.00,0.000),('df5e461e-d81a-428d-aef0-c8054ccbae5f','Customer/8','2020-09-06 17:15:59.000000',1600.00,'1','4a7f5298-9116-42bb-9d8c-d09ba560971a',12,'',1600.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:21:35.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:21:35.000000','',0.00,0.000),('e53bfb94-00c2-458a-a210-b5767b22a513','Customer/4','2020-09-06 17:15:59.000000',16600.00,'1','ee184bad-e85f-468f-8e62-999c00f7769d',12,'',16600.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:19:06.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:19:06.000000','',0.00,0.000),('e980e9f9-a6c1-4987-acac-685db487a2cf','Customer/62','2020-09-06 18:41:44.000000',7000.00,'1','d2c20147-c140-4562-8865-148a02aca45a',12,'',7000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:42:09.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:42:09.000000','',0.00,0.000),('ed906508-c19b-4f6a-b87f-868a2a57aad6','Customer/58','2020-09-06 18:36:28.000000',1000.00,'1','47672c4a-c14d-47df-9c91-e230517a0c8f',12,'',1000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:38:39.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:38:39.000000','',0.00,0.000),('eda02001-8267-4923-8866-1e0decd93d1f','Customer/60','2020-09-06 18:36:28.000000',24000.00,'1','b6ca3c67-00a4-4e7d-8b14-41a07cb95373',12,'',24000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:39:43.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:39:43.000000','',0.00,0.000),('f0d932fc-7de3-43e7-9569-e073f27d8e4f','Customer/34','2020-09-06 18:09:29.000000',8000.00,'1','d54e7169-ff4e-4757-8188-05d97d052f7b',12,'',8000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:18:14.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:18:14.000000','',0.00,0.000),('f1478a3b-e51b-4eab-a6a9-5197a4b9eef1','Customer/78','2020-09-06 18:50:19.000000',13000.00,'1','9b2aec5f-3572-42a7-b03f-337fbe4adba1',12,'',13000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:54:16.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:54:16.000000','',0.00,0.000),('f7114689-dcb6-4390-aeb4-02baceea010b','Customer/55','2020-09-06 18:36:28.000000',7000.00,'1','b7bffd2f-9847-498c-8ad9-5ec04ca7a34a',12,'',7000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:36:46.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:36:46.000000','',0.00,0.000),('f78c1d3d-c9ee-4624-9551-f0b226816aa8','Customer/20','2020-09-06 17:58:48.000000',12000.00,'1','380a1971-53dc-4f97-a3a0-bb7e462aec59',12,'',12000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:03:14.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:03:14.000000','',0.00,0.000),('fb1d417f-987c-4691-b7dc-430d1e515512','Customer/28','2020-09-06 18:09:29.000000',4000.00,'1','5a83c259-a4c6-443b-b693-898bfa476059',12,'',4000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:13:02.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:13:02.000000','',0.00,0.000),('fd196c5b-3283-49c6-b9cf-4f353cacc9fb','Customer/38','2020-09-06 18:09:29.000000',13000.00,'1','5d072989-96ce-41c3-a796-5692784e6283',12,'',13000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:21:17.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:21:17.000000','',0.00,0.000),('fe490ce9-7021-4dc8-9d02-ca3bf567c1bf','Customer/7','2020-09-06 17:15:59.000000',12000.00,'1','33579477-074a-40b3-8b42-fb61ea0697e8',12,'',12000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:20:46.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 17:20:46.000000','',0.00,0.000),('fe542897-b701-4e02-8dde-d1b63ebabc75','Customer/19','2020-09-06 17:58:48.000000',46000.00,'1','8412cea6-bff2-4efd-9c9f-001f31490924',12,'',46000.00,'0','Y',122,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:02:40.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-06 18:02:40.000000','',0.00,0.000);
/*!40000 ALTER TABLE `customer_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `day_summary`
--

DROP TABLE IF EXISTS `day_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `day_summary` (
  `summary_id` varchar(36) NOT NULL,
  `noofshifts` int DEFAULT NULL,
  `summary_date` date DEFAULT NULL,
  `time_started` time(6) DEFAULT NULL,
  `time_ended` time(6) DEFAULT NULL,
  `day_started_by` longtext,
  `day_ended_by` longtext,
  `receipts_total_amount` bigint DEFAULT NULL,
  `total_vat` bigint DEFAULT NULL,
  `total_cat_levey` bigint DEFAULT NULL,
  `total_cash_amount` bigint DEFAULT NULL,
  `total_cheque_amount` bigint DEFAULT NULL,
  `total_card_amount` bigint DEFAULT NULL,
  `total_voucher_amount` bigint DEFAULT NULL,
  `total_mobile_money` bigint DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`summary_id`),
  KEY `Branch_Day_summary_FK1` (`branch_id`),
  CONSTRAINT `Branch_Day_summary_FK1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `day_summary`
--

LOCK TABLES `day_summary` WRITE;
/*!40000 ALTER TABLE `day_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `day_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_customer`
--

DROP TABLE IF EXISTS `delivery_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_customer` (
  `dcustomer_id` varchar(36) NOT NULL,
  `dcustomer_name` longtext,
  `dcustomer_number` varchar(250) DEFAULT NULL,
  `dcustomer_details` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `route_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `credit_period` int DEFAULT NULL,
  PRIMARY KEY (`dcustomer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_customer`
--

LOCK TABLES `delivery_customer` WRITE;
/*!40000 ALTER TABLE `delivery_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_details`
--

DROP TABLE IF EXISTS `delivery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_details` (
  `delivery_detail_id` varchar(36) NOT NULL,
  `receipt_ref` varchar(50) DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `delivery_amount` decimal(18,2) DEFAULT NULL,
  `delivery_paid` char(1) DEFAULT NULL,
  `dcustomer_id` varchar(36) DEFAULT NULL,
  `delivery_cancelled` char(1) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `cancelled_by` varchar(50) DEFAULT NULL,
  `delivery_comment` varchar(250) DEFAULT NULL,
  `delivery_location` varchar(50) DEFAULT NULL,
  `collection_by` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`delivery_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_details`
--

LOCK TABLES `delivery_details` WRITE;
/*!40000 ALTER TABLE `delivery_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `driver`
--

DROP TABLE IF EXISTS `driver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driver` (
  `driver_id` varchar(36) NOT NULL,
  `driver_name` longtext,
  `staff_id` varchar(36) DEFAULT NULL,
  `licence_no` varchar(50) DEFAULT NULL,
  `exp_date` datetime(6) DEFAULT NULL,
  `staff` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`driver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `driver`
--

LOCK TABLES `driver` WRITE;
/*!40000 ALTER TABLE `driver` DISABLE KEYS */;
/*!40000 ALTER TABLE `driver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet`
--

DROP TABLE IF EXISTS `fleet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet` (
  `vehicle_id` varchar(36) NOT NULL,
  `plate_no` varchar(50) DEFAULT NULL,
  `serial_no` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `make` varchar(50) DEFAULT NULL,
  `manufacture_year` datetime(6) DEFAULT NULL,
  `engine_size` varchar(50) DEFAULT NULL,
  `purchase_date` datetime(6) DEFAULT NULL,
  `identification` varchar(50) DEFAULT NULL,
  `fleet_owner_id` varchar(36) DEFAULT NULL,
  `transmission_type` varchar(50) DEFAULT NULL,
  `fuel_type` varchar(50) DEFAULT NULL,
  `current_mileage` decimal(18,2) DEFAULT NULL,
  `last_mileage` decimal(18,2) DEFAULT NULL,
  `total_mileage` decimal(18,2) DEFAULT NULL,
  `total_consumption` decimal(18,2) DEFAULT NULL,
  `avarage_consumption` decimal(18,2) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `driver_id` varchar(36) DEFAULT NULL,
  `vehicle_category_id` varchar(36) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  `net_weight` decimal(18,2) DEFAULT NULL,
  `gross_weight` decimal(18,2) DEFAULT NULL,
  `current_value` decimal(18,2) DEFAULT NULL,
  `starting_value` decimal(18,2) DEFAULT NULL,
  `depreciation` decimal(18,2) DEFAULT NULL,
  `salvage_value` decimal(18,2) DEFAULT NULL,
  `value_start_date` datetime(6) DEFAULT NULL,
  `value_current_date` datetime(6) DEFAULT NULL,
  `value_cycles` int DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `vehicle_available` char(1) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `leased` char(1) DEFAULT NULL,
  PRIMARY KEY (`vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet`
--

LOCK TABLES `fleet` WRITE;
/*!40000 ALTER TABLE `fleet` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_insuarance`
--

DROP TABLE IF EXISTS `fleet_insuarance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_insuarance` (
  `insuarance_id` varchar(36) NOT NULL,
  `insuarance_description` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`insuarance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_insuarance`
--

LOCK TABLES `fleet_insuarance` WRITE;
/*!40000 ALTER TABLE `fleet_insuarance` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet_insuarance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_owner`
--

DROP TABLE IF EXISTS `fleet_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_owner` (
  `fleet_owner_id` varchar(36) NOT NULL,
  `fleet_owner_name` longtext,
  `running_balance` decimal(18,2) DEFAULT NULL,
  `total_debit` decimal(18,2) DEFAULT NULL,
  `total_credit` decimal(18,2) DEFAULT NULL,
  `contacts` longtext,
  `active` char(1) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`fleet_owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_owner`
--

LOCK TABLES `fleet_owner` WRITE;
/*!40000 ALTER TABLE `fleet_owner` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet_owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_trans`
--

DROP TABLE IF EXISTS `fleet_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_trans` (
  `fleet_trans_id` varchar(36) DEFAULT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `trans_ref` varchar(50) DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  `driver_id` varchar(36) DEFAULT NULL,
  `fleet_trans_type_id` varchar(36) DEFAULT NULL,
  `unit_price` decimal(18,2) DEFAULT NULL,
  `quantity` decimal(18,2) DEFAULT NULL,
  `total_price` decimal(18,2) DEFAULT NULL,
  `comment` longtext,
  `completed` char(1) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `completed_by` varchar(36) DEFAULT NULL,
  `completed_on` datetime(6) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `ref_id` varchar(36) DEFAULT NULL,
  `trans_ref_type` varchar(50) DEFAULT NULL,
  `running_bal` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `trip_id` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `next_due` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_trans`
--

LOCK TABLES `fleet_trans` WRITE;
/*!40000 ALTER TABLE `fleet_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_trans_type`
--

DROP TABLE IF EXISTS `fleet_trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_trans_type` (
  `fleet_trans_type_id` varchar(36) NOT NULL,
  `type_description` longtext,
  `sign` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`fleet_trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_trans_type`
--

LOCK TABLES `fleet_trans_type` WRITE;
/*!40000 ALTER TABLE `fleet_trans_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet_trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hs_trans_file`
--

DROP TABLE IF EXISTS `hs_trans_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hs_trans_file` (
  `hs_trans_id` varchar(36) NOT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `trans_reference` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `trans_type_id` int DEFAULT NULL,
  `uom_code` char(3) DEFAULT NULL,
  `trans_quantity` bigint DEFAULT NULL,
  `trans_base_quantity` bigint DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `trans_comment` longtext,
  `product_id` varchar(36) DEFAULT NULL,
  `location_product_id` varchar(36) DEFAULT NULL,
  `complete` char(1) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `supplier_id` varchar(36) DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `del_note` varchar(50) DEFAULT NULL,
  `inv_no` varchar(50) DEFAULT NULL,
  `lpo_no` varchar(50) DEFAULT NULL,
  `cost_price` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `track_no` varchar(50) DEFAULT NULL,
  `tran_discount` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`hs_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hs_trans_file`
--

LOCK TABLES `hs_trans_file` WRITE;
/*!40000 ALTER TABLE `hs_trans_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `hs_trans_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insuarance`
--

DROP TABLE IF EXISTS `insuarance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insuarance` (
  `insuarance_id` varchar(36) NOT NULL,
  `insuarance_name` longtext,
  `insuarance_address` longtext,
  `insuarance_contactp` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`insuarance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insuarance`
--

LOCK TABLES `insuarance` WRITE;
/*!40000 ALTER TABLE `insuarance` DISABLE KEYS */;
/*!40000 ALTER TABLE `insuarance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insuarance_trans`
--

DROP TABLE IF EXISTS `insuarance_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insuarance_trans` (
  `insuarance_trans_id` varchar(36) NOT NULL,
  `insuarance_trans_ref` varchar(50) DEFAULT NULL,
  `insuarance_trans_date` datetime(6) DEFAULT NULL,
  `insuarance_id` varchar(36) DEFAULT NULL,
  `end_date` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `cost_amount` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `details` longtext,
  `comment` longtext,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `start_date` datetime(6) DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`insuarance_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insuarance_trans`
--

LOCK TABLES `insuarance_trans` WRITE;
/*!40000 ALTER TABLE `insuarance_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `insuarance_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_card`
--

DROP TABLE IF EXISTS `job_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_card` (
  `job_id` varchar(36) NOT NULL,
  `supplier_id` varchar(36) DEFAULT NULL,
  `job_ref` varchar(50) DEFAULT NULL,
  `job_date` datetime(6) DEFAULT NULL,
  `process_level` int DEFAULT NULL,
  `total_sorting` decimal(18,2) DEFAULT NULL,
  `total_crushing` decimal(18,2) DEFAULT NULL,
  `sorting_by` varchar(36) DEFAULT NULL,
  `crushing_by` varchar(36) DEFAULT NULL,
  `sorting_date` datetime(6) DEFAULT NULL,
  `crushing_date` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `total_received` decimal(18,2) DEFAULT NULL,
  `total_invoice` decimal(18,2) DEFAULT NULL,
  `total_payment` decimal(18,2) DEFAULT NULL,
  `balance_due` decimal(18,2) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `cancel_approved` char(1) DEFAULT NULL,
  `cancel_approved_by` varchar(36) DEFAULT NULL,
  `cancel_approved_on` datetime(6) DEFAULT NULL,
  `total_seeds` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `job_open` char(1) DEFAULT NULL,
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_card`
--

LOCK TABLES `job_card` WRITE;
/*!40000 ALTER TABLE `job_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_trans`
--

DROP TABLE IF EXISTS `job_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_trans` (
  `job_trans_id` varchar(36) NOT NULL,
  `job_id` varchar(36) DEFAULT NULL,
  `trans_ref` varchar(50) DEFAULT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `trans_level` int DEFAULT NULL,
  `trans_quantity` decimal(18,2) DEFAULT NULL,
  `price_per_unit` decimal(18,2) DEFAULT NULL,
  `total_cost` decimal(18,2) DEFAULT NULL,
  `trans_by` varchar(36) DEFAULT NULL,
  `trans_on` datetime(6) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `cancel_approved` char(1) DEFAULT NULL,
  `cancel_approved_by` varchar(36) DEFAULT NULL,
  `cancel_approved_on` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `quantity_processed` decimal(18,2) DEFAULT NULL,
  `quantity_remaining` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`job_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_trans`
--

LOCK TABLES `job_trans` WRITE;
/*!40000 ALTER TABLE `job_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loans`
--

DROP TABLE IF EXISTS `loans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loans` (
  `loan_id` varchar(36) NOT NULL,
  `loan_ref` varchar(50) DEFAULT NULL,
  `loan_date` datetime(6) DEFAULT NULL,
  `loan_amount` decimal(18,2) DEFAULT NULL,
  `loan_balance` decimal(18,2) DEFAULT NULL,
  `installments_number` int DEFAULT NULL,
  `loan_installment` decimal(18,2) DEFAULT NULL,
  `installments_paid` int DEFAULT NULL,
  `loan_interest` decimal(18,2) DEFAULT NULL,
  `loan_duration` varchar(50) DEFAULT NULL,
  `loan_approved` char(1) DEFAULT NULL,
  `loan_cancelled` char(1) DEFAULT NULL,
  `loan_approved_by` varchar(36) DEFAULT NULL,
  `loan_cancelled_by` varchar(36) DEFAULT NULL,
  `loan_approval_comments` longtext,
  `loan_cancelled_comments` longtext,
  `loan_comments` longtext,
  `last_installment_amount` decimal(18,2) DEFAULT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `loan_start_date` datetime(6) DEFAULT NULL,
  `loan_end_date` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loans`
--

LOCK TABLES `loans` WRITE;
/*!40000 ALTER TABLE `loans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` varchar(36) NOT NULL,
  `location_description` longtext,
  `branch_id` int DEFAULT NULL,
  `posl` longtext,
  `remoteprinter` varchar(50) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`location_id`),
  KEY `Branch_location_FK1` (`branch_id`),
  CONSTRAINT `Branch_location_FK1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES ('A2217DC7-D855-43DD-9F85-DFE168B93C70','ENKANASA SHOP',122,'1','','Y');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location_stock`
--

DROP TABLE IF EXISTS `location_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location_stock` (
  `location_product_id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `uom_code` char(3) DEFAULT NULL,
  `location_product_quantity` decimal(18,3) DEFAULT NULL,
  `location_product_max_quantity` decimal(18,2) DEFAULT NULL,
  `location_product_min_quantity` bigint DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `location_product_reorder_level` bigint DEFAULT NULL,
  `location_productcode` char(10) DEFAULT NULL,
  `location_product_scancode` char(20) DEFAULT NULL,
  `location_product_description` longtext,
  `location_product_sp` decimal(18,2) DEFAULT NULL,
  `location_product_vattable` char(1) DEFAULT NULL,
  `fixed_price` char(1) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `location_product_catlv` char(1) DEFAULT NULL,
  `location_product_sp1` decimal(18,2) DEFAULT NULL,
  `product_image` longblob,
  `accompaniments` longtext,
  `partaccompaniment` int DEFAULT NULL,
  `batch_tracking` char(1) DEFAULT NULL,
  `blockneg` char(1) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `packaging_uom` char(3) DEFAULT NULL,
  `packaging_qty` decimal(18,2) DEFAULT NULL,
  `packaging_fixed` char(1) DEFAULT NULL,
  `packaging_ratio` decimal(18,2) DEFAULT NULL,
  `fuelvat` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`location_product_id`),
  KEY `location_Location_Stock_FK1` (`location_id`),
  KEY `Stock_f_Location_Stock_FK1` (`product_id`),
  KEY `Uom_Location_Stock_FK1` (`uom_code`),
  CONSTRAINT `location_Location_Stock_FK1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `Stock_f_Location_Stock_FK1` FOREIGN KEY (`product_id`) REFERENCES `stock_f` (`product_id`),
  CONSTRAINT `Uom_Location_Stock_FK1` FOREIGN KEY (`uom_code`) REFERENCES `uom` (`uom_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location_stock`
--

LOCK TABLES `location_stock` WRITE;
/*!40000 ALTER TABLE `location_stock` DISABLE KEYS */;
INSERT INTO `location_stock` VALUES ('1d464746-e778-40d7-a2bc-6627aa43220d','3250b420-55cc-48f5-aa1a-e7566389fbef','EAC',0.000,0.00,0,'A2217DC7-D855-43DD-9F85-DFE168B93C70',0,'010002','010002','BUTTER',250.00,'Y','Y','3e96ad9a-879a-421c-ac31-837df0ce1b3a','N',250.00,_binary 'System.Byte[]','',0,'N','Y','Y','Y',122,'EAC',0.00,'N',0.00,'N'),('2cf13b31-ba53-44c9-ad03-4df7af7dc718','241f9d68-141f-4dfe-b7da-17673ef45bd9','LIT',0.000,0.00,0,'A2217DC7-D855-43DD-9F85-DFE168B93C70',0,'010003','010003','ENKANASA WATER',30.00,'Y','Y','3e96ad9a-879a-421c-ac31-837df0ce1b3a','N',30.00,_binary 'System.Byte[]','',0,'N','Y','Y','Y',122,'EAC',0.00,'N',0.00,'N'),('eb5e6589-e1ea-4d0b-8be0-3d2e8fa9f8e4','36c432ff-3ea8-4391-a2b5-971b6497d505','LIT',50.000,0.00,0,'A2217DC7-D855-43DD-9F85-DFE168B93C70',0,'010001','010001','FRESH MILK',100.00,'Y','Y','3e96ad9a-879a-421c-ac31-837df0ce1b3a','N',100.00,_binary 'System.Byte[]','',0,'N','Y','Y','Y',122,'EAC',0.00,'N',0.00,'N');
/*!40000 ALTER TABLE `location_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyaty_customer`
--

DROP TABLE IF EXISTS `loyaty_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyaty_customer` (
  `loyaty_customer_id` varchar(36) NOT NULL,
  `loyaty_customer_sir_name` varchar(250) DEFAULT NULL,
  `loyaty_customer_o_names` varchar(250) DEFAULT NULL,
  `loyaty_customer_nid` varchar(20) DEFAULT NULL,
  `loyaty_customer_phone` varchar(20) DEFAULT NULL,
  `loyaty_customer_points` decimal(18,2) DEFAULT NULL,
  `loyaty_customer_accured` decimal(18,2) DEFAULT NULL,
  `loyaty_customer_redeemed` decimal(18,2) DEFAULT NULL,
  `loyaty_customer_active` char(1) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`loyaty_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyaty_customer`
--

LOCK TABLES `loyaty_customer` WRITE;
/*!40000 ALTER TABLE `loyaty_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyaty_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyaty_customer_parameter`
--

DROP TABLE IF EXISTS `loyaty_customer_parameter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyaty_customer_parameter` (
  `loyaty_customer_para_id` varchar(36) NOT NULL,
  `per_point_amount` decimal(18,2) DEFAULT NULL,
  `minimum_receipt_amount` decimal(18,2) DEFAULT NULL,
  `round_off` decimal(18,2) DEFAULT NULL,
  `redeem_point_value` decimal(18,2) DEFAULT NULL,
  `redeem_active` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` varchar(10) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`loyaty_customer_para_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyaty_customer_parameter`
--

LOCK TABLES `loyaty_customer_parameter` WRITE;
/*!40000 ALTER TABLE `loyaty_customer_parameter` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyaty_customer_parameter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyaty_customer_trans`
--

DROP TABLE IF EXISTS `loyaty_customer_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyaty_customer_trans` (
  `loyaty_customer_trans_id` varchar(36) NOT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `trans_ref` varchar(50) DEFAULT NULL,
  `loyaty_customer_id` varchar(36) DEFAULT NULL,
  `loyaty_customer_trans_type_id` int DEFAULT NULL,
  `per_point_factor` decimal(18,2) DEFAULT NULL,
  `trans_points` decimal(18,2) DEFAULT NULL,
  `running_bal` decimal(18,2) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`loyaty_customer_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyaty_customer_trans`
--

LOCK TABLES `loyaty_customer_trans` WRITE;
/*!40000 ALTER TABLE `loyaty_customer_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyaty_customer_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loyaty_customer_trans_type`
--

DROP TABLE IF EXISTS `loyaty_customer_trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loyaty_customer_trans_type` (
  `loyaty_customer_trans_type_id` int NOT NULL,
  `loyaty_customer_trans_type_desc` varchar(250) DEFAULT NULL,
  `loyaty_customer_trans_type_sign` char(1) DEFAULT NULL,
  PRIMARY KEY (`loyaty_customer_trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loyaty_customer_trans_type`
--

LOCK TABLES `loyaty_customer_trans_type` WRITE;
/*!40000 ALTER TABLE `loyaty_customer_trans_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `loyaty_customer_trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mileage`
--

DROP TABLE IF EXISTS `mileage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mileage` (
  `mileage_id` varchar(36) DEFAULT NULL,
  `mileage_date` datetime(6) DEFAULT NULL,
  `trip_id` varchar(36) DEFAULT NULL,
  `last_mileage` decimal(18,2) DEFAULT NULL,
  `current_mileage` decimal(18,2) DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mileage`
--

LOCK TABLES `mileage` WRITE;
/*!40000 ALTER TABLE `mileage` DISABLE KEYS */;
/*!40000 ALTER TABLE `mileage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mm_sms`
--

DROP TABLE IF EXISTS `mm_sms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mm_sms` (
  `sms_id` varchar(36) NOT NULL,
  `sms_number` varchar(50) DEFAULT NULL,
  `sms_mm_ref` varchar(50) DEFAULT NULL,
  `sms_client` varchar(250) DEFAULT NULL,
  `sms_client_number` varchar(250) DEFAULT NULL,
  `sms_content` varchar(250) DEFAULT NULL,
  `sms_amount` decimal(18,2) DEFAULT NULL,
  `sms_date` datetime(6) DEFAULT NULL,
  `sms_credited` char(1) DEFAULT NULL,
  `sms_used` char(1) DEFAULT NULL,
  `sms_receipt_ref` varchar(250) DEFAULT NULL,
  `sms_type` varchar(10) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`sms_id`),
  UNIQUE KEY `IX_mm_sms` (`sms_mm_ref`),
  KEY `idx_mmref` (`sms_mm_ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mm_sms`
--

LOCK TABLES `mm_sms` WRITE;
/*!40000 ALTER TABLE `mm_sms` DISABLE KEYS */;
/*!40000 ALTER TABLE `mm_sms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` int NOT NULL,
  `module_description` longtext,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monthly_roll`
--

DROP TABLE IF EXISTS `monthly_roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monthly_roll` (
  `monthly_roll_id` varchar(36) NOT NULL,
  `monthly_roll_date` datetime(6) DEFAULT NULL,
  `monthly_roll_period` datetime(6) DEFAULT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `gross_pay` decimal(18,2) DEFAULT NULL,
  `paye` decimal(18,2) DEFAULT NULL,
  `nssf1` decimal(18,2) DEFAULT NULL,
  `nssf2` decimal(18,2) DEFAULT NULL,
  `nhif` decimal(18,2) DEFAULT NULL,
  `loan_deduction` decimal(18,2) DEFAULT NULL,
  `net_pay` decimal(18,2) DEFAULT NULL,
  `noncashbenefit` decimal(18,2) DEFAULT NULL,
  `allowable_deductions` decimal(18,2) DEFAULT NULL,
  `taxable_pay` decimal(18,2) DEFAULT NULL,
  `roll_by` varchar(36) DEFAULT NULL,
  `roll_cancelled` char(1) DEFAULT NULL,
  `roll_complete` char(1) DEFAULT NULL,
  `advancepayment` decimal(18,2) DEFAULT NULL,
  `insuarance_relief` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`monthly_roll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monthly_roll`
--

LOCK TABLES `monthly_roll` WRITE;
/*!40000 ALTER TABLE `monthly_roll` DISABLE KEYS */;
/*!40000 ALTER TABLE `monthly_roll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhif_rates`
--

DROP TABLE IF EXISTS `nhif_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhif_rates` (
  `rate_id` int NOT NULL,
  `rate_lower_limit` decimal(18,2) DEFAULT NULL,
  `rate_upper_limit` decimal(18,2) DEFAULT NULL,
  `deduction` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhif_rates`
--

LOCK TABLES `nhif_rates` WRITE;
/*!40000 ALTER TABLE `nhif_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhif_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nssf_rates`
--

DROP TABLE IF EXISTS `nssf_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nssf_rates` (
  `nssf_rate_id` int NOT NULL,
  `limit_lower_amount` decimal(18,2) DEFAULT NULL,
  `limit_upper_amount` decimal(18,2) DEFAULT NULL,
  `tier1` decimal(18,2) DEFAULT NULL,
  `tier2` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`nssf_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nssf_rates`
--

LOCK TABLES `nssf_rates` WRITE;
/*!40000 ALTER TABLE `nssf_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `nssf_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ozekimessagein`
--

DROP TABLE IF EXISTS `ozekimessagein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ozekimessagein` (
  `id` int DEFAULT NULL,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` longtext,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `operator` varchar(30) DEFAULT NULL,
  `msgtype` varchar(30) DEFAULT NULL,
  `reference` varchar(30) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ozekimessagein`
--

LOCK TABLES `ozekimessagein` WRITE;
/*!40000 ALTER TABLE `ozekimessagein` DISABLE KEYS */;
/*!40000 ALTER TABLE `ozekimessagein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ozekimessageout`
--

DROP TABLE IF EXISTS `ozekimessageout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ozekimessageout` (
  `id` int DEFAULT NULL,
  `sender` varchar(30) DEFAULT NULL,
  `receiver` varchar(30) DEFAULT NULL,
  `msg` varchar(160) DEFAULT NULL,
  `senttime` varchar(100) DEFAULT NULL,
  `receivedtime` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `msgtype` varchar(30) DEFAULT NULL,
  `reference` varchar(30) DEFAULT NULL,
  `status` varchar(30) DEFAULT NULL,
  `errormsg` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ozekimessageout`
--

LOCK TABLES `ozekimessageout` WRITE;
/*!40000 ALTER TABLE `ozekimessageout` DISABLE KEYS */;
/*!40000 ALTER TABLE `ozekimessageout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parameter_file`
--

DROP TABLE IF EXISTS `parameter_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parameter_file` (
  `parameter_id` varchar(36) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `lpo_no` int DEFAULT NULL,
  `quote_no` int DEFAULT NULL,
  `invoice_no` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `expence_no` int DEFAULT NULL,
  `rmargin` decimal(18,2) DEFAULT NULL,
  `wmargin` decimal(18,2) DEFAULT NULL,
  `foliono` int DEFAULT NULL,
  `customerno` int DEFAULT NULL,
  `supplierno` int DEFAULT NULL,
  `grn_no` int DEFAULT NULL,
  `fscan` char(1) DEFAULT NULL,
  `categoryno` int DEFAULT NULL,
  `jobno` int DEFAULT NULL,
  `staffno` int DEFAULT NULL,
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parameter_file`
--

LOCK TABLES `parameter_file` WRITE;
/*!40000 ALTER TABLE `parameter_file` DISABLE KEYS */;
INSERT INTO `parameter_file` VALUES ('1E9BD71F-B6BE-47B0-A041-AE9F86259635',122,0,0,0,'Y',0,1.25,1.20,0,0,0,0,'Y',1,0,0),('2ADEDCA7-E447-4A47-93E4-93995164E642',122,0,0,0,'Y',0,1.25,1.20,0,1,0,0,'Y',1,0,0);
/*!40000 ALTER TABLE `parameter_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_out`
--

DROP TABLE IF EXISTS `pay_out`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_out` (
  `pay_id` varchar(36) NOT NULL,
  `pay_date` date DEFAULT NULL,
  `pay_time` time(6) DEFAULT NULL,
  `pay_to` longtext,
  `staff_id` varchar(36) DEFAULT NULL,
  `pay_amount` decimal(18,2) DEFAULT NULL,
  `pay_type_id` int DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `cash_amount` decimal(18,2) DEFAULT NULL,
  `cc_amount` decimal(18,2) DEFAULT NULL,
  `voucher_amount` decimal(18,2) DEFAULT NULL,
  `pay_description` varchar(225) DEFAULT NULL,
  `cheque_amount` decimal(18,2) DEFAULT NULL,
  `mobile_amount` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  `till_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `f_id` varchar(36) DEFAULT NULL,
  `pay_ref` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`pay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_out`
--

LOCK TABLES `pay_out` WRITE;
/*!40000 ALTER TABLE `pay_out` DISABLE KEYS */;
INSERT INTO `pay_out` VALUES ('b88f40aa-a366-4712-a982-5e5bf8def471','2020-09-04','22:52:58.000000','Shift Float','1DD707B8-40F7-4F0E-8046-A14FBDD5384E',0.00,1,'null',0.00,0.00,0.00,'Float',0.00,0.00,122,'','756E3F26-D3C9-4773-A6B8-1575BE954F37','N','','');
/*!40000 ALTER TABLE `pay_out` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_trans`
--

DROP TABLE IF EXISTS `pay_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_trans` (
  `pay_trans_id` varchar(36) NOT NULL,
  `pay_trans_ref` varchar(50) DEFAULT NULL,
  `pay_trans_type_id` int DEFAULT NULL,
  `pay_trans_amount` decimal(18,2) DEFAULT NULL,
  `pay_trans_date` datetime(6) DEFAULT NULL,
  `pay_trans_by` varchar(36) DEFAULT NULL,
  `pay_trans_on` datetime(6) DEFAULT NULL,
  `pay_trans_run_bal` decimal(18,2) DEFAULT NULL,
  `pay_trans_cancelled` char(1) DEFAULT NULL,
  `pay_trans_period` datetime(6) DEFAULT NULL,
  `pay_trans_approved` char(1) DEFAULT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`pay_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_trans`
--

LOCK TABLES `pay_trans` WRITE;
/*!40000 ALTER TABLE `pay_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_trans_type`
--

DROP TABLE IF EXISTS `pay_trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_trans_type` (
  `pay_trans_type_id` int NOT NULL,
  `pay_trans_type_desc` varchar(250) DEFAULT NULL,
  `pay_trans_type_sign` char(1) DEFAULT NULL,
  PRIMARY KEY (`pay_trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_trans_type`
--

LOCK TABLES `pay_trans_type` WRITE;
/*!40000 ALTER TABLE `pay_trans_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pay_type`
--

DROP TABLE IF EXISTS `pay_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pay_type` (
  `pay_type_id` int NOT NULL,
  `pay_type_desc` char(50) DEFAULT NULL,
  `pay_type_action` char(10) DEFAULT NULL,
  `pay_type_include_zed` char(1) DEFAULT NULL,
  `showbo` char(1) DEFAULT NULL,
  `showfo` char(1) DEFAULT NULL,
  PRIMARY KEY (`pay_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pay_type`
--

LOCK TABLES `pay_type` WRITE;
/*!40000 ALTER TABLE `pay_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `pay_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paye_rates`
--

DROP TABLE IF EXISTS `paye_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paye_rates` (
  `paye_rate_id` int NOT NULL,
  `limit_lower_amount` decimal(18,2) DEFAULT NULL,
  `limit_upper_amount` decimal(18,2) DEFAULT NULL,
  `limit_percentage` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`paye_rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paye_rates`
--

LOCK TABLES `paye_rates` WRITE;
/*!40000 ALTER TABLE `paye_rates` DISABLE KEYS */;
/*!40000 ALTER TABLE `paye_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_plan`
--

DROP TABLE IF EXISTS `payment_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_plan` (
  `payment_plan_id` varchar(36) NOT NULL,
  `plan_date` datetime(6) DEFAULT NULL,
  `supplier_id` varchar(36) DEFAULT NULL,
  `plan_amount` decimal(18,2) DEFAULT NULL,
  `paid` char(1) DEFAULT NULL,
  `trans_id` varchar(36) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `advance` char(1) DEFAULT NULL,
  PRIMARY KEY (`payment_plan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_plan`
--

LOCK TABLES `payment_plan` WRITE;
/*!40000 ALTER TABLE `payment_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_receipt_details`
--

DROP TABLE IF EXISTS `pos_receipt_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receipt_details` (
  `receipt_details_id` varchar(36) NOT NULL,
  `receipt_id` varchar(36) DEFAULT NULL,
  `location_product_id` varchar(36) DEFAULT NULL,
  `trans_quantity` decimal(18,3) DEFAULT NULL,
  `product_sp` decimal(18,2) DEFAULT NULL,
  `product_bp` decimal(18,2) DEFAULT NULL,
  `vat` decimal(18,2) DEFAULT NULL,
  `cat_levy` decimal(18,2) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `footnote` varchar(50) DEFAULT NULL,
  `accompaniment_id` longtext,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `linenum` int DEFAULT NULL,
  `uom_code` char(3) DEFAULT NULL,
  `item_printed` char(1) DEFAULT NULL,
  `batch_no` longtext,
  `fuel_vat` decimal(18,3) DEFAULT NULL,
  `discount` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`receipt_details_id`),
  KEY `Location_Stock_pos_receipt_details_FK1` (`location_product_id`),
  KEY `Pos_receipts_pos_receipt_details_FK1` (`receipt_id`),
  CONSTRAINT `Location_Stock_pos_receipt_details_FK1` FOREIGN KEY (`location_product_id`) REFERENCES `location_stock` (`location_product_id`),
  CONSTRAINT `Pos_receipts_pos_receipt_details_FK1` FOREIGN KEY (`receipt_id`) REFERENCES `pos_receipts` (`receipt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_receipt_details`
--

LOCK TABLES `pos_receipt_details` WRITE;
/*!40000 ALTER TABLE `pos_receipt_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_receipt_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_receipt_payment`
--

DROP TABLE IF EXISTS `pos_receipt_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receipt_payment` (
  `pos_receipt_payment_id` varchar(36) NOT NULL,
  `receipt_id` varchar(36) DEFAULT NULL,
  `payment_date` datetime(6) DEFAULT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `till_id` varchar(36) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` int DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `payment_amount` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`pos_receipt_payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_receipt_payment`
--

LOCK TABLES `pos_receipt_payment` WRITE;
/*!40000 ALTER TABLE `pos_receipt_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_receipt_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pos_receipts`
--

DROP TABLE IF EXISTS `pos_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pos_receipts` (
  `receipt_id` varchar(36) NOT NULL,
  `receipt_ref` longtext,
  `receipt_date` date DEFAULT NULL,
  `receipt_time` time(6) DEFAULT NULL,
  `receipt_total_amount` decimal(18,2) DEFAULT NULL,
  `total_vat` decimal(18,2) DEFAULT NULL,
  `total_cat_levy` decimal(18,2) DEFAULT NULL,
  `receipt_cash_amount` decimal(18,2) DEFAULT NULL,
  `receipt_cheque_amount` decimal(18,2) DEFAULT NULL,
  `receipt_card_amount` decimal(18,2) DEFAULT NULL,
  `receipt_voucher_amount` decimal(18,2) DEFAULT NULL,
  `receipt_mobile_money` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `till_id` varchar(36) DEFAULT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `table_id` varchar(36) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  `receipt_paid` char(1) DEFAULT NULL,
  `customer_alias` longtext,
  `stype` longtext,
  `dlocation` longtext,
  `sales_staff_id` varchar(36) DEFAULT NULL,
  `receipt_code` varchar(50) DEFAULT NULL,
  `comments` longtext,
  `receipt_discount` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `uom_code` char(3) DEFAULT NULL,
  `bill_printed` char(1) DEFAULT NULL,
  `total_fuel_vat` decimal(18,2) DEFAULT NULL,
  `service_customer_id` varchar(36) DEFAULT NULL,
  `service_vehicle_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`receipt_id`),
  KEY `Branch_Pos_receipts_FK1` (`branch_id`),
  KEY `Customer_Pos_receipts_FK1` (`customer_id`),
  KEY `location_Pos_receipts_FK1` (`location_id`),
  KEY `shift_Pos_receipts_FK1` (`shift_id`),
  KEY `staff_Pos_receipts_FK1` (`staff_id`),
  KEY `till_Pos_receipts_FK1` (`till_id`),
  CONSTRAINT `Branch_Pos_receipts_FK1` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`branch_id`),
  CONSTRAINT `Customer_Pos_receipts_FK1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `location_Pos_receipts_FK1` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `shift_Pos_receipts_FK1` FOREIGN KEY (`shift_id`) REFERENCES `shift` (`shift_id`),
  CONSTRAINT `staff_Pos_receipts_FK1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`),
  CONSTRAINT `till_Pos_receipts_FK1` FOREIGN KEY (`till_id`) REFERENCES `till` (`till_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pos_receipts`
--

LOCK TABLES `pos_receipts` WRITE;
/*!40000 ALTER TABLE `pos_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `pos_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_table`
--

DROP TABLE IF EXISTS `process_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `process_table` (
  `process_id` varchar(36) NOT NULL,
  `process_name` varchar(50) DEFAULT NULL,
  `process_price` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `process_code` int DEFAULT NULL,
  PRIMARY KEY (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_table`
--

LOCK TABLES `process_table` WRITE;
/*!40000 ALTER TABLE `process_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `promotion_id` varchar(36) NOT NULL,
  `promotion_description` varchar(250) DEFAULT NULL,
  `promotion_quantity` decimal(18,2) DEFAULT NULL,
  `promotion_price` decimal(18,2) DEFAULT NULL,
  `promotion_uom` char(3) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `promotion_days` varchar(50) DEFAULT NULL,
  `promotion_created_by` varchar(36) DEFAULT NULL,
  `promotion_created_on` datetime(6) DEFAULT NULL,
  `promotion_updated_by` varchar(36) DEFAULT NULL,
  `promotion_updated_on` datetime(6) DEFAULT NULL,
  `promotion_deleted` char(1) DEFAULT NULL,
  `promotion_deleted_by` varchar(36) DEFAULT NULL,
  `promotion_deleted_on` datetime(6) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `start_time` varchar(50) DEFAULT NULL,
  `end_time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`promotion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `register_id` varchar(36) NOT NULL,
  `register_date` datetime(6) DEFAULT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `register_by` varchar(36) DEFAULT NULL,
  `register_on` datetime(6) DEFAULT NULL,
  `register_cancelled` char(1) DEFAULT NULL,
  `register_type_id` int DEFAULT NULL,
  `clock_in` datetime(6) DEFAULT NULL,
  `clock_out` datetime(6) DEFAULT NULL,
  `confirmed_by` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `register_type`
--

DROP TABLE IF EXISTS `register_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register_type` (
  `register_type_id` int NOT NULL,
  `register_type_description` varchar(250) DEFAULT NULL,
  `register_type_sign` char(1) DEFAULT NULL,
  PRIMARY KEY (`register_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register_type`
--

LOCK TABLES `register_type` WRITE;
/*!40000 ALTER TABLE `register_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `register_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repack`
--

DROP TABLE IF EXISTS `repack`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repack` (
  `repack_id` varchar(36) NOT NULL,
  `repark_base_product_id` varchar(36) DEFAULT NULL,
  `repark_to_product_id` varchar(36) DEFAULT NULL,
  `convertion_rate` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`repack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repack`
--

LOCK TABLES `repack` WRITE;
/*!40000 ALTER TABLE `repack` DISABLE KEYS */;
/*!40000 ALTER TABLE `repack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repack_items`
--

DROP TABLE IF EXISTS `repack_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repack_items` (
  `repack_item_id` varchar(36) NOT NULL,
  `repack_id` varchar(36) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `quantity` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `qvariable` char(1) DEFAULT NULL,
  PRIMARY KEY (`repack_item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repack_items`
--

LOCK TABLES `repack_items` WRITE;
/*!40000 ALTER TABLE `repack_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `repack_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repack_trans`
--

DROP TABLE IF EXISTS `repack_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repack_trans` (
  `repack_trans_id` varchar(36) NOT NULL,
  `repack_id` varchar(36) DEFAULT NULL,
  `repark_trans_ref` varchar(50) DEFAULT NULL,
  `repark_trans_date` datetime(6) DEFAULT NULL,
  `convertion_rate` decimal(18,2) DEFAULT NULL,
  `base_qty` decimal(18,2) DEFAULT NULL,
  `total_qty` decimal(18,2) DEFAULT NULL,
  `repark_by` varchar(36) DEFAULT NULL,
  `repark_date` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`repack_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repack_trans`
--

LOCK TABLES `repack_trans` WRITE;
/*!40000 ALTER TABLE `repack_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `repack_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_master`
--

DROP TABLE IF EXISTS `repair_master`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_master` (
  `repair_id` varchar(36) NOT NULL,
  `repair_ref` varchar(250) DEFAULT NULL,
  `order_no` varchar(250) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `supplier` varchar(255) DEFAULT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `sp_comm` double DEFAULT NULL,
  `item_desc` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `spare_cost` double DEFAULT NULL,
  `labour_cost` double DEFAULT NULL,
  `depreciation` double DEFAULT NULL,
  `final_settlement` double DEFAULT NULL,
  `replaced_item` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `service_centre` varchar(255) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `repair_type_id` int DEFAULT NULL,
  `master_date` datetime(6) DEFAULT NULL,
  `actual_spare_cost` decimal(18,2) DEFAULT NULL,
  `actual_labour_cost` decimal(18,2) DEFAULT NULL,
  `push_inventory` char(1) DEFAULT NULL,
  PRIMARY KEY (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_master`
--

LOCK TABLES `repair_master` WRITE;
/*!40000 ALTER TABLE `repair_master` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_trans`
--

DROP TABLE IF EXISTS `repair_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_trans` (
  `repair_trans_id` varchar(36) NOT NULL,
  `repair_id` varchar(36) DEFAULT NULL,
  `repair_trans_date` datetime(6) DEFAULT NULL,
  `secondary_name` varchar(250) DEFAULT NULL,
  `secondary_contact` varchar(250) DEFAULT NULL,
  `item_status` varchar(250) DEFAULT NULL,
  `notes` longtext,
  `trans_by` varchar(36) DEFAULT NULL,
  `labour_cost` decimal(18,2) DEFAULT NULL,
  `spare_cost` decimal(18,2) DEFAULT NULL,
  `return_date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`repair_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_trans`
--

LOCK TABLES `repair_trans` WRITE;
/*!40000 ALTER TABLE `repair_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair_type`
--

DROP TABLE IF EXISTS `repair_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `repair_type` (
  `repair_type_id` int NOT NULL,
  `repair_type_name` varchar(250) DEFAULT NULL,
  `repair_type_count` int DEFAULT NULL,
  PRIMARY KEY (`repair_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair_type`
--

LOCK TABLES `repair_type` WRITE;
/*!40000 ALTER TABLE `repair_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `repair_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_booking_type`
--

DROP TABLE IF EXISTS `room_booking_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_booking_type` (
  `room_booking_type_id` varchar(36) DEFAULT NULL,
  `room_booking_type_description` varchar(250) DEFAULT NULL,
  `room_booking_type_charge` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `room_booking_type_by` varchar(36) DEFAULT NULL,
  `room_booking_type_on` datetime(6) DEFAULT NULL,
  `room_booking_type_active` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_booking_type`
--

LOCK TABLES `room_booking_type` WRITE;
/*!40000 ALTER TABLE `room_booking_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_booking_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_category`
--

DROP TABLE IF EXISTS `room_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_category` (
  `room_category_id` varchar(36) NOT NULL,
  `room_category_description` varchar(250) DEFAULT NULL,
  `room_category_available` bigint DEFAULT NULL,
  `room_category_occupied` bigint DEFAULT NULL,
  `room_category_booked` bigint DEFAULT NULL,
  `room_category_reserved` bigint DEFAULT NULL,
  `room_category_count` bigint DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `room_category_pax` int DEFAULT NULL,
  `room_category_desc` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`room_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_category`
--

LOCK TABLES `room_category` WRITE;
/*!40000 ALTER TABLE `room_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_customer`
--

DROP TABLE IF EXISTS `room_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_customer` (
  `room_customer_id` varchar(36) NOT NULL,
  `customer_names` longtext NOT NULL,
  `customer_running_bal` bigint NOT NULL,
  `customer_idno` varchar(250) DEFAULT NULL,
  `customer_otherid` varchar(250) DEFAULT NULL,
  `customer_phone_no` char(16) DEFAULT NULL,
  `customer_address` char(50) DEFAULT NULL,
  `Customer_contact_person` varchar(50) DEFAULT NULL,
  `customer_credit_limit` bigint DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `customer_total_credit` decimal(18,2) DEFAULT NULL,
  `customer_total_debit` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_customer`
--

LOCK TABLES `room_customer` WRITE;
/*!40000 ALTER TABLE `room_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_floor`
--

DROP TABLE IF EXISTS `room_floor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_floor` (
  `room_floor_id` varchar(36) NOT NULL,
  `room_floor_description` varchar(250) DEFAULT NULL,
  `room_floor_available` bigint DEFAULT NULL,
  `room_floor_occupied` bigint DEFAULT NULL,
  `room_floor_booked` bigint DEFAULT NULL,
  `room_floor_reserved` bigint DEFAULT NULL,
  `room_category_count` bigint DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_floor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_floor`
--

LOCK TABLES `room_floor` WRITE;
/*!40000 ALTER TABLE `room_floor` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_floor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_service`
--

DROP TABLE IF EXISTS `room_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_service` (
  `room_service_id` varchar(36) NOT NULL,
  `room_service_description` varchar(250) DEFAULT NULL,
  `room_service_type_id` varchar(36) NOT NULL,
  `room_service_amount` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_service`
--

LOCK TABLES `room_service` WRITE;
/*!40000 ALTER TABLE `room_service` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_service_category`
--

DROP TABLE IF EXISTS `room_service_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_service_category` (
  `room_service_category_id` varchar(36) NOT NULL,
  `room_service_category_description` varchar(250) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_service_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_service_category`
--

LOCK TABLES `room_service_category` WRITE;
/*!40000 ALTER TABLE `room_service_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_service_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_service_type`
--

DROP TABLE IF EXISTS `room_service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_service_type` (
  `room_service_type_id` varchar(36) NOT NULL,
  `room_service_type_description` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_service_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_service_type`
--

LOCK TABLES `room_service_type` WRITE;
/*!40000 ALTER TABLE `room_service_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_status`
--

DROP TABLE IF EXISTS `room_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_status` (
  `room_status_id` int DEFAULT NULL,
  `room_status_desc` varchar(250) DEFAULT NULL,
  `room_status_available` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_status`
--

LOCK TABLES `room_status` WRITE;
/*!40000 ALTER TABLE `room_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_trans`
--

DROP TABLE IF EXISTS `room_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_trans` (
  `room_trans_id` varchar(36) NOT NULL,
  `room_trans_type_id` int NOT NULL,
  `room_trans_ref` longtext,
  `room_trans_date` datetime(6) NOT NULL,
  `room_trans_quantity` bigint DEFAULT NULL,
  `room_trans_unit_price` bigint DEFAULT NULL,
  `room_trans_total_amount` bigint DEFAULT NULL,
  `total_vat` bigint DEFAULT NULL,
  `total_cat_levy` bigint DEFAULT NULL,
  `room_trans_cash_amount` bigint DEFAULT NULL,
  `room_trans_cheque_amount` bigint DEFAULT NULL,
  `room_trans_card_amount` bigint DEFAULT NULL,
  `room_trans_voucher_amount` bigint DEFAULT NULL,
  `room_trans_mobile_money` bigint DEFAULT NULL,
  `room_trans_discount` bigint DEFAULT NULL,
  `branch_id` int NOT NULL,
  `room_id` int NOT NULL,
  `staff_id` varchar(36) NOT NULL,
  `shift_id` varchar(36) DEFAULT NULL,
  `completed` char(1) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `room_customer_id` int DEFAULT NULL,
  `room_trans_paid` char(1) DEFAULT NULL,
  `customer_alias` longtext,
  `Sales_staff_id` int DEFAULT NULL,
  `room_trans_code` varchar(50) DEFAULT NULL,
  `comments` longtext,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_trans`
--

LOCK TABLES `room_trans` WRITE;
/*!40000 ALTER TABLE `room_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_trans_details`
--

DROP TABLE IF EXISTS `room_trans_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_trans_details` (
  `room_trans_details_id` varchar(36) NOT NULL,
  `room_trans_id` varchar(36) DEFAULT NULL,
  `room_trans_details_desc` longtext,
  `room_trans_type_id` varchar(36) DEFAULT NULL,
  `room_service_id` varchar(36) DEFAULT NULL,
  `trans_quantity` bigint DEFAULT NULL,
  `unit_price` bigint DEFAULT NULL,
  `total_amount` bigint DEFAULT NULL,
  `vat` bigint DEFAULT NULL,
  `cat_levy` bigint DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`room_trans_details_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_trans_details`
--

LOCK TABLES `room_trans_details` WRITE;
/*!40000 ALTER TABLE `room_trans_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_trans_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_trans_type`
--

DROP TABLE IF EXISTS `room_trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_trans_type` (
  `room_trans_type_id` int NOT NULL,
  `room_trans_type_desc` varchar(250) DEFAULT NULL,
  `room_trans_type_sign` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_trans_type`
--

LOCK TABLES `room_trans_type` WRITE;
/*!40000 ALTER TABLE `room_trans_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `room_id` varchar(36) NOT NULL,
  `room_ref` varchar(250) DEFAULT NULL,
  `room_desc` varchar(250) DEFAULT NULL,
  `room_status_id` int DEFAULT NULL,
  `room_created_by` varchar(36) DEFAULT NULL,
  `room_created_on` datetime(6) DEFAULT NULL,
  `room_edited_by` varchar(36) DEFAULT NULL,
  `room_edited_on` datetime(6) DEFAULT NULL,
  `room_category_id` varchar(36) DEFAULT NULL,
  `room_floor_id` varchar(36) DEFAULT NULL,
  `room_amount` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `route_id` varchar(36) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `route_description` longtext,
  `updated` char(1) DEFAULT NULL,
  `surcharge` decimal(12,2) DEFAULT NULL,
  `route_message` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_type`
--

DROP TABLE IF EXISTS `sale_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale_type` (
  `sale_type_id` int NOT NULL,
  `sale_type_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sale_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_type`
--

LOCK TABLES `sale_type` WRITE;
/*!40000 ALTER TABLE `sale_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `sale_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_process`
--

DROP TABLE IF EXISTS `sales_process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_process` (
  `sales_process_id` varchar(36) NOT NULL,
  `sales_process_ref` varchar(50) DEFAULT NULL,
  `trans_ref` varchar(50) DEFAULT NULL,
  `sales_process_date` datetime(6) DEFAULT NULL,
  `account_ref` varchar(36) DEFAULT NULL,
  `exipry_date` datetime(6) DEFAULT NULL,
  `sale_type_id` int DEFAULT NULL,
  `sales_process_amount` decimal(18,2) DEFAULT NULL,
  `sales_process_complete` char(1) DEFAULT NULL,
  `sales_process_cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_date` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `sales_process_quantity` decimal(18,2) DEFAULT NULL,
  `sales_process_delivered` decimal(18,2) DEFAULT NULL,
  `sales_process_vat` decimal(18,2) DEFAULT NULL,
  `primary_ref` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sales_process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_process`
--

LOCK TABLES `sales_process` WRITE;
/*!40000 ALTER TABLE `sales_process` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_trans`
--

DROP TABLE IF EXISTS `sales_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_trans` (
  `sales_trans_id` varchar(36) NOT NULL,
  `sales_process_id` varchar(36) DEFAULT NULL,
  `pos_receipt_id` varchar(36) DEFAULT NULL,
  `item_description` longtext,
  `quantity` decimal(18,2) DEFAULT NULL,
  `unit_price` decimal(18,2) DEFAULT NULL,
  `total_amount` decimal(18,2) DEFAULT NULL,
  `complete` char(1) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `cancelled_date` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`sales_trans_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_trans`
--

LOCK TABLES `sales_trans` WRITE;
/*!40000 ALTER TABLE `sales_trans` DISABLE KEYS */;
/*!40000 ALTER TABLE `sales_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_centre`
--

DROP TABLE IF EXISTS `service_centre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_centre` (
  `service_id` varchar(36) NOT NULL,
  `job_number` varchar(250) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  `service_date` datetime(6) DEFAULT NULL,
  `service_advisor` varchar(250) DEFAULT NULL,
  `order_no` varchar(250) DEFAULT NULL,
  `contact_person` varchar(250) DEFAULT NULL,
  `phone_no` varchar(250) DEFAULT NULL,
  `check_in_notes` longtext,
  `job_close_notes` longtext,
  `job_closed` char(1) DEFAULT NULL,
  `job_closed_date` datetime(6) DEFAULT NULL,
  `job_closed_by` varchar(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `kilometer` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `confirmed_by` varchar(250) DEFAULT NULL,
  `confirmed` char(1) DEFAULT NULL,
  `confirmed_on` datetime(6) DEFAULT NULL,
  `job_total` decimal(18,2) DEFAULT NULL,
  `service_vehicle_id` varchar(36) DEFAULT NULL,
  `technician` longtext,
  `service_customer_id` varchar(36) DEFAULT NULL,
  `gate_pass` varchar(1) DEFAULT NULL,
  `gate_pass_on` datetime(6) DEFAULT NULL,
  `gate_pass_by` varchar(36) DEFAULT NULL,
  `gate_pass_notes` longtext,
  `gate_pass_cleared_by` varchar(250) DEFAULT NULL,
  `gate_pass_authorised_by` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_centre`
--

LOCK TABLES `service_centre` WRITE;
/*!40000 ALTER TABLE `service_centre` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_centre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_customer`
--

DROP TABLE IF EXISTS `service_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_customer` (
  `service_customer_id` varchar(36) NOT NULL,
  `service_customer_name` longtext,
  `service_customer_contact` varchar(250) DEFAULT NULL,
  `service_customer_email` varchar(250) DEFAULT NULL,
  `service_customer_visitno` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`service_customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_customer`
--

LOCK TABLES `service_customer` WRITE;
/*!40000 ALTER TABLE `service_customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_job_card`
--

DROP TABLE IF EXISTS `service_job_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_job_card` (
  `service_job_card_id` varchar(36) NOT NULL,
  `service_id` varchar(36) DEFAULT NULL,
  `job_number` varchar(250) DEFAULT NULL,
  `service_type` varchar(250) DEFAULT NULL,
  `item_description` varchar(250) DEFAULT NULL,
  `item_quantity` decimal(18,2) DEFAULT NULL,
  `item_price` decimal(18,2) DEFAULT NULL,
  `job_time` int DEFAULT NULL,
  `line_total` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `item_notes` longtext,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `cancelled_by` varchar(250) DEFAULT NULL,
  `cancelled_on` datetime(6) DEFAULT NULL,
  `job_done` char(1) DEFAULT NULL,
  `job_requested` char(1) DEFAULT NULL,
  `local_service` char(1) DEFAULT NULL,
  `discount` decimal(18,2) DEFAULT NULL,
  `primary_job` char(1) DEFAULT NULL,
  `part_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_job_card_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_job_card`
--

LOCK TABLES `service_job_card` WRITE;
/*!40000 ALTER TABLE `service_job_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_job_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_job_tool`
--

DROP TABLE IF EXISTS `service_job_tool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_job_tool` (
  `service_job_tool_id` varchar(36) NOT NULL,
  `service_vehicle_tool_id` varchar(36) DEFAULT NULL,
  `job_number` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`service_job_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_job_tool`
--

LOCK TABLES `service_job_tool` WRITE;
/*!40000 ALTER TABLE `service_job_tool` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_job_tool` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_type`
--

DROP TABLE IF EXISTS `service_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_type` (
  `service_type_id` varchar(36) NOT NULL,
  `service_code` char(10) DEFAULT NULL,
  `service_name` varchar(250) DEFAULT NULL,
  `service_charge` decimal(18,2) DEFAULT NULL,
  `review_price` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `vattable` char(1) DEFAULT NULL,
  PRIMARY KEY (`service_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_type`
--

LOCK TABLES `service_type` WRITE;
/*!40000 ALTER TABLE `service_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_vehicle`
--

DROP TABLE IF EXISTS `service_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_vehicle` (
  `service_vehicle_id` varchar(36) NOT NULL,
  `vehicle_reg` varchar(100) DEFAULT NULL,
  `model` varchar(100) DEFAULT NULL,
  `vin_no` varchar(100) DEFAULT NULL,
  `engine_no` varchar(100) DEFAULT NULL,
  `kilometer` decimal(18,2) DEFAULT NULL,
  `date_of_registration` datetime(6) DEFAULT NULL,
  `selling_delear` varchar(250) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`service_vehicle_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_vehicle`
--

LOCK TABLES `service_vehicle` WRITE;
/*!40000 ALTER TABLE `service_vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_vehicle_tools`
--

DROP TABLE IF EXISTS `service_vehicle_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_vehicle_tools` (
  `service_vehicle_tool_id` varchar(36) NOT NULL,
  `tool_name` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `tool_code` char(10) DEFAULT NULL,
  PRIMARY KEY (`service_vehicle_tool_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_vehicle_tools`
--

LOCK TABLES `service_vehicle_tools` WRITE;
/*!40000 ALTER TABLE `service_vehicle_tools` DISABLE KEYS */;
/*!40000 ALTER TABLE `service_vehicle_tools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shift`
--

DROP TABLE IF EXISTS `shift`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shift` (
  `shift_id` varchar(36) NOT NULL,
  `shift_day` char(1) NOT NULL,
  `shift_complete` char(1) NOT NULL,
  `sdate` date NOT NULL,
  `shift_description` varchar(20) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `till_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`shift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shift`
--

LOCK TABLES `shift` WRITE;
/*!40000 ALTER TABLE `shift` DISABLE KEYS */;
INSERT INTO `shift` VALUES ('097b6779-fb9b-4c0e-ad6d-5924ac19c3e0','Y','N','2020-09-05','20200905',122,'89727303-30A6-4E20-A6FB-F72566DA070B','N'),('1a9f5c40-7201-4b6d-a04b-c95693acc01e','Y','N','2020-09-05','20200905',122,NULL,'N');
/*!40000 ALTER TABLE `shift` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_setting`
--

DROP TABLE IF EXISTS `sms_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sms_setting` (
  `sms_setting_id` varchar(36) NOT NULL,
  `sms_setting_message` longtext,
  `sms_setting_name` char(1) DEFAULT NULL,
  `sms_setting_bal` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`sms_setting_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_setting`
--

LOCK TABLES `sms_setting` WRITE;
/*!40000 ALTER TABLE `sms_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` varchar(36) NOT NULL,
  `staff_id_no` char(20) NOT NULL,
  `staff_code` char(10) NOT NULL,
  `staff_category_id` varchar(36) NOT NULL,
  `staff_salary` bigint DEFAULT NULL,
  `staff_tel_no` longtext NOT NULL,
  `staff_nok` longtext NOT NULL,
  `staff_nhif_no` varchar(25) DEFAULT NULL,
  `staff_nssf_no` char(10) DEFAULT NULL,
  `staff_sir_name` longtext NOT NULL,
  `staff_other_names` longtext NOT NULL,
  `branch_id` int DEFAULT NULL,
  `nhif_deduction` char(1) DEFAULT NULL,
  `nssf_deduction` char(1) DEFAULT NULL,
  `staff_salary_bal` decimal(18,2) DEFAULT NULL,
  `staff_pinno` longtext,
  `bank_id` int DEFAULT NULL,
  `bank_accno` longtext,
  `bank_code` longtext,
  `staffpin` longtext,
  `updated` char(1) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `nhifamount` decimal(18,2) DEFAULT NULL,
  `nssfamount` decimal(18,2) DEFAULT NULL,
  `fprint` longblob,
  `branch_code` varchar(50) DEFAULT NULL,
  `branch_name` varchar(50) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `hascustomeracc` char(1) DEFAULT NULL,
  `customer_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`staff_id`),
  KEY `staff_category_staff_FK1` (`staff_category_id`),
  CONSTRAINT `staff_category_staff_FK1` FOREIGN KEY (`staff_category_id`) REFERENCES `staff_category` (`staff_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('1DD707B8-40F7-4F0E-8046-A14FBDD5384E','99','99','10C41714-10F9-4569-ACCB-EDAAEAFDA5E3',0,'','','                         ','','ENGINE','ADMINISTRATOR',122,'N','N',0.00,'',NULL,'','','','Y','Y',0.00,0.00,'','','','','','');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_category`
--

DROP TABLE IF EXISTS `staff_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_category` (
  `staff_category_id` varchar(36) NOT NULL,
  `staff_category_description` varchar(50) NOT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`staff_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_category`
--

LOCK TABLES `staff_category` WRITE;
/*!40000 ALTER TABLE `staff_category` DISABLE KEYS */;
INSERT INTO `staff_category` VALUES ('10C41714-10F9-4569-ACCB-EDAAEAFDA5E3','Administrator',122,'Y'),('90C7DF53-9374-434C-BF0E-099656FB0B9D','CASHIER',122,'Y'),('D939913D-0725-43EE-A3AB-25265ECEFB0E','CASHIER',122,'Y'),('FCC0B60F-ED45-430F-A833-1B5FDA0799F5','Administrator',122,'Y');
/*!40000 ALTER TABLE `staff_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff_insuarance`
--

DROP TABLE IF EXISTS `staff_insuarance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff_insuarance` (
  `staffinsuarance_id` varchar(36) NOT NULL,
  `staff_id` varchar(36) DEFAULT NULL,
  `insuarance_id` varchar(36) DEFAULT NULL,
  `relief_amount` int DEFAULT NULL,
  `insuarance_refno` longtext,
  `active` char(1) DEFAULT NULL,
  `comment` longtext,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `edited_on` datetime(6) DEFAULT NULL,
  `edited_by` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  PRIMARY KEY (`staffinsuarance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff_insuarance`
--

LOCK TABLES `staff_insuarance` WRITE;
/*!40000 ALTER TABLE `staff_insuarance` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff_insuarance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_logs`
--

DROP TABLE IF EXISTS `status_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_logs` (
  `status_log_id` int NOT NULL,
  `status_log_start` datetime(6) DEFAULT NULL,
  `status_log_end` datetime(6) DEFAULT NULL,
  `start_by` int DEFAULT NULL,
  `end_by` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  PRIMARY KEY (`status_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_logs`
--

LOCK TABLES `status_logs` WRITE;
/*!40000 ALTER TABLE `status_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_f`
--

DROP TABLE IF EXISTS `stock_f`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_f` (
  `product_id` varchar(36) NOT NULL,
  `product_short_desc` longtext,
  `product_long_desc` longtext,
  `uom_code` char(3) DEFAULT NULL,
  `product_quantity` decimal(18,2) DEFAULT NULL,
  `product_max_quantity` decimal(18,2) DEFAULT NULL,
  `product_min_quantity` decimal(18,2) DEFAULT NULL,
  `product_reorder_level` decimal(18,2) DEFAULT NULL,
  `category_id` varchar(36) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `product_code` varchar(20) DEFAULT NULL,
  `product_scancode` varchar(30) DEFAULT NULL,
  `product_sp` decimal(18,2) DEFAULT NULL,
  `product_sp_vat` decimal(18,2) DEFAULT NULL,
  `product_bp` decimal(18,2) DEFAULT NULL,
  `product_bp_vat` decimal(18,2) DEFAULT NULL,
  `batch_tracking` char(1) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `packaging_uom` char(3) DEFAULT NULL,
  `packaging_fixed` char(1) DEFAULT NULL,
  `packaging_ratio` decimal(18,2) DEFAULT NULL,
  `packaging_qty` decimal(18,2) DEFAULT NULL,
  `fuel_vat` char(1) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `category_Stock_f_FK1` (`category_id`),
  CONSTRAINT `category_Stock_f_FK1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_f`
--

LOCK TABLES `stock_f` WRITE;
/*!40000 ALTER TABLE `stock_f` DISABLE KEYS */;
INSERT INTO `stock_f` VALUES ('241f9d68-141f-4dfe-b7da-17673ef45bd9','ENKANASA WATER','ENKANASA WATER','LIT',0.00,0.00,0.00,0.00,'3e96ad9a-879a-421c-ac31-837df0ce1b3a',122,'010003','010003',30.00,0.00,0.00,0.00,'N','Y','Y','EAC','N',0.00,0.00,'N'),('3250b420-55cc-48f5-aa1a-e7566389fbef','BUTTER','BUTTER','EAC',0.00,0.00,0.00,0.00,'3e96ad9a-879a-421c-ac31-837df0ce1b3a',122,'010002','010002',250.00,0.00,0.00,0.00,'N','Y','Y','EAC','N',0.00,0.00,'N'),('36c432ff-3ea8-4391-a2b5-971b6497d505','FRESH MILK','FRESH MILK','LIT',0.00,0.00,0.00,0.00,'3e96ad9a-879a-421c-ac31-837df0ce1b3a',122,'010001','010001',100.00,0.00,40.00,6.40,'N','Y','Y','EAC','N',0.00,0.00,'N');
/*!40000 ALTER TABLE `stock_f` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stocktake`
--

DROP TABLE IF EXISTS `stocktake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocktake` (
  `stk_id` varchar(36) NOT NULL,
  `stk_date` datetime(6) DEFAULT NULL,
  `stk_ref` varchar(50) DEFAULT NULL,
  `stk_complete` char(1) DEFAULT NULL,
  `stk_cancelled` char(1) DEFAULT NULL,
  `stk_items` int DEFAULT NULL,
  `Product_id` varchar(36) DEFAULT NULL,
  `product_quantity` decimal(18,2) DEFAULT NULL,
  `uom_code` char(3) DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `curqty` decimal(18,2) DEFAULT NULL,
  `pystock` decimal(18,2) DEFAULT NULL,
  `packaging` decimal(18,2) DEFAULT NULL,
  PRIMARY KEY (`stk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocktake`
--

LOCK TABLES `stocktake` WRITE;
/*!40000 ALTER TABLE `stocktake` DISABLE KEYS */;
/*!40000 ALTER TABLE `stocktake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_id` varchar(36) NOT NULL,
  `supplier_name` longtext NOT NULL,
  `Supplier_pin` varchar(50) DEFAULT NULL,
  `supplier_running_bal` decimal(18,2) DEFAULT NULL,
  `supplier_bank_acc` char(10) NOT NULL,
  `supplier_phone_no` char(16) NOT NULL,
  `supplier_address` char(50) NOT NULL,
  `supplier_contact_person` char(30) NOT NULL,
  `supplier_code` varchar(10) DEFAULT NULL,
  `supplier_total_debit` decimal(18,2) DEFAULT NULL,
  `supplier_total_credit` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('456b4787-2cf8-4ecf-978a-531da42cc778','CHANTEL','',2000.00,'','','','','00001',0.00,2000.00,122,'1','Y');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier_trans`
--

DROP TABLE IF EXISTS `supplier_trans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier_trans` (
  `supplier_trans_id` varchar(36) NOT NULL,
  `transaction_ref` varchar(250) DEFAULT NULL,
  `transaction_date` datetime(6) DEFAULT NULL,
  `transaction_amount` decimal(18,2) DEFAULT NULL,
  `transaction_approved` char(1) DEFAULT NULL,
  `supplier_id` varchar(36) DEFAULT NULL,
  `trans_type_id` int DEFAULT NULL,
  `transaction_payment_type` longtext,
  `transaction_payment_ref` longtext,
  `transaction_comment` longtext,
  `transaction_vat_total` decimal(18,2) DEFAULT NULL,
  `transaction_due_date` datetime(6) DEFAULT NULL,
  `trans_by` varchar(50) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `running_bal` decimal(18,2) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `discount` decimal(12,3) DEFAULT NULL,
  PRIMARY KEY (`supplier_trans_id`),
  KEY `supplier_Supplier_trans_FK1` (`supplier_id`),
  KEY `Trans_type_Supplier_trans_FK1` (`trans_type_id`),
  CONSTRAINT `supplier_Supplier_trans_FK1` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`),
  CONSTRAINT `Trans_type_Supplier_trans_FK1` FOREIGN KEY (`trans_type_id`) REFERENCES `trans_type` (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier_trans`
--

LOCK TABLES `supplier_trans` WRITE;
/*!40000 ALTER TABLE `supplier_trans` DISABLE KEYS */;
INSERT INTO `supplier_trans` VALUES ('8f70a0de-67b3-49f7-a902-965a11b17fba','GRN-1','2020-09-04 22:06:39.000000',1600.00,'1','456b4787-2cf8-4ecf-978a-531da42cc778',2,'','','',196.40,'2020-09-04 22:06:39.000000','','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-04 22:07:18.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-04 22:07:18.000000',1600.00,'Y',122,0.000),('f46ccaab-9cfd-4abe-beeb-b8d25bfb95fc','GRN-2','2020-09-04 22:47:55.000000',400.00,'1','456b4787-2cf8-4ecf-978a-531da42cc778',2,'','','',49.10,'2020-09-04 22:47:55.000000','','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-04 22:53:23.000000','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-04 22:53:23.000000',2000.00,'Y',122,0.000);
/*!40000 ALTER TABLE `supplier_trans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sync_table`
--

DROP TABLE IF EXISTS `sync_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sync_table` (
  `tablename` varchar(50) NOT NULL,
  `pkey` varchar(50) DEFAULT NULL,
  `mfile` char(1) DEFAULT NULL,
  `crossupdate` char(1) DEFAULT NULL,
  `norder` int DEFAULT NULL,
  PRIMARY KEY (`tablename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sync_table`
--

LOCK TABLES `sync_table` WRITE;
/*!40000 ALTER TABLE `sync_table` DISABLE KEYS */;
INSERT INTO `sync_table` VALUES ('access_right','access_right_id','N','N',1),('access_right_module','access_right_module_id','N','N',1),('bank_trans','bank_trans_id','N','N',23),('bank_trans_type','bank_trans_type_id','N','N',8),('banks','bank_id','N','N',22),('batch_table','batch_id','N','N',25),('bom','bom_id','N','N',24),('bookings','booking_id','N','N',1),('Branch','branch_id','N','N',2),('bulk_sms','sms_id','N','N',26),('category','category_id','N','N',9),('catery','catery_id','N','N',9),('Company','company_id','N','N',0),('Customer','Customer_id','N','N',15),('customer_trans','customer_trans_id','N','N',16),('driver','driver_id','N','N',27),('fleet','vehicle_id','N','N',28),('fleet_insuarance','insuarance_id','N','N',29),('fleet_owner','fleet_owner_id','N','N',30),('fleet_trans','fleet_trans_id','N','N',31),('fleet_trans_type','fleet_trans_type_id','N','N',10),('hs_trans_file','hs_trans_id','N','N',87),('insuarance','insuarance_id','N','N',32),('insuarance_trans','insuarance_trans_id','N','N',33),('job_card','job_id','N','N',34),('job_trans','job_trans_id','N','N',35),('loans','loan_id','N','N',36),('location','location_id','N','N',5),('Location_Stock','location_product_id','N','N',14),('mileage','mileage_id','N','N',37),('mm_sms','sms_id','N','N',38),('monthly_roll','monthly_roll_id','N','N',39),('parameter_file','parameter_id','N','N',11),('pay_out','pay_id','N','N',40),('pay_trans','pay_trans_id','N','N',42),('pay_trans_type','pay_trans_type_id','N','Y',41),('pay_type','pay_type_id','N','Y',1),('payment_plan','payment_plan_id','N','N',43),('pos_receipt_details','receipt_details_id','N','N',45),('pos_receipt_payment','pos_receipt_payment_id','N','N',46),('Pos_receipts','receipt_id','N','N',44),('process_table','process_id','N','N',47),('register','register_id','N','N',48),('register_type','register_type_id','N','N',49),('repack','repack_id','N','N',50),('repack_items','repack_item_id','N','N',51),('repack_trans','repack_trans_id','N','N',52),('room_category','room_category_id','N','N',53),('room_catery','room_catery_id','N','N',53),('room_customer','room_customer_id','N','N',54),('room_service','room_service_id','N','N',55),('room_status','room_status_id','N','N',56),('room_trans','room_trans_id','N','N',57),('room_trans_details','room_trans_details_id','N','N',58),('room_trans_type','room_trans_type_id','N','N',53),('rooms','room_id','N','N',54),('routes','route_id','N','N',59),('sale_type','sale_type_id','N','N',60),('sales_process','sales_process_id','N','N',61),('shift','shift_id','N','N',12),('staff','staff_id','N','N',4),('staff_category','staff_category_id','N','N',3),('staff_catery','staff_category_id','N','N',3),('staff_insuarance','staffinsuarance_id','N','N',63),('status_logs','status_log_id','N','N',64),('Stock_f','Product_id','N','N',13),('stocktake','stk_id','N','N',65),('supplier','supplier_id','N','N',17),('Supplier_trans','supplier_trans_id','N','N',18),('sync_table','tablename','N','Y',2),('sys_user','user_id','N','N',19),('Tables','table_id','N','N',4),('till','till_id','N','N',4),('Trans_file','trans_id','N','N',66),('Trans_type','trans_type_id','N','Y',7),('trip_details','trip_details_id','N','N',67),('trip_order_details','trip_order_detail_id','N','N',70),('trip_orders','trip_order_id','N','N',69),('trips','trip_id','N','N',68),('Uom','Uom_code','N','N',6),('Uom_conversion','uom_conversion_id','N','N',71),('weighing_details','ticket_no','N','N',72);
/*!40000 ALTER TABLE `sync_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_user` (
  `user_id` varchar(36) NOT NULL,
  `staff_id` varchar(36) NOT NULL,
  `User_name` longtext NOT NULL,
  `user_pass` longtext,
  `user_pin` longtext,
  `user_lid` int DEFAULT NULL,
  `card_details` longtext,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `fprint` longblob,
  PRIMARY KEY (`user_id`),
  KEY `staff_sys_user_FK1` (`staff_id`),
  CONSTRAINT `staff_sys_user_FK1` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('19BB20F9-2D36-4BF5-94DC-3A90034E28A5','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','ENGINE','','943aa0fcda4ee2901a7de9321663b114',99,'652b98f1075304fb1176de3488273a40','Y',122,_binary 'System.Byte[]');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_vat`
--

DROP TABLE IF EXISTS `sys_vat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_vat` (
  `vat_id` int NOT NULL,
  `tax_value` int NOT NULL,
  `vat_code` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_vat`
--

LOCK TABLES `sys_vat` WRITE;
/*!40000 ALTER TABLE `sys_vat` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_vat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tables` (
  `table_id` varchar(36) NOT NULL,
  `table_description` varchar(50) DEFAULT NULL,
  `table_capacity` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `till`
--

DROP TABLE IF EXISTS `till`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `till` (
  `till_id` varchar(36) NOT NULL,
  `till_no` char(10) DEFAULT NULL,
  `till_printer_port` char(10) DEFAULT NULL,
  `till_receipt_msg1` varchar(40) DEFAULT NULL,
  `till_receipt_msg2` varchar(40) DEFAULT NULL,
  `locations` longtext,
  `till_pole_port` longtext,
  `till_pole_active` char(1) DEFAULT NULL,
  `tillogout` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `confirmrct` char(1) DEFAULT NULL,
  `till_report_port` varchar(50) DEFAULT NULL,
  `tillchangeqty` char(1) DEFAULT NULL,
  PRIMARY KEY (`till_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `till`
--

LOCK TABLES `till` WRITE;
/*!40000 ALTER TABLE `till` DISABLE KEYS */;
INSERT INTO `till` VALUES ('89727303-30A6-4E20-A6FB-F72566DA070B','01','LPT1','','','A2217DC7-D855-43DD-9F85-DFE168B93C70','FP300','0','0',122,'Y','Y','','');
/*!40000 ALTER TABLE `till` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_file`
--

DROP TABLE IF EXISTS `trans_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trans_file` (
  `trans_id` varchar(36) NOT NULL,
  `trans_date` datetime(6) DEFAULT NULL,
  `trans_reference` varchar(250) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `trans_type_id` int DEFAULT NULL,
  `uom_code` char(3) DEFAULT NULL,
  `trans_quantity` decimal(18,3) DEFAULT NULL,
  `trans_base_quantity` decimal(18,3) DEFAULT NULL,
  `batch_no` longtext,
  `trans_comment` longtext,
  `product_id` varchar(36) DEFAULT NULL,
  `location_product_id` varchar(36) DEFAULT NULL,
  `complete` char(1) DEFAULT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `supplier_id` varchar(36) DEFAULT NULL,
  `location_id` varchar(36) DEFAULT NULL,
  `del_note` varchar(50) DEFAULT NULL,
  `inv_no` varchar(50) DEFAULT NULL,
  `lpo_no` varchar(50) DEFAULT NULL,
  `cost_price` decimal(18,2) DEFAULT NULL,
  `running_balance` decimal(18,3) DEFAULT NULL,
  `confirmed` char(1) DEFAULT NULL,
  `batch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `track_no` varchar(50) DEFAULT NULL,
  `packaging_runbal` decimal(18,2) DEFAULT NULL,
  `packaging` decimal(18,2) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `updated_by` varchar(36) DEFAULT NULL,
  `created_on` datetime(6) DEFAULT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `sprice` decimal(16,2) DEFAULT NULL,
  `lpono` varchar(50) DEFAULT NULL,
  `tran_discount` decimal(12,3) DEFAULT NULL,
  `grn_no` int DEFAULT NULL,
  `ln` int DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `idx_productid` (`product_id`),
  KEY `Trans_type_Trans_file_FK1` (`trans_type_id`),
  CONSTRAINT `Stock_f_Trans_file_FK1` FOREIGN KEY (`product_id`) REFERENCES `stock_f` (`product_id`),
  CONSTRAINT `Trans_type_Trans_file_FK1` FOREIGN KEY (`trans_type_id`) REFERENCES `trans_type` (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_file`
--

LOCK TABLES `trans_file` WRITE;
/*!40000 ALTER TABLE `trans_file` DISABLE KEYS */;
INSERT INTO `trans_file` VALUES ('874976f4-4d6c-4992-bb6d-7281aa25badd','2020-09-04 22:47:55.000000','GRN-2',122,2,'LIT',10.000,0.000,'','','36c432ff-3ea8-4391-a2b5-971b6497d505','','1','0','456b4787-2cf8-4ecf-978a-531da42cc778','A2217DC7-D855-43DD-9F85-DFE168B93C70','','','',40.00,50.000,'0',NULL,'Y','',0.00,0.00,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-04 22:53:23.000000','2020-09-04 22:53:23.000000',100.00,'',0.000,NULL,1),('ecd1f13b-22b4-47df-9a6d-32c799c2eaf7','2020-09-04 22:06:39.000000','GRN-1',122,2,'LIT',40.000,0.000,'','','36c432ff-3ea8-4391-a2b5-971b6497d505','','1','0','456b4787-2cf8-4ecf-978a-531da42cc778','A2217DC7-D855-43DD-9F85-DFE168B93C70','','','',40.00,40.000,'0',NULL,'Y','',0.00,0.00,'1DD707B8-40F7-4F0E-8046-A14FBDD5384E','1DD707B8-40F7-4F0E-8046-A14FBDD5384E','2020-09-04 22:07:18.000000','2020-09-04 22:07:18.000000',100.00,'',0.000,NULL,1);
/*!40000 ALTER TABLE `trans_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trans_type`
--

DROP TABLE IF EXISTS `trans_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trans_type` (
  `trans_type_id` int NOT NULL,
  `trans_type_desc` varchar(50) DEFAULT NULL,
  `trans_type_sign` varchar(1) DEFAULT NULL,
  `trans_type_count` int DEFAULT NULL,
  PRIMARY KEY (`trans_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trans_type`
--

LOCK TABLES `trans_type` WRITE;
/*!40000 ALTER TABLE `trans_type` DISABLE KEYS */;
INSERT INTO `trans_type` VALUES (1,'Pos sale','-',0),(2,'Stock Receipt','+',0),(3,'Positive Adj','+',0),(4,'Negative Adj','-',0),(5,'Transfer I','+',0),(6,'Transfer Out','-',0),(7,'Stock Take','+',0),(8,'POS Returned','+',0),(9,'Supplier Payment','-',0),(10,'Customer Receipt','-',0),(11,'Receipt Revert','+',0),(12,'Debit Adjustment','+',0),(13,'Credit Adjustment','-',0),(14,'RePacking','-',0),(16,'Packed','+',0),(17,'Service Charge','-',0),(18,'Processing','-',0),(19,'Invoice','-',0),(20,'Used','-',0),(21,'Transport Charges','+',0),(22,'Customer LPO','-',0),(23,'Supplier LPO','+',0),(24,'Credit Note','-',0),(25,'GR- Returned','-',0),(26,'Cycle Count','+',0),(27,'Damage/Expiry','-',0);
/*!40000 ALTER TABLE `trans_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_details`
--

DROP TABLE IF EXISTS `trip_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_details` (
  `trip_details_id` varchar(36) NOT NULL,
  `trip_id` varchar(36) DEFAULT NULL,
  `transaction_ref` varchar(225) DEFAULT NULL,
  `receipt_id` varchar(36) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_details`
--

LOCK TABLES `trip_details` WRITE;
/*!40000 ALTER TABLE `trip_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_order_details`
--

DROP TABLE IF EXISTS `trip_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_order_details` (
  `trip_order_detail_id` varchar(36) NOT NULL,
  `trip_order_id` varchar(36) DEFAULT NULL,
  `location_product_id` varchar(36) NOT NULL,
  `product_sp` bigint DEFAULT NULL,
  `trans_quantity` bigint NOT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `linenum` int DEFAULT NULL,
  `uom_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`trip_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_order_details`
--

LOCK TABLES `trip_order_details` WRITE;
/*!40000 ALTER TABLE `trip_order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip_orders`
--

DROP TABLE IF EXISTS `trip_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip_orders` (
  `trip_order_id` varchar(36) NOT NULL,
  `trip_id` varchar(36) DEFAULT NULL,
  `confirmed` char(1) NOT NULL,
  `cancelled` char(1) DEFAULT NULL,
  `confirmed_by` varchar(36) DEFAULT NULL,
  `cancelled_by` varchar(36) DEFAULT NULL,
  `confirmed_date` datetime(6) DEFAULT NULL,
  `Customer_id` varchar(36) DEFAULT NULL,
  `customer_name` longtext,
  `updated` char(1) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `service_vehicle_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`trip_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip_orders`
--

LOCK TABLES `trip_orders` WRITE;
/*!40000 ALTER TABLE `trip_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `trip_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `trip_id` varchar(36) NOT NULL,
  `route_id` varchar(36) DEFAULT NULL,
  `trip_date` datetime(6) DEFAULT NULL,
  `trip_ref` varchar(50) DEFAULT NULL,
  `trip_customerno` int DEFAULT NULL,
  `trip_invoiceno` int DEFAULT NULL,
  `trip_done` char(1) DEFAULT NULL,
  `updated` char(1) DEFAULT 'N',
  `branch_id` int DEFAULT NULL,
  `vehicle_id` varchar(36) DEFAULT NULL,
  `driver_id` varchar(36) DEFAULT NULL,
  `driver_name` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom` (
  `uom_code` char(3) NOT NULL,
  `uom_description` varchar(25) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `uom_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`uom_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES ('EAC','EACH',122,'Y',''),('LIT','LITRES',122,'Y','');
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_conversion`
--

DROP TABLE IF EXISTS `uom_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom_conversion` (
  `uom_conversion_id` varchar(36) NOT NULL,
  `from_uom_code` char(3) DEFAULT NULL,
  `to_uom_code` char(3) DEFAULT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `uom_conversion_rate` decimal(18,2) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `updated` char(1) DEFAULT NULL,
  `wholesale_price` decimal(18,2) DEFAULT NULL,
  `retail_price` decimal(18,2) DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  PRIMARY KEY (`uom_conversion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_conversion`
--

LOCK TABLES `uom_conversion` WRITE;
/*!40000 ALTER TABLE `uom_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `uom_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user` varchar(64) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `user` (`user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Blu3Gremlin','leojeremy94@gmail.com','password');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weighing_details`
--

DROP TABLE IF EXISTS `weighing_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weighing_details` (
  `ticket_no` varchar(50) NOT NULL,
  `vehicle_no` varchar(50) NOT NULL,
  `account` varchar(250) NOT NULL,
  `field_1` varchar(50) NOT NULL,
  `product_name` varchar(250) NOT NULL,
  `operator_name` varchar(250) NOT NULL,
  `tare_datetime` varchar(20) NOT NULL,
  `gross_datetime` varchar(20) NOT NULL,
  `gross_wt` decimal(12,2) NOT NULL,
  `tare_wt` decimal(12,2) NOT NULL,
  `net_wt` decimal(12,2) NOT NULL,
  `units` varchar(20) DEFAULT NULL,
  `remarks` varchar(500) NOT NULL,
  `ticket_date` datetime(6) NOT NULL,
  `vehicle_indate` varchar(20) NOT NULL,
  `vehicle_outdate` varchar(20) NOT NULL,
  `transporter_name` varchar(250) NOT NULL,
  `intime` time(6) NOT NULL,
  `outtime` time(6) NOT NULL,
  `updated` char(1) NOT NULL,
  PRIMARY KEY (`ticket_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weighing_details`
--

LOCK TABLES `weighing_details` WRITE;
/*!40000 ALTER TABLE `weighing_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `weighing_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-08 12:25:05
