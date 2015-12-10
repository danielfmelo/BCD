-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 200.135.233.39    Database: teste
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `Chip`
--

DROP TABLE IF EXISTS `Chip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Chip` (
  `ICCID` bigint(20) unsigned NOT NULL,
  `registro` int(10) unsigned NOT NULL,
  `vinculo` bigint(20) unsigned NOT NULL,
  `associacao` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`ICCID`),
  UNIQUE KEY `ICCID` (`ICCID`),
  UNIQUE KEY `associacao` (`associacao`),
  KEY `fk_vinculo_numero` (`vinculo`),
  KEY `fk_registro_id` (`registro`),
  CONSTRAINT `fk_chip__associacao` FOREIGN KEY (`associacao`) REFERENCES `IMEI` (`numero_IMEI`),
  CONSTRAINT `fk_registro_id` FOREIGN KEY (`registro`) REFERENCES `erb` (`id`),
  CONSTRAINT `fk_vinculo_numero` FOREIGN KEY (`vinculo`) REFERENCES `numero` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Chip`
--

LOCK TABLES `Chip` WRITE;
/*!40000 ALTER TABLE `Chip` DISABLE KEYS */;
/*!40000 ALTER TABLE `Chip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contrato`
--

DROP TABLE IF EXISTS `Contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Contrato` (
  `numero` int(10) unsigned NOT NULL,
  `contratante` smallint(255) unsigned DEFAULT NULL,
  `contratado` tinyint(3) unsigned NOT NULL,
  `plano` smallint(5) unsigned NOT NULL,
  `endereçoCobrança` varchar(50) NOT NULL,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `numero` (`numero`),
  UNIQUE KEY `plano` (`plano`),
  KEY `fk_contratante_id` (`contratante`),
  KEY `fk_contratado_id` (`contratado`),
  CONSTRAINT `fk_plano_numero` FOREIGN KEY (`plano`) REFERENCES `Plano` (`codigo`),
  CONSTRAINT `fk_contratado_id` FOREIGN KEY (`contratado`) REFERENCES `operadora` (`id`),
  CONSTRAINT `fk_contratante_id` FOREIGN KEY (`contratante`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contrato`
--

LOCK TABLES `Contrato` WRITE;
/*!40000 ALTER TABLE `Contrato` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IMEI`
--

DROP TABLE IF EXISTS `IMEI`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IMEI` (
  `numero_IMEI` bigint(20) unsigned NOT NULL,
  `proprietario` smallint(255) unsigned NOT NULL,
  `numeroSerial` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`numero_IMEI`),
  UNIQUE KEY `numero_IMEI` (`numero_IMEI`),
  KEY `fk_proprietario_id` (`proprietario`),
  CONSTRAINT `fk_proprietario_id` FOREIGN KEY (`proprietario`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IMEI`
--

LOCK TABLES `IMEI` WRITE;
/*!40000 ALTER TABLE `IMEI` DISABLE KEYS */;
/*!40000 ALTER TABLE `IMEI` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plano`
--

DROP TABLE IF EXISTS `Plano`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plano` (
  `codigo` smallint(5) unsigned NOT NULL,
  `operadora_P` tinyint(3) unsigned NOT NULL,
  `vigencia` varchar(30) NOT NULL,
  `fidelização` tinyint(3) unsigned DEFAULT NULL,
  `tipo` varchar(10) NOT NULL,
  `cadência` float(6,2) NOT NULL,
  `custoCadencia` float(6,2) NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk_operador_P_id` (`operadora_P`),
  CONSTRAINT `fk_operador_P_id` FOREIGN KEY (`operadora_P`) REFERENCES `operadora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plano`
--

LOCK TABLES `Plano` WRITE;
/*!40000 ALTER TABLE `Plano` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `central`
--

DROP TABLE IF EXISTS `central`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `central` (
  `codigo` tinyint(4) NOT NULL AUTO_INCREMENT,
  `operadora` tinyint(3) unsigned NOT NULL,
  `regiao` varchar(10) DEFAULT NULL,
  `capacidadeDeLigacoes` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo` (`codigo`),
  KEY `fk__operadora_id` (`operadora`),
  CONSTRAINT `fk__operadora_id` FOREIGN KEY (`operadora`) REFERENCES `operadora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `central`
--

LOCK TABLES `central` WRITE;
/*!40000 ALTER TABLE `central` DISABLE KEYS */;
/*!40000 ALTER TABLE `central` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `erb`
--

DROP TABLE IF EXISTS `erb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `erb` (
  `id` int(30) unsigned NOT NULL AUTO_INCREMENT,
  `operadora` tinyint(3) unsigned NOT NULL,
  `qos` smallint(5) unsigned DEFAULT '500',
  `limite` smallint(5) unsigned DEFAULT '2500',
  `area` tinyint(3) unsigned DEFAULT '48',
  `longitude` float(8,6) DEFAULT NULL,
  `latitude` float(9,6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `fk_operadora_id` (`operadora`),
  CONSTRAINT `fk_operadora_id` FOREIGN KEY (`operadora`) REFERENCES `operadora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `erb`
--

LOCK TABLES `erb` WRITE;
/*!40000 ALTER TABLE `erb` DISABLE KEYS */;
/*!40000 ALTER TABLE `erb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `numero`
--

DROP TABLE IF EXISTS `numero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `numero` (
  `numero` bigint(20) unsigned NOT NULL,
  `operadora_` tinyint(3) unsigned NOT NULL,
  `crédito` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`numero`),
  UNIQUE KEY `numero` (`numero`),
  KEY `fk_operadoraNum_id` (`operadora_`),
  CONSTRAINT `fk_operadoraNum_id` FOREIGN KEY (`operadora_`) REFERENCES `operadora` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `numero`
--

LOCK TABLES `numero` WRITE;
/*!40000 ALTER TABLE `numero` DISABLE KEYS */;
INSERT INTO `numero` VALUES (210,2,10);
/*!40000 ALTER TABLE `numero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadora`
--

DROP TABLE IF EXISTS `operadora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operadora` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `cnpj` bigint(20) unsigned NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadora`
--

LOCK TABLES `operadora` WRITE;
/*!40000 ALTER TABLE `operadora` DISABLE KEYS */;
INSERT INTO `operadora` VALUES (1,13246578,'OI'),(2,87654321,'TIM');
/*!40000 ALTER TABLE `operadora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `id_pessoa` smallint(255) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  `documento` varchar(30) NOT NULL,
  `endereço` varchar(100) NOT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-10 19:38:43