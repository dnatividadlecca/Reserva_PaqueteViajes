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
INSERT INTO `aereolinea` VALUES ('LAN','LAN Perú','Dirección LAN Perú','(01) 1234567'),('PAI','Peruvian Airlines','Dirección Peruvian Airlines','(01) 1234567'),('SPE','Star Perú','Dirección Star Perú','(01) 1234567'),('TAC','TACA Perú','Dirección TACA Perú','(01) 1234567');
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
INSERT INTO `departamento` VALUES ('AMA','Amazonas'),('ANC','Áncash'),('APU','Apurimac'),('ARE','Arequipa'),('AYA','Ayacucho'),('CAJ','Cajamarca'),('CUZ','Cuzco'),('HUA','Huánuco'),('ICA','Ica'),('JUN','Junin'),('LAM','Lambayeque'),('LIB','La Libertad'),('LIM','Lima'),('LOR','Loreto'),('MDI','Madre de Dios'),('MOQ','Moquegua'),('PAS','Pasco'),('PIU','Piura'),('PUN','Puno'),('SMA','San Martín'),('TAC','Tacna'),('TUM','Tumbes'),('UCA','Ucayali');
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
INSERT INTO `vuelo` VALUES ('LAN-1310','LAN','EJE','LIM','CUZ','2017-12-05',5,350.00,NULL,NULL),('LAN-1316','LAN','ECO','LIM','CUZ','2017-12-05',30,405.00,NULL,NULL),('LAN-1322','LAN','EJE','CUZ','LIM','2017-12-05',5,370.00,NULL,NULL),('LAN-1328','LAN','ECO','CUZ','LIM','2017-12-05',30,410.00,NULL,NULL),('LAN-1334','LAN','EJE','LIM','CUZ','2017-12-06',5,350.00,NULL,NULL),('LAN-1340','LAN','ECO','LIM','CUZ','2017-12-06',30,405.00,NULL,NULL),('LAN-1346','LAN','EJE','CUZ','LIM','2017-12-06',5,370.00,NULL,NULL),('LAN-1352','LAN','ECO','CUZ','LIM','2017-12-06',30,410.00,NULL,NULL),('LAN-1358','LAN','EJE','LIM','CUZ','2017-12-07',5,350.00,NULL,NULL),('LAN-1364','LAN','ECO','LIM','CUZ','2017-12-07',30,405.00,NULL,NULL),('LAN-1370','LAN','EJE','CUZ','LIM','2017-12-07',5,370.00,NULL,NULL),('LAN-1376','LAN','ECO','CUZ','LIM','2017-12-07',30,410.00,NULL,NULL),('LAN-1382','LAN','EJE','LIM','CUZ','2017-12-08',5,350.00,NULL,NULL),('LAN-1388','LAN','ECO','LIM','CUZ','2017-12-08',30,405.00,NULL,NULL),('LAN-1394','LAN','EJE','CUZ','LIM','2017-12-08',5,370.00,NULL,NULL),('LAN-1400','LAN','ECO','CUZ','LIM','2017-12-08',30,410.00,NULL,NULL),('LAN-1406','LAN','EJE','LIM','CUZ','2017-12-09',5,350.00,NULL,NULL),('LAN-1412','LAN','ECO','LIM','CUZ','2017-12-09',30,405.00,NULL,NULL),('LAN-1418','LAN','EJE','CUZ','LIM','2017-12-09',5,370.00,NULL,NULL),('LAN-1424','LAN','ECO','CUZ','LIM','2017-12-09',30,410.00,NULL,NULL),('LAN-1430','LAN','EJE','LIM','CUZ','2017-12-10',5,350.00,NULL,NULL),('LAN-1436','LAN','ECO','LIM','CUZ','2017-12-10',30,405.00,NULL,NULL),('LAN-1442','LAN','EJE','CUZ','LIM','2017-12-10',5,370.00,NULL,NULL),('LAN-1448','LAN','ECO','CUZ','LIM','2017-12-10',30,410.00,NULL,NULL),('LAN-1454','LAN','EJE','LIM','CUZ','2017-12-11',5,350.00,NULL,NULL),('LAN-1460','LAN','ECO','LIM','CUZ','2017-12-11',30,405.00,NULL,NULL),('LAN-1466','LAN','EJE','CUZ','LIM','2017-12-11',5,370.00,NULL,NULL),('LAN-1472','LAN','ECO','CUZ','LIM','2017-12-11',30,410.00,NULL,NULL),('LAN-1478','LAN','EJE','LIM','CUZ','2017-12-12',5,350.00,NULL,NULL),('LAN-1484','LAN','ECO','LIM','CUZ','2017-12-12',30,405.00,NULL,NULL),('LAN-1490','LAN','EJE','CUZ','LIM','2017-12-12',5,370.00,NULL,NULL),('LAN-1496','LAN','ECO','CUZ','LIM','2017-12-12',30,410.00,NULL,NULL),('LAN-4307','LAN','ECO','LIM','CUZ','2017-12-05',30,405.00,NULL,NULL),('LAN-4307','LAN','EJE','LIM','CUZ','2017-12-05',5,350.00,NULL,NULL),('PAI-1311','PAI','EJE','LIM','CUZ','2017-12-05',5,390.00,NULL,NULL),('PAI-1317','PAI','ECO','LIM','CUZ','2017-12-05',30,355.00,NULL,NULL),('PAI-1323','PAI','EJE','CUZ','LIM','2017-12-05',5,395.00,NULL,NULL),('PAI-1329','PAI','ECO','CUZ','LIM','2017-12-05',30,450.00,NULL,NULL),('PAI-1335','PAI','EJE','LIM','CUZ','2017-12-06',5,390.00,NULL,NULL),('PAI-1341','PAI','ECO','LIM','CUZ','2017-12-06',30,355.00,NULL,NULL),('PAI-1347','PAI','EJE','CUZ','LIM','2017-12-06',5,395.00,NULL,NULL),('PAI-1353','PAI','ECO','CUZ','LIM','2017-12-06',30,450.00,NULL,NULL),('PAI-1359','PAI','EJE','LIM','CUZ','2017-12-07',5,390.00,NULL,NULL),('PAI-1365','PAI','ECO','LIM','CUZ','2017-12-07',30,355.00,NULL,NULL),('PAI-1371','PAI','EJE','CUZ','LIM','2017-12-07',5,395.00,NULL,NULL),('PAI-1377','PAI','ECO','CUZ','LIM','2017-12-07',30,450.00,NULL,NULL),('PAI-1383','PAI','EJE','LIM','CUZ','2017-12-08',5,390.00,NULL,NULL),('PAI-1389','PAI','ECO','LIM','CUZ','2017-12-08',30,355.00,NULL,NULL),('PAI-1395','PAI','EJE','CUZ','LIM','2017-12-08',5,395.00,NULL,NULL),('PAI-1401','PAI','ECO','CUZ','LIM','2017-12-08',30,450.00,NULL,NULL),('PAI-1407','PAI','EJE','LIM','CUZ','2017-12-09',5,390.00,NULL,NULL),('PAI-1413','PAI','ECO','LIM','CUZ','2017-12-09',30,355.00,NULL,NULL),('PAI-1419','PAI','EJE','CUZ','LIM','2017-12-09',5,395.00,NULL,NULL),('PAI-1425','PAI','ECO','CUZ','LIM','2017-12-09',30,450.00,NULL,NULL),('PAI-1431','PAI','EJE','LIM','CUZ','2017-12-10',5,390.00,NULL,NULL),('PAI-1437','PAI','ECO','LIM','CUZ','2017-12-10',30,355.00,NULL,NULL),('PAI-1443','PAI','EJE','CUZ','LIM','2017-12-10',5,395.00,NULL,NULL),('PAI-1449','PAI','ECO','CUZ','LIM','2017-12-10',30,450.00,NULL,NULL),('PAI-1455','PAI','EJE','LIM','CUZ','2017-12-11',5,390.00,NULL,NULL),('PAI-1461','PAI','ECO','LIM','CUZ','2017-12-11',30,355.00,NULL,NULL),('PAI-1467','PAI','EJE','CUZ','LIM','2017-12-11',5,395.00,NULL,NULL),('PAI-1473','PAI','ECO','CUZ','LIM','2017-12-11',30,450.00,NULL,NULL),('PAI-1479','PAI','EJE','LIM','CUZ','2017-12-12',5,390.00,NULL,NULL),('PAI-1485','PAI','ECO','LIM','CUZ','2017-12-12',30,355.00,NULL,NULL),('PAI-1491','PAI','EJE','CUZ','LIM','2017-12-12',5,395.00,NULL,NULL),('PAI-1497','PAI','ECO','CUZ','LIM','2017-12-12',30,450.00,NULL,NULL),('PAI-4307','PAI','ECO','LIM','CUZ','2017-12-05',30,355.00,NULL,NULL),('PAI-4307','PAI','EJE','LIM','CUZ','2017-12-05',5,390.00,NULL,NULL),('SPE-1313','SPE','EJE','LIM','CUZ','2017-12-05',5,340.00,NULL,NULL),('SPE-1319','SPE','ECO','LIM','CUZ','2017-12-05',30,380.00,NULL,NULL),('SPE-1325','SPE','EJE','CUZ','LIM','2017-12-05',5,435.00,NULL,NULL),('SPE-1331','SPE','ECO','CUZ','LIM','2017-12-05',30,400.00,NULL,NULL),('SPE-1337','SPE','EJE','LIM','CUZ','2017-12-06',5,340.00,NULL,NULL),('SPE-1343','SPE','ECO','LIM','CUZ','2017-12-06',30,380.00,NULL,NULL),('SPE-1349','SPE','EJE','CUZ','LIM','2017-12-06',5,435.00,NULL,NULL),('SPE-1355','SPE','ECO','CUZ','LIM','2017-12-06',30,400.00,NULL,NULL),('SPE-1361','SPE','EJE','LIM','CUZ','2017-12-07',5,340.00,NULL,NULL),('SPE-1367','SPE','ECO','LIM','CUZ','2017-12-07',30,380.00,NULL,NULL),('SPE-1373','SPE','EJE','CUZ','LIM','2017-12-07',5,435.00,NULL,NULL),('SPE-1379','SPE','ECO','CUZ','LIM','2017-12-07',30,400.00,NULL,NULL),('SPE-1385','SPE','EJE','LIM','CUZ','2017-12-08',5,340.00,NULL,NULL),('SPE-1391','SPE','ECO','LIM','CUZ','2017-12-08',30,380.00,NULL,NULL),('SPE-1397','SPE','EJE','CUZ','LIM','2017-12-08',5,435.00,NULL,NULL),('SPE-1403','SPE','ECO','CUZ','LIM','2017-12-08',30,400.00,NULL,NULL),('SPE-1409','SPE','EJE','LIM','CUZ','2017-12-09',5,340.00,NULL,NULL),('SPE-1415','SPE','ECO','LIM','CUZ','2017-12-09',30,380.00,NULL,NULL),('SPE-1421','SPE','EJE','CUZ','LIM','2017-12-09',5,435.00,NULL,NULL),('SPE-1427','SPE','ECO','CUZ','LIM','2017-12-09',30,400.00,NULL,NULL),('SPE-1433','SPE','EJE','LIM','CUZ','2017-12-10',5,340.00,NULL,NULL),('SPE-1439','SPE','ECO','LIM','CUZ','2017-12-10',30,380.00,NULL,NULL),('SPE-1445','SPE','EJE','CUZ','LIM','2017-12-10',5,435.00,NULL,NULL),('SPE-1451','SPE','ECO','CUZ','LIM','2017-12-10',30,400.00,NULL,NULL),('SPE-1457','SPE','EJE','LIM','CUZ','2017-12-11',5,340.00,NULL,NULL),('SPE-1463','SPE','ECO','LIM','CUZ','2017-12-11',30,380.00,NULL,NULL),('SPE-1469','SPE','EJE','CUZ','LIM','2017-12-11',5,435.00,NULL,NULL),('SPE-1475','SPE','ECO','CUZ','LIM','2017-12-11',30,400.00,NULL,NULL),('SPE-1481','SPE','EJE','LIM','CUZ','2017-12-12',5,340.00,NULL,NULL),('SPE-1487','SPE','ECO','LIM','CUZ','2017-12-12',30,380.00,NULL,NULL),('SPE-1493','SPE','EJE','CUZ','LIM','2017-12-12',5,435.00,NULL,NULL),('SPE-1499','SPE','ECO','CUZ','LIM','2017-12-12',30,400.00,NULL,NULL),('SPE-4308','SPE','ECO','LIM','CUZ','2017-12-05',30,380.00,NULL,NULL),('SPE-4308','SPE','EJE','LIM','CUZ','2017-12-05',5,340.00,NULL,NULL),('TAC-1314','TAC','EJE','LIM','CUZ','2017-12-05',5,365.00,NULL,NULL),('TAC-1320','TAC','ECO','LIM','CUZ','2017-12-05',30,420.00,NULL,NULL),('TAC-1326','TAC','EJE','CUZ','LIM','2017-12-05',5,385.00,NULL,NULL),('TAC-1332','TAC','ECO','CUZ','LIM','2017-12-05',30,425.00,NULL,NULL),('TAC-1338','TAC','EJE','LIM','CUZ','2017-12-06',5,365.00,NULL,NULL),('TAC-1344','TAC','ECO','LIM','CUZ','2017-12-06',30,420.00,NULL,NULL),('TAC-1350','TAC','EJE','CUZ','LIM','2017-12-06',5,385.00,NULL,NULL),('TAC-1356','TAC','ECO','CUZ','LIM','2017-12-06',30,425.00,NULL,NULL),('TAC-1362','TAC','EJE','LIM','CUZ','2017-12-07',5,365.00,NULL,NULL),('TAC-1368','TAC','ECO','LIM','CUZ','2017-12-07',30,420.00,NULL,NULL),('TAC-1374','TAC','EJE','CUZ','LIM','2017-12-07',5,385.00,NULL,NULL),('TAC-1380','TAC','ECO','CUZ','LIM','2017-12-07',30,425.00,NULL,NULL),('TAC-1386','TAC','EJE','LIM','CUZ','2017-12-08',5,365.00,NULL,NULL),('TAC-1392','TAC','ECO','LIM','CUZ','2017-12-08',30,420.00,NULL,NULL),('TAC-1398','TAC','EJE','CUZ','LIM','2017-12-08',5,385.00,NULL,NULL),('TAC-1404','TAC','ECO','CUZ','LIM','2017-12-08',30,425.00,NULL,NULL),('TAC-1410','TAC','EJE','LIM','CUZ','2017-12-09',5,365.00,NULL,NULL),('TAC-1416','TAC','ECO','LIM','CUZ','2017-12-09',30,420.00,NULL,NULL),('TAC-1422','TAC','EJE','CUZ','LIM','2017-12-09',5,385.00,NULL,NULL),('TAC-1428','TAC','ECO','CUZ','LIM','2017-12-09',30,425.00,NULL,NULL),('TAC-1434','TAC','EJE','LIM','CUZ','2017-12-10',5,365.00,NULL,NULL),('TAC-1440','TAC','ECO','LIM','CUZ','2017-12-10',30,420.00,NULL,NULL),('TAC-1446','TAC','EJE','CUZ','LIM','2017-12-10',5,385.00,NULL,NULL),('TAC-1452','TAC','ECO','CUZ','LIM','2017-12-10',30,425.00,NULL,NULL),('TAC-1458','TAC','EJE','LIM','CUZ','2017-12-11',5,365.00,NULL,NULL),('TAC-1464','TAC','ECO','LIM','CUZ','2017-12-11',30,420.00,NULL,NULL),('TAC-1470','TAC','EJE','CUZ','LIM','2017-12-11',5,385.00,NULL,NULL),('TAC-1476','TAC','ECO','CUZ','LIM','2017-12-11',30,425.00,NULL,NULL),('TAC-1482','TAC','EJE','LIM','CUZ','2017-12-12',5,365.00,NULL,NULL),('TAC-1488','TAC','ECO','LIM','CUZ','2017-12-12',30,420.00,NULL,NULL),('TAC-1494','TAC','EJE','CUZ','LIM','2017-12-12',5,385.00,NULL,NULL),('TAC-1500','TAC','ECO','CUZ','LIM','2017-12-12',30,425.00,NULL,NULL),('TAC-4308','TAC','ECO','LIM','CUZ','2017-12-05',30,420.00,NULL,NULL),('TAC-4308','TAC','EJE','LIM','CUZ','2017-12-05',5,365.00,NULL,NULL);
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

