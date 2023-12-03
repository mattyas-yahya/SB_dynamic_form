CREATE DATABASE  IF NOT EXISTS `cmms` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `cmms`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: cmms
-- ------------------------------------------------------
-- Server version	5.0.15-nt

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `asset`
--

DROP TABLE IF EXISTS `asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset` (
  `id_asset` varchar(255) NOT NULL,
  `grup` varchar(255) NOT NULL,
  `kode_asset` varchar(30) NOT NULL,
  `model` varchar(255) NOT NULL,
  `nama_asset` varchar(30) NOT NULL,
  `serial` varchar(30) NOT NULL,
  `tgl_beli_asset` date NOT NULL,
  `lokasi` varchar(255) NOT NULL,
  `asset_tag` varchar(255) NOT NULL,
  `garansi` varchar(255) NOT NULL,
  `harga_beli` double NOT NULL,
  PRIMARY KEY  (`id_asset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset`
--

LOCK TABLES `asset` WRITE;
/*!40000 ALTER TABLE `asset` DISABLE KEYS */;
INSERT INTO `asset` VALUES ('4a75bd48-148c-409b-8fac-c09bfad76b4a','mekanik','SBY-L1','ML021RS','Mesin Las','KV00213','2019-01-01','bengkel','L001','1',2000),('a9e6752b-2719-488c-b971-57a6a28a059b','elektrik','SBY-KVYR1','AC TEMBOK','KONVEYOR ','8201802','2019-01-18','ruang marketing','KV1','12',4500000),('b12b8d8a-f568-451a-9412-360715fbe708','elektrik','SBY-AC1','AC','AC HITACHI','111DFOQ','2018-11-20','ruang marketing','AC1','12',3000000);
/*!40000 ALTER TABLE `asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_aud`
--

DROP TABLE IF EXISTS `asset_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asset_aud` (
  `id_asset` varchar(255) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` tinyint(4) default NULL,
  `grup` varchar(255) default NULL,
  `kode_asset` varchar(255) default NULL,
  `lokasi` varchar(255) default NULL,
  `model` varchar(255) default NULL,
  `nama_asset` varchar(255) default NULL,
  `serial` varchar(255) default NULL,
  `tgl_beli_asset` date default NULL,
  PRIMARY KEY  (`id_asset`,`rev`),
  KEY `FKk2y69n6xuwan2iwwis54utbke` (`rev`),
  CONSTRAINT `FKk2y69n6xuwan2iwwis54utbke` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_aud`
--

LOCK TABLES `asset_aud` WRITE;
/*!40000 ALTER TABLE `asset_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `asset_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aud_wo`
--

DROP TABLE IF EXISTS `aud_wo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aud_wo` (
  `id_aud_wo` varchar(255) NOT NULL,
  `action` varchar(9000) default NULL,
  `end` date NOT NULL,
  `jenis_pekerjaan` varchar(255) default NULL,
  `kode_asset` varchar(255) default NULL,
  `kode_wo` bigint(20) default NULL,
  `lokasi` varchar(255) default NULL,
  `nama_dept` varchar(255) default NULL,
  `prioritas` varchar(255) default NULL,
  `start` date NOT NULL,
  `status_pekerjaan` varchar(255) default NULL,
  `title` longtext,
  `id_asset` varchar(255) default NULL,
  `id_dept` varchar(255) default NULL,
  `id_pm` varchar(255) default NULL,
  PRIMARY KEY  (`id_aud_wo`),
  KEY `FKb56psv2ndh494jmxkf2y7v9v7` (`id_asset`),
  KEY `FKjeisdp6tybpspkilhut137qxo` (`id_dept`),
  KEY `FK6e0py3c1liycnebwx0eawmcef` (`id_pm`),
  CONSTRAINT `FK6e0py3c1liycnebwx0eawmcef` FOREIGN KEY (`id_pm`) REFERENCES `preventive_maintenance` (`id_pm`),
  CONSTRAINT `FKb56psv2ndh494jmxkf2y7v9v7` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id_asset`),
  CONSTRAINT `FKjeisdp6tybpspkilhut137qxo` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aud_wo`
--

LOCK TABLES `aud_wo` WRITE;
/*!40000 ALTER TABLE `aud_wo` DISABLE KEYS */;
INSERT INTO `aud_wo` VALUES ('01f11ff9-85e1-466e-9ebd-a07c6aa4cfe6','penggantian directori','2019-02-22','Perbaikan','SBY-KVYR1',54623,'ruang marketing','MTC','Normal','2019-02-22','End_Job','c','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('38d5400b-8754-4f6e-aab0-02bd8d2352b8','','2019-01-20','Perbaikan','KVYR01',72417,'ruang marketing','MTC','Normal','2019-01-19','Approved','ccccccccccccccccc','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('3b7fc3af-2dd8-41b1-b354-f555ffdb34db','plat rusak karena koros\r\n\r\ndi las bagian belakang engsel bia gk sempal lagi\r\n','2019-11-03','Perbaikan','SBY-L1',58985,'bengkel','PROD-SBY1','Normal','2019-03-03','Verified','iku rusak plat e bos','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294',NULL),('449b274d-9146-450d-b5e7-c2d034b234b6','','2019-01-20','Perbaikan','111DFOQ',76162,'','MTC','Normal','2019-01-19','Verified','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('5eeb7025-de91-4831-a341-34af5fef0503','','2019-01-20','Perbaikan','KVYR01',72417,'ruang marketing','MTC','Normal','2019-01-19','Verified','ccccccccccccccccc','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('5f298907-8642-4938-9b20-53aa0019143c','','2019-02-13','Preventiv_Maintenance','111DFOQ',93161,'','MTC','Normal','2019-02-13','Verified','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('616b3871-aab8-491a-a87b-49d27d6dfdc4','','2019-01-27','Perbaikan','111DFOQ',85444,'','MTC','Normal','2019-01-21','Work_In_Progrees','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('67aab23f-5d4e-4915-bf6e-b8c6fccf7c15','xxxxxx','2019-01-26','Perbaikan','SBY-L1',91395,'bengkel','PROD-SBY1','Normal','2019-01-26','Verified','cleaning ac rutin office','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('7a3012c9-758f-4275-8c11-3659d75d0454','\r\n','2019-01-20','Perbaikan','L1',32370,'bengkel','MTC','Normal','2019-01-19','Approved','','4a75bd48-148c-409b-8fac-c09bfad76b4a','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('7d2fcbae-c94e-43df-a2b7-1a04b03e2728','ssssssssssssssssssssssss\r\n','2019-01-20','Perbaikan','L1',32370,'bengkel','MTC','Normal','2019-01-19','Approved','ssssssssssssssssss','4a75bd48-148c-409b-8fac-c09bfad76b4a','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('89871e48-183b-4622-b4a2-1f5d92f4546c','','2019-01-20','Perbaikan','L1',32087,'bengkel','MTC','Normal','2019-01-19','Approved','c','4a75bd48-148c-409b-8fac-c09bfad76b4a','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('8c8fd121-17a6-4696-a5fa-f3c93a09e8ea','','2019-01-27','Perbaikan','111DFOQ',85444,'','MTC','Normal','2019-01-21','End_Job','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('9f190660-627e-47c2-bc51-6110fd28ed42','','2019-02-13','Preventiv_Maintenance','111DFOQ',93161,'','MTC','Normal','2019-02-13','End_Job','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('a34a4408-200e-4294-84da-c95b99edb964','','2019-01-20','Perbaikan','L1',15816,'bengkel','MTC','Normal','2019-01-19','Verified','c','4a75bd48-148c-409b-8fac-c09bfad76b4a','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('a4fe8c08-d514-4ccb-94e6-f7c2d105a799','','2019-02-13','Preventiv_Maintenance','111DFOQ',93161,'','MTC','Normal','2019-02-13','Verified','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('ac0f8254-3f0c-4e91-881f-d99da461d590','','2019-02-22','Perbaikan','SBY-KVYR1',28066,'ruang marketing','MTC','Normal','2019-02-22','Verified','pak bejatttt','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('bd4be2e0-cdbc-4cc3-ad23-7645971a2704','','2019-01-27','Perbaikan','111DFOQ',85444,'','MTC','Normal','2019-01-21','Verified','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('bf64b05a-b367-4eeb-9de6-99df34ec3c4e','','2019-01-26','Perbaikan','SBY-L1',91395,'bengkel','PROD-SBY1','Normal','2019-01-26','End_Job','cleaning ac rutin office','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('c3e276bf-2c78-4784-912c-e928ba77eae9','','2019-02-14','Perbaikan','KV00213',99289,'','MTC','Normal','2019-02-14','Verified','ganti tabung',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','b8c9e0d4-dd73-44d5-b28f-8469bbb4c435'),('c4d0f0cc-f079-4e26-97e6-e3523c8030e9','','2019-02-22','Perbaikan','SBY-KVYR1',54623,'ruang marketing','MTC','Normal','2019-02-22','Verified','c','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('d3b0c0b5-1dd2-4ac7-a967-f8842da07c6c','','2019-01-26','Perbaikan','111DFOQ',91395,'','MTC','Normal','2019-01-26','Verified','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('e008ff20-91b0-4822-b970-0b2f19ee89ee','plat rusak karena koros\r\n\r\ndi las bagian belakang engsel bia gk sempal lagi\r\n','2019-03-04','Perbaikan','SBY-L1',58985,'bengkel','PROD-SBY1','Normal','2019-03-03','Verified','iku rusak plat e bos','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294',NULL),('e4a73849-477b-4793-af45-92061cd86d6f','penggantian directori','2019-02-22','Perbaikan','SBY-KVYR1',54623,'ruang marketing','MTC','Normal','2019-02-22','Work_In_Progrees','c','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('e95bb946-1f01-40a2-8bb3-60f517900af7','','2019-01-20','Perbaikan','KVYR01',72417,'ruang marketing','MTC','Normal','2019-01-19','End_Job','ccccccccccccccccc','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('f7af4499-72fc-445f-820d-ee4f8bddd3a0','xxxxxx','2019-01-26','Perbaikan','SBY-L1',91395,'bengkel','PROD-SBY1','Normal','2019-01-26','End_Job','cleaning ac rutin office','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('f89448e0-159c-4419-bc65-3e03a4cc7c14','','2019-01-20','Perbaikan','L1',32370,'bengkel','MTC','Normal','2019-01-19','Approved','xx','4a75bd48-148c-409b-8fac-c09bfad76b4a','86324fa9-4fd5-4136-b141-acc0c277514f',NULL);
/*!40000 ALTER TABLE `aud_wo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authorities` (
  `id` int(11) NOT NULL auto_increment,
  `authority` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (1,'ROLE_USER','vanili'),(2,'ROLE_ADMIN','admin'),(3,'ROLE_USER','vanili'),(4,'ROLE_ADMIN','admin'),(5,'ROLE_USER','vanili'),(6,'ROLE_ADMIN','admin'),(7,'ROLE_USER','vanili'),(8,'ROLE_ADMIN','admin'),(9,'ROLE_USER','vanili'),(10,'ROLE_ADMIN','admin'),(11,'ROLE_USER','vanili'),(12,'ROLE_ADMIN','admin'),(13,'ROLE_USER','vanili'),(14,'ROLE_ADMIN','admin'),(15,'ROLE_USER','vanili'),(16,'ROLE_ADMIN','admin');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `biaya`
--

DROP TABLE IF EXISTS `biaya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `biaya` (
  `id_biaya` varchar(255) NOT NULL,
  `biaya` double NOT NULL,
  `deskripsi` longtext,
  `grup` varchar(255) default NULL,
  `jumlah_orang` int(11) NOT NULL,
  `kode_wo` bigint(20) default NULL,
  `start` date NOT NULL,
  `id_wo` varchar(255) default NULL,
  PRIMARY KEY  (`id_biaya`),
  KEY `FKkhvc1ya4189sa94iare82sq9t` (`id_wo`),
  CONSTRAINT `FKkhvc1ya4189sa94iare82sq9t` FOREIGN KEY (`id_wo`) REFERENCES `work_order` (`id_wo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `biaya`
--

LOCK TABLES `biaya` WRITE;
/*!40000 ALTER TABLE `biaya` DISABLE KEYS */;
INSERT INTO `biaya` VALUES ('4dd72416-9031-47d7-a734-b7eac38c0531',1000,'directori','Mechanic',1,54623,'2019-02-22','8cc9a455-22b9-4580-bb91-37a1d2b5d96d'),('a1887310-486f-4d4d-bac7-411ae7e19532',1200,'buang pren','sipil',11,54623,'2019-02-22','8cc9a455-22b9-4580-bb91-37a1d2b5d96d'),('af2a0e04-c100-40c0-baf9-a6946dae33a7',4000,'','Mechanic',2,91395,'2019-01-26','b51c4c92-ea6a-4ff3-b670-cae018146628'),('c0233dc7-2a94-4332-82bf-ab514b2210f9',3000,'bersihkan ac ne office atas','HVAC',1,85444,'2019-01-21','4b1796aa-28a9-4776-addd-a2584c65f1e5');
/*!40000 ALTER TABLE `biaya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departemen`
--

DROP TABLE IF EXISTS `departemen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departemen` (
  `id_dept` varchar(255) NOT NULL,
  `kode_dept` varchar(30) NOT NULL,
  `nama_dept` varchar(30) NOT NULL,
  PRIMARY KEY  (`id_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departemen`
--

LOCK TABLES `departemen` WRITE;
/*!40000 ALTER TABLE `departemen` DISABLE KEYS */;
INSERT INTO `departemen` VALUES ('86324fa9-4fd5-4136-b141-acc0c277514f','MTC','MAINTENANCE'),('864ca8b3-966f-4328-910a-f3387b7fa294','PROD-SBY1','PRODUKSI'),('9556d5de-cc8f-4460-980c-169a4191e6ee','MTC-ELT','MAINTENANCE ELEKTRIK'),('d2075a51-0ef9-4155-89cf-28bfdde51bc1','cccc','cccc');
/*!40000 ALTER TABLE `departemen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departemen_aud`
--

DROP TABLE IF EXISTS `departemen_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departemen_aud` (
  `id_dept` varchar(255) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` tinyint(4) default NULL,
  `kode_dept` varchar(255) default NULL,
  `nama_dept` varchar(255) default NULL,
  PRIMARY KEY  (`id_dept`,`rev`),
  KEY `FK8xl7j9qhkqhn3w693p7uddsne` (`rev`),
  CONSTRAINT `FK8xl7j9qhkqhn3w693p7uddsne` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departemen_aud`
--

LOCK TABLES `departemen_aud` WRITE;
/*!40000 ALTER TABLE `departemen_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `departemen_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header_moveout`
--

DROP TABLE IF EXISTS `header_moveout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `header_moveout` (
  `id_header_moveout` varchar(255) NOT NULL,
  `deskripsi` varchar(255) default NULL,
  `referensi` varchar(255) default NULL,
  PRIMARY KEY  (`id_header_moveout`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_moveout`
--

LOCK TABLES `header_moveout` WRITE;
/*!40000 ALTER TABLE `header_moveout` DISABLE KEYS */;
INSERT INTO `header_moveout` VALUES ('013eb475-2da5-4c12-ba0f-799ea2347b6a','asasa','sas'),('0fc09309-3677-4cd2-b710-9c55f01b9fa2','d','d'),('15515a45-f319-4608-b43f-8bba476c518d','xxxxxxxxxx','MOV002'),('39583fb1-4a79-4b1b-9004-fca311630fdc','s','s'),('43a0d44f-9faf-4b97-ad3a-ff65bec377cf','sssssccc','s'),('48bb3844-6e6a-4b60-ba05-69ba2e2d06ab','Moveout pulley konveyor','MOV001'),('48ee240b-f292-46d2-90be-46c87e518b85','asasasas','s'),('50b7ffb7-9c1f-470b-a081-b5215e28a33c','c','c'),('53b5b788-05ae-41cc-b82a-db1e58587402','dddqsasa','dddd'),('575a406e-8bdc-4bdb-b078-b0875e68823c','s','s'),('a80b88e9-d6b3-4ee1-81a2-7cab382c40b7','s','s'),('ac4af4e1-0b6e-4e73-81a9-e8f4ce39cb0d','x','x'),('d3d5a7b7-30bf-4e59-af00-23b17b9edbeb','zzzzzzzz','MOV003');
/*!40000 ALTER TABLE `header_moveout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jadwal`
--

DROP TABLE IF EXISTS `jadwal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jadwal` (
  `id_dept` varchar(255) NOT NULL,
  `end` date NOT NULL,
  `start` date NOT NULL,
  `title` longtext,
  PRIMARY KEY  (`id_dept`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jadwal`
--

LOCK TABLES `jadwal` WRITE;
/*!40000 ALTER TABLE `jadwal` DISABLE KEYS */;
INSERT INTO `jadwal` VALUES ('08a526d8-e561-4ae8-84ad-0656368e080a','2019-01-13','2019-01-13','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),('0ee881dc-d30e-4b5c-9da6-3d51e2dc3294','2019-01-13','2019-01-13','cccccccccc'),('19d18f49-514a-46e9-a770-88617615cd9b','2019-01-14','2019-01-13','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),('59619990-35f4-4707-85c5-a8f9194c3919','2019-01-20','2019-01-13','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),('79889de8-6728-4ec6-bf3e-95fd5557d0d0','2019-01-13','2019-01-13','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),('84e01a70-c4a8-4e70-984d-122a8b3ab5c8','2019-01-13','2019-01-13','xxxxxxx'),('e972e4bc-b9cb-4e10-a0b2-538596b2179a','2019-01-13','2019-01-13','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),('ee672c74-9098-47b7-85ad-7b85899f330b','2019-01-13','2019-01-13','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),('f54a77e2-162f-4615-bdb0-f55dda56cc84','2019-01-14','2019-01-13','ccccccccccccc');
/*!40000 ALTER TABLE `jadwal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moveout`
--

DROP TABLE IF EXISTS `moveout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `moveout` (
  `id_moveout` varchar(255) NOT NULL,
  `jumlah` varchar(30) NOT NULL,
  `keterangan` varchar(255) NOT NULL,
  `kode_moveout` varchar(30) NOT NULL,
  `kode_spare_part` varchar(30) NOT NULL,
  `tgl_moveout` date NOT NULL,
  `id_spare_part` varchar(255) default NULL,
  `harga` varchar(30) NOT NULL,
  `total` varchar(30) NOT NULL,
  PRIMARY KEY  (`id_moveout`),
  KEY `FKatckyhce5ead2jpms2j9oslvd` (`id_spare_part`),
  CONSTRAINT `FKatckyhce5ead2jpms2j9oslvd` FOREIGN KEY (`id_spare_part`) REFERENCES `spare_part` (`id_spare_part`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moveout`
--

LOCK TABLES `moveout` WRITE;
/*!40000 ALTER TABLE `moveout` DISABLE KEYS */;
INSERT INTO `moveout` VALUES ('c474ea88-9b87-4b14-8a53-cbf98c870cf6','23','filetr konveyor','MOV-16685','FLTR','2019-11-11','f8b9568d-692b-4c3a-8804-5af8fd6260a3','3400','78200');
/*!40000 ALTER TABLE `moveout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peserta_pelatihan`
--

DROP TABLE IF EXISTS `peserta_pelatihan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peserta_pelatihan` (
  `id_sesi` varchar(255) NOT NULL,
  `id_peserta` varchar(255) NOT NULL,
  KEY `FK_nu06xg3gshjdqajpjunsaoxeb` (`id_peserta`),
  KEY `FK_n0ten5mrabvefx4c59xlyvbea` (`id_sesi`),
  CONSTRAINT `FK_n0ten5mrabvefx4c59xlyvbea` FOREIGN KEY (`id_sesi`) REFERENCES `sesi` (`id`),
  CONSTRAINT `FK_nu06xg3gshjdqajpjunsaoxeb` FOREIGN KEY (`id_peserta`) REFERENCES `peserta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peserta_pelatihan`
--

LOCK TABLES `peserta_pelatihan` WRITE;
/*!40000 ALTER TABLE `peserta_pelatihan` DISABLE KEYS */;
INSERT INTO `peserta_pelatihan` VALUES ('aa','aa1'),('aa','aa2'),('aa','aa3'),('ab','aa2'),('ab','aa3'),('ac','aa2');
/*!40000 ALTER TABLE `peserta_pelatihan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preventive_maintenance`
--

DROP TABLE IF EXISTS `preventive_maintenance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preventive_maintenance` (
  `id_pm` varchar(255) NOT NULL,
  `deskripsi` varchar(30) NOT NULL,
  `kode_asset` varchar(30) NOT NULL,
  `id_asset` varchar(255) default NULL,
  PRIMARY KEY  (`id_pm`),
  KEY `FKeds4fgef3t62c9gld3s9fykfh` (`id_asset`),
  CONSTRAINT `FKeds4fgef3t62c9gld3s9fykfh` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id_asset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventive_maintenance`
--

LOCK TABLES `preventive_maintenance` WRITE;
/*!40000 ALTER TABLE `preventive_maintenance` DISABLE KEYS */;
INSERT INTO `preventive_maintenance` VALUES ('a0d48b3d-890b-46a3-8fb4-c909ec5270b1','cleaning ac rutin office','111DFOQ','b12b8d8a-f568-451a-9412-360715fbe708'),('b8c9e0d4-dd73-44d5-b28f-8469bbb4c435','ganti tabung','KV00213','4a75bd48-148c-409b-8fac-c09bfad76b4a');
/*!40000 ALTER TABLE `preventive_maintenance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preventive_maintenance_aud`
--

DROP TABLE IF EXISTS `preventive_maintenance_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `preventive_maintenance_aud` (
  `id_pm` varchar(255) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` tinyint(4) default NULL,
  `deskripsi` varchar(255) default NULL,
  `kode_asset` varchar(255) default NULL,
  `id_asset` varchar(255) default NULL,
  PRIMARY KEY  (`id_pm`,`rev`),
  KEY `FKnijkdb2fpuuqxtuycrf2x3xnc` (`rev`),
  CONSTRAINT `FKnijkdb2fpuuqxtuycrf2x3xnc` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preventive_maintenance_aud`
--

LOCK TABLES `preventive_maintenance_aud` WRITE;
/*!40000 ALTER TABLE `preventive_maintenance_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `preventive_maintenance_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revinfo`
--

DROP TABLE IF EXISTS `revinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revinfo` (
  `rev` int(11) NOT NULL auto_increment,
  `revtstmp` bigint(20) default NULL,
  PRIMARY KEY  (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revinfo`
--

LOCK TABLES `revinfo` WRITE;
/*!40000 ALTER TABLE `revinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `revinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role` varchar(255) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_roles`
--

DROP TABLE IF EXISTS `s_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_roles` (
  `id` varchar(36) NOT NULL,
  `nama` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_roles`
--

LOCK TABLES `s_roles` WRITE;
/*!40000 ALTER TABLE `s_roles` DISABLE KEYS */;
INSERT INTO `s_roles` VALUES ('adm','ROLE_ADMIN'),('stf','ROLE_STAFF');
/*!40000 ALTER TABLE `s_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_user_role`
--

DROP TABLE IF EXISTS `s_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_user_role` (
  `id_user` varchar(36) NOT NULL,
  `id_role` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user_role`
--

LOCK TABLES `s_user_role` WRITE;
/*!40000 ALTER TABLE `s_user_role` DISABLE KEYS */;
INSERT INTO `s_user_role` VALUES ('u001','adm'),('u001','stf'),('u002','stf');
/*!40000 ALTER TABLE `s_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_users`
--

DROP TABLE IF EXISTS `s_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_users` (
  `id` varchar(36) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_users`
--

LOCK TABLES `s_users` WRITE;
/*!40000 ALTER TABLE `s_users` DISABLE KEYS */;
INSERT INTO `s_users` VALUES ('u001','endy','123',1),('u002','adi','123',1);
/*!40000 ALTER TABLE `s_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spare_part`
--

DROP TABLE IF EXISTS `spare_part`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spare_part` (
  `id_spare_part` varchar(255) NOT NULL,
  `kode_asset` varchar(30) NOT NULL,
  `kode_spare_part` varchar(30) NOT NULL,
  `nama_spare_part` varchar(30) NOT NULL,
  `tgl_beli_spare` date NOT NULL,
  `vendor` varchar(30) NOT NULL,
  `id_asset` varchar(255) default NULL,
  `garansi` varchar(255) NOT NULL,
  `harga_beli` double NOT NULL,
  `serial` varchar(255) NOT NULL,
  `stok` int(11) NOT NULL,
  `consume` int(11) NOT NULL,
  `end` int(11) NOT NULL,
  PRIMARY KEY  (`id_spare_part`),
  KEY `FK3l80brreuab2ev83kg8q29pwl` (`id_asset`),
  CONSTRAINT `FK3l80brreuab2ev83kg8q29pwl` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id_asset`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spare_part`
--

LOCK TABLES `spare_part` WRITE;
/*!40000 ALTER TABLE `spare_part` DISABLE KEYS */;
INSERT INTO `spare_part` VALUES ('f8b9568d-692b-4c3a-8804-5af8fd6260a3','SBY-AC1','FLTR','FILTER SARINGAN','2019-03-15','PT ASUKA','b12b8d8a-f568-451a-9412-360715fbe708','12',3400,'FLTR0134556',3,2,0);
/*!40000 ALTER TABLE `spare_part` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `active` int(11) default NULL,
  `email` varchar(255) default NULL,
  `last_name` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `roles` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `link` varchar(255) default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (12,1,'rahmadtiu@gmail.com','rahmadtiu','rahmadtiu','$2a$10$TS8/b0MciCQyIINqkmjNBexBoMacCaoIeY9BA3yJj3wfOcIEdJPiC',NULL,'ROLE_ADMIN',NULL),(18,1,'jasperadmin@gmail.com','jasperadmin','jasperadmin','$2a$10$rh98R7rcaIsC6ATP9ldzhuLpk9uiQv/DRxItISCSoQAvaTZziDQFm',NULL,'ROLE_ADMIN',NULL),(19,1,'jasper@gmail.com','jasper','jasper','$2a$10$YBtBEVUfu1sdhafXZH3ka.0rSqX7US4FzhS.wo3F/j0bRPcciwKoW',NULL,'ROLE_ADMIN',NULL),(20,1,'matt@gmail.com','mattyas','mattyas','$2a$10$AWNF6r2.v8B/5tdcEjQDAOGa5NteluxbwGhcrHlxyhZw3q3EhikFC',NULL,'ROLE_USER',''),(22,1,'vanilla@gmail.com','vanilla','vanilla','$2a$10$LuJTXLNBA93v8LTuio63l.0J07dCxqJtc3Tf2/Hct1dhat5UX4C5K',NULL,'ROLE_ACTUATOR',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (12,1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL auto_increment,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'$2a$10$/zPhdx3.ICPTAZokYFcvEeFdWoG5dwGjuAjZQkXv.knpddGUz1vpq','naruto',''),(2,'vanili','vanili',''),(3,'pass','admin',''),(4,'vanili','vanili',''),(5,'pass','admin',''),(6,'vanili','vanili',''),(7,'pass','admin',''),(8,'vanili','vanili',''),(9,'pass','admin',''),(10,'vanili','vanili',''),(11,'pass','admin',''),(12,'vanili','vanili',''),(13,'pass','admin',''),(14,'vanili','vanili',''),(15,'pass','admin',''),(16,'vanili','vanili',''),(17,'pass','admin','');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_order`
--

DROP TABLE IF EXISTS `work_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_order` (
  `id_wo` varchar(255) NOT NULL,
  `action` varchar(9000) default NULL,
  `end` date NOT NULL,
  `issue` longtext,
  `jenis_pekerjaan` varchar(255) default NULL,
  `kode_asset` varchar(255) default NULL,
  `kode_wo` bigint(20) default NULL,
  `lokasi` varchar(255) default NULL,
  `nama_dept` varchar(255) default NULL,
  `prioritas` varchar(255) default NULL,
  `start` date NOT NULL,
  `status_pekerjaan` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `id_asset` varchar(255) default NULL,
  `id_dept` varchar(255) default NULL,
  `id_pm` varchar(255) default NULL,
  PRIMARY KEY  (`id_wo`),
  KEY `FK2yqu95lb5849da6xx652knq6v` (`id_asset`),
  KEY `FKf5loajhoo391ondyevswfk0ns` (`id_dept`),
  KEY `FKfapf86k6lhrhon2dipjpaacxe` (`id_pm`),
  CONSTRAINT `FK2yqu95lb5849da6xx652knq6v` FOREIGN KEY (`id_asset`) REFERENCES `asset` (`id_asset`),
  CONSTRAINT `FKf5loajhoo391ondyevswfk0ns` FOREIGN KEY (`id_dept`) REFERENCES `departemen` (`id_dept`),
  CONSTRAINT `FKfapf86k6lhrhon2dipjpaacxe` FOREIGN KEY (`id_pm`) REFERENCES `preventive_maintenance` (`id_pm`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_order`
--

LOCK TABLES `work_order` WRITE;
/*!40000 ALTER TABLE `work_order` DISABLE KEYS */;
INSERT INTO `work_order` VALUES ('13253832-3667-41e4-ace3-8a1089c64509','plat rusak karena koros\r\n\r\ndi las bagian belakang engsel bia gk sempal lagi\r\n','2019-03-04',NULL,'Perbaikan','SBY-L1',58985,'bengkel','PROD-SBY1','Normal','2019-03-03','Verified','iku rusak plat e bos','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294',NULL),('4b1796aa-28a9-4776-addd-a2584c65f1e5','','2019-01-27',NULL,'Perbaikan','111DFOQ',85444,'','MTC','Normal','2019-01-21','End_Job','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('8cc9a455-22b9-4580-bb91-37a1d2b5d96d','penggantian directori','2019-02-22',NULL,'Perbaikan','SBY-KVYR1',54623,'ruang marketing','MTC','Normal','2019-02-22','End_Job','c','a9e6752b-2719-488c-b971-57a6a28a059b','86324fa9-4fd5-4136-b141-acc0c277514f',NULL),('90a7bc00-b977-4ddf-9ab8-c56cf68599b7','','2019-02-13',NULL,'Preventiv_Maintenance','111DFOQ',93161,'','MTC','Normal','2019-02-13','Verified','cleaning ac rutin office',NULL,'86324fa9-4fd5-4136-b141-acc0c277514f','a0d48b3d-890b-46a3-8fb4-c909ec5270b1'),('b51c4c92-ea6a-4ff3-b670-cae018146628','','2019-01-26',NULL,'Perbaikan','SBY-L1',91395,'bengkel','PROD-SBY1','Normal','2019-01-26','End_Job','cleaning ac rutin office','4a75bd48-148c-409b-8fac-c09bfad76b4a','864ca8b3-966f-4328-910a-f3387b7fa294','a0d48b3d-890b-46a3-8fb4-c909ec5270b1');
/*!40000 ALTER TABLE `work_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_order_aud`
--

DROP TABLE IF EXISTS `work_order_aud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_order_aud` (
  `id_wo` varchar(255) NOT NULL,
  `rev` int(11) NOT NULL,
  `revtype` tinyint(4) default NULL,
  `action` varchar(255) default NULL,
  `deskripsi` varchar(255) default NULL,
  `issue` longtext,
  `jenis_pekerjaan` varchar(255) default NULL,
  `kode_asset` varchar(255) default NULL,
  `kode_wo` bigint(20) default NULL,
  `lokasi` varchar(255) default NULL,
  `nama_dept` varchar(255) default NULL,
  `prioritas` varchar(255) default NULL,
  `status_pekerjaan` varchar(255) default NULL,
  `tgl_pengerjaan` date default NULL,
  `id_asset` varchar(255) default NULL,
  `id_dept` varchar(255) default NULL,
  `id_pm` varchar(255) default NULL,
  PRIMARY KEY  (`id_wo`,`rev`),
  KEY `FKtj2sgb5dhjrc6mrsoynpgd2c6` (`rev`),
  CONSTRAINT `FKtj2sgb5dhjrc6mrsoynpgd2c6` FOREIGN KEY (`rev`) REFERENCES `revinfo` (`rev`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_order_aud`
--

LOCK TABLES `work_order_aud` WRITE;
/*!40000 ALTER TABLE `work_order_aud` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_order_aud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cmms'
--
/*!50003 DROP PROCEDURE IF EXISTS `end_blnc` */;
--
-- WARNING: old server version. The following dump may be incomplete.
--
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE PROCEDURE `end_blnc`()
BEGIN
SELECT a.id_spare_part,b.kode_asset,a.kode_spare_part,a.nama_spare_part,a.tgl_beli_spare,a.vendor,b.id_asset,b.garansi,a.harga_beli,a.serial,a.stok,a.consume,(a.stok-a.consume)as end_balance 
FROM spare_part a join asset b
where a.id_asset=b.id_asset
group by a.id_spare_part ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-06 20:35:22
