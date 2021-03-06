-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: ocpizza
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Current Database: `ocpizza`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ocpizza` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ocpizza`;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addresses` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(60) NOT NULL,
  `zip_code` varchar(5) NOT NULL,
  `street_label` varchar(100) NOT NULL,
  `street_number` varchar(4) NOT NULL,
  `complement` varchar(60) DEFAULT NULL,
  `phone_number` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,'Avignon','84000','Boulevard Raspail','1',NULL,'0102030405'),(2,'Lyon','69000','Cours Lafayette','102','Halles Paul Bocuse','0203040506'),(3,'Bordeaux','33000','Rue Laseppe','137','','0405060708'),(4,'Paris','75000','Avenue Rachel','125','','0304050607'),(5,'Caderousse','84850','Rue de l\'Hardy','13','',''),(6,'Orange','84100','Avenue du Mar├®chal Foch','565','Villa Hortensias','0606808412'),(7,'Villeurbanne','69100','Avenue Thiers','7','2├¿me ├®tage','0506070809'),(8,'Lyon','69004','Rue Deleuvre','71','','0607080910'),(9,'Sartrouville','78500','Boulevard de B├®zons','58','Porte B','0910111213'),(10,'Montmorency','95160','Rue de Clairvaux','18',NULL,'0103040506'),(11,'B├¿gles','33130','Rue Roger Lejard','4',NULL,'0201030405'),(12,'M├®rignac','33700','Avenue du Chut','678',NULL,'0301020405');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_order_id` int unsigned NOT NULL,
  `payment_method` enum('CB','EspÔö£┬┐ces','ChÔö£┬┐que','Paiement en ligne') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_id` (`fk_order_id`),
  CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `commands` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
INSERT INTO `bills` VALUES (1,1,'EspÔö£┬┐ces'),(2,2,'Paiement en ligne'),(3,3,'ChÔö£┬┐que'),(4,4,'EspÔö£┬┐ces'),(5,5,'CB');
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commands`
--

DROP TABLE IF EXISTS `commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `commands` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_client_id` int unsigned DEFAULT NULL,
  `raw_price` decimal(6,2) DEFAULT NULL,
  `net_price` decimal(6,2) DEFAULT NULL,
  `date_cmd` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`fk_client_id`),
  CONSTRAINT `commands_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commands`
--

