-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 192.168.20.4    Database: db_material
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.25-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_bring`
--

DROP TABLE IF EXISTS `tb_bring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bring` (
  `id` int(4) DEFAULT NULL,
  `number` int(6) NOT NULL,
  `bring_date` date NOT NULL,
  `bring_by` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `bring_dep` int(5) NOT NULL,
  `bring_tel` int(5) NOT NULL,
  `approve_by` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `approve` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT NULL,
  `approve_date` datetime DEFAULT NULL,
  `pay_date` date NOT NULL,
  `pay_by` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `repair_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `bring_reason` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`number`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_bringdetail`
--

DROP TABLE IF EXISTS `tb_bringdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_bringdetail` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `serial_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bring_id` int(6) DEFAULT NULL,
  `mat_id` int(5) DEFAULT NULL,
  `amount` int(5) DEFAULT NULL,
  `status` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=988 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tb_check`
--

DROP TABLE IF EXISTS `tb_check`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_check` (
  `check_id` int(5) NOT NULL AUTO_INCREMENT,
  `check_date` datetime NOT NULL,
  `Invoice_no` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `invoice_date` datetime NOT NULL,
  `company` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(1) NOT NULL,
  `check_by` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`check_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_check`
--

LOCK TABLES `tb_check` WRITE;
/*!40000 ALTER TABLE `tb_check` DISABLE KEYS */;
INSERT INTO `tb_check` VALUES (1,'2015-05-27 11:44:30','INV58050076','2015-05-26 17:05:46','1',1,'1300900115098'),(2,'2016-01-26 08:54:31','INV59010056','2016-01-19 16:08:05','1',1,'1300900115098'),(3,'2016-08-04 16:30:23','IV59080402','2016-08-04 16:30:55','2',1,'1300900115098'),(4,'2016-09-13 09:46:08','ABC160900881','2016-09-08 09:45:20','3',1,'1300900115098'),(5,'2016-12-27 11:33:03','INV59120103','2016-12-27 11:33:03','1',1,'1300900115098'),(6,'2017-01-25 09:33:19','INV60010088','2017-01-18 16:21:19','1',1,'1300900115098'),(7,'2018-01-23 11:25:48','IV61011901','2018-01-19 11:26:11','1',1,'1301500020121'),(8,'2018-04-30 09:48:13','IV61041005','2018-04-10 09:48:50','2',1,'1309900238341');
/*!40000 ALTER TABLE `tb_check` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_checkdetail`
--

