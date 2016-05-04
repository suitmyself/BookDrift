CREATE DATABASE  IF NOT EXISTS `book_drift` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `book_drift`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: t_sns
-- ------------------------------------------------------
-- Server version	5.5.35

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `password` varchar(64) NOT NULL,
  `salt` char(128) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES ('001','zzz','1q2yCAVoDjlw7n0t26FN1A==','001@pku.edu.cn'),('002','zzz','dgB6BFElVchmoJKRh4lyVA==','002@pku.edu.cn'),('003','zzz','dGsLVbiyXWQ+qW627VxL4w==','003@pku.edu.cn'),('004','zzz','BCpk7qJB+BRUYMYaM7nbJw==','004@pku.edu.cn'),('005','zzz','fGkP8nguwqHFJi7G2fGBVw==','005@pku.edu.cn'),('006','zzz','7V070ybbFDB1MniYqcv8HA==','006@pku.edu.cn'),('007','zzz','RHycgPKLWGNPAV5qy0OlFQ==','007@pku.edu.cn'),('008','zzz','pfOLKWxTY7fCIGr3/Xf0sg==','008@pku.edu.cn'),('009','zzz','m/plZZTQq5WYXwUIFNBDwg==','009@pku.edu.cn'),('010','zzz','UKcfh462faImzD5W/HI0tQ==','010@pku.edu.cn'),('011','zzz','LIo6nTyTsYEgu9LR5e/13w==','011@pku.edu.cn'),('012','zzz','8iXG0rk9dfjjd6f7ass7xQ==','012@pku.edu.cn'),('013','zzz','AWbGeBUcFMcgrI2LZ/7C1A==','013@pku.edu.cn'),('014','zzz','/tsVGJHl2Tw5lzXiPkO4Ng==','014@pku.edu.cn'),('015','zzz','ZlZds3mejMyhd003ImNkNw==','015@pku.edu.cn'),('daniel','zzz','EX2tfxfrk9fRhGPixobr2g==','perseids10@139.com'),('hitler','zzz','OX23paHWBbnfqWgriBihng==','hitler@king.de'),('suitmyself','12345','Un Know','1100011608@pku.edu.cn'),('suitmyself2','1234','Un Know','1100011608@pku');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `add_friend_request`
--

DROP TABLE IF EXISTS `add_friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `add_friend_request` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `from_username` varchar(64) DEFAULT NULL,
  `to_username` varchar(64) DEFAULT NULL,
  `message` text,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `add_friend_request`
--

LOCK TABLES `add_friend_request` WRITE;
/*!40000 ALTER TABLE `add_friend_request` DISABLE KEYS */;
INSERT INTO `add_friend_request` VALUES (1,'2014-06-21 08:07:26','suitmyself2','suitmyself','你好',1),(2,'2014-06-21 08:09:17','suitmyself2','suitmyself','',1);
/*!40000 ALTER TABLE `add_friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_pair`
--

DROP TABLE IF EXISTS `friend_pair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_pair` (
  `username1` varchar(64) NOT NULL DEFAULT '',
  `username2` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`username1`,`username2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_pair`
--

LOCK TABLES `friend_pair` WRITE;
/*!40000 ALTER TABLE `friend_pair` DISABLE KEYS */;
INSERT INTO `friend_pair` VALUES ('suitmyself','suitmyself2'),('suitmyself2','suitmyself');
/*!40000 ALTER TABLE `friend_pair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_id` int(11) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `content` text,
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,-1,'suitmyself','2014-06-21 08:04:31','发表一条状态'),(2,1,'suitmyself','2014-06-21 08:04:42','回复一下'),(3,1,'suitmyself2','2014-06-21 08:10:10','我来回复一下'),(4,-1,'suitmyself','2014-06-21 08:19:53','在发表一条状态\n'),(5,4,'suitmyself','2014-06-21 08:22:17','你好啊'),(6,-1,'suitmyself','2015-03-21 12:04:16','傻逼'),(7,-1,'suitmyself','2015-06-13 05:35:11','闲来无事');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_message`
--

DROP TABLE IF EXISTS `system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_message` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT NULL,
  `content` text,
  `to_username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_message`
--

LOCK TABLES `system_message` WRITE;
/*!40000 ALTER TABLE `system_message` DISABLE KEYS */;
INSERT INTO `system_message` VALUES (1,'2014-06-21 08:06:21',1,'suitmyself2,welcome to our SNS webSite, the webSite is designed by WeiChen and HanDong, enjoy it and good luck!','suitmyself2'),(2,'2014-06-21 08:07:44',1,'suitmyself now is your friend!!! Remerber to contact with him/her!','suitmyself2'),(3,'2014-06-21 08:07:44',1,'suitmyself2 now is your friend!!! Remerber to contact with him/her!','suitmyself');
/*!40000 ALTER TABLE `system_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_info`
--

DROP TABLE IF EXISTS `user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_info` (
  `username` varchar(64) NOT NULL DEFAULT '',
  `realname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `photo` blob,
  `birthday` date DEFAULT NULL,
  `university` varchar(64) DEFAULT NULL,
  `school` varchar(64) DEFAULT NULL,
  `major` varchar(64) DEFAULT NULL,
  `entry_year` year(4) DEFAULT NULL,
  `signature` text,
  `sig_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`username`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`username`) REFERENCES `account` (`username`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_info`
--

LOCK TABLES `user_info` WRITE;
/*!40000 ALTER TABLE `user_info` DISABLE KEYS */;
INSERT INTO `user_info` VALUES ('001',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('002',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('003',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('004',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('005',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('006',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('007',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('008',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('009',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('010',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('011',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('012',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('013',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('014',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('015',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('daniel','Daniel Dong',1,NULL,'1992-02-02','Peking University','School of Foundational Education','Biomedical English',2011,NULL,NULL),('hitler',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('suitmyself','null',1,NULL,'1900-01-01','peking university','','null',NULL,'醉过才知酒浓，爱过才知情重，我不能做你的诗，正如你不能做我的梦。',NULL),('suitmyself2',NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-04 14:24:38