-- Dump completed on 2017-12-05 22:23:09

select * from vuelo where origen = "" or destino = "";

SELECT * FROM vuelo;

SELECT CONCAT('Vuelo|Aerolinea|Clase|Origen|Destino|Precio|Fecha|Asientos¬80|80|80|80|80|80|80|80¬',
IFNULL(GROUP_CONCAT(CONCAT('|',vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, 
vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos)),''))
FROM 
vuelo INNER JOIN 
aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea 
WHERE ( vuelo.origen = 'DES' OR vuelo.destino = 'DES' )
GROUP BY 1;

SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea WHERE ( vuelo.origen = 'null' OR vuelo.destino = 'null' or fechaOrigen = '' ) ;
SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea WHERE  vuelo.origen = 'LIM' OR fechaOrigen = '20171206';
SELECT vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea WHERE  vuelo.destino = 'LIM' or fechaOrigen = 'null';

SET SESSION group_concat_max_len = 2000000;
SELECT 
CONCAT('Sentido|Vuelo|Aerolinea|Clase|Origen|Destino|Precio|Fecha|Asientos¬50|80|80|80|80|80|80|80|80¬',
IFNULL(GROUP_CONCAT(CONCAT_WS('|','IDA',vuelo.idvuelo, aereolinea.nombre, vuelo.clase, 
vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos)),'')) 
FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea 
WHERE ( vuelo.origen = 'LIM' OR vuelo.destino = 'null' OR vuelo.fechaOrigen = 'null' );

