-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstore
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `name` varchar(255) DEFAULT NULL,
  `author` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `book_id` int(11) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `photo` text,
  PRIMARY KEY (`book_id`),
  KEY `category_idx` (`category`),
  CONSTRAINT `category` FOREIGN KEY (`category`) REFERENCES `category` (`category`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('Extreme Earth','Michael Martin',58.95,141971791,'Arts','images/products/Extreme Earth.jpg'),('Find a Way','Diana Nyad',16.52,385353618,'Biographies','images/products/Find a Way.jpg'),('Benu','Corey Lee',35.97,714868868,'Cookbooks','images/products/Benu.jpg'),('Between the World and Me','Ta-Nehisi Coate',14.4,812993543,'Biographies','images/products/Between the World and Me.jpg'),('Home Cooking the Costco Way','Tim Talevich',4,981900313,'Cookbooks','images/products/Home Cooking the Costco Way.jpg'),('Humans of New York: Storie','Brandon Stanton',17.64,1250058902,'Arts','images/products/Humans of New York.jpg'),('Every Person in New York','Jason Polan',16.98,1452128235,'Arts','images/products/Every Person in New York.jpg'),('The Wright Brothers','David McCullough',17.99,1476728747,'Biographies','images/products/The Wright Brothers.jpg'),('The NoMad Cookbook','Daniel Humm',59.49,1607748223,'Cookbooks','images/products/The NoMad Cookbook.jpg');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-26  0:30:07
