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
  `img` text,
  `description` text,
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
INSERT INTO `book` VALUES ('Extreme Earth','Michael Martin',58.95,141971791,'Arts','images/products/Extreme Earth.jpg','Extreme Earth represents an extraordinary achievement in exploration and photography. One of the world’s leading documentary photographers, Michael Martin has devoted many years to this vast project, which surveys the four climate zones where extremes of temperature and drought prevail: the Arctic, the deserts of the Northern Hemisphere, the deserts of the Southern Hemisphere, and the Antarctic. He has ridden his motorbike across the Sahara, the Namib, and the Atacama deserts; traversed the ice of Greenland and Spitsbergen by dog sledge; flown by helicopter to the South Pole and the pristine expanses of Antarctica; and reached the North Pole on skis. His high standards of exploration and reporting are reflected not only in his photography, but also in the book’s scientifically exact maps and its texts written by experts in a wide variety of fields.'),('Find a Way','Diana Nyad',16.52,385353618,'Biographies','images/products/Find a Way.jpg','Millions of people around the world cheered this maverick on, moved by her undeniable tenacity to be the first to make the historic crossing without the aid of a shark cage. At the end of her magnificent journey, after thirty-five years and four crushing failures, the public found hope in Diana’s perseverance. They were inspired by her mantra—find a way—that led her to realize a dream in her sixties that had eluded her as a young champion in peak form.'),('Benu','Corey Lee',35.97,714868868,'Cookbooks','images/products/Benu.jpg','Benu provides a gorgeously illustrated presentation of the running order of one of Lee’s 33‐course tasting menus, providing access to all the drama and pace of Benu’s kitchen and dining room. Forewords by Thomas Keller and David Chang are accompanied by additional short prose and photo essays by Lee, detailing the cultural influences, inspirations, and motivations behind his East‐meets‐West approach.'),('Between the World and Me','Ta-Nehisi Coate',14.4,812993543,'Biographies','images/products/Between the World and Me.jpg','In a profound work that pivots from the biggest questions about American history and ideals to the most intimate concerns of a father for his son, Ta-Nehisi Coates offers a powerful new framework for understanding our nation’s history and current crisis. Americans have built an empire on the idea of “race,” a falsehood that damages us all but falls most heavily on the bodies of black women and men—bodies exploited through slavery and segregation, and, today, threatened, locked up, and murdered out of all proportion. What is it like to inhabit a black body and find a way to live within it? And how can we all honestly reckon with this fraught history and free ourselves from its burden?'),('Home Cooking the Costco Way','Tim Talevich',4,981900313,'Cookbooks','images/products/Home Cooking the Costco Way.jpg','Fantastic recipes using Costco products.'),('Humans of New York: Storie','Brandon Stanton',17.64,1250058902,'Arts','images/products/Humans of New York.jpg','In the summer of 2010, photographer Brandon Stanton began an ambitious project —to single-handedly create a photographic census of New York City. The photos he took and the accompanying interviews became the blog Humans of New York. In the first three years, his audience steadily grew from a few hundred to over one million. In 2013, his book Humans of New York, based on that blog, was published and immediately catapulted to the top of the NY Times Bestseller List. It has appeared on that list for over twenty-five weeks to date. The appeal of HONY has been so great that in the course of the next year Brandon following increased tenfold to, now, over 12 million followers on Facebook. In the summer of 2014, the UN chose him to travel around the world on a goodwill mission that had followers meeting people from Iraq to the Ukraine to Mexico City via the photos he took. '),('Every Person in New York','Jason Polan',16.98,1452128235,'Arts','images/products/Every Person in New York.jpg','Jason Polan is on a mission to draw every person in New York, \n       from cab drivers to celebrities. \n       He draws people eating at Taco Bell, \n       admiring paintings at the Museum of Modern Art, \n       and sleeping on the subway. With a foreword by Kristen Wiig, \n       Every Person in New York, Volume 1 collects thousands of \n       Polan energetic drawings in one chunky book. \n       As full as a phone book and as invigorating as a walk down a bustling New York street, this is a new kind of love letter to a beloved city and the people who live there.'),('The Wright Brothers','David McCullough',17.99,1476728747,'Biographies','images/products/The Wright Brothers.jpg','Far more than a couple of unschooled Dayton bicycle mechanics who happened to hit on success, they were men of exceptional courage and determination, and of far-ranging intellectual interests and ceaseless curiosity, much of which they attributed to their upbringing. The house they lived in had no electricity or indoor plumbing, but there were books aplenty, supplied mainly by their preacher father, and they never stopped reading.'),('The NoMad Cookbook','Daniel Humm',59.49,1607748223,'Cookbooks','images/products/The NoMad Cookbook.jpg','Chef Daniel Humm and his business partner Will Guidara are the proprietors of two of New York most beloved and pioneering restaurants: Eleven Madison Park and The NoMad. Their team is known not only for its perfectly executed, innovative cooking, but also for creating extraordinary, genre-defying dining experiences. The NoMad Cookbook translates the unparalleled and often surprising food and drink of the restaurant into book form. What appears to be a traditional cookbook is in fact two books in one: upon opening, readers discover that the back half contains false pages in which a smaller cocktail recipe book is hidden. The result is a wonderfully unexpected collection of both sweet and savory food recipes and cocktail recipes, with the lush photography by Francesco Tonelli and impeccable style for which the authors are known. The NoMad Cookbook promises to be a reading experience like no other, and will be the holiday gift of the year for the foodie who has everything.');
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

-- Dump completed on 2015-12-02 19:48:44
