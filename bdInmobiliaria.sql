-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: db_inmobiliaria
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `tb_administrador`
--

DROP TABLE IF EXISTS `tb_administrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_administrador` (
  `int` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  PRIMARY KEY (`int`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_administrador`
--

LOCK TABLES `tb_administrador` WRITE;
/*!40000 ALTER TABLE `tb_administrador` DISABLE KEYS */;
INSERT INTO `tb_administrador` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `tb_administrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_contactos`
--

DROP TABLE IF EXISTS `tb_contactos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_contactos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `urlWhatsapp` varchar(450) DEFAULT NULL,
  `urlInstagram` varchar(450) DEFAULT NULL,
  `urlFacebook` varchar(450) DEFAULT NULL,
  `urlMaps` varchar(450) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_contactos`
--

LOCK TABLES `tb_contactos` WRITE;
/*!40000 ALTER TABLE `tb_contactos` DISABLE KEYS */;
INSERT INTO `tb_contactos` VALUES (1,'https://wa.me/5492281683888','https://www.instagram.com/paulauzubiagainmobiliaria/','me voy a comprar un facebook','https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d200.8338315100126!2d-60.031102302418006!3d-36.35251097953135!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9595c3c9a58f9d35%3A0x40049df05896e1ad!2sPaula%20Uzubiaga%20Casas%20%26%20Campos!5e0!3m2!1ses-419!2sar!4v1732820835774!5m2!1ses-419!2sar','Av. 9 de Julio 201, Tapalque, Prov. de Buenos Aires.');
/*!40000 ALTER TABLE `tb_contactos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_imagenes`
--

DROP TABLE IF EXISTS `tb_imagenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_imagenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `titulo` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_imagenes`
--

LOCK TABLES `tb_imagenes` WRITE;
/*!40000 ALTER TABLE `tb_imagenes` DISABLE KEYS */;
INSERT INTO `tb_imagenes` VALUES (71,'uploads/66449ebd-4969-46a5-8db7-bfc63e3241ce.jpg',NULL,0),(72,'uploads/3257ec1f-ba31-417d-89da-d782e960d61e.jpg',NULL,0),(73,'uploads/7201b85c-f778-42b2-8ada-6f28be7008f4.jpg',NULL,0),(74,'uploads/411fd39e-55a2-4c05-9b89-1d2974a72b0d.jpg',NULL,0),(75,'uploads/5ab37278-bef5-4d9f-b152-7b3e860f95da.jpg',NULL,0),(76,'uploads/c798998f-00e7-464e-aa95-5ad6146b2f3b.jpg',NULL,1),(77,'uploads/c93a375d-0872-4a11-8f9f-5bef6ff80061.jpg',NULL,1),(78,'uploads/eac69e37-2bea-4f47-bd1a-dfb10fad4534.jpg',NULL,1),(79,'uploads/5d9427d6-91fe-40dc-893a-ebc635e673e6.jpg',NULL,1),(80,'uploads/46ab03fb-f9b8-479b-a072-c5c77d31fa08.jpg',NULL,1),(81,'uploads/bf3c5c0a-ff13-4874-a13f-8133c11fb064.jpg',NULL,1),(82,'uploads/a1904463-4a2a-4eee-aacf-2dd32851d3e5.jpg',NULL,1);
/*!40000 ALTER TABLE `tb_imagenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_imagenes_propiedades`
--

DROP TABLE IF EXISTS `tb_imagenes_propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_imagenes_propiedades` (
  `id_imagen` int(11) NOT NULL,
  `id_propiedad` int(11) NOT NULL,
  KEY `ff_imagenes_idx` (`id_imagen`),
  KEY `fk_propiedades_idx` (`id_propiedad`),
  CONSTRAINT `ff_imagenes` FOREIGN KEY (`id_imagen`) REFERENCES `tb_imagenes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_propiedades` FOREIGN KEY (`id_propiedad`) REFERENCES `tb_propiedades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_imagenes_propiedades`
--

LOCK TABLES `tb_imagenes_propiedades` WRITE;
/*!40000 ALTER TABLE `tb_imagenes_propiedades` DISABLE KEYS */;
INSERT INTO `tb_imagenes_propiedades` VALUES (71,16),(72,16),(73,16),(74,16),(75,16),(76,16),(77,17),(78,18),(79,19),(80,16),(81,16),(82,18);
/*!40000 ALTER TABLE `tb_imagenes_propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_propiedades`
--

DROP TABLE IF EXISTS `tb_propiedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_propiedades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `idImagenPrincipal` int(11) DEFAULT NULL,
  `precio` varchar(45) DEFAULT NULL,
  `resenia` varchar(45) DEFAULT NULL,
  `descripcion` varchar(400) DEFAULT NULL,
  `urlMaps` varchar(400) DEFAULT NULL,
  `localidad` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) NOT NULL DEFAULT '1',
  `fechaUltMod` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_propiedades`
--

LOCK TABLES `tb_propiedades` WRITE;
/*!40000 ALTER TABLE `tb_propiedades` DISABLE KEYS */;
INSERT INTO `tb_propiedades` VALUES (16,'Los jacintos',81,'','1\r\n2','1\r\n2\r\n3\r\n','https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d401.65518432064437!2d-60.029645192320174!3d-36.35492946602396!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses-419!2sar!4v1733857268177!5m2!1ses-419!2sar','tapalque',1,'2024-12-17 17:26:06'),(17,'Propiedad 2',NULL,'','asdasdasd','adasdasdasdsad','https://www.facebook.com','Crotto',1,'2024-12-09 21:51:08'),(18,'casa quimta',82,'12312','123wdsadasd','Linea 1\r\nlinea 2\r\nlinea 3','https://google.com','covello',1,'2024-12-17 17:26:36'),(19,'campodonico',NULL,'','asdasdsadasd','asdsadasdasdasdasd','https://www.youtube.com','terreno',1,'2024-12-09 21:57:20');
/*!40000 ALTER TABLE `tb_propiedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_servicios`
--

DROP TABLE IF EXISTS `tb_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `servicio` varchar(45) NOT NULL,
  `estado` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_servicios`
--

LOCK TABLES `tb_servicios` WRITE;
/*!40000 ALTER TABLE `tb_servicios` DISABLE KEYS */;
INSERT INTO `tb_servicios` VALUES (3,'Alquiler',1),(8,'Administracion',1),(9,'Ventas',1);
/*!40000 ALTER TABLE `tb_servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-17 21:14:50