DROP TABLE IF EXISTS `tb_checkdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_checkdetail` (
  `detail_id` int(5) NOT NULL AUTO_INCREMENT,
  `mat_id` int(5) NOT NULL,
  `amount` int(5) NOT NULL,
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `list` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `check_id` int(5) NOT NULL,
  `update_stock` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT 'นำเข้าสต็อค',
  PRIMARY KEY (`detail_id`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_checkdetail`
--

LOCK TABLES `tb_checkdetail` WRITE;
/*!40000 ALTER TABLE `tb_checkdetail` DISABLE KEYS */;
INSERT INTO `tb_checkdetail` VALUES (1,75,4,'ตลับ','',2,'N'),(2,76,4,'ตลับ','',2,'N'),(3,77,4,'ตลับ','',2,'N'),(4,78,4,'ตลับ','',2,'N'),(5,9,40,'หัว','',2,'N'),(6,36,8,'ตลับ','',2,'N'),(7,31,1,'ขวด','',2,'N'),(8,55,2,'ขวด','',2,'N'),(9,56,2,'ขวด','',2,'N'),(10,57,2,'ขวด','',2,'N'),(11,58,2,'ขวด','',2,'N'),(12,22,8,'ตลับ','',3,'N'),(13,55,2,'ตลับ','',3,'N'),(14,24,4,'กล่อง','',3,'N'),(15,31,1,'ขวด','',3,'N'),(16,79,4,'กระป๋อง','',3,'N'),(17,80,1,'เส้น','',4,'N'),(18,28,3,'ขวด','',5,'N'),(19,29,3,'ขวด','',5,'N'),(20,30,3,'ขวด','',5,'N'),(21,31,3,'ขวด','',5,'N'),(22,32,2,'ตลับ','',5,'N'),(23,55,3,'','',5,'N'),(24,56,3,'','',5,'N'),(25,57,3,'','',5,'N'),(26,58,3,'','',5,'N'),(27,75,3,'','',5,'N'),(28,76,3,'','',5,'N'),(29,77,3,'','',5,'N'),(30,78,3,'','',5,'N'),(31,80,5,'','',5,'N'),(32,81,5,'','',5,'N'),(33,10,100,'หัว','',6,'N'),(34,28,1,'ขวด','',8,'N');
/*!40000 ALTER TABLE `tb_checkdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mat_type`
--

DROP TABLE IF EXISTS `tb_mat_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mat_type` (
  `id` int(5) NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mat_type`
--

LOCK TABLES `tb_mat_type` WRITE;
/*!40000 ALTER TABLE `tb_mat_type` DISABLE KEYS */;
INSERT INTO `tb_mat_type` VALUES (1,'วัสดุคอมพิวเตอร์'),(2,'วัสดุเครือข่าย'),(3,'วัสดุปริ้นเตอร์'),(4,'วัสดุอื่นๆ');
/*!40000 ALTER TABLE `tb_mat_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_material`
--

DROP TABLE IF EXISTS `tb_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_material` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cost` float(10,0) NOT NULL,
  `stock` int(5) NOT NULL,
  `min` int(5) NOT NULL,
  `balance` int(5) NOT NULL,
  `mat_type` int(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_material`
--

LOCK TABLES `tb_material` WRITE;
/*!40000 ALTER TABLE `tb_material` DISABLE KEYS */;
INSERT INTO `tb_material` VALUES 
(1,'สาย AC power','เส้น',40,83,83,83,1,'2014-11-25 10:28:07','2018-07-04 14:15:40'),
(2,'สายฮาร์ดดิสก์ IDE','เส้น',0,17,0,17,1,'2014-11-25 10:29:35','2014-12-03 13:44:00'),
(3,'สายจอ DVI','เส้น',120,11,0,11,1,'2014-11-25 10:30:01','2017-10-19 14:17:41'),
(4,'สายจอ VGA','เส้น',350,26,0,26,1,'2014-11-25 10:30:37','2020-02-25 13:47:08'),
(5,'สาย USB ปริ้นเตอร์ (ดำ)','เส้น',0,28,0,28,1,'2014-11-25 10:31:01','2018-11-02 11:18:09'),
(6,'สาย USB ปริ้นเตอร์ 1.8 เมตร','เส้น',60,30,0,30,1,'2014-11-25 10:31:34','2020-08-05 13:17:39'),
(7,'สาย USB ปริ้นเตอร์ 5 เมตร','เส้น',220,28,0,29,1,'2014-11-25 10:32:06','2020-09-21 17:00:02'),
(8,'สาย Parallel Printer','เส้น',320,15,0,15,1,'2014-11-25 10:32:33',NULL),
(9,'RJ45 ตัวเมีย CAT5e','หัว',4,0,0,0,2,'2014-11-25 10:33:01','2019-06-06 13:55:54'),
(10,'หัว RJ-45 CAT5','หัว',3,8,5,8,2,'2014-11-25 10:35:33','2020-06-22 10:08:33'),
(11,'หัว RJ-45 CAT6','หัว',0,171,0,194,2,'2014-11-25 10:36:03','2020-11-27 11:41:50'),
(12,'สายแลน UTP Cat6 (กล่องละ 200m.)','เมตร',80,1567,0,1617,2,'2014-11-25 10:36:23','2020-11-27 11:41:50'),
(13,'สายแลน UTP Cat5  (กล่องละ 305m.)','เมตร',76,790,0,790,2,'2014-11-25 10:37:06','2018-10-17 11:06:03'),
(14,'สาย Patch Cord','เส้น',113,5,0,5,2,'2014-11-25 10:37:19','2020-06-18 11:18:29'),
(15,'รางเก็บสายไฟ 12 x 25 (เหลี่ยมเล็ก) (กล่องละ 50)','ท่อน',79,93,0,95,2,'2014-11-25 10:37:55','2020-12-17 15:58:07'),
(16,'รางเก็บสายไฟ 20 x 40 (เหลี่ยมกลาง) (กล่องละ 50)','ท่อน',107,107,0,107,2,'2014-11-25 10:39:23','2019-07-10 12:10:18'),
(17,'หน้ากากบล็อก 2 ช่อง','ชิ้น',36,53,0,53,2,'2014-11-25 10:39:50','2020-02-25 13:47:08'),
(18,'หน้ากากบล็อก 1 ช่อง','ชิ้น',22,40,0,41,2,'2014-11-25 10:40:19','2020-08-17 12:29:06'),
(19,'บล็อกแลน','ชิ้น',0,36,0,37,2,'2014-11-25 10:40:37','2020-08-17 12:29:06'),
(20,'RJ45 Joint Connector','หัว',0,69,0,69,2,'2014-11-25 10:40:55','2020-08-06 11:12:46');
/*!40000 ALTER TABLE `tb_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_material_stock`
--

DROP TABLE IF EXISTS `tb_material_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_material_stock` (
  `stock_id` int(12) NOT NULL AUTO_INCREMENT,
  `id` int(5) NOT NULL,
  `name` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `cost` float(10,0) NOT NULL,
  `stock` int(5) NOT NULL,
  `min` int(5) DEFAULT NULL,
  `balance` int(5) NOT NULL,
  `mat_type` int(5) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `stock_month` int(5) DEFAULT NULL,
  `stock_year` int(5) DEFAULT NULL,
  `stock_date` datetime DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_material_stock`
--

LOCK TABLES `tb_material_stock` WRITE;
/*!40000 ALTER TABLE `tb_material_stock` DISABLE KEYS */;
INSERT INTO `tb_material_stock` VALUES 
(1,1,'สาย AC power','เส้น',40,86,NULL,0,1,'2014-11-25 10:28:07','2015-06-15 09:56:10',10,2015,'2015-11-09 17:35:40'),
(2,2,'สายฮาร์ดดิสก์ IDE','เส้น',0,18,NULL,0,1,'2014-11-25 10:29:35','2014-12-03 13:44:00',10,2015,'2015-11-09 17:35:40'),
(3,3,'สายจอ DVI','เส้น',120,13,NULL,0,1,'2014-11-25 10:30:01','2015-10-12 13:52:59',10,2015,'2015-11-09 17:35:40'),
(4,4,'สายจอ VGA','เส้น',350,14,NULL,0,1,'2014-11-25 10:30:37','2015-05-29 09:53:50',10,2015,'2015-11-09 17:35:40'),
(5,5,'สาย USB ปริ้นเตอร์ (ดำ)','เส้น',0,32,NULL,0,1,'2014-11-25 10:31:01','2015-08-14 11:12:53',10,2015,'2015-11-09 17:35:40'),
(6,6,'สาย USB ปริ้นเตอร์ 1.8 เมตร','เส้น',60,15,NULL,0,1,'2014-11-25 10:31:34','2015-09-16 11:06:41',10,2015,'2015-11-09 17:35:40'),
(7,7,'สาย USB ปริ้นเตอร์ 5 เมตร','เส้น',220,20,NULL,0,1,'2014-11-25 10:32:06','2015-11-06 14:58:53',10,2015,'2015-11-09 17:35:40'),
(8,8,'สาย Parallel Printer','เส้น',320,14,NULL,0,1,'2014-11-25 10:32:33',NULL,10,2015,'2015-11-09 17:35:40'),
(9,9,'RJ45 ตัวเมีย CAT5e','หัว',0,10,NULL,0,2,'2014-11-25 10:33:01','2015-11-05 15:59:49',10,2015,'2015-11-09 17:35:40'),
(10,10,'หัว RJ-45 CAT5','หัว',0,130,NULL,0,2,'2014-11-25 10:35:33','2015-10-12 13:51:55',10,2015,'2015-11-09 17:35:40'),
(11,11,'หัว RJ-45 CAT6','หัว',0,54,NULL,0,2,'2014-11-25 10:36:03',NULL,10,2015,'2015-11-09 17:35:40'),
(12,12,'สายแลน UTP Cat6 (กล่องละ 200m.)','เมตร',80,1525,NULL,0,2,'2014-11-25 10:36:23','2015-07-05 13:40:04',10,2015,'2015-11-09 17:35:40'),
(13,13,'สายแลน UTP Cat5  (กล่องละ 305m.)','เมตร',76,1130,NULL,0,2,'2014-11-25 10:37:06','2015-07-16 11:00:12',10,2015,'2015-11-09 17:35:40'),
(14,14,'สาย Patch Cord','เส้น',150,13,NULL,0,2,'2014-11-25 10:37:19',NULL,10,2015,'2015-11-09 17:35:40'),
(15,15,'รางเก็บสายไฟ 12 x 25 (เล็ก) (กล่องละ 50)','ท่อน',79,0,NULL,0,2,'2014-11-25 10:37:55','2015-11-05 15:59:49',10,2015,'2015-11-09 17:35:40'),
(16,16,'รางเก็บสายไฟ 20 x 40 (กลาง) (กล่องละ 50)','ท่อน',107,32,NULL,0,2,'2014-11-25 10:39:23','2015-03-23 15:53:05',10,2015,'2015-11-09 17:35:40'),
(17,17,'หน้ากากบล็อก 2 ช่อง','ชิ้น',36,54,NULL,0,2,'2014-11-25 10:39:50','2015-07-16 11:02:00',10,2015,'2015-11-09 17:35:40'),
(18,18,'หน้ากากบล็อก 1 ช่อง','ชิ้น',22,29,NULL,0,2,'2014-11-25 10:40:19','2015-11-05 15:59:49',10,2015,'2015-11-09 17:35:40'),
(19,19,'บล็อกแลน','ชิ้น',0,42,NULL,0,2,'2014-11-25 10:40:37','2015-11-05 15:59:49',10,2015,'2015-11-09 17:35:40'),
(20,20,'RJ45 Joint Connector','หัว',0,26,NULL,0,2,'2014-11-25 10:40:55','2015-08-07 11:52:08',10,2015,'2015-11-09 17:35:40');
/*!40000 ALTER TABLE `tb_material_stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_return`
--

DROP TABLE IF EXISTS `tb_return`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_return` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `return_date` datetime NOT NULL,
  `return_by` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `recive_by` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `bring_id` int(5) DEFAULT NULL,
  `bring_list` int(20) DEFAULT NULL,
  `mat_id` int(5) DEFAULT NULL,
  `amount` int(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_return`
--

LOCK TABLES `tb_return` WRITE;
/*!40000 ALTER TABLE `tb_return` DISABLE KEYS */;
INSERT INTO `tb_return` VALUES 
(1,'2016-02-29 12:21:59','1300900115098','1300900115098','เก็บวัสดุมาคืนสต็อค',NULL,NULL,4,3),
(2,'2016-05-04 14:30:57','','','',590049,261,15,2),
(3,'2016-06-01 10:13:25','1300900115098','1300900115098','',590052,268,9,1),
(4,'2018-12-11 08:52:06','','','',580010,31,21,1),
(5,'2018-12-11 08:58:39','','','',610054,745,74,3),
(6,'2019-04-04 15:31:41','1309900238341','1309900238341','คืนสี',NULL,NULL,56,1),
(7,'2019-04-04 15:31:41','1309900238341','1309900238341','คืนสี',NULL,NULL,57,1),
(8,'2019-04-04 15:31:41','1309900238341','1309900238341','คืนสี',NULL,NULL,58,1);
/*!40000 ALTER TABLE `tb_return` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_supplier`
--

DROP TABLE IF EXISTS `tb_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_supplier` (
  `sup_id` int(5) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sup_status` enum('N','Y') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_supplier`
--

LOCK TABLES `tb_supplier` WRITE;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;
INSERT INTO `tb_supplier` VALUES (1,'บริษัท เค พี ฤทธ์วิชญ์ชัย เอ็นจิเนียริ่ง จำกัด','Y'),(2,'ห้างหุ้นส่วนจำกัด ไอ.ที.เฮ้าส์','Y');
/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_material'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-04 15:44:08
