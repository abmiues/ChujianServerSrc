-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: chujiandb
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `camera`
--

DROP TABLE IF EXISTS `camera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camera` (
  `cameraid` int(11) NOT NULL AUTO_INCREMENT COMMENT '摄像头id',
  `sellerid` varchar(30) NOT NULL COMMENT '商家id',
  `address` varchar(255) DEFAULT NULL COMMENT '直播地址',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '摄像头状态',
  PRIMARY KEY (`cameraid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='摄像头列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camera`
--

LOCK TABLES `camera` WRITE;
/*!40000 ALTER TABLE `camera` DISABLE KEYS */;
INSERT INTO `camera` VALUES (1,'1121','http://open.ys7.com/openlive/ebbb77823054487a837e2908f92bb3ee.m3u8',0),(2,'31231','http://open.ys7.com/openlive/ebbb77823054487a837e2908f92bb3ee.m3u8',0);
/*!40000 ALTER TABLE `camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `f_comment`
--

DROP TABLE IF EXISTS `f_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `f_comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `foodid` int(11) NOT NULL COMMENT '食品id',
  `content` varchar(20) DEFAULT NULL COMMENT '评价内容',
  `userid` varchar(30) NOT NULL COMMENT '用户id',
  `score` int(11) NOT NULL DEFAULT '5' COMMENT '评分',
  `up` int(11) NOT NULL DEFAULT '0' COMMENT '被赞次数',
  `time` varchar(25) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL COMMENT '评价者名字,可匿名评价',
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='食品评价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `f_comment`
--

LOCK TABLES `f_comment` WRITE;
/*!40000 ALTER TABLE `f_comment` DISABLE KEYS */;
INSERT INTO `f_comment` VALUES (1,1,'阿斯达所多','12121',1,0,'2017-02-12 13:31','haha'),(2,1,'阿达','12121',3,0,'2017-02-12 13:31','haha'),(3,1,'啊','12121',1,1,'2017-02-12 13:31','阿萨德'),(4,1,'打','12121',1,1,'2017-02-12 13:31','碍事'),(5,1,'过的','12121',1,1,'2017-02-12 13:31','的'),(6,1,'儿童','12121',1,1,'2017-02-12 13:31','地方'),(7,1,'地方','12121',1,1,'2017-02-12 13:31','达到'),(8,1,'的','12121',1,1,'2017-02-12 13:31','阿萨德');
/*!40000 ALTER TABLE `f_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food` (
  `foodid` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `sellerid` varchar(30) NOT NULL COMMENT '商家id',
  `name` varchar(45) DEFAULT NULL COMMENT '菜品名字',
  `price` double NOT NULL DEFAULT '0' COMMENT '菜品价格',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT '菜品评价',
  `des` varchar(200) DEFAULT NULL COMMENT '菜品描述(200)字以内',
  PRIMARY KEY (`foodid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='菜品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES (1,'1121','苹果',5.5,0,'好吃的'),(2,'1121','苹果',5.5,0,'好吃的');
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `time` varchar(45) DEFAULT NULL,
  `sellerid` varchar(30) NOT NULL,
  `userid` varchar(30) NOT NULL,
  `price` double DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL COMMENT '送达地址',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `s_comment`
--

DROP TABLE IF EXISTS `s_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `s_comment` (
  `commentid` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价id',
  `content` varchar(200) DEFAULT NULL COMMENT '评价内容',
  `score` int(11) NOT NULL DEFAULT '5' COMMENT '评分',
  `time` varchar(25) DEFAULT NULL COMMENT '评价时间',
  `userid` varchar(30) NOT NULL COMMENT '用户id',
  `sellerid` varchar(30) NOT NULL COMMENT '商家id',
  `username` varchar(50) DEFAULT NULL COMMENT '评价者名字,可匿名评价',
  PRIMARY KEY (`commentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家评价表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_comment`
--

LOCK TABLES `s_comment` WRITE;
/*!40000 ALTER TABLE `s_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller` (
  `sellerid` varchar(30) NOT NULL COMMENT '商家id',
  `name` varchar(25) NOT NULL COMMENT '商家名字',
  `tel` varchar(15) DEFAULT NULL COMMENT '商家电话',
  `permitid` varchar(50) DEFAULT NULL COMMENT '营业许可证id',
  `comment` int(11) NOT NULL DEFAULT '1' COMMENT '评级',
  `exp` int(11) NOT NULL DEFAULT '0' COMMENT '评级经验',
  `state` int(1) NOT NULL DEFAULT '1' COMMENT '账号状态',
  `pwd` varchar(45) NOT NULL COMMENT '登录密码',
  PRIMARY KEY (`sellerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES ('1121','hao','121323','',1,0,1,'111'),('31231','asda','12311',NULL,1,0,1,'1212');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` varchar(30) NOT NULL COMMENT '顾客id',
  `name` varchar(50) NOT NULL COMMENT '顾客名字',
  `tel` varchar(20) DEFAULT NULL COMMENT '电话',
  `pwd` varchar(25) NOT NULL COMMENT '密码',
  `state` int(11) NOT NULL DEFAULT '1' COMMENT '账号状态',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('12121','1212','12','12',1),('121232','哈哈','222','111',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videotext`
--

DROP TABLE IF EXISTS `videotext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `videotext` (
  `textid` int(11) NOT NULL COMMENT '弹幕发送时间(时间戳形式保存)',
  `userid` varchar(30) NOT NULL COMMENT '用户id',
  `content` varchar(30) DEFAULT NULL COMMENT '弹幕内容（默认最长30字符）',
  `cameraid` int(11) NOT NULL COMMENT '摄像头id',
  `color` varchar(11) DEFAULT '111,111,111' COMMENT '弹幕颜色',
  `fontsize` int(11) DEFAULT '14' COMMENT '字体大小',
  `speed` int(11) DEFAULT '1' COMMENT '弹幕播放速度',
  PRIMARY KEY (`textid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='弹幕';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `videotext`
--

LOCK TABLES `videotext` WRITE;
/*!40000 ALTER TABLE `videotext` DISABLE KEYS */;
/*!40000 ALTER TABLE `videotext` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-22 16:35:43
