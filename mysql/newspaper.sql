-- MySQL dump 10.13  Distrib 8.0.31, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: newspaper
-- ------------------------------------------------------
-- Server version	8.0.31-0ubuntu0.22.04.1

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
                            `id` int NOT NULL AUTO_INCREMENT,
                            `title` varchar(50) NOT NULL,
                            `createDate` datetime DEFAULT NULL,
                            `updateDate` datetime DEFAULT NULL,
                            `abstract_content` text,
                            `content` text,
                            `avatar` varchar(150) DEFAULT NULL,
                            `status` varchar(50) DEFAULT NULL,
                            `type` varchar(150) DEFAULT NULL,
                            `author_id` int DEFAULT NULL,
                            `enable` tinyint NOT NULL,
                            PRIMARY KEY (`id`),
                            UNIQUE KEY `id` (`id`),
                            KEY `articles___fk__author` (`author_id`),
                            CONSTRAINT `articles___fk__author` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_categories`
--

DROP TABLE IF EXISTS `articles_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_categories` (
                                       `id` int NOT NULL AUTO_INCREMENT,
                                       `article_id` int NOT NULL,
                                       `category_id` int NOT NULL,
                                       PRIMARY KEY (`id`),
                                       UNIQUE KEY `id` (`id`),
                                       KEY `articles_categories___fk__category` (`category_id`),
                                       KEY `articles_categories___fk_article` (`article_id`),
                                       CONSTRAINT `articles_categories___fk__category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                       CONSTRAINT `articles_categories___fk_article` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_categories`
--

LOCK TABLES `articles_categories` WRITE;
/*!40000 ALTER TABLE `articles_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles_tags`
--

DROP TABLE IF EXISTS `articles_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles_tags` (
                                 `id` int NOT NULL AUTO_INCREMENT,
                                 `article_id` int NOT NULL,
                                 `tag_id` int NOT NULL,
                                 PRIMARY KEY (`id`),
                                 UNIQUE KEY `id` (`id`),
                                 KEY `articles_tags___fk__article` (`article_id`),
                                 KEY `articles_tags___fk__tag` (`tag_id`),
                                 CONSTRAINT `articles_tags___fk__article` FOREIGN KEY (`article_id`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
                                 CONSTRAINT `articles_tags___fk__tag` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles_tags`
--

LOCK TABLES `articles_tags` WRITE;
/*!40000 ALTER TABLE `articles_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
                              `id` int NOT NULL AUTO_INCREMENT,
                              `title` varchar(150) NOT NULL,
                              `createDate` datetime DEFAULT NULL,
                              `updateDate` datetime DEFAULT NULL,
                              `enable` tinyint(1) DEFAULT NULL,
                              PRIMARY KEY (`id`),
                              UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
                        `id` int NOT NULL AUTO_INCREMENT,
                        `title` varchar(150) NOT NULL,
                        `createDate` datetime DEFAULT NULL,
                        `updateDate` datetime DEFAULT NULL,
                        `enable` tinyint DEFAULT NULL,
                        PRIMARY KEY (`id`),
                        UNIQUE KEY `id` (`id`),
                        UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
                         `id` int NOT NULL AUTO_INCREMENT,
                         `username` varchar(50) NOT NULL,
                         `password` varchar(255) NOT NULL,
                         `name` varchar(50) DEFAULT NULL,
                         `email` varchar(150) NOT NULL,
                         `birthday` datetime DEFAULT NULL,
                         `penname` varchar(50) DEFAULT NULL,
                         `createDate` datetime DEFAULT NULL,
                         `updateDate` datetime DEFAULT NULL,
                         `expr` datetime DEFAULT NULL,
                         `permission` varchar(50) DEFAULT NULL,
                         `enable` tinyint NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `password`, `name`, `email`, `birthday`, `penname`, `createDate`, `updateDate`, `expr`, `permission`, `enable`) VALUES (1,'datng','$2a$12$Jzr1.O988Zx7TqfAX.M0kOYj4bxRthoUsxKFm1A2AvRc8L9IItmNG','Nguyễn Văn Đạt','datnguyen2847@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:07:53','2023-01-02 20:07:53',NULL,'admin',1),(2,'datng01','$2a$12$vVbs4.jniezSiBFM/u1DdOd3cLsNhZasdkKkd6LV7NSL0VGrj10O6','Nguyễn Văn Đạt','datng01@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:08:06','2023-01-02 20:08:06',NULL,'reader',1),(3,'datng02','$2a$12$U4AQrsSh09oSDshTfpi99.5njZTEyF3CuM7y//OkFvyeOPnUKt2TO','Nguyễn Văn Đạt','datng02@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:08:14','2023-01-02 20:08:14',NULL,'reader',1),(4,'datng03','$2a$12$bpKjmZn66W/LPnuQ.Bg8oes2vPiZidvM.P0WBJM4L2.x3PxuI/A/G','Nguyễn Văn Đạt','datng03@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:09:33','2023-01-02 20:09:33',NULL,'reader',1),(5,'datng04','$2a$12$6D.G87h/Dpx9cHxrtG5CCuGKVy7bUNFoj/n.vSv6SXJVrmAhAIpJW','Nguyễn Văn Đạt','datng04@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:09:42','2023-01-02 20:09:42',NULL,'reader',1),(6,'datng05','$2a$12$cXR7U788l/0uuarKRRTVvuDe6yLa0LR2.AQn03K.CIP/K9lafLCrO','Nguyễn Văn Đạt','datng05@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:12:13','2023-01-02 20:12:13',NULL,'reader',1),(7,'datng06','$2a$12$GY3Vf1POEPMAYngFQWD4luYNOSzFlqNCtSmHjSkp1GfjAzoo0N8tK','Nguyễn Văn Đạt','datng06@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:12:44','2023-01-02 20:12:44',NULL,'reader',1),(8,'datng07','$2a$12$iGt0sTw2G66lpSEfr.hMheTm0o8ozSM16GIXa86H7d9qAw6QWkAjW','Nguyễn Văn Đạt','datng07@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:15:27','2023-01-02 20:15:27',NULL,'reader',1),(9,'datng08','$2a$12$pJu6gayDfdz1A01uRDQicus4dI8ipfdALUj1nEqRkZ3t6GR8nrrVa','Nguyễn Văn Đạt','datng08@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:15:35','2023-01-02 20:15:35',NULL,'reader',1),(10,'datng09','$2a$12$xdTBySgLtyZBNXx4lVR8BO4C1SJ1AiEar3ONvedkNSRB8CTNudgKa','Nguyễn Văn Đạt','datng09@gmail.com','1997-03-20 00:00:00',NULL,'2023-01-02 20:16:02','2023-01-02 20:16:02',NULL,'reader',1),(11,'datng','$2a$12$idWGip8Qw41bNAegxI6cCesf2mjvqE1r1o8Nwb1iXNX77P6hNHium','Nguyá»n VÄn Äáº¡t','','1997-03-20 00:00:00',NULL,'2023-01-03 00:54:40','2023-01-03 00:54:40',NULL,'reader',1);
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

-- Dump completed on 2023-01-03 10:18:24
