CREATE DATABASE  IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ecommerce`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6i66ijb8twgcqtetl8eeeed6v` (`user_id`),
  CONSTRAINT `FK6i66ijb8twgcqtetl8eeeed6v` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'test','test','test','1122334455','test','test','112233',5),(2,'Guntur','Jyosthna','Jyosthna','7013106459','AP','chilakaluripet','522616',5),(3,'Guntur','Jyosthna','Jyosthna','7013106459','AP','chilakaluripet','522616',1);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_seq`
--

DROP TABLE IF EXISTS `address_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_seq`
--

LOCK TABLES `address_seq` WRITE;
/*!40000 ALTER TABLE `address_seq` DISABLE KEYS */;
INSERT INTO `address_seq` VALUES (101);
/*!40000 ALTER TABLE `address_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discounte` int NOT NULL,
  `total_discounted_price` int NOT NULL,
  `total_item` int DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKg5uhi8vpsuy0lgloxk2h4w5o6` (`user_id`),
  CONSTRAINT `FKg5uhi8vpsuy0lgloxk2h4w5o6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,2000,0,2,2000,1),(2,2158,840,2,2998,5);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `discounted_price` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  KEY `FKjcyd5wv4igqnw413rgxbfu4nv` (`product_id`),
  CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKjcyd5wv4igqnw413rgxbfu4nv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (34,398,3999,1,'S',4,NULL,103),(37,840,2998,2,'S',5,2,69),(39,0,2000,2,'M',1,1,152);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL,
  `level` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `parent_category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9il7y6fehxwunjeepq0n7g5rd` (`parent_category_id`),
  CONSTRAINT `FK9il7y6fehxwunjeepq0n7g5rd` FOREIGN KEY (`parent_category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,'men',NULL),(2,2,'clothing',1),(3,3,'women_dress',2),(4,2,'accessories',1),(5,3,'top',4),(6,3,'mens_kurta',2),(7,1,'',NULL),(8,2,'',7),(52,1,'women',NULL),(53,2,'clothing',52),(102,3,'Pant',2),(152,3,'shirt',2),(153,3,'t-shirt',2),(154,3,'#',2),(155,3,'top',53),(156,3,'women_jeans',53),(157,3,'lengha_choli',53),(158,3,'women_sweater',53),(159,3,'women_jacket',53),(160,3,'women_saree',53),(161,3,'kurtas',53),(162,2,'accessories',52),(163,3,'watch',162),(164,3,'wallet',162),(165,3,'bag',162),(166,3,'sunglasse',162),(167,3,'hat',162),(168,3,'belt',162);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_seq`
--

DROP TABLE IF EXISTS `categories_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_seq`
--

LOCK TABLES `categories_seq` WRITE;
/*!40000 ALTER TABLE `categories_seq` DISABLE KEYS */;
INSERT INTO `categories_seq` VALUES (251);
/*!40000 ALTER TABLE `categories_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `delivery_date` datetime(6) DEFAULT NULL,
  `discounted_price` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `size` varchar(255) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKt4dc2r9nbvbujrljv3e23iibt` (`order_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKt4dc2r9nbvbujrljv3e23iibt` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,NULL,499,1499,1,'S',1,1,4),(2,NULL,68,2499,1,'S',1,2,53),(3,NULL,136,4998,2,'S',1,3,53),(4,NULL,798,2998,2,'M',1,3,54),(5,NULL,136,4998,2,'S',1,4,53),(6,NULL,798,2998,2,'M',1,4,54),(7,NULL,554,1998,2,'L',1,5,58),(8,NULL,554,1998,2,'L',1,6,58),(9,NULL,68,2499,1,'M',1,6,53),(10,NULL,398,3999,1,NULL,1,6,103),(11,NULL,68,2499,1,'S',1,7,53),(12,NULL,68,2499,1,'S',1,8,53),(16,NULL,68,2499,1,'M',1,12,53),(17,NULL,499,1399,1,'M',1,12,105),(18,NULL,499,1399,1,'M',1,13,105),(19,NULL,272,9996,4,'M',1,13,53),(20,NULL,499,1399,1,'M',1,14,105),(21,NULL,272,9996,4,'M',1,14,53),(22,NULL,272,9996,4,'M',1,15,53),(23,NULL,272,9996,4,'M',1,16,53),(24,NULL,204,7497,3,'M',1,17,53),(25,NULL,204,7497,3,'M',1,18,53),(26,NULL,554,1998,2,'L',1,18,58),(27,NULL,554,1998,2,'L',1,19,58),(28,NULL,408,14994,6,'M',1,19,53),(29,NULL,554,1998,2,'L',1,20,58),(30,NULL,408,14994,6,'M',1,20,53),(31,NULL,408,14994,6,'M',1,21,53),(32,NULL,554,1998,2,'L',1,21,58),(33,NULL,554,1998,2,'L',1,22,58),(34,NULL,1194,11997,3,'M',1,22,103),(35,NULL,408,14994,6,'M',1,22,53),(36,NULL,959,319,1,'S',1,23,104),(37,NULL,840,2998,2,'S',5,24,69),(38,NULL,840,2998,2,'S',5,25,69),(39,NULL,0,2000,2,'M',1,26,152);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `delivery_date` datetime(6) DEFAULT NULL,
  `discounte` int DEFAULT NULL,
  `order_date` datetime(6) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `order_status` smallint DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `payment_method` smallint DEFAULT NULL,
  `razorpay_payment_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_link_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_link_reference_id` varchar(255) DEFAULT NULL,
  `razorpay_payment_link_status` varchar(255) DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `total_discounted_price` int DEFAULT NULL,
  `total_item` int NOT NULL,
  `total_price` double NOT NULL,
  `shipping_address_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `razorpay_payment_id​` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKh0uue95ltjysfmkqb5abgk7tj` (`shipping_address_id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKh0uue95ltjysfmkqb5abgk7tj` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'2024-08-23 19:28:53.610325',NULL,1000,'2024-08-23 19:28:53.610325',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,499,1,1499,1,1,NULL),(2,'2024-08-23 23:28:54.254400',NULL,2431,'2024-08-23 23:28:54.254400',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,68,1,2499,1,1,NULL),(3,'2024-08-23 23:33:44.321362',NULL,7062,'2024-08-23 23:33:44.321362',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,934,4,7996,1,1,NULL),(4,'2024-08-23 23:40:38.785789',NULL,7062,'2024-08-23 23:40:38.785789',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,934,4,7996,1,1,NULL),(5,'2024-08-24 00:16:53.067486',NULL,1444,'2024-08-24 00:16:53.067486',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,554,2,1998,1,1,NULL),(6,'2024-08-24 16:09:54.338658',NULL,7476,'2024-08-24 16:09:54.338658',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,1020,4,8496,1,1,NULL),(7,'2024-08-24 22:42:47.802189',NULL,2431,'2024-08-24 22:42:47.802189',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,68,1,2499,1,1,NULL),(8,'2024-08-24 22:42:53.589562',NULL,2431,'2024-08-24 22:42:53.589562',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,68,1,2499,1,1,NULL),(12,'2024-08-25 16:56:02.651092',NULL,3331,'2024-08-25 16:56:02.651092',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,567,2,3898,1,1,NULL),(13,'2024-08-25 17:11:18.843702',NULL,10624,'2024-08-25 17:11:18.843702',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,771,5,11395,1,1,NULL),(14,'2024-08-25 17:11:54.473978',NULL,10624,'2024-08-25 17:11:54.473978',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,771,5,11395,1,1,NULL),(15,'2024-08-25 17:12:17.568938',NULL,9724,'2024-08-25 17:12:17.568938',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,272,4,9996,1,1,NULL),(16,'2024-08-25 21:08:41.824799',NULL,9724,'2024-08-25 21:08:41.824799',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,272,4,9996,1,1,NULL),(17,'2024-08-25 21:27:59.210565',NULL,7293,'2024-08-25 21:27:59.210565',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,204,3,7497,1,1,NULL),(18,'2024-08-25 21:29:04.834817',NULL,8737,'2024-08-25 21:29:04.834817',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,758,5,9495,1,1,NULL),(19,'2024-08-25 21:35:29.075721',NULL,16030,'2024-08-25 21:35:29.075721',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,962,8,16992,1,1,NULL),(20,'2024-08-25 21:36:15.326260',NULL,16030,'2024-08-25 21:36:15.326260',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,962,8,16992,1,1,NULL),(21,'2024-08-25 21:52:16.150332',NULL,16030,'2024-08-25 21:52:16.149200',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,962,8,16992,1,1,NULL),(22,'2024-08-25 22:04:12.545936',NULL,26833,'2024-08-25 22:04:12.545936',NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,0,2156,11,28989,1,1,NULL),(23,'2024-08-25 19:42:41.853800',NULL,-640,'2024-08-25 19:42:41.853800',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,959,1,319,1,1,NULL),(24,'2024-08-25 19:44:53.530284',NULL,2158,'2024-08-25 19:44:53.530284',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,840,2,2998,2,5,NULL),(25,'2024-08-25 20:11:46.160450',NULL,2158,'2024-08-25 20:11:46.157452',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,840,2,2998,1,5,NULL),(26,'2024-08-26 12:01:33.371031',NULL,2000,'2024-08-26 12:01:33.370031',NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,0,2,2000,3,1,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_information`
