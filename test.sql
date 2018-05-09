-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `castumer`
--

DROP TABLE IF EXISTS `castumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `castumer` (
  `CastumerID` int(11) NOT NULL AUTO_INCREMENT,
  `CastumerName` varchar(45) DEFAULT NULL,
  `CastumerType` varchar(45) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CastumerID`),
  KEY `FK_CastumerType_idx` (`CastumerType`),
  CONSTRAINT `FK_CastumerType` FOREIGN KEY (`CastumerType`) REFERENCES `castumertype` (`CastumerTypeName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `castumer`
--

LOCK TABLES `castumer` WRITE;
/*!40000 ALTER TABLE `castumer` DISABLE KEYS */;
INSERT INTO `castumer` VALUES (1,'مهاب','جملة','794565465');
/*!40000 ALTER TABLE `castumer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `castumertype`
--

DROP TABLE IF EXISTS `castumertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `castumertype` (
  `CastumerTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `CastumerTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`CastumerTypeID`),
  UNIQUE KEY `CastumerTypeName_UNIQUE` (`CastumerTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `castumertype`
--

LOCK TABLES `castumertype` WRITE;
/*!40000 ALTER TABLE `castumertype` DISABLE KEYS */;
INSERT INTO `castumertype` VALUES (1,'جملة');
/*!40000 ALTER TABLE `castumertype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(45) NOT NULL,
  `ProductType` varchar(45) NOT NULL,
  `SupplierName` varchar(45) DEFAULT NULL,
  `PurchasePrice` decimal(7,0) NOT NULL,
  `RetailerPrice` decimal(7,0) NOT NULL,
  `RetailPrice` decimal(7,0) NOT NULL,
  `Q_Storage` int(11) NOT NULL,
  `Q_Inventory` int(11) NOT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `FK_ProductType_idx` (`ProductType`),
  KEY `FK_Supplier_idx` (`SupplierName`),
  CONSTRAINT `FK_ProductType` FOREIGN KEY (`ProductType`) REFERENCES `productstype` (`ProductTypeName`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_Supplier` FOREIGN KEY (`SupplierName`) REFERENCES `supplier` (`SupplierName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'قلم','Pen','محمد محمود احمد',2132,213123,213,323,123);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productstype`
--

DROP TABLE IF EXISTS `productstype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productstype` (
  `ProductTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`ProductTypeID`),
  UNIQUE KEY `ProductTypeName_UNIQUE` (`ProductTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productstype`
--

LOCK TABLES `productstype` WRITE;
/*!40000 ALTER TABLE `productstype` DISABLE KEYS */;
INSERT INTO `productstype` VALUES (1,'Pen'),(2,'كتاب');
/*!40000 ALTER TABLE `productstype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supplier` (
  `SupplierID` int(11) NOT NULL AUTO_INCREMENT,
  `SupplierName` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  PRIMARY KEY (`SupplierID`),
  UNIQUE KEY `SupplierName_UNIQUE` (`SupplierName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'محمد محمود احمد','65468468'),(2,'خالد','123324');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `LogInName` varchar(45) NOT NULL,
  `UserID` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(45) NOT NULL,
  `UserTypeName` varchar(45) NOT NULL,
  `PassWord` varchar(45) NOT NULL,
  PRIMARY KEY (`UserID`),
  UNIQUE KEY `LogInName_UNIQUE` (`LogInName`),
  UNIQUE KEY `UserID_UNIQUE` (`UserID`),
  KEY `FK_UserType_idx` (`UserTypeName`),
  CONSTRAINT `FK_UserType` FOREIGN KEY (`UserTypeName`) REFERENCES `usertype` (`UserTypeName`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('obad',1,'عبدالله','admin','123456'),('abdallh',2,'عبدالله نشأت','admin','123456');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usertype` (
  `UserTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `UserTypeName` varchar(45) NOT NULL,
  PRIMARY KEY (`UserTypeID`,`UserTypeName`),
  UNIQUE KEY `UserTypeName_UNIQUE` (`UserTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (1,'admin');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 12:26:34
