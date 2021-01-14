CREATE DATABASE  IF NOT EXISTS `power` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `power`;
-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: power
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `categorie` (
  `idcategorie` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idcategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'inutile'),(2,'environnemental'),(3,'corporel'),(4,'classique'),(5,'flippant');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `super_pouvoir`
--

DROP TABLE IF EXISTS `super_pouvoir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `super_pouvoir` (
  `idsuper_pouvoir` int NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `prix` int NOT NULL,
  `description_meta` varchar(255) DEFAULT NULL,
  `contenu_produit` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `time` int DEFAULT NULL COMMENT '\\n',
  `categorie_idcategorie` int NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idsuper_pouvoir`,`categorie_idcategorie`),
  KEY `fk_table1_catégorie_idx` (`categorie_idcategorie`),
  CONSTRAINT `fk_table1_catégorie` FOREIGN KEY (`categorie_idcategorie`) REFERENCES `categorie` (`idcategorie`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `super_pouvoir`
--

LOCK TABLES `super_pouvoir` WRITE;
/*!40000 ALTER TABLE `super_pouvoir` DISABLE KEYS */;
INSERT INTO `super_pouvoir` VALUES (1,12,100,'Mangez des cailloux','Mangez des cailloux','Cailloux man','cailloux',20,1,'super-pouvoir-inutile.jpg'),(2,22,150,'Voyagez dans le temps','Voyagez dans le temps','Voyage man','voyage',10,4,'super-pouvoir-classique.jpg'),(3,25,200,'Invisible man','Invisible man','Invisible man','Invisible',4,4,'super-pouvoir-classique.jpg'),(4,57,40,'Fort man','Fort man','Fort man','force',3,3,'super-pouvoir-physique.jpg'),(5,14,400,'Télépathe man','Télépathe man','Telepathe man','telepathie',2,2,'super-pouvoir-elements.jpg'),(6,98,500,'Vole man','Vole man','Vole man','voler',100,2,'super-pouvoir-elements.jpg'),(7,2,100,'Télékinésie man','Télékinésie man','Telekinesie man','telekinesie',55,2,'super-pouvoir-elements.jpg'),(8,1900,40,'Garde robe','Garde robe','Garde robe','garde-robe',100,1,'super-pouvoir-inutile.jpg'),(9,500,250,'Métamorphose','Métamorphose','Metamorphose','metamorphose',29,3,'super-pouvoir-physique.jpg'),(10,6000,99,'Mémoire','Mémoire','Memoire','memoire',50,4,'super-pouvoir-classique.jpg'),(11,120,59,'Jeunesse éternelle','Jeunesse éternelle','Jeunesse eternelle','jeunesse-eternelle',89,3,'super-pouvoir-physique.jpg'),(12,20,49,'Hacker','Hacker','Hacker','hacker',99,1,'super-pouvoir-inutile.jpg'),(13,39,1000,'Lire l\'avenir','Lire l\'avenir','Lire l\'avenir','don-voyance',20,5,'super-pouvoir-flippant.jpg'),(14,49,399,'Parler toute les langues','Parler toute les langues','Parler toutes les langues','polyglotte',1000,1,'super-pouvoir-inutile.jpg'),(15,69,69,'Prendre des photos avec ses yeux','Prendre des photos avec ses yeux','Prendre des photos avec ses yeux','photos-avec-yeux',99,1,'super-pouvoir-inutile.jpg'),(16,19,40,'Super vision','Super vision','Super vision','super-vision',56,5,'super-pouvoir-flippant.jpg'),(17,200,199,'Marcher sur l\'eau','Marcher sur l\'eau','Marcher sur l\'eau','marcher-sur-eau',199,2,'super-pouvoir-elements.jpg'),(18,1,999,'Transformer l\'eau en vin','Transformer l\'eau en vin','Transformer l\'eau en vin','eau-en-vin',2000,2,'super-pouvoir-elements.jpg'),(19,214,59,'Respirer sous l\'eau','Respirer sous l\'eau','Respirer sous l\'eau','respirer-sous-eau',400,3,'super-pouvoir-physique.jpg');
/*!40000 ALTER TABLE `super_pouvoir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-14 15:44:42