--

DROP TABLE IF EXISTS `payment_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_information` (
  `user_id` bigint NOT NULL,
  `card_number` varchar(255) DEFAULT NULL,
  `cardholder_name` varchar(255) DEFAULT NULL,
  `cvv` varchar(255) DEFAULT NULL,
  `expiration_date` date DEFAULT NULL,
  KEY `FK5xb28hck1puvn9ldjnbb1vqm8` (`user_id`),
  CONSTRAINT `FK5xb28hck1puvn9ldjnbb1vqm8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_information`
--

LOCK TABLES `payment_information` WRITE;
/*!40000 ALTER TABLE `payment_information` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount_persent` int DEFAULT NULL,
  `discounted_price` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `num_ratings` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKowomku74u72o6h8q0khj7id8q` (`category_id`),
  CONSTRAINT `FKowomku74u72o6h8q0khj7id8q` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (4,'Majestic Man','Green','2024-08-23 19:24:56.739279','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',66,499,'https://rukminim1.flixcart.com/image/612/612/l5h2xe80/kurta/x/6/n/xl-kast-tile-green-majestic-man-original-imagg4z33hu4kzpv.jpeg?q=70',0,1499,20,'Men Printed Pure Cotton Straight Kurta',6),(6,'','','2024-08-23 20:08:38.198845','',0,0,'',0,0,0,'',8),(52,'Majestic Man','Green','2024-08-23 20:19:12.783566','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',66,499,'https://rukminim1.flixcart.com/image/612/612/l5h2xe80/kurta/x/6/n/xl-kast-tile-green-majestic-man-original-imagg4z33hu4kzpv.jpeg?q=70',0,1499,100,'Men Printed Pure Cotton Straight Kurta',6),(53,'SG LEMAN','Yellow','2024-08-23 20:19:28.409421','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',68,68,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/l/f/r/xl-k-spl668-yellow-sg-leman-original-imagznqcrahgq9rf.jpeg?q=70',0,2499,100,'Men Embroidered Jacquard Straight Kurta',6),(54,'FUBAR','Blue','2024-08-23 20:19:36.512762','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',73,399,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/g/6/k/m-sksh-dt1105-pcbl-fubar-original-imafux247zhqym2z-bb.jpeg?q=70',0,1499,100,'Men Printed Cotton Blend Straight Kurta',6),(55,'ALY JOHN','White','2024-08-23 20:19:43.988922','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',76,474,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/i/v/x/xxl-br-ad-kt-105-adwyn-peter-original-imagj4zyd2q7t6cg.jpeg?q=70',0,1999,100,'Men Solid Pure Cotton Straight Kurta',6),(56,'PETER ENGLAND','Grey','2024-08-23 20:21:54.008966','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',50,524,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/j/a/r/l-poch521835-peter-england-original-imag7jg47g7cxhg3-bb.jpeg?q=70',0,1049,100,'Men Woven Design Pure Cotton Straight Kurta',6),(57,'Majestic Man','Pink','2024-08-23 20:22:01.505404','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',66,499,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/y/c/x/xl-kast107hp-majestic-man-original-imafw49u5uty4agx-bb.jpeg?q=70',0,1499,100,'Men Solid Pure Cotton Straight Kurta',6),(58,'WRODSS','Black','2024-08-23 20:22:11.421208','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',72,277,'https://rukminim1.flixcart.com/image/612/612/kpodocw0/t-shirt/x/o/4/xl-wr-64-wrodss-original-imag3upwgq9n9fbv.jpeg?q=70',0,999,100,'Men Solid Cotton Blend Straight Kurta',6),(59,'Manthan','Blue','2024-08-23 20:22:22.167710','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',27,765,'https://rukminim1.flixcart.com/image/612/612/l4zxn680/kurta/i/g/u/s-mtml0039-341-manthan-original-imagfrz3gwgdtczm.jpeg?q=70',0,1049,100,'Men Printed Cotton Blend Straight Kurta',6),(60,'RAHUL LOOK','Green','2024-08-23 20:23:59.461654','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',68,499,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/m/e/e/s-kurta-rahul-look-original-imaga2g6qmhbywdf-bb.jpeg?q=70',0,1599,100,'Men Solid Pure Cotton Straight Kurta',6),(61,'FRELURO','Yellow','2024-08-23 20:24:09.396725','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',57,429,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/u/v/m/l-grey-106-yellow-freluro-original-imagc26vdpwxgztu-bb.jpeg?q=70',0,999,100,'Men Printed Cotton Blend Straight Kurta',6),(62,'Manthan','Light Blue','2024-08-23 20:24:20.047643','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',27,729,'https://rukminim1.flixcart.com/image/612/612/jsj90280/kurta/j/z/g/l-mtmkos0004-326-manthan-original-imafe35wha5ry36p.jpeg?q=70',0,909,100,'Men Self Design Cotton Blend Straight Kurta',6),(63,'allan peter','Green','2024-08-23 20:24:32.041849','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',74,449,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/g/f/f/xl-grey-sws4503-allan-peter-original-imag6xxgvvh59gh5-bb.jpeg?q=70',0,1749,100,'Men Solid Pure Cotton Straight Kurta',6),(64,'COMBRAIDED','Dark Blue','2024-08-23 20:24:40.025885','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',70,449,'https://rukminim1.flixcart.com/image/612/612/xif0q/kurta/u/g/z/xl-8button-kurta-elepants-original-imagk57kfg2bwvhd.jpeg?q=70',0,1499,100,'Men Solid Cotton Blend Straight Kurta',6),(65,'Aarvia','yellow','2024-08-23 20:32:11.817827','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',65,699,'https://rukminim1.flixcart.com/image/612/612/xif0q/dress/a/x/z/l-na-awd-19-yellow-aarvia-original-imagzffm3bkyzup2.jpeg?q=70',0,1999,100,'Women Bodycon Yellow Dress',3),(66,'Aarvia','yellow','2024-08-23 20:32:22.211156','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',65,699,'https://rukminim1.flixcart.com/image/612/612/xif0q/dress/h/m/h/xl-na-awd-23-yellow-aarvia-original-imagzfs6ykq3z7jw.jpeg?q=70',0,1999,100,'Women Bodycon Yellow Dress',3),(67,'Sheetal Associates','yellow','2024-08-23 20:32:29.581808','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',77,459,'https://rukminim1.flixcart.com/image/612/612/xif0q/dress/h/l/3/xxl-6101-sheetal-associates-original-imagmnemtrdhgrnc.jpeg?q=70',0,1999,100,'Women Fit and Flare Yellow, White, Green Dress',3),(68,'Sheetal Associates','yellow','2024-08-23 20:32:36.379506','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',77,459,'https://rukminim1.flixcart.com/image/612/612/kt0enww0/dress/2/d/p/xxl-1091-sheetal-associates-original-imag6g4n7qhwesad.jpeg?q=70',0,1999,100,'Women Fit and Flare Yellow Dress',3),(69,'AAYU','yellow','2024-08-23 20:32:48.471813','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',71,420,'https://rukminim1.flixcart.com/image/612/612/xif0q/dress/f/z/y/l-aa-00153-yellow-aayu-original-imagz848vwz3hsgm.jpeg?q=70',0,1499,100,'Women A-line Yellow Dress',3),(70,'Janasya','yellow','2024-08-23 20:32:57.376821','A traditional garment embodying elegance and grace. Crafted from fine fabrics, it features intricate embroidery and a relaxed fit, providing comfort and style.',66,902,'https://rukminim1.flixcart.com/image/612/612/l51d30w0/dress/h/a/w/xl-j0433-dr-janasya-original-imagfsu9ghjsjhgz.jpeg?q=70',0,2689,100,'Women Fit and Flare Yellow Dress',3),(102,'Roadster','blue','2024-08-24 13:49:15.753419','Discover stylish men\'s pants that exude both comfort and fashion-forward design. These meticulously crafted pants are perfect for any occasion, providing a perfect blend of style and versatility.',0,591,'https://rukminim1.flixcart.com/image/612/612/kb1470w0/jean/x/r/a/30-11274626-roadster-original-imafsgsthk6gdpjg.jpeg?q=70',0,1159,100,'Men Regular Mid Rise Blue Jeans',102),(103,'V-MART','','2024-08-24 13:49:31.325339','Discover stylish men\'s pants that exude both comfort and fashion-forward design. These meticulously crafted pants are perfect for any occasion, providing a perfect blend of style and versatility.',0,398,'https://rukminim1.flixcart.com/image/612/612/xif0q/jean/v/c/n/30-586035-v-mart-original-imagmh7fzah3r2jj.jpeg?q=70',0,3999,100,'Men Slim Mid Rise Grey Jeans',102),(104,'KILLER','','2024-08-24 13:49:42.639381','Discover stylish men\'s pants that exude both comfort and fashion-forward design. These meticulously crafted pants are perfect for any occasion, providing a perfect blend of style and versatility.',0,959,'https://rukminim1.flixcart.com/image/612/612/xif0q/jean/1/4/v/-original-imaggjcyhzz4myqh.jpeg?q=70',0,319,100,'Men Slim Mid Rise Dark Blue Jeans',102),(105,'BEN MARTIN','','2024-08-24 13:49:51.758668','Discover stylish men\'s pants that exude both comfort and fashion-forward design. These meticulously crafted pants are perfect for any occasion, providing a perfect blend of style and versatility.',0,499,'https://rukminim1.flixcart.com/image/612/612/jean/n/u/3/bmw-darklevis-ben-martin-32-original-imaedpc4zcgjadsv.jpeg?q=70',0,1399,100,'Men Regular Mid Rise Dark Blue Jeans',102),(106,'LEVI\'S','','2024-08-24 13:50:19.661813','Discover stylish men\'s pants that exude both comfort and fashion-forward design. These meticulously crafted pants are perfect for any occasion, providing a perfect blend of style and versatility.',0,1499,'https://rukminim1.flixcart.com/image/612/612/xif0q/jean/r/g/f/32-18298-1258-levi-s-original-imaggz3fnw5cdphp.jpeg?q=70',0,3199,100,'511 Men Slim Mid Rise Blue Jeans',102),(152,'Inspire Me','Blue','2024-08-25 19:21:06.584809','Make your way out with Inspire Me Men’s Cotton Denim Jeans developed with style in mind which can also turn-up to be a great addition to your wardrobe',0,0,'https://m.media-amazon.com/images/I/41OxVllEhyL._AC_SY500_.jpg',0,1000,5,'Jeans',102),(202,'RockStar','Blue','2024-08-26 11:29:51.741538','100% Cotton\nMachine Wash Warm, Tumble Dry\nFastening: Button\nCollar Style: Spread Collar\nLong-Sleeve Slim-Fit Shirt\n',5,1000,'https://m.media-amazon.com/images/I/91o7mKbrrEL._AC_SX425_.jpg',0,1500,5,'Shirt',152),(203,'Levis','Black','2024-08-26 11:32:43.166446','siliteelon Men\'s Short Sleeve Dress Shirt Stretch No Iron Plain Regular Fit Casual Business Shirt with Pocket',5,1500,'https://m.media-amazon.com/images/I/6174KyKR-xL._AC_SX425_.jpg',0,2000,10,'Shirt',152),(208,'Levis','Red','2024-08-26 12:45:02.713350','SLIM FIT: Slim fit through the shoulders, chest, and waist.\nLIGHTWEIGHT T-SHIRT JERSEY: Soft and comfortable knit fabric for a go-to lightweight t-shirt. Solids are 100% cotton and heathers are a cotton-poly blend.',5,1000,'https://m.media-amazon.com/images/I/81DFSwEEYAL._AC_SX466_.jpg',0,1500,5,'T-Shirt',153),(211,'jVER','White','2024-08-26 12:57:23.530858','tretch Fabric: The long sleeve shirt is made of stretch fabric, which makes you move body easier, soft and comfortable with anti-shrink, good color fastness',3,1200,'https://m.media-amazon.com/images/I/51rkKPruYvL._AC_SX425_.jpg',0,1500,3,'Shirt',152),(212,'Levis','blue','2024-08-26 13:06:10.654012','Breathable Mesh Fabric：Moisture wicking that keeps you cool and dry while training. Fabric for excellent ventilation and breathability, dissipates heat easily.',5,1000,'https://m.media-amazon.com/images/I/61vguW7ZcSL._AC_SX522_.jpg',0,1500,5,'Sports T-Shirt',153),(213,'Hollister','White','2024-08-26 18:08:54.366490','100% cotton Belcoro yarn fabric.\nCotton/Lycra neck for improved shape retention\nShoulder to shoulder taping\nTwin needle stitching on neck, sleeves and hem',0,600,'https://m.media-amazon.com/images/I/61RicfgPAJL._AC_SX425_.jpg',0,600,5,'T-Shirt',153),(214,'Love My Fashion','Blue','2024-08-26 18:12:40.607385','Officially branded merchandise with all authorised branding packaging and labelling Well crafted 10 pack Valueweight t-shirt whilst being soft and comfortable to wear',20,1000,'https://m.media-amazon.com/images/I/51F3GjO9kZS._AC_SX522_.jpg',0,3000,3,'T-Shirt',153),(216,'Hollister','Green','2024-08-27 11:27:38.618344','If you are looking for an extremely comfortable and light weight T shirt you are at right place. Introducing to you the best in the west Original 100% Cotton Pure Fabric Tee.',2,800,'https://m.media-amazon.com/images/I/71CXCXYr7KL._AC_SX522_.jpg',0,1000,4,'T-Shirt',153),(217,'Levis','Yellow','2024-08-27 11:32:37.257454','Material composition100% Cotton\nCare instructionsMachine Wash\nClosure typePull On\nNeck styleV-Neck',4,800,'https://m.media-amazon.com/images/I/511yyaR6+WL._AC_SX522_.jpg',0,1200,4,'T-Shirt',153),(218,'Wrangler Authentics','Green','2024-08-27 11:38:01.286976','Material composition55% Cotton, 23% Polyester, 20% Polyester (recycled), 2% Elastane\nCare instructionsMachine Wash\nClosure typeButton\nNeck styleCollared Neck',0,3000,'https://m.media-amazon.com/images/I/71SaGftGIBL._AC_SY550_.jpg',0,3000,5,'Shirt',152),(219,'Meilicloth','Orange','2024-08-27 11:41:30.610662','Mens plaid flannel shirts are made of high density fabric, warm and thick, not tear, breathable and comfortable (Please refer to the Meilicloth Size Chart before ordering)',5,2000,'https://m.media-amazon.com/images/I/71HuC75mt3L._AC_SY500_.jpg',0,2500,5,'Shirt',152),(220,'Levis','Red','2024-08-27 11:44:29.216281','Material composition30% Wool,40% Nylon,30% Acrylic\nCare instructionsMachine Wash\nClosure typeButton\nWeave typeKnit\nCountry of originChina',0,3500,'https://m.media-amazon.com/images/I/81yoi-EQcML._AC_SX425_.jpg',0,3500,5,'Sweaters',154),(221,'Wrangler','Blue','2024-08-27 11:47:30.949935','Material composition100% Cotton\nCare instructionsMachine Wash Cold, Dry Flat\nClosure typePull On\nWeave typeKnit',0,2000,'https://m.media-amazon.com/images/I/91GQa4pXpHL._AC_SX522_.jpg',0,2000,4,'Sweater',154),(222,'Calvin Klein ','Blue','2024-08-27 14:13:20.605292','Material composition50% Acrylic, 50% Cotton\nClosure typePull On\nWeave typeRib\nNeck styleCrew Neck',0,3500,'https://m.media-amazon.com/images/I/61N7boixutL._AC_SX522_.jpg',0,3500,3,'Sweater',154),(223,'TACVASEN','LightBlue','2024-08-27 15:06:43.592553','Material composition95% Cotton, 5% Elastane\nCare instructionsMachine Wash\nClosure typePull On\nNeck styleCrew Neck\nCountry of originChina',5,1000,'https://m.media-amazon.com/images/I/A1FKcntAS+L._AC_SX466_.jpg',0,1500,5,'Sweaters',154),(224,'MakingDa','Green','2024-08-27 15:09:49.567629','Material composition80% Cotton, 20% Polyester\nCare instructionsMachine Wash\nClosure typeButton\nWeave typePlain\nCountry of originChina',0,2500,'https://m.media-amazon.com/images/I/71eJxWXVDxL._AC_SX522_.jpg',0,2500,5,'Sweater',154),(225,'Yommay','pink','2024-08-27 15:17:53.919429','Yommay Blouses for Womens V Neck Ladies Tops Summer Chiffon Blouses Tops Short Sleeve Casual T Shirts',0,1000,'https://m.media-amazon.com/images/I/81KRf3BynwL._AC_SY550_.jpg',0,1000,3,'Top',155),(226,'MGOOL','Dark Pink','2024-08-27 15:20:09.150259','MGOOL Womens Tops Casual V Neck Tshirts Puff Sleeve Summer Tops Tunic Blouse Short Sleeve Tops for Women UK',5,1000,'https://m.media-amazon.com/images/I/81ZxdT6hu0L._AC_SY500_.jpg',0,1500,3,'Tops',155),(227,'IWOLLENCE','Blue','2024-08-27 15:21:51.700651','IWOLLENCE Lace Sleeve Tops for Women UK Going Out Womens Blouses Ladies Dressy Lace Sleeve T Shirts',10,1000,'https://m.media-amazon.com/images/I/71qJdyUbN4L._AC_SY500_.jpg',0,2000,4,'Top',155),(228,'ONLY','blue denium','2024-08-27 15:24:46.501465','Fit type: Wide leg\nWide leg jeans\nHigh waist\nFive-pocket style\nMaterial composition: 100% cotton',0,2500,'https://m.media-amazon.com/images/I/91XzjhTk17L._AC_SY550_.jpg',0,2500,5,'Pants',156),(229,'Levis','Black','2024-08-27 15:27:23.347649','High Waisted Double Button Denim Jeans\n2 front and 2 back pockets\nFastening: Buttoned, Zip\nMachine Washable',0,2500,'https://m.media-amazon.com/images/I/61mECQToPBS._AC_SY550_.jpg',0,2500,4,'Pants',156),(230,'Breampot','Drak Blue','2024-08-27 15:29:36.535725','Breampot Womens Cargo Trousers High Waist Hiking Walking Combat Pants Casual Work Bottoms Outdoor Streetwear',0,3000,'https://m.media-amazon.com/images/I/71a4LoS3+hL._AC_SX466_.jpg',0,3000,5,'Pant',156),(231,'TRENDMALLS ','white','2024-08-27 15:31:46.766400','TRENDMALLS Women\'s Embroidery Sequence Work Semi-Stitched Bridal Lehenga Choli with Dupatta For Women(New-Bridal-Latest-Wedding-Lehenga-Free size)',0,3000,'https://m.media-amazon.com/images/I/617ZWh7q8dL._AC_SY500_.jpg',0,3000,5,'Lengha Choli',157),(232,'TRENDMALLS','Red','2024-08-27 15:34:00.512660','TRENDMALLS Georgette Sequins Work Semi-Stitched Lehenga Choli with Dupatta For Women-(Bridal-Latest-Wedding-Festive-Lehenga-Free size)',0,5000,'https://m.media-amazon.com/images/I/71+k+EC6GeL._AC_SY500_.jpg',0,5000,5,'Lengha Choli',157),(233,'TRENDMALLS','Yellow','2024-08-27 15:35:48.045030','Material: Lehenga: Blouse: Dupatta; Faux Georgette ; Inner: Micro Satin\nColor: Lehenga: Yellow ; Blouse: Yellow ; Dupatta: Yellow\nMeasurements: Lehenga Flair: 3 Mt, Height: 44 In ||Blouse Size: 0.80 Mt, Dupatta Length: 2 Mt',5,4500,'https://m.media-amazon.com/images/I/51HHRwJGI3L._AC_SY500_.jpg',0,5000,3,'Lengha Choli',157),(234,'Levis','Beige','2024-08-27 15:38:02.568704','Features: Womens oversized half zip hoodies feature a quarter zipper and drop shoulder collar design, long sleeve, 2 side pockets, solid color, fleece lined, stand collar,relaxed fit,trendy athletic hoodies are super cute and comfy.',5,2000,'https://m.media-amazon.com/images/I/61lgbXr1RDL._AC_SY500_.jpg',0,2500,3,'Sweaters',158),(235,'SA Fashions','Yellow','2024-08-27 15:40:07.747770','SA Fashions Oversized New Ladies Womens Chunky Baggy Jumper Knitted Sweater Thick Top S-XL 8-18 M/L 12-14 , Mustard\nproduct type: SWEATER\nColor: Mustard\nSize: 45640',0,3000,'https://m.media-amazon.com/images/I/81Ufzl-UdfL._AC_SX425_.jpg',0,3000,3,'Sweater',158),(236,'HULKAY','white','2024-08-27 15:43:13.349996','Sweaters for Women Cartoon Cute Loose Knit Cardigan Female Japanese College Style Sweater Coat',0,1500,'https://m.media-amazon.com/images/I/71lLDeZEgZL._AC_SX522_.jpg',0,1500,3,'Sweater',158),(238,'Levis','Blue','2024-08-27 15:54:42.301747','Material composition94% Polyester, 6% Elastane\nCare instructionsMachine Wash\nCountry of originChina',0,3000,'https://m.media-amazon.com/images/I/71yiJzcCCCL._AC_SX425_.jpg',0,3000,3,'Jacket',159),(239,'TRENDMALLS','Blue','2024-08-27 15:58:50.488495','Fabric: Saree: Crepe Silk|Blouse: Dupion Silk\nColor: Saree: TealBlue|Blouse: TealBlue\nWork Type: EmbroideryStone Work\nPackage Contents: 1 Saree with Unstitched Blouse Piece',0,5000,'https://m.media-amazon.com/images/I/710X2pZek8L._AC_SY500_.jpg',0,5000,3,'Saree',160),(240,'TRENDMALLS','Pink','2024-08-27 16:00:47.745017','Fabric: Saree: Rangoli Silk|Blouse: Net\nColor: Saree: LightPink|Blouse: LightPink\nWork Type: Embroidery Sequence Work\nLength: Saree: 5.50 Meter || Blouse: 1 Meter',0,4000,'https://m.media-amazon.com/images/I/710aLeQAK0L._AC_SY500_.jpg',0,4000,3,'Saree',160),(241,'Trendmalls','Pink','2024-08-27 16:02:17.298102','Women\'s Silk Embroidered Heavy Border Saree With Unstitched Designer Blouse saree for women',0,3000,'https://m.media-amazon.com/images/I/710aLeQAK0L._AC_SY500_.jpg',0,3000,3,'Saree',160),(242,'UnifiedClothes','Black','2024-08-27 16:05:16.685693','Women Indian Long Black Raw Silk Kurti Tunic Kurta Shirt Dress Embroidery BD345',2,800,'https://m.media-amazon.com/images/I/61BZsWYAoLL._AC_SY500_.jpg',0,1000,4,'Kurta',161),(243,'UnifiedClothes','Black','2024-08-27 16:08:37.839255','Our Dresses or Kurtis are versatile, perfect for Prom, Party, Cocktail, Dinner, Dance, Banquet, Wedding, Bridesmaid, Graduation, Celebration, Birthday, Evening events, Going out, and numerous other occasions.',0,1000,'https://m.media-amazon.com/images/I/61BZsWYAoLL._AC_SY500_.jpg',0,1000,3,'Kurtas',161),(244,'Sekonda','Gold','2024-08-27 16:12:42.471285','Sekonda Elizabeth Women\'s Quartz Watch 33mm with Stone Set Case, Analogue Display and Stainless Steel Bracelet',0,2400,'https://m.media-amazon.com/images/I/71+o0HwgObL._AC_SX679_.jpg',0,2400,4,'Watches',163),(245,'OLEVS','White','2024-08-27 16:14:28.891901','OLEVS Women Wrist Watches Ultra Thin 6.5mm Minimalist Business Dress Waterproof & Date & Leather Strap Slim Watches for Women',0,3000,'https://m.media-amazon.com/images/I/51O9ZG8CkGL._AC_SX679_.jpg',0,3000,2,'Watches',163),(246,'Pure-Leather','Green','2024-08-27 16:16:29.522346','DREAMING Q&P Fq-234 Brown Leather Strap Bowknot Kitty Design Students Girls Woman Quartz Wrist Watches',0,15000,'https://m.media-amazon.com/images/I/61Ecnu+C6+L._AC_SX679_.jpg',0,15000,3,'Watches',163),(247,'UNOSEKS','Black','2024-08-27 16:18:27.510589','UNOSEKS Purses for Women - RFID Blocking Card Holder Wallet, PU Leather Bifold Wallet for Women Zipper Coin Pocket & ID Window, Small Purses for Women...',0,500,'https://m.media-amazon.com/images/I/61HyfSQ-r0L._AC_SL1500_.jpg',0,500,2,'Wallets',164),(248,'Pomelo','Pink','2024-08-27 16:57:46.329748','Pomelo Best Womens Wallet RFID Blocking Large Capacity Long Purse with Multiple Card Slots Zipper Phone Coin Pocket',0,400,'https://m.media-amazon.com/images/I/71t9x0qn4lL._AC_SL1500_.jpg',0,400,4,'Wallets',164),(249,'Gaekeao','light blue','2024-08-27 17:40:14.938561','GAEKEAO Women\'s Wallet RFID Blocking Leather Compact Bi-fold Wallet for Woman Zipper Coin Pocket Small Ladies Purse with ID Window',2,400,'https://m.media-amazon.com/images/I/61FihmgFRhS._AC_SL1000_.jpg',0,600,4,'Wallets',164),(251,'Personalized','Beige','2024-08-27 17:46:16.339752','Personalized Initial Canvas Beach Bag, Monogrammed Gift Tote Bag for Women',0,1000,'https://m.media-amazon.com/images/I/61UdFTXNQpS._AC_SX522_.jpg',0,1000,3,'Bag',165),(252,'Michael-Kors','Brown','2024-08-27 17:48:22.372476','Michael Kors Jet Set Medium Crossbody Leder Handtasche',0,15000,'https://m.media-amazon.com/images/I/91XR-jIjDZL._AC_SX575_.jpg',0,15000,3,'Bags',165),(253,'LATMAP','Brown','2024-08-27 17:59:54.605197',' Cross Body Bag Women Men Sling Bag Small Casual Rucksack Bag for Women PU Leather Fanny Pack Crossbody Travel Purse for Hiking Shopping',0,1000,'https://m.media-amazon.com/images/I/81MtffjJZyL._AC_SL1500_.jpg',0,1000,4,'Bag',165),(254,'Vans','Black','2024-08-27 18:01:45.120285','UVA/UVB 400 protection\nFrame: 100% Polycarbonate; Lens: 100% Polycarbonate sunglasses.\nVans branding to the side',0,15000,'https://m.media-amazon.com/images/I/61OHQPhKf9L._AC_SX679_.jpg',0,15000,4,'Sunglasses',166),(255,'CGID','Black','2024-08-27 18:03:42.789987','CGID Polarised Sunglasses for Men Women Ladies,2024 Newly Upgraded UV400 Fishing Driving Shades',5,20000,'https://m.media-amazon.com/images/I/61PJvwyQWAL._AC_SX522_.jpg',0,25000,3,'Sunglasses',166),(256,'ZENOTTIC','black','2024-08-27 18:08:59.978012','ZENOTTIC 2 Pack Polarised Sunglasses Womens Mens Retro Vintage Round and Square Sun Glasses with UV400 Protection Unisex',0,19000,'https://m.media-amazon.com/images/I/51cPVMpp+8S._AC_SX522_.jpg',0,19000,4,'Sunglasses',166),(257,'Sunhut','Brown','2024-08-27 18:14:10.277531','Sunglasses Men-Ultra Light Rectangular Polarized Sunglasses for Women, UV400 Protection, Polarized Ultraviolet Protection, Driving, Fishing, Running',0,20000,'https://m.media-amazon.com/images/I/61djV+I2adL._AC_SL1500_.jpg',0,20000,5,'Sunglasses',166),(258,'Langzhen','pink','2024-08-27 18:16:49.052239','Unisex Baseball Cap 100% Cotton Fits Men Women Washed Denim Adjustable Dad Hat',0,1200,'https://m.media-amazon.com/images/I/71E8VEYgn2L._AC_SX522_.jpg',0,1200,4,'Hats',167),(259,'Toskatok','brown','2024-08-27 18:18:37.543617','Ladies Womens Adjustable Summer Sun Hat Fashion Foldable Roll Brim Trilby Bowler',0,1700,'https://m.media-amazon.com/images/I/810WnZ7NmAL._AC_SX522_.jpg',0,1700,4,'Hats',167),(260,'Under-Armour','black','2024-08-27 18:20:36.334768','Under Armour Womens Blitzing Adjustable Cap Sports Accessory',0,2300,'https://m.media-amazon.com/images/I/51IjiZloRnL._AC_SX522_.jpg',0,2300,4,'Hats',167),(261,'Cowhide','brown','2024-08-27 18:23:22.728559','Fashion Womens Leather Belts for Jeans Pants with Metal Pin Buckle Ladies Retro Vintage Leather Waist Belt',0,1000,'https://m.media-amazon.com/images/I/61eT6HwHDrL._AC_SX522_.jpg',0,1000,3,'Belts',168),(262,'XZQTIVE','black beige white','2024-08-27 18:25:19.063209','3 Pack Women\'s Leather Belt for Jeans Pants Ladies Fashion Leather Belt for Dresses Shiny Golden Buckle Waist Belt',0,1500,'https://m.media-amazon.com/images/I/71w7RVPFlcL._AC_SX522_.jpg',0,1500,4,'Belts',168),(263,'Montblanc','black','2024-08-27 18:27:20.911960','Montblanc Unisex Adult\'s Classic Line Belt, Black, 120',0,12000,'https://m.media-amazon.com/images/I/81Mz5C3GVrL._AC_SX679_.jpg',0,12000,4,'Belts',168);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seq`
--

LOCK TABLES `product_seq` WRITE;
/*!40000 ALTER TABLE `product_seq` DISABLE KEYS */;
INSERT INTO `product_seq` VALUES (351);
/*!40000 ALTER TABLE `product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_sizes`
--

DROP TABLE IF EXISTS `product_sizes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_sizes` (
  `product_id` bigint NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `quantity` int NOT NULL,
  KEY `FK4w69qsh5hd062xv3hqkpgpdpu` (`product_id`),
  CONSTRAINT `FK4w69qsh5hd062xv3hqkpgpdpu` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_sizes`
--

LOCK TABLES `product_sizes` WRITE;
/*!40000 ALTER TABLE `product_sizes` DISABLE KEYS */;
INSERT INTO `product_sizes` VALUES (4,NULL,20),(6,NULL,0),(52,NULL,20),(52,NULL,50),(52,NULL,30),(55,NULL,30),(55,NULL,50),(55,NULL,20),(56,NULL,20),(56,NULL,30),(56,NULL,50),(57,NULL,20),(57,NULL,50),(57,NULL,30),(59,NULL,20),(59,NULL,30),(59,NULL,50),(60,NULL,20),(60,NULL,50),(60,NULL,30),(61,NULL,20),(61,NULL,50),(61,NULL,30),(62,NULL,30),(62,NULL,20),(62,NULL,50),(63,NULL,50),(63,NULL,30),(63,NULL,20),(65,NULL,30),(65,NULL,50),(65,NULL,20),(66,NULL,20),(66,NULL,50),(66,NULL,30),(67,NULL,30),(67,NULL,20),(67,NULL,50),(68,NULL,20),(68,NULL,30),(68,NULL,50),(70,NULL,30),(70,NULL,50),(70,NULL,20),(102,'L',50),(102,'S',20),(102,'M',30),(106,'S',20),(106,'M',30),(106,'L',50),(64,NULL,30),(64,NULL,20),(64,NULL,50),(54,NULL,20),(54,NULL,30),(54,NULL,50),(105,'M',30),(105,'L',50),(105,'S',20),(53,NULL,50),(53,NULL,20),(53,NULL,30),(58,NULL,30),(58,NULL,20),(58,NULL,50),(104,'M',30),(104,'S',20),(104,'L',50),(69,NULL,30),(69,NULL,50),(69,NULL,20),(202,NULL,5),(203,NULL,10),(103,'M',30),(103,'S',20),(103,'L',50),(152,NULL,5),(208,NULL,5),(211,NULL,3),(212,NULL,5),(213,NULL,5),(214,NULL,3),(216,NULL,4),(217,NULL,4),(218,NULL,5),(219,NULL,5),(220,NULL,5),(221,NULL,4),(222,NULL,3),(223,NULL,5),(224,NULL,5),(225,NULL,3),(226,NULL,3),(227,NULL,4),(228,NULL,5),(229,NULL,4),(230,NULL,5),(231,NULL,5),(232,NULL,5),(233,NULL,3),(234,NULL,3),(235,NULL,3),(236,NULL,3),(238,NULL,3),(239,NULL,3),(240,NULL,3),(241,NULL,3),(242,NULL,4),(243,NULL,3),(244,NULL,4),(245,NULL,2),(246,NULL,3),(247,NULL,2),(248,NULL,4),(249,NULL,4),(251,NULL,3),(252,NULL,3),(253,NULL,4),(254,NULL,4),(255,NULL,3),(256,NULL,4),(257,NULL,5),(258,NULL,4),(259,NULL,4),(260,NULL,4),(261,NULL,3),(262,NULL,4),(263,NULL,4);
/*!40000 ALTER TABLE `product_sizes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL,
  `brand` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `discount_persent` int DEFAULT NULL,
  `discounted_price` int DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `num_ratings` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_seq`
--

DROP TABLE IF EXISTS `products_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_seq`
--

LOCK TABLES `products_seq` WRITE;
/*!40000 ALTER TABLE `products_seq` DISABLE KEYS */;
INSERT INTO `products_seq` VALUES (1);
/*!40000 ALTER TABLE `products_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rating`
--

DROP TABLE IF EXISTS `rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `product_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKf68lgbsbxl310n0jifwpfqgfh` (`user_id`),
  KEY `FK4odf7rh1jmwmew4dnowoc73cf` (`product_id`),
  CONSTRAINT `FK4odf7rh1jmwmew4dnowoc73cf` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKf68lgbsbxl310n0jifwpfqgfh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKlkuwie0au2dru36asng9nywmh` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rating`
--

LOCK TABLES `rating` WRITE;
/*!40000 ALTER TABLE `rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `review` varchar(255) DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6cpw2nlklblpvc7hyt7ko6v3e` (`user_id`),
  KEY `FKa5cmgpp2plp5oai84fkmbi63e` (`product_id`),
  CONSTRAINT `FK6cpw2nlklblpvc7hyt7ko6v3e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKa5cmgpp2plp5oai84fkmbi63e` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKiyof1sindb9qiqr9o8npj8klt` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_seq`
--

DROP TABLE IF EXISTS `review_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review_seq` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_seq`
--

LOCK TABLES `review_seq` WRITE;
/*!40000 ALTER TABLE `review_seq` DISABLE KEYS */;
INSERT INTO `review_seq` VALUES (1);
/*!40000 ALTER TABLE `review_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` smallint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,'sahil@gmail.com','sahil','khan',NULL,'$2a$10$z4yQqug979sg8rg99Bj7p.VR1QFpqjF9qz0pzC1lJ9U/s9kqjWr3a',NULL),(2,NULL,'','','',NULL,'$2a$10$49irdedLEC7YHrMMMFMeuef8Ca7/tqZTzrTYB6Qks6DzASu6dyW3S',0),(3,NULL,'admin','admin','password',NULL,'$2a$10$mdpXUk41EqVkjWlpaC3LY.9i8Us2AHdkBhxFX4MJy.07WxUM8.j.6',0),(4,NULL,'admin@gmail.com','admin','admin',NULL,'$2a$10$otUXk/.zHvDd3Hil3hw8R.y01aIC8NSmbWFSbUKN5WCLRjoRJB6/W',0),(5,NULL,'jyosthna@gmail.com','Jyosthna','Tanubodhi',NULL,'$2a$10$eEKR2pm3pox1esZF5R/dnOPqepvoDnY2i2saAEJ7EGdDBzzx9zeEu',NULL);
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

-- Dump completed on 2024-08-29  0:49:20