LOCK TABLES `commands` WRITE;
/*!40000 ALTER TABLE `commands` DISABLE KEYS */;
INSERT INTO `commands` VALUES (1,3,22.74,25.10,'2020-01-16 19:32:09'),(2,4,12.32,13.60,'2020-05-14 11:35:00'),(3,7,17.20,18.90,'2020-03-22 22:07:12'),(4,9,37.64,42.75,'2020-03-13 18:04:59'),(5,4,6.36,7.00,'2020-06-11 20:34:05');
/*!40000 ALTER TABLE `commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositions`
--

DROP TABLE IF EXISTS `compositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositions` (
  `fk_pizza_id` int unsigned NOT NULL,
  `fk_ingredient_id` int unsigned NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`fk_ingredient_id`,`fk_pizza_id`),
  KEY `fk_pizza_id` (`fk_pizza_id`),
  CONSTRAINT `compositions_ibfk_1` FOREIGN KEY (`fk_pizza_id`) REFERENCES `pizzas` (`id`),
  CONSTRAINT `compositions_ibfk_2` FOREIGN KEY (`fk_ingredient_id`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositions`
--

LOCK TABLES `compositions` WRITE;
/*!40000 ALTER TABLE `compositions` DISABLE KEYS */;
INSERT INTO `compositions` VALUES (1,1,2),(2,1,2),(3,1,2),(4,1,2),(5,1,2),(6,1,2),(7,1,2),(8,1,2),(9,1,2),(10,1,2),(11,1,2),(13,1,2),(1,2,4),(2,2,4),(3,2,4),(5,2,4),(6,2,4),(7,2,4),(8,2,4),(9,2,2),(10,2,4),(11,2,4),(7,3,2),(13,3,2),(1,4,1),(3,4,1),(4,4,1),(6,4,1),(8,4,1),(2,5,1),(3,5,1),(8,5,1),(10,5,2),(11,5,1),(2,6,6),(7,6,5),(10,6,5),(5,7,5),(6,8,5),(7,8,5),(13,8,5),(4,9,1),(6,9,1),(7,10,2),(9,11,2),(9,12,2),(9,13,2),(1,14,1),(2,14,1),(3,14,1),(4,14,1),(5,14,1),(6,14,1),(7,14,14),(8,14,1),(9,14,1),(10,14,1),(11,14,1),(13,14,1),(11,15,5),(3,16,5),(8,16,5),(13,16,5),(4,17,1),(8,18,1),(13,18,1);
/*!40000 ALTER TABLE `compositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int unsigned NOT NULL,
  `fk_favorite_shop_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_favorite_shop_id` (`fk_favorite_shop_id`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`fk_favorite_shop_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (3,1),(4,2),(7,3),(9,4);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinkinglines`
--

DROP TABLE IF EXISTS `drinkinglines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinkinglines` (
  `fk_cmd_id` int unsigned NOT NULL,
  `fk_item_id` int unsigned NOT NULL,
  `quantity` tinyint unsigned DEFAULT NULL,
  `total_price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`fk_item_id`,`fk_cmd_id`),
  KEY `fk_cmd_id` (`fk_cmd_id`),
  CONSTRAINT `drinkinglines_ibfk_1` FOREIGN KEY (`fk_cmd_id`) REFERENCES `commands` (`id`),
  CONSTRAINT `drinkinglines_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `drinkings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkinglines`
--

LOCK TABLES `drinkinglines` WRITE;
/*!40000 ALTER TABLE `drinkinglines` DISABLE KEYS */;
INSERT INTO `drinkinglines` VALUES (3,2,2,3.30),(2,3,2,5.10),(4,3,1,2.55),(4,6,2,4.00),(4,7,1,1.50);
/*!40000 ALTER TABLE `drinkinglines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinkings`
--

DROP TABLE IF EXISTS `drinkings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinkings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `raw_price` decimal(6,2) DEFAULT NULL,
  `net_price` decimal(6,2) DEFAULT NULL,
  `alcooholic` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkings`
--

LOCK TABLES `drinkings` WRITE;
/*!40000 ALTER TABLE `drinkings` DISABLE KEYS */;
INSERT INTO `drinkings` VALUES (1,'Soda',1.50,1.65,_binary '\0'),(2,'Soda Light',1.70,1.85,_binary '\0'),(3,'Bi├¿re Blonde',2.30,2.55,_binary ''),(4,'Jus de Pommes',1.20,1.30,_binary '\0'),(5,'Jus d\'Orange',1.50,1.65,_binary '\0'),(6,'Th├® Glac├®',1.80,2.00,_binary '\0'),(7,'Eau P├®tillante',1.35,1.50,_binary '\0'),(8,'Eau min├®rale',1.10,1.20,_binary '\0');
/*!40000 ALTER TABLE `drinkings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drinkingsstocks`
--

DROP TABLE IF EXISTS `drinkingsstocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drinkingsstocks` (
  `fk_shop_id` int unsigned NOT NULL,
  `fk_drinkings_id` int unsigned NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`fk_drinkings_id`,`fk_shop_id`),
  KEY `fk_shop_id` (`fk_shop_id`),
  CONSTRAINT `drinkingsstocks_ibfk_1` FOREIGN KEY (`fk_shop_id`) REFERENCES `shops` (`id`),
  CONSTRAINT `drinkingsstocks_ibfk_2` FOREIGN KEY (`fk_drinkings_id`) REFERENCES `drinkings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drinkingsstocks`
--

LOCK TABLES `drinkingsstocks` WRITE;
/*!40000 ALTER TABLE `drinkingsstocks` DISABLE KEYS */;
INSERT INTO `drinkingsstocks` VALUES (1,1,100),(2,1,14),(3,1,49),(4,1,68),(1,2,58),(2,2,85),(3,2,21),(4,2,162),(1,3,75),(2,3,36),(3,3,114),(4,3,42),(1,4,67),(2,4,12),(3,4,20),(4,4,188),(1,5,124),(2,5,56),(3,5,14),(4,5,150),(1,6,80),(2,6,145),(3,6,94),(4,6,2),(1,7,123),(2,7,83),(3,7,85),(4,7,0),(1,8,98),(2,8,18),(3,8,77),(4,8,73);
/*!40000 ALTER TABLE `drinkingsstocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` int unsigned NOT NULL,
  `fk_workplace_id` int unsigned DEFAULT NULL,
  `occupation` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_workplace_id` (`fk_workplace_id`),
  CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`fk_workplace_id`) REFERENCES `shops` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (2,1,'Pizza├»olo'),(5,2,'Livreur'),(6,3,'Employ├® Polyvalent'),(8,4,'Pizza├»olo');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expeditions`
--

DROP TABLE IF EXISTS `expeditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expeditions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_client_id` int unsigned DEFAULT NULL,
  `fk_bill_id` int unsigned DEFAULT NULL,
  `fk_deliverer_id` int unsigned DEFAULT NULL,
  `paid_status` bit(1) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `delivery_date` datetime DEFAULT NULL,
  `delivery_mehod` enum('Livraison','A Emporter') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_client_id` (`fk_client_id`),
  KEY `fk_bill_id` (`fk_bill_id`),
  KEY `fk_deliverer_id` (`fk_deliverer_id`),
  CONSTRAINT `expeditions_ibfk_1` FOREIGN KEY (`fk_client_id`) REFERENCES `customers` (`id`),
  CONSTRAINT `expeditions_ibfk_2` FOREIGN KEY (`fk_bill_id`) REFERENCES `bills` (`id`),
  CONSTRAINT `expeditions_ibfk_3` FOREIGN KEY (`fk_deliverer_id`) REFERENCES `employees` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expeditions`
--

LOCK TABLES `expeditions` WRITE;
/*!40000 ALTER TABLE `expeditions` DISABLE KEYS */;
INSERT INTO `expeditions` VALUES (1,3,1,2,_binary '\0','2020-01-16 19:32:09','2020-01-16 20:30:00','A Emporter'),(2,4,5,5,_binary '','2020-06-11 20:34:05','2020-06-11 20:45:00','A Emporter'),(3,4,2,5,_binary '','2020-05-14 11:35:00','2020-05-14 12:00:00','A Emporter'),(4,7,3,6,_binary '','2020-03-22 22:07:12','0020-03-22 22:25:00','A Emporter'),(5,9,4,8,_binary '','2020-03-13 18:04:59','2020-03-13 20:00:00','A Emporter');
/*!40000 ALTER TABLE `expeditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(50) DEFAULT NULL,
  `raw_price` decimal(6,2) DEFAULT NULL,
  `net_price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES (1,'Tomate',2.05,2.25),(2,'Mozarella',0.54,0.60),(3,'Basilic',2.30,2.60),(4,'Huile d\'olive',7.50,8.20),(5,'Jambon',8.20,9.10),(6,'Champignons de Paris',0.75,0.83),(7,'Spianata',12.50,13.75),(8,'Anchois',5.60,6.20),(9,'Origan',5.00,5.50),(10,'Capres',4.90,5.45),(11,'Emmental',8.50,9.35),(12,'B├╗che de Ch├¿vre',4.55,5.00),(13,'Brie de Maux',8.50,3.35),(14,'Base P├óte',0.50,0.55),(15,'Ananas',4.75,5.20),(16,'Olives',1.25,1.35),(17,'Ail',2.50,2.75),(18,'Artichaut',2.00,2.20);
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientstocks`
--

DROP TABLE IF EXISTS `ingredientstocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredientstocks` (
  `fk_shop_id` int unsigned NOT NULL,
  `fk_ingredient_id` int unsigned NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`fk_ingredient_id`,`fk_shop_id`),
  KEY `fk_shop_id` (`fk_shop_id`),
  CONSTRAINT `ingredientstocks_ibfk_1` FOREIGN KEY (`fk_shop_id`) REFERENCES `shops` (`id`),
  CONSTRAINT `ingredientstocks_ibfk_2` FOREIGN KEY (`fk_ingredient_id`) REFERENCES `ingredients` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientstocks`
--

LOCK TABLES `ingredientstocks` WRITE;
/*!40000 ALTER TABLE `ingredientstocks` DISABLE KEYS */;
INSERT INTO `ingredientstocks` VALUES (1,1,220),(2,1,563),(3,1,25),(4,1,123),(1,2,400),(2,2,257),(3,2,827),(4,2,172),(1,3,53),(2,3,354),(3,3,387),(4,3,125),(1,4,125),(2,4,87),(3,4,378),(4,4,287),(1,5,250),(2,5,575),(3,5,87),(4,5,75),(1,6,172),(2,6,57),(3,6,578),(4,6,387),(1,7,48),(2,7,23),(3,7,68),(4,7,3),(1,8,127),(2,8,0),(3,8,387),(4,8,12),(1,9,42),(2,9,54),(3,9,364),(4,9,398),(1,10,37),(2,10,254),(3,10,28),(4,10,287),(1,11,98),(2,11,588),(3,11,257),(1,12,120),(2,12,38),(3,12,275),(1,13,110),(2,13,387),(3,13,387),(1,14,150),(2,14,377),(3,14,200),(1,15,28),(2,15,89),(3,15,75),(1,16,4),(2,16,876),(3,16,286),(1,17,78),(2,17,36),(3,17,52),(4,17,25),(1,18,54),(2,18,86),(3,18,22),(4,18,83);
/*!40000 ALTER TABLE `ingredientstocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzalines`
--

DROP TABLE IF EXISTS `pizzalines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzalines` (
  `fk_cmd_id` int unsigned NOT NULL,
  `fk_item_id` int unsigned NOT NULL,
  `quantity` tinyint unsigned DEFAULT NULL,
  `total_price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`fk_item_id`,`fk_cmd_id`),
  KEY `fk_cmd_id` (`fk_cmd_id`),
  CONSTRAINT `pizzalines_ibfk_1` FOREIGN KEY (`fk_cmd_id`) REFERENCES `commands` (`id`),
  CONSTRAINT `pizzalines_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `pizzas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzalines`
--

LOCK TABLES `pizzalines` WRITE;
/*!40000 ALTER TABLE `pizzalines` DISABLE KEYS */;
INSERT INTO `pizzalines` VALUES (1,1,2,16.00),(1,5,1,9.10),(4,5,2,18.20),(2,9,1,8.50),(4,9,1,8.50),(5,10,1,7.00),(4,13,1,8.00);
/*!40000 ALTER TABLE `pizzalines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pizzas`
--

DROP TABLE IF EXISTS `pizzas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizzas` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(30) DEFAULT NULL,
  `raw_price` decimal(6,2) DEFAULT NULL,
  `net_price` decimal(6,2) DEFAULT NULL,
  `vegan` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pizzas`
--

LOCK TABLES `pizzas` WRITE;
/*!40000 ALTER TABLE `pizzas` DISABLE KEYS */;
INSERT INTO `pizzas` VALUES (1,'Margherita',7.27,8.00,_binary ''),(2,'Regina',7.27,8.00,_binary '\0'),(3,'Napolitaine',7.70,8.50,_binary '\0'),(4,'Marinara',7.00,7.70,_binary ''),(5,'Diavola',8.20,9.10,_binary '\0'),(6,'Romaine',6.90,7.60,_binary '\0'),(7,'Sicilienne',7.27,8.00,_binary '\0'),(8,'Capricciosa',7.27,8.00,_binary '\0'),(9,'Quatre Fromages',7.72,8.50,_binary ''),(10,'Calzone',6.36,7.00,_binary '\0'),(11,'Hawa├»enne',314.00,345.40,_binary '\0'),(12,'Plateau ap├®ritif',10.80,11.90,_binary '\0'),(13,'Artichette',7.27,8.00,_binary '');
/*!40000 ALTER TABLE `pizzas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops`
--

DROP TABLE IF EXISTS `shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shops` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_address_id` int unsigned DEFAULT NULL,
  `contact_mail` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_id` (`fk_address_id`),
  CONSTRAINT `shops_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops`
--

LOCK TABLES `shops` WRITE;
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
INSERT INTO `shops` VALUES (1,1,'avignon@ocpizza.fr'),(2,2,'lyon@ocpizza.fr'),(3,4,'paris@ocpizza.fr'),(4,3,'bordeaux@ocpizza.fr');
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `fk_address_id` int unsigned DEFAULT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password_hash` binary(64) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_id` (`fk_address_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`fk_address_id`) REFERENCES `addresses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,5,'Tristan','Barzalona','barzalefifou@gmail.com',_binary 'aVäÿE1TÿA2Içÿy\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(3,5,'Jeanne','Morue','jmorue@ladepeche.fr',_binary 'iyy2hHöhyä`3$\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(4,7,'Jean','K├®vin','keketuning69@hotmail.com',_binary 'ùçQ5Fü!#ü#Egë\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(5,8,'C├®cile','Ploch','familleploch@sfr.fr',_binary '1AY&SXùô#äbd3â\'ò\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(6,9,'Philippe','Lanicroche','sansaccroche@lanicroche.net',_binary '5ü2EXæD#3wa	ç\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(7,10,'Sylvain','Dupr├¿s','dupres.sylvain01@yahoo.net',_binary '9êu\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(8,11,'Matthieu','Jalibert','m.jalibert@unionbb.fr',_binary '\'((F\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0'),(9,12,'S├®bastien','Chabal','thecaveman07@worldrugby.com',_binary 'b`p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-09-14 21:11:41