SELECT 
IFNULL(GROUP_CONCAT(CONCAT_WS('|','VUELTA',vuelo.idvuelo, aereolinea.nombre, vuelo.clase,
 vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos)),'') 
 FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea 
 WHERE ( vuelo.origen = 'null' OR vuelo.destino = 'LIM' OR vuelo.fechaOrigen = 'null' );

SET GLOBAL group_concat_max_len=2000000;
 
SET SESSION group_concat_max_len = 2000000; SELECT CONCAT('Sentido|Vuelo|Aerolinea|Clase|Origen|Destino|Precio|Fecha|Asientos¬50|80|80|80|80|80|80|80|80¬',IFNULL(GROUP_CONCAT(CONCAT_WS('|','IDA',vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos)),'')) FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea WHERE ( vuelo.origen = 'LIM' OR vuelo.destino = 'null' OR vuelo.fechaOrigen = 'null' ); SET SESSION group_concat_max_len = 2000000; SELECT IFNULL(GROUP_CONCAT(CONCAT_WS('|','VUELTA',vuelo.idvuelo, aereolinea.nombre, vuelo.clase, vuelo.origen, vuelo.destino, vuelo.precio, vuelo.fechaOrigen, vuelo.cantidadAsientos)),'') FROM vuelo INNER JOIN aereolinea ON vuelo.idaereolinea = aereolinea.idaereolinea WHERE ( vuelo.origen = 'null' OR vuelo.destino = 'LIM' OR vuelo.fechaOrigen = 'null' );