-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sklep
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `idorderDetails` int(11) NOT NULL AUTO_INCREMENT,
  `orderID` int(11) DEFAULT NULL,
  `productID` int(11) DEFAULT NULL,
  `productQuantity` int(11) DEFAULT NULL,
  `productPrice` float DEFAULT NULL,
  PRIMARY KEY (`idorderDetails`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (28,16,12571,2,22.99),(29,16,12563,1,6.9),(30,16,12456,3,24.5),(31,16,12346,1,54),(32,16,12567,2,5.7),(33,17,12571,1,22.99),(34,17,12591,1,639);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orderID` int(11) NOT NULL AUTO_INCREMENT,
  `orderDate` datetime DEFAULT NULL,
  `login` varchar(20) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `deliveryMethod` varchar(15) DEFAULT NULL,
  `paymentMethod` varchar(25) DEFAULT NULL,
  `comments` varchar(155) DEFAULT NULL,
  `firstName` varchar(15) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `code` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (16,'2020-01-25 00:00:00','darecc','new','pocztex','blik','new comment','Dariusz','Ceglarek','Luboń','Chudzickiego','17','62-030'),(17,'2020-01-25 00:00:00','darecc','new','pocztex','blik','new comment','Dariusz','Ceglarek','LuboÅ','Chudzickiego','17','62-030');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `productID` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(35) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `indexNum` varchar(15) DEFAULT NULL,
  `imageURL` varchar(180) DEFAULT NULL,
  `category` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`productID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'cebule tulipanów mieszanka \'mix\'',2.6,'12345','https://a.allegroimg.com/s512/1181ae/9559b47b40148651092cbc83d80e/TULIPAN-MIESZANKA-MIX-100-SZT-GRATIS','plants'),(2,'grabki ogrodowe',24.5,'12456','https://sklep.swiatkwiatow.pl/images/thumbnails/320/161/detailed/41/grabie_stalowe_10_zebow_5902138080136_xayk-cv.jpg','tools'),(3,'łopata',54,'12346','https://sklep.swiatkwiatow.pl/images/thumbnails/320/445/detailed/37/%C5%82opata_piaskowa_z_trzonkiem_drewnianym_fmr7-cj.jpg','tools'),(10,'lilia azjatycka biała',5.7,'12567','https://cebule-kwiatowe.pl/files/fotos/product-322.jpg','plants'),(11,'lilia azjatycka \'Vivaldi\'',7.8,'12568','https://cebule-kwiatowe.pl/files/fotos/product-328.jpg','plants'),(12,'lilia tygrysia',8.5,'12560','https://cebule-kwiatowe.pl/files/fotos/product-396.jpg','plants'),(13,'szpadel ostry',45.2,'12561','https://static1.redcart.pl/templates/images/thumb/11497/800/800/pl/0/templates/images/products/11497/74126b144679c99aca026328e5dadbe9.jpg','tools'),(14,'begonia strzępiasta',6.9,'12563','https://cebule-kwiatowe.pl/files/fotos/product-46.jpg','plants'),(15,'dołownik metalowy',15.99,'12564','https://cebule-kwiatowe.pl/files/foto_mini/fotom/c456x515/product-1014.jpg','tools'),(16,'spulchniacz mały',7.5,'12566','https://euroogrod.com.pl/pol_il_38-Spulchniacz-maly-dlg-30-cm-1755.jpg','tools'),(17,'pazurki plus motyczka',5.8,'12568','https://euroogrod.com.pl/pol_il_Bradas-DE-LUXE-Pazurki-Motyczka-8-5-cm-KT-Y6005-788.jpg','tools'),(18,'pazurki Fiskars',32.9,'12569','https://euroogrod.com.pl/pol_il_Fiskars-Pazurki-QuikFit-1000683-47994.jpg','tools'),(19,'profesjonalne pazurki ogrodnicze',12.9,'12570','https://euroogrod.com.pl/pol_il_Greenmill-Professional-Pazurki-Ogrodnicze-UP0182-96969.jpg','tools'),(20,'azalia japońska \'Babushka\'',22.99,'12571','https://euroogrod.com.pl/pol_il_Azalia-japonska-Babushka-Azalea-japonica-Babushka-2706.jpg','plants'),(21,'azalia japońska \'Blue Danube\'',19.99,'12573','https://euroogrod.com.pl/pol_il_Azalia-japonska-Blue-Danube-Azalea-japonica-Blue-Danube-4070.jpg','plants'),(22,'nawóz do iglaków',7.9,'12576','https://euroogrod.com.pl/pol_il_Agrecol-Hortifoska-Nawoz-do-Iglakow-1kg-607.png','fertilizers'),(23,'mikoryza do iglaków',13.9,'12577','https://euroogrod.com.pl/pol_il_Biopon-Mikoryza-Do-Iglakow-Szczepionka-250ml-Proszek-1064-76339.jpg','fertilizers'),(24,'nawóz do pelargonii',6.9,'12578','https://euroogrod.com.pl/pol_il_Agrecol-Nawoz-Do-Pelargonii-0-75L-570.jpg','fertilizers'),(25,'nawóz do roślin balkonowych',9.9,'12579','https://euroogrod.com.pl/pol_il_Agrecol-Nawoz-Do-Roslin-Balkonowych-Zel-0-5L-587.jpg','fertilizers'),(26,'nawóz do surfinii',6.9,'12580','https://euroogrod.com.pl/pol_il_Agrecol-Nawoz-Do-Surfinii-0-75L-568.jpg','fertilizers'),(27,'nawóz do roślin cebulowych',9,'12581','https://euroogrod.com.pl/pol_il_Biopon-Nawoz-Do-Roslin-Cebulowych-1kg-Granulat-1199-76398.jpg','fertilizers'),(28,'nawóz mineralny do datury',8.55,'12583','https://euroogrod.com.pl/pol_il_Biopon-Nawoz-Mineralny-Do-Datury-1L-Plynny-1031-76311.jpg','fertilizers'),(29,'nawóz do roślin kwitnących',6.1,'12584','https://euroogrod.com.pl/pol_il_Agrecol-Biohumus-Forte-Do-Roslin-Kwitnacych-0-75L-518.jpg','fertilizers'),(30,'nawóz do hortensji',6.9,'12586','https://euroogrod.com.pl/pol_il_Agrecol-Nawoz-Do-Hortensji-0-75L-575.jpg','fertilizers'),(31,'opiekacz węglowy',499,'12587','https://euroogrod.com.pl/pol_il_Activa-Opiekacz-Weglowy-Wedzarka-Lokomotywa-11225-94815.jpg','relax'),(32,'wędzarka wodna',298,'12589','https://euroogrod.com.pl/pol_il_Activa-Wedzarka-Wodna-Okragla-11375-94812.jpg','relax'),(33,'wędzarka gazowa',1249,'12590','https://euroogrod.com.pl/pol_il_Landmann-Wedzarka-Gazowa-12093-Pudelko-Na-Zrebki-13958-78342.jpg','relax'),(34,'ławka ogrodowa \'Country\'',639,'12591','https://euroogrod.com.pl/pol_il_Hecht-Lawka-Ogrodowa-Country-Drewno-160cm-75682.jpg','relax'),(35,'parasol ogrodowy \'Active\'',190,'12593','https://euroogrod.com.pl/pol_il_Doppler-Parasol-Ogrodowy-Active-180x120cm-Antracyt-79385.jpg','relax'),(36,'parasol ogrodowy kawowy',290,'12595','https://euroogrod.com.pl/pol_il_Doppler-Parasol-Ogrodowy-Active-200x130cm-Kawowy-846-458557-82727.jpg','relax'),(37,'stolik kawowy',199,'12596','https://euroogrod.com.pl/pol_il_Bazkar-Stolik-Kawowy-CORFU-Antracyt-CUS206623-95206.jpg','relax');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userNum` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(20) DEFAULT NULL,
  `md5` varchar(32) DEFAULT NULL,
  `lastLogin` date DEFAULT NULL,
  `firstName` varchar(15) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `city` varchar(25) DEFAULT NULL,
  `code` varchar(6) DEFAULT NULL,
  `street` varchar(30) DEFAULT NULL,
  `streetNumber` varchar(10) DEFAULT NULL,
  `role` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`userNum`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'darecc','B778284C6B5F9FB6F65DFE26A7F3C3ED','2020-01-01','Dariusz','Ceglarek','Luboń','62-030','Chudzickiego','17','user'),(2,'marecc','B778284C6B5F9FB6F65DFE26A7F3C3ED','2020-01-04','Mariusz','Nowak','Poznań','60-666','Jasnogórska','23A','user'),(3,'darek','darek1','2020-01-20','Dariusz','Kowalski','Stęszew','62-040','Ciasna','1','employee');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sklep'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-25 23:58:31
