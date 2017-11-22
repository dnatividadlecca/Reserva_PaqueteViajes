CREATE DATABASE  IF NOT EXISTS `airservice` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `airservice`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: airservice
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `aereolinea`
--

DROP TABLE IF EXISTS `aereolinea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aereolinea` (
  `idaereolinea` varchar(3) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idaereolinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aereolinea`
--

LOCK TABLES `aereolinea` WRITE;
/*!40000 ALTER TABLE `aereolinea` DISABLE KEYS */;
INSERT INTO `aereolinea` VALUES ('LAN','LAN Perú','Dirección LAN Perú','(01) 1234567'),('SPE','StarPerú','Dirección Star Perú','(01) 1234567');
/*!40000 ALTER TABLE `aereolinea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `iddepartamento` varchar(3) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`iddepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES ('ARQ','Arequipa'),('CUZ','Cuzco'),('LIM','Lima');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva`
--

DROP TABLE IF EXISTS `reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reserva` (
  `idreserva` int(11) NOT NULL,
  `idvuelo` varchar(8) DEFAULT NULL,
  `clase` varchar(45) DEFAULT NULL,
  `dni` varchar(45) DEFAULT NULL,
  `cantidadAsientos` int(11) DEFAULT NULL,
  PRIMARY KEY (`idreserva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva`
--

LOCK TABLES `reserva` WRITE;
/*!40000 ALTER TABLE `reserva` DISABLE KEYS */;
INSERT INTO `reserva` VALUES (1,'LAN-1234','EJE','12345678',1),(2,'LAN-1234','EJE','12345678',1),(3,'LAN-1234','EJE','12345678',1),(4,'LAN-1234','EJE','12345678',1),(5,'LAN-1234','EJE','12345678',1),(6,'LAN-1234','ECO','12345678',2),(7,'LAN-1234','ECO','12345678',2),(8,'LAN-1234','ECO','12345678',2),(9,'LAN-1234','ECO','12345678',2),(10,'LAN-1234','ECO','12345678',2),(11,'SPE-1234','EJE','12345678',1),(12,'SPE-1234','EJE','12345678',1),(13,'SPE-1234','EJE','12345678',1),(14,'SPE-1234','EJE','12345699',1);
/*!40000 ALTER TABLE `reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vuelo` (
  `idvuelo` varchar(8) NOT NULL,
  `idaereolinea` varchar(3) NOT NULL,
  `clase` varchar(3) NOT NULL,
  `origen` varchar(3) DEFAULT NULL,
  `destino` varchar(3) DEFAULT NULL,
  `fechaOrigen` date DEFAULT NULL,
  `cantidadAsientos` int(11) DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  `horaPartida` time(2) DEFAULT NULL,
  `horaLlegada` time(2) DEFAULT NULL,
  PRIMARY KEY (`idvuelo`,`idaereolinea`,`clase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES ('LAN-1234','LAN','ECO','LIM','CUZ','2017-11-19',40,150.00,'05:00:00.00','07:00:00.00'),('LAN-1234','LAN','EJE','LIM','CUZ','2017-11-19',5,220.00,'05:00:00.00','07:00:00.00'),('SPE-1234','SPE','ECO','CUZ','LIM','2017-11-20',40,125.00,'06:00:00.00','08:00:00.00'),('SPE-1234','SPE','EJE','CUZ','LIM','2017-11-20',5,200.00,'06:00:00.00','08:00:00.00');
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-21 22:14:38
