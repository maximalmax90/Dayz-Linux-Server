-- MariaDB dump 10.19  Distrib 10.7.3-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: dayz190
-- ------------------------------------------------------
-- Server version	10.7.3-MariaDB-1:10.7.3+maria~focal

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Character_DATA`
--

DROP TABLE IF EXISTS `Character_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Character_DATA` (
  `CharacterID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(32) NOT NULL,
  `InstanceID` int(11) NOT NULL,
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext DEFAULT NULL,
  `Backpack` longtext DEFAULT NULL,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(256) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) unsigned NOT NULL DEFAULT 1,
  `Generation` int(11) unsigned NOT NULL DEFAULT 1,
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) unsigned NOT NULL DEFAULT 0,
  `HeadshotsZ` int(11) unsigned NOT NULL DEFAULT 0,
  `DistanceFoot` int(11) NOT NULL DEFAULT 0,
  `Duration` int(11) unsigned NOT NULL DEFAULT 0,
  `CurrentState` varchar(128) NOT NULL DEFAULT '[]',
  `KillsH` int(11) unsigned NOT NULL DEFAULT 0,
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) unsigned NOT NULL DEFAULT 0,
  `Humanity` int(11) NOT NULL DEFAULT 2500,
  PRIMARY KEY (`CharacterID`),
  KEY `CharFetch` (`PlayerUID`,`Alive`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Character_DATA`
--

LOCK TABLES `Character_DATA` WRITE;
/*!40000 ALTER TABLE `Character_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `Character_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Character_DEAD`
--

DROP TABLE IF EXISTS `Character_DEAD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Character_DEAD` (
  `CharacterID` int(11) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(11) NOT NULL DEFAULT 0,
  `PlayerUID` varchar(45) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT 0,
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext DEFAULT NULL,
  `Backpack` longtext DEFAULT NULL,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Medical` varchar(200) NOT NULL DEFAULT '[]',
  `Alive` tinyint(4) NOT NULL DEFAULT 1,
  `Generation` int(11) NOT NULL DEFAULT 1,
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) NOT NULL DEFAULT 0,
  `HeadshotsZ` int(11) NOT NULL DEFAULT 0,
  `distanceFoot` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL DEFAULT 0,
  `currentState` varchar(100) NOT NULL DEFAULT '[]',
  `KillsH` int(11) NOT NULL DEFAULT 0,
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) NOT NULL DEFAULT 0,
  `Humanity` int(11) NOT NULL DEFAULT 2500,
  `last_updated` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerID` (`PlayerID`),
  KEY `Alive_PlayerID` (`Alive`,`LastLogin`,`PlayerID`),
  KEY `PlayerUID` (`PlayerUID`),
  KEY `Alive_PlayerUID` (`Alive`,`LastLogin`,`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Character_DEAD`
--

LOCK TABLES `Character_DEAD` WRITE;
/*!40000 ALTER TABLE `Character_DEAD` DISABLE KEYS */;
/*!40000 ALTER TABLE `Character_DEAD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Object_CLASSES`
--

DROP TABLE IF EXISTS `Object_CLASSES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Object_CLASSES` (
  `Classname` varchar(32) NOT NULL DEFAULT '',
  `Chance` varchar(4) NOT NULL DEFAULT '0',
  `MaxNum` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `Damage` varchar(20) NOT NULL DEFAULT '0',
  `Type` text NOT NULL,
  PRIMARY KEY (`Classname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Object_CLASSES`
--

LOCK TABLES `Object_CLASSES` WRITE;
/*!40000 ALTER TABLE `Object_CLASSES` DISABLE KEYS */;
INSERT INTO `Object_CLASSES` VALUES
('ATV_CZ_EP1','0.70',6,'0.05000','atv'),
('car_hatchback','0.73',3,'0.05000','car'),
('datsun1_civil_3_open','0.75',3,'0.05000','car'),
('Fishing_Boat','0.61',1,'0.05000','largeboat'),
('S1203_TK_CIV_EP1','0.69',1,'0.05000','bus'),
('tractor','0.7',1,'0.05000','farmvehicle'),
('BAF_Offroad_D','0.54',1,'0.05000','car'),
('UAZ_Unarmed_TK_EP1','0.7',2,'0.05000','car'),
('UH1H_DZ','0.59',2,'0.05000','helicopter'),
('UralCivil2','0.67',1,'0.05000','truck'),
('V3S_Civ','0.66',1,'0.05000','truck'),
('Volha_2_TK_CIV_EP1','0.71',2,'0.05000','car'),
('Ikarus','0.59',1,'0.05000','bus'),
('ATV_US_EP1','0.70',5,'0.05000','atv'),
('BAF_Offroad_W','0.54',1,'0.05000','car'),
('car_sedan','0.59',1,'0.05000','car'),
('hilux1_civil_1_open','0.59',1,'0.05000','car'),
('hilux1_civil_2_covered','0.59',1,'0.05000','car'),
('hilux1_civil_3_open','0.59',1,'0.05000','car'),
('Ikarus_TK_CIV_EP1','0.59',1,'0.05000','bus'),
('LandRover_TK_CIV_EP1','0.59',1,'0.05000','car'),
('MH6J_EP1','0.32',1,'0.05000','helicopter'),
('Old_bike_TK_CIV_EP1','0.64',4,'0.05000','bike'),
('Old_bike_TK_INS_EP1','0.64',4,'0.05000','bike'),
('PBX','0.59',1,'0.05000','smallboat'),
('Skoda','0.68',4,'0.05000','car'),
('SkodaBlue','0.68',2,'0.05000','car'),
('SkodaGreen','0.68',1,'0.05000','car'),
('Smallboat_1','0.59',2,'0.05000','mediumboat'),
('Smallboat_2','0.59',2,'0.05000','mediumboat'),
('SUV_DZ','0.59',1,'0.05000','car'),
('TentStorage','0.59',0,'0.05000','tent'),
('TT650_Ins','0.72',1,'0.05000','motorcycle'),
('TT650_TK_CIV_EP1','0.72',1,'0.05000','motorcycle'),
('TT650_TK_EP1','0.72',1,'0.05000','motorcycle'),
('UAZ_INS','0.59',2,'0.05000','car'),
('UAZ_RU','0.59',1,'0.05000','car'),
('UAZ_Unarmed_TK_CIV_EP1','0.59',3,'0.05000','car'),
('UAZ_Unarmed_UN_EP1','0.59',1,'0.05000','car'),
('UralCivil','0.59',1,'0.05000','truck'),
('Mi17_DZ','0.49',2,'0.05000','helicopter'),
('AN2_DZ','1',1,'0.05000','plane'),
('Hedgehog_DZ','0',0,'0','Hedgehog'),
('Wire_cat1','0',0,'0','wire'),
('Sandbag1_DZ','0',0,'0','Sandbag'),
('AH6X_DZ','0.48',1,'0.05000','helicopter'),
('datsun1_civil_1_open','0.59',2,'0.05000','car'),
('Lada1_TK_CIV_EP1','0.59',3,'0.05000','car'),
('M1030','0.58',2,'0.05000','motorcycle'),
('SUV_TK_EP1','0.39',1,'0.05000','car'),
('VolhaLimo_TK_CIV_EP1','0.49',1,'0.05000','car'),
('Lada2','0.59',2,'0','car'),
('hilux1_civil_3_open_EP1','0.59',3,'0','car'),
('LandRover_CZ_EP1','0.59',3,'0','car'),
('HMMWV','0.21',2,'0','car'),
('MH6J_DZ','0.48',1,'0.05000','helicopter'),
('StashSmall','0',0,'0','StashSmall'),
('StashMedium','0',0,'0','StashMedium');
/*!40000 ALTER TABLE `Object_CLASSES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Object_DATA`
--

DROP TABLE IF EXISTS `Object_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Object_DATA` (
  `ObjectID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT 0,
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) unsigned NOT NULL DEFAULT 0,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext DEFAULT NULL,
  `Hitpoints` varchar(512) NOT NULL DEFAULT '[]',
  `Fuel` double(13,5) NOT NULL DEFAULT 1.00000,
  `Damage` double(13,5) NOT NULL DEFAULT 0.00000,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ObjectID`),
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Object_DATA`
--

LOCK TABLES `Object_DATA` WRITE;
/*!40000 ALTER TABLE `Object_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `Object_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Object_SPAWNS`
--

DROP TABLE IF EXISTS `Object_SPAWNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Object_SPAWNS` (
  `ObjectUID` bigint(20) NOT NULL DEFAULT 0,
  `Classname` varchar(32) DEFAULT NULL,
  `Worldspace` varchar(64) DEFAULT NULL,
  `Inventory` longtext DEFAULT NULL,
  `Hitpoints` varchar(999) NOT NULL DEFAULT '[]',
  `MapID` varchar(255) NOT NULL DEFAULT '',
  `Last_changed` int(10) DEFAULT NULL,
  PRIMARY KEY (`ObjectUID`,`MapID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Object_SPAWNS`
--

LOCK TABLES `Object_SPAWNS` WRITE;
/*!40000 ALTER TABLE `Object_SPAWNS` DISABLE KEYS */;
INSERT INTO `Object_SPAWNS` VALUES
(30728533,'UAZ_Unarmed_TK_EP1','[0,[12140.168, 12622.802,0]]','[[[], []], [[\"20Rnd_762x51_DMR\"], [5]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(26883451,'UAZ_Unarmed_TK_CIV_EP1','[0,[6279.4966, 7810.3691,0]]','[[[], []], [[\"10Rnd_127x99_m107\"], [5]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(42231659,'UAZ_Unarmed_UN_EP1','[45,[6865.2432,2481.6943,0]]','[[[], []], [[\"30Rnd_556x45_StanagSD\"], [5]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(30507947,'UAZ_RU','[157,[3693.0386, 5969.1489,0]]','[[[], []], [[\"HandGrenade_west\"], [2]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(25844760,'UAZ_Unarmed_TK_CIV_EP1','[20,[13264.081,12167.432,0]]','[[[], []], [[\"10Rnd_127x99_m107\"], [5]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(37699964,'UAZ_Unarmed_TK_CIV_EP1','[223,[4817.6572, 2556.5034,0]]','[[[], []], [[\"10Rnd_127x99_m107\"], [5]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(10965544,'UAZ_Unarmed_TK_EP1','[337,[8120.3057,9305.4912,0]]','[[[], []], [[\"20Rnd_762x51_DMR\"], [5]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(41727833,'ATV_US_EP1','[337,[3312.2793,11270.755,0]]','[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(75742533,'ATV_US_EP1','[50,[3684.0366, 5999.0117,0]]','[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(53529173,'ATV_CZ_EP1','[202,[11464.035, 11381.071,0]]','[[[], []], [[\"Skin_Camo1_DZ\", \"ItemCompass\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(40418266,'ATV_US_EP1','[253,[11459.299,11386.546,0]]','[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(41503818,'ATV_CZ_EP1','[335,[8856.8359,2893.7903,0]]','[[[], []], [[\"Skin_Camo1_DZ\", \"ItemCompass\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(86264294,'SkodaBlue','[353,[12869.565,4450.4077,0]]','[[[], []], [[\"ItemWatch\", \"ItemKnife\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(6810018,'Skoda','[223,[6288.416, 7834.3521,0]]','[[[\"Binocular\"], [1]], [[], []], [[\"CZ_VestPouch_EP1\"], [1]]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(75257214,'SkodaGreen','[306,[8125.7075,3166.3708,0]]','[[[], []], [[\"ItemMatchbox\", \"ItemMap\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(55856021,'ATV_US_EP1','[284,[8854.9082,2891.5762,0]]','[[[], []], [[\"ItemTent\", \"ItemMatchbox\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(53508464,'TT650_Ins','[291,[11945.78,9099.3633,0]]','[[[], []], [[\"ItemJerrycan\"], [1]], [[], []]]','[[\"motor\",1]]','',NULL),
(99974261,'TT650_TK_EP1','[151,[6592.686,2906.8245,0]]','[[[], []], [[\"PartGeneric\"], [1]], [[], []]]','[[\"motor\",1]]','',NULL),
(39345918,'TT650_TK_CIV_EP1','[372,[8762.8516, 11727.877,0]]','[[[], []], [[\"PartWheel\"], [1]], [[], []]]','[[\"motor\",1]]','',NULL),
(96806808,'TT650_TK_CIV_EP1','[52,[8713.4893, 7103.0518,0]]','[[[], []], [[\"PartWheel\"], [1]], [[], []]]','[[\"motor\",1]]','',NULL),
(65996290,'Old_bike_TK_CIV_EP1','[50,[8040.6777, 7086.5356,0]]','[]','[]','',NULL),
(39561031,'Old_bike_TK_CIV_EP1','[316,[7943.5068,6988.1763,0]]','[]','[]','',NULL),
(99816288,'Old_bike_TK_INS_EP1','[201,[8070.6958, 3358.7793,0]]','[]','[]','',NULL),
(80398351,'Old_bike_TK_INS_EP1','[179,[3474.3989, 2562.4915,0]]','[]','[]','',NULL),
(2542893,'Old_bike_TK_INS_EP1','[236,[1773.9318,2351.6221,0]]','[]','[]','',NULL),
(71519415,'Old_bike_TK_CIV_EP1','[236,[3699.9189,2474.2119,0]]','[]','[]','',NULL),
(49968400,'Old_bike_TK_CIV_EP1','[73,[8350.0947, 2480.542,0]]','[]','[]','',NULL),
(35283758,'Old_bike_TK_INS_EP1','[35,[8345.7227, 2482.6855,0]]','[]','[]','',NULL),
(26513596,'Old_bike_TK_CIV_EP1','[23,[3203.0916, 3988.6379,0]]','[]','[]','',NULL),
(26716708,'Old_bike_TK_INS_EP1','[191,[2782.7134,5285.5342,0]]','[]','[]','',NULL),
(54042757,'Old_bike_TK_INS_EP1','[155,[8680.75,2445.5315,0]]','[]','[]','',NULL),
(90063662,'Old_bike_TK_CIV_EP1','[155,[12158.999,3468.7563,0]]','[]','[]','',NULL),
(88190045,'Old_bike_TK_INS_EP1','[250,[11984.01,3835.9231,0]]','[]','[]','',NULL),
(70759242,'Old_bike_TK_CIV_EP1','[255,[10153.068,2219.3547,0]]','[]','[]','',NULL),
(89226080,'UH1H_DZ2','[60,[11279.154,4296.0205,0]]','[[[], []], [[\"ItemSodaMtngreen\",\"ItemSodaMtngreenEmpty\"], [1, 2]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(33852678,'UH1H_DZ','[133,[4211.8789,10735.168,0]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(1585150,'UH1H_DZ','[52,[6874.0503,11432.864,0]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(6367723,'UH1H_DZ','[58,[10571.7,2220.3101,0.0015564]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(27083167,'UH1H_DZ','[359,[6377.8799,2757.8899,-0.048767101]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(16312671,'hilux1_civil_3_open','[344,[2045.3989,7267.4165,0]]','[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(313856,'hilux1_civil_3_open','[133,[8310.9902, 3348.3579,0]]','[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(52631272,'hilux1_civil_3_open','[124,[11309.963, 6646.3989,0]]','[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(62214795,'hilux1_civil_3_open','[6,[11240.744, 5370.6128,0]]','[[[], []], [[\"PartFueltank\", \"PartWheel\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(53180164,'Ikarus_TK_CIV_EP1','[230,[3762.5764,8736.1709,0]]','[[[], []], [[\"ItemWatch\", \"ItemSodaPepsi\"], [1, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(79256439,'Ikarus','[279,[10628.433,8037.8188,0]]','[[[], []], [[\"PartWheel\", \"ItemSodaCoke\"], [1, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(36741707,'Ikarus','[245,[4580.3203,4515.9282,0]]','[[[], []], [[\"PartWheel\", \"ItemSodaCoke\"], [1, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(45939219,'Ikarus_TK_CIV_EP1','[333,[6040.0923,7806.5439,0]]','[[[], []], [[\"ItemWatch\", \"ItemSodaPepsi\"], [1, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(19470979,'Ikarus','[76,[10314.745, 2147.5374,0]]','[[[], []], [[\"PartWheel\", \"ItemSodaCoke\"], [1, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(59537240,'Ikarus_TK_CIV_EP1','[59,[6705.8887, 2991.9358,0]]','[[[], []], [[\"ItemWatch\", \"ItemSodaPepsi\"], [1, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(39273268,'Tractor','[195,[9681.8213,8947.2354,0]]','[[[], []], [[\"ItemWire\", \"ItemJerrycan\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(17754622,'Tractor','[262,[3825.1318,8941.4873,0]]','[[[], []], [[\"ItemWire\", \"ItemJerrycan\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(70953310,'Tractor','[19,[11246.52, 7534.7954,0]]','[[[], []], [[\"ItemWire\", \"ItemJerrycan\"], [1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(1502689,'S1203_TK_CIV_EP1','[19,[11066.828,7915.2275,0]]','[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(94653519,'S1203_TK_CIV_EP1','[352,[12058.555,3577.8667,0]]','[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(68759530,'S1203_TK_CIV_EP1','[218,[11940.854, 8872.8389,0]]','[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(59837095,'S1203_TK_CIV_EP1','[346,[13386.471,6604.0098,0]]','[[[\"Makarov\"], [1]], [[\"FoodCanBakedBeans\"], [3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(92906892,'V3S_Civ','[178,[13276.482, 6098.4463,0]]','[[[\"MR43\"], [1]], [[\"PartEngine\"], [1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(85023176,'UralCivil','[338,[1890.9952,12417.333,0]]','[[[], []], [[\"PartWheel\", \"ItemToolbox\", \"ItemTankTrap\"], [1, 1, 1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(46395206,'car_hatchback','[226,[1975.1283, 9150.0195,0]]','[[[\"LeeEnfield\"], [1]], [[\"5x_22_LR_17_HMR\"], [3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(76906508,'car_hatchback','[315,[7429.4849,5157.8682,0]]','[[[\"LeeEnfield\"], [1]], [[\"5x_22_LR_17_HMR\"], [3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(45346927,'Fishing_Boat','[315,[8317.2676,2348.6055,0]]','[]','[[\"motor\",1]]','',NULL),
(96015113,'Fishing_Boat','[315,[13222.181,10015.431,0]]','[]','[[\"motor\",1]]','',NULL),
(44034787,'PBX','[55,[13454.882, 13731.796,0]]','[[[], []], [[\"ItemFlashlightRed\"], [1]], [[\"DZ_Backpack_EP1\"], [1]]]','[[\"motor\",1]]','',NULL),
(32128600,'Smallboat_1','[245,[14417.589,12886.104,0]]','[]','[[\"motor\",1]]','',NULL),
(28538641,'Smallboat_1','[268,[13098.13, 8250.8828,0]]','[]','[[\"motor\",1]]','',NULL),
(46307410,'Volha_2_TK_CIV_EP1','[205,[9731.1514,8937.7998,0]]','[[[], []], [[\"ItemSodaPepsi\", \"FoodCanFrankBeans\"], [3, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(45921132,'Volha_1_TK_CIV_EP1','[337,[9715.0352,6522.8286,0]]','[[[], []], [[\"ItemSodaCoke\", \"FoodCanBakedBeans\"], [3, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(90683431,'Volha_1_TK_CIV_EP1','[241,[2614.0862,5079.6357,0]]','[[[], []], [[\"ItemSodaCoke\", \"FoodCanBakedBeans\"], [3, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(15653764,'Volha_2_TK_CIV_EP1','[18,[10827.634, 2701.5688,0]]','[[[], []], [[\"ItemSodaPepsi\", \"FoodCanFrankBeans\"], [3, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(6218531,'Volha_1_TK_CIV_EP1','[222,[5165.7231,2375.7642,0]]','[[[], []], [[\"ItemSodaCoke\", \"FoodCanBakedBeans\"], [3, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(84131366,'Volha_2_TK_CIV_EP1','[207,[1740.8503,3622.6938,0]]','[[[], []], [[\"ItemSodaPepsi\", \"FoodCanFrankBeans\"], [3, 3]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(2001240,'SUV_DZ','[266,[9157.8408, 11019.819,0]]','[[[], []], [[\"Pipebomb\"], [1]], [[], []]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(57612106,'car_sedan','[222,[12360.468, 10817.882,0]]','[[[], []], [[\"ItemFlashlight\", \"ItemMap\"], [1, 1]], [[\"DZ_ALICE_Pack_EP1\"], [1]]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL),
(82056815,'UH1H_DZ','[310,[6365.7402,7795.3501,-0.048767101]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(37447759,'UH1H_DZ','[14,[13308.511,3227.0215,0]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(41068355,'UH1H_DZ','[265,[7695.0356,3991.2056,0]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(92998502,'UH1H_DZ','[22,[12009.904,12636.732,0]]','[[[], []], [[\"ItemSodaCoke\"], [5]], [[], []]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(41787450,'AH6X_DZ','[2,[12010.7,12637.2,0]]','[[[\"Binocular\"],[1]],[[\"TrashJackDaniels\",\"FoodCanFrankBeans\"],[1,1]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]','',NULL),
(29941745,'AH6X_DZ','[113,[6880.2007,11454.291,0]]','[[[\"Binocular\"],[1]],[[\"TrashJackDaniels\",\"FoodCanFrankBeans\"],[1,1]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]','',NULL),
(24346379,'Mi17_DZ','[156,[7660.271,3982.0063,0]]','[[[],[]],[[\"ItemSodaMdew\"],[2]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]','',NULL),
(31906663,'Mi17_DZ','[-188,[7220.6538,9116.3428,0]]','[[[],[]],[[\"ItemSodaMdew\"],[2]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]','',NULL),
(86494184,'Mi17_DZ','[4,[13584.044,3199.9648,0]]','[[[],[]],[[\"ItemSodaMdew\"],[2]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"glass4\",1],[\"glass5\",1],[\"NEtrup\",1.1998],[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1],[\"munice\",1.07084],[\"sklo predni P\",1.04818],[\"sklo predni L\",1.11816],[\"glass6\",1.0402]]','',NULL),
(36750931,'AN2_DZ','[252,[4530.52,10785.1,0]]','[]','[]','',NULL),
(24272110,'BAF_Offroad_D','[162,[3702.04,6044.3101,0]]','[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]','',NULL),
(11107760,'BAF_Offroad_D','[141,[11953.279,9107.3896,0]]','[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]','',NULL),
(82722474,'BAF_Offroad_W','[71,[3708.5,5999.4199,0]]','[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]','',NULL),
(80289092,'BAF_Offroad_W','[322,[7201.5181,3034.3232,0]]','[[[],[]],[[\"HandGrenade_West\",\"SmokeShell\",\"SmokeShellRed\",\"SmokeShellYellow\",\"SmokeShellGreen\",\"ItemWaterbottle\",\"30Rnd_556x45_Stanag\",\"20Rnd_762x51_DMR\",\"ItemTent\"],[10,1,1,1,1,1,20,10,1]],[[],[]]]','[[\"glass1\",1],[\"glass2\",1],[\"glass3\",1],[\"motor\",0.8],[\"palivo\",0.8],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1],[\"sklo predni P\",1],[\"sklo predni L\",1],[\"karoserie\",1],[\"wheel_1_4_steering\",1],[\"wheel_2_4_steering\",1],[\"wheel_1_3_steering\",1],[\"wheel_2_3_steering\",1],[\"glass4\",1]]','',NULL),
(53278043,'MH6J_DZ','[122,[10137.868,12049.376,-6.1035156e-005]]','[[[],[]],[[\"1Rnd_Smoke_M203\", \"7Rnd_45ACP_1911\", \"30Rnd_556x45_StanagSD\", \"200Rnd_556x45_M249\", \"FoodCanPasta\", \"15Rnd_W1866_Slug\", \"5x_22_LR_17_HMR\", \"15Rnd_9x19_M9SD\", \"17Rnd_9x19_glock17\", \"100Rnd_762x51_M240\", \"6Rnd_45ACP\", \"8Rnd_9x18_Makarov\"],[2,1,1,1,1,1,1,1,1,1,1,1]],[[\"DZ_Backpack_EP1\"],[1]]]','[[\"motor\",1],[\"elektronika\",1],[\"mala vrtule\",1],[\"velka vrtule\",1]]','',NULL),
(25522943,'HMMWV_DZ','[0,[13441.056,12003.912,4.5776367e-005]]','[[[\"AK_47_M\"],[1]],[[\"PartWoodPile\", \"ItemBandage\", \"HandGrenade_west\", \"6Rnd_45ACP\", \"ItemEpinephrine\", \"8Rnd_B_Beneli_74Slug\", \"HandChemBlue\", \"8Rnd_B_Beneli_Pellets\", \"PartEngine\", \"17Rnd_9x19_glock17\", \"ItemTent\"],[1,2,1,1,1,1,1,1,1,1,1]],[[\"DZ_CivilBackpack_EP1\"],[1]]]','[[\"palivo\",1],[\"motor\",1],[\"karoserie\",1],[\"wheel_1_1_steering\",1],[\"wheel_1_2_steering\",1],[\"wheel_2_1_steering\",1],[\"wheel_2_2_steering\",1]]','',NULL);
/*!40000 ALTER TABLE `Object_SPAWNS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Object_init_DATA`
--

DROP TABLE IF EXISTS `Object_init_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Object_init_DATA` (
  `ObjectID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ObjectUID` bigint(20) NOT NULL DEFAULT 0,
  `Instance` int(11) NOT NULL,
  `Classname` varchar(50) DEFAULT NULL,
  `Datestamp` datetime NOT NULL,
  `CharacterID` int(11) unsigned NOT NULL DEFAULT 0,
  `Worldspace` varchar(70) NOT NULL DEFAULT '[]',
  `Inventory` longtext DEFAULT NULL,
  `Hitpoints` varchar(512) NOT NULL DEFAULT '[]',
  `Fuel` double(13,5) NOT NULL DEFAULT 1.00000,
  `Damage` double(13,5) NOT NULL DEFAULT 0.00000,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ObjectID`),
  KEY `ObjectUID` (`ObjectUID`),
  KEY `Instance` (`Instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Object_init_DATA`
--

LOCK TABLES `Object_init_DATA` WRITE;
/*!40000 ALTER TABLE `Object_init_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `Object_init_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player_DATA`
--

DROP TABLE IF EXISTS `Player_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Player_DATA` (
  `PlayerUID` varchar(32) NOT NULL,
  `PlayerName` varchar(128) NOT NULL,
  `PlayerMorality` int(11) NOT NULL DEFAULT 0,
  `PlayerSex` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player_DATA`
--

LOCK TABLES `Player_DATA` WRITE;
/*!40000 ALTER TABLE `Player_DATA` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player_DATA` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Player_LOGIN`
--

DROP TABLE IF EXISTS `Player_LOGIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Player_LOGIN` (
  `LoginID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(32) NOT NULL,
  `CharacterID` int(11) unsigned NOT NULL,
  `Datestamp` datetime NOT NULL,
  `Action` tinyint(3) NOT NULL,
  PRIMARY KEY (`LoginID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Player_LOGIN`
--

LOCK TABLES `Player_LOGIN` WRITE;
/*!40000 ALTER TABLE `Player_LOGIN` DISABLE KEYS */;
/*!40000 ALTER TABLE `Player_LOGIN` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_scheduler`
--

DROP TABLE IF EXISTS `event_scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_scheduler` (
  `System` text DEFAULT NULL,
  `LastRun` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_scheduler`
--

LOCK TABLES `event_scheduler` WRITE;
/*!40000 ALTER TABLE `event_scheduler` DISABLE KEYS */;
INSERT INTO `event_scheduler` VALUES
('3hRespawns',NULL),
('pCleanup',NULL),
('pMain',NULL),
('3hRespawns',NULL),
('pCleanup',NULL),
('pCleanupBase',NULL),
('pMain',NULL),
('3hRespawns',NULL),
('pCleanup',NULL),
('pCleanupBase',NULL),
('pMain',NULL),
('3hRespawns',NULL),
('pCleanup',NULL),
('pCleanupBase',NULL),
('pMain',NULL),
('3hRespawns',NULL),
('pCleanup',NULL),
('pCleanupBase',NULL),
('pMain',NULL);
/*!40000 ALTER TABLE `event_scheduler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_groups`
--

DROP TABLE IF EXISTS `vehicle_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_groups` (
  `ID` int(11) NOT NULL,
  `MaxNum` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='0 Helicopters\r\n1 Military cars (Landrover W, Landrover D, HMMWV)\r\n2 Armed cars\r\n3 Bikes\r\n4 Trucks\r\n5 Buses\r\n6 Civilian cars\r\n7 Civilian cars high end\r\n8 Civilian cars low end\r\n9 AN-2\r\n10 UH-1H';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_groups`
--

LOCK TABLES `vehicle_groups` WRITE;
/*!40000 ALTER TABLE `vehicle_groups` DISABLE KEYS */;
INSERT INTO `vehicle_groups` VALUES
(0,4),
(1,3),
(2,2),
(3,8),
(4,2),
(5,2),
(6,15),
(9,1),
(10,2);
/*!40000 ALTER TABLE `vehicle_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_hitpoints`
--

DROP TABLE IF EXISTS `vehicle_hitpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_hitpoints` (
  `ID` int(11) NOT NULL,
  `PartName` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinDamage` double(20,10) NOT NULL DEFAULT 0.5000000000,
  `MaxDamage` double(20,10) NOT NULL DEFAULT 1.0000000000,
  PRIMARY KEY (`ID`,`PartName`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_hitpoints`
--

LOCK TABLES `vehicle_hitpoints` WRITE;
/*!40000 ALTER TABLE `vehicle_hitpoints` DISABLE KEYS */;
INSERT INTO `vehicle_hitpoints` VALUES
(1,'palivo',0.6000000000,0.8000000000),
(1,'motor',0.6000000000,0.8000000000),
(1,'karoserie',0.6000000000,1.0000000000),
(1,'wheel_1_1_steering',0.6000000000,1.0000000000),
(1,'wheel_1_2_steering',0.6000000000,1.0000000000),
(1,'wheel_2_1_steering',0.6000000000,1.0000000000),
(1,'wheel_2_2_steering',0.6000000000,1.0000000000),
(2,'motor',0.6000000000,0.8000000000),
(3,'motor',0.6000000000,0.8000000000),
(3,'elektronika',0.6000000000,1.0000000000),
(3,'mala vrtule',0.6000000000,1.0000000000),
(3,'velka vrtule',0.6000000000,1.0000000000),
(4,'glass1',0.6000000000,1.0000000000),
(4,'glass2',0.6000000000,1.0000000000),
(4,'glass3',0.6000000000,1.0000000000),
(4,'glass4',0.6000000000,1.0000000000),
(4,'glass5',0.6000000000,1.0000000000),
(4,'NEtrup',0.6000000000,1.0000000000),
(4,'motor',0.6000000000,0.8000000000),
(4,'elektronika',0.6000000000,1.0000000000),
(4,'mala vrtule',0.6000000000,1.0000000000),
(4,'velka vrtule',0.6000000000,1.0000000000),
(4,'munice',0.6000000000,1.0000000000),
(4,'sklo predni P',0.6000000000,1.0000000000),
(4,'sklo predni L',0.6000000000,1.0000000000),
(4,'glass6',0.6000000000,1.0000000000),
(5,'glass1',0.6000000000,1.0000000000),
(5,'glass2',0.6000000000,1.0000000000),
(5,'glass3',0.6000000000,1.0000000000),
(5,'motor',0.6000000000,0.8000000000),
(5,'palivo',0.6000000000,0.8000000000),
(5,'wheel_1_1_steering',0.6000000000,1.0000000000),
(5,'wheel_1_2_steering',0.6000000000,1.0000000000),
(5,'wheel_2_1_steering',0.6000000000,1.0000000000),
(5,'wheel_2_2_steering',0.6000000000,1.0000000000),
(5,'sklo predni P',0.6000000000,1.0000000000),
(5,'sklo predni L',0.6000000000,1.0000000000),
(5,'karoserie',0.6000000000,1.0000000000),
(5,'wheel_1_4_steering',0.6000000000,1.0000000000),
(5,'wheel_2_4_steering',0.6000000000,1.0000000000),
(5,'wheel_1_3_steering',0.6000000000,1.0000000000),
(5,'wheel_2_3_steering',0.6000000000,1.0000000000),
(5,'glass4',0.6000000000,1.0000000000),
(6,'glass1',0.6000000000,1.0000000000),
(6,'glass2',0.6000000000,1.0000000000),
(6,'glass3',0.6000000000,1.0000000000),
(6,'motor',0.6000000000,0.8000000000),
(6,'palivo',0.6000000000,0.8000000000),
(6,'wheel_1_1_steering',0.6000000000,1.0000000000),
(6,'wheel_1_2_steering',0.6000000000,1.0000000000),
(6,'wheel_2_1_steering',0.6000000000,1.0000000000),
(6,'wheel_2_2_steering',0.6000000000,1.0000000000),
(6,'karoserie',0.6000000000,1.0000000000),
(6,'glass4',0.6000000000,1.0000000000);
/*!40000 ALTER TABLE `vehicle_hitpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_inventory`
--

DROP TABLE IF EXISTS `vehicle_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_inventory` (
  `ID` int(11) NOT NULL,
  `Type` enum('Backpack','Magazine','Weapon') CHARACTER SET latin1 NOT NULL DEFAULT 'Magazine',
  `Classname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `MinAmount` tinyint(3) NOT NULL DEFAULT 1,
  `MaxAmount` tinyint(3) NOT NULL DEFAULT 1,
  `Chance` double(20,10) NOT NULL DEFAULT 1.0000000000,
  PRIMARY KEY (`ID`,`Type`,`Classname`),
  KEY `ObjectUID` (`ID`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_inventory`
--

LOCK TABLES `vehicle_inventory` WRITE;
/*!40000 ALTER TABLE `vehicle_inventory` DISABLE KEYS */;
INSERT INTO `vehicle_inventory` VALUES
(30728533,'Magazine','20Rnd_762x51_DMR',2,4,1.0000000000),
(30728533,'Weapon','DMR_DZ',1,1,0.0500000000),
(26883451,'Magazine','20Rnd_762x51_DMR',1,3,1.0000000000),
(26883451,'Magazine','5x_22_LR_17_HMR',2,5,1.0000000000),
(26883451,'Weapon','huntingrifle',1,1,0.8000000000),
(42231659,'Magazine','30Rnd_556x45_StanagSD',2,5,1.0000000000),
(42231659,'Weapon','M4A1_Aim_SD_Camo',1,1,0.2000000000),
(30507947,'Magazine','HandGrenade_west',1,2,0.5000000000),
(30507947,'Magazine','30Rnd_545x39_AK',2,4,1.0000000000),
(30507947,'Weapon','AK_74',1,1,0.5000000000),
(25844760,'Magazine','20Rnd_762x51_DMR',1,3,1.0000000000),
(25844760,'Weapon','MeleeMachete',1,1,0.9000000000),
(25844760,'Weapon','LeeEnfield',1,1,0.7000000000),
(25844760,'Magazine','10x_303',1,3,1.0000000000);
/*!40000 ALTER TABLE `vehicle_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_locations`
--

DROP TABLE IF EXISTS `vehicle_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_locations` (
  `ID` int(11) NOT NULL,
  `Worldspace` varchar(255) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ID`,`Worldspace`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='0 ATV\r\n1 Motorcycle\r\n2 Huey\r\n4 Mi-17\r\n3 Little bird\r\n5 AN-2\r\n6 Bike\r\n7 Military car (Landrover, HMMWV, Camo UAZs, Armed pickups)\r\n10 Civilian car (including SUV)\r\n11 Bus\r\n12 Tractor\r\n13 Truck\r\n14 Boat';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_locations`
--

LOCK TABLES `vehicle_locations` WRITE;
/*!40000 ALTER TABLE `vehicle_locations` DISABLE KEYS */;
INSERT INTO `vehicle_locations` VALUES
(0,'[126,[6556.34,5621.66,0]]'),
(0,'[166,[8316.43,7497.42,0]]'),
(0,'[202,[11464.035, 11381.071,0]]'),
(0,'[253,[11459.299,11386.546,0]]'),
(0,'[284,[8854.9082,2891.5762,0]]'),
(0,'[300,[9047.57,4480.17,0]]'),
(0,'[335,[8856.8359,2893.7903,0]]'),
(0,'[337,[3312.2793,11270.755,0]]'),
(0,'[50,[3684.0366, 5999.0117,0]]'),
(1,'[151,[6592.686,2906.8245,0]]'),
(1,'[213,[9515.67,7222.07,0]]'),
(1,'[291,[11945.78,9099.3633,0]]'),
(1,'[372,[8762.8516, 11727.877,0]]'),
(1,'[52,[8713.4893, 7103.0518,0]]'),
(2,'[0,[9837.5,3860.2,0]]'),
(2,'[133,[4211.8789,10735.168,0]]'),
(2,'[156,[7660.271,3982.0063,0]]'),
(2,'[172,[7220.6538,9116.3428,0]]'),
(2,'[181,[10153.5,12026.8,0]]'),
(2,'[2,[12010.7,12637.2,0]]'),
(2,'[240,[4871.19,10176.2,0]]'),
(2,'[241,[4811.56,9603.77,0]]'),
(2,'[310,[6365.7402,7795.3501,0]]'),
(2,'[37,[6366.01,2774.14,0]]'),
(2,'[60,[11279.154,4296.0205,0]]'),
(2,'[62,[13307,3231.95,0]]'),
(2,'[67,[10587.8,2188.25,0]]'),
(2,'[72,[6886.53,11437.1,0]]'),
(2,'[75,[13614.3,3170.86,0]]'),
(2,'[80,[6887.07,11436.8,0]]'),
(3,'[0,[9837.5,3860.2,0]]'),
(3,'[133,[4211.8789,10735.168,0]]'),
(3,'[156,[7660.271,3982.0063,0]]'),
(3,'[172,[7220.6538,9116.3428,0]]'),
(3,'[181,[10153.5,12026.8,0]]'),
(3,'[2,[12010.7,12637.2,0]]'),
(3,'[240,[4871.19,10176.2,0]]'),
(3,'[241,[4811.56,9603.77,0]]'),
(3,'[258,[7209.86,6984.74,0]]'),
(3,'[278,[11162.7,2509.88,0]]'),
(3,'[310,[6365.7402,7795.3501,0]]'),
(3,'[37,[6366.01,2774.14,0]]'),
(3,'[60,[11279.154,4296.0205,0]]'),
(3,'[62,[13307,3231.95,0]]'),
(3,'[67,[10587.8,2188.25,0]]'),
(3,'[72,[6886.53,11437.1,0]]'),
(3,'[75,[13614.3,3170.86,0]]'),
(3,'[80,[6887.07,11436.8,0]]'),
(4,'[0,[9837.5,3860.2,0]]'),
(4,'[133,[4211.8789,10735.168,0]]'),
(4,'[156,[7660.271,3982.0063,0]]'),
(4,'[172,[7220.6538,9116.3428,0]]'),
(4,'[181,[10153.5,12026.8,0]]'),
(4,'[241,[4811.56,9603.77,0]]'),
(4,'[310,[6365.7402,7795.3501,0]]'),
(4,'[37,[6366.01,2774.14,0]]'),
(4,'[62,[13307,3231.95,0]]'),
(4,'[67,[10587.8,2188.25,0]]'),
(4,'[72,[6886.53,11437.1,0]]'),
(4,'[75,[13614.3,3170.86,0]]'),
(4,'[80,[6887.07,11436.8,0]]'),
(5,'[240,[4586.84,10684.6,0]]'),
(5,'[252,[4530.52,10785.1,0]]'),
(5,'[32,[12492,12515,0]]'),
(6,'[140,[12681.2,9467.42,0]]'),
(6,'[155,[12158.999,3468.7563,0]]'),
(6,'[155,[8680.75,2445.5315,0]]'),
(6,'[179,[3474.3989, 2562.4915,0]]'),
(6,'[191,[2782.7134,5285.5342,0]]'),
(6,'[201,[8070.6958, 3358.7793,0]]'),
(6,'[23,[3203.0916, 3988.6379,0]]'),
(6,'[236,[1773.9318,2351.6221,0]]'),
(6,'[236,[3699.9189,2474.2119,0]]'),
(6,'[250,[11984.01,3835.9231,0]]'),
(6,'[255,[10153.068,2219.3547,0]]'),
(6,'[316,[7943.5068,6988.1763,0]]'),
(6,'[322,[3097.96,7812.64,0]]'),
(6,'[35,[8345.7227, 2482.6855,0]]'),
(6,'[50,[8040.6777, 7086.5356,0]]'),
(6,'[73,[8350.0947, 2480.542,0]]'),
(7,'[12,[4662.13,10436,0]]'),
(7,'[141,[11953.279,9107.3896,0]]'),
(7,'[157,[12235.8,9729.92,0]]'),
(7,'[157,[3693.0386, 5969.1489,0]]'),
(7,'[183,[4752.58,2535.77,0]]'),
(7,'[191,[4625.61,9675.62,0]]'),
(7,'[203,[3696.23,6013.07,0]]'),
(7,'[216,[4765.67,10260.7,0]]'),
(7,'[249,[11823.4,12691.1,0]]'),
(7,'[272,[6303.11,7833.36,0]]'),
(7,'[317,[3770.08,10237,0]]'),
(7,'[337,[6344.92,7772.4,0]]'),
(7,'[39,[12143.2,12611.2,0]]'),
(7,'[58,[3702.54,10182.1,0]]'),
(10,'[0,[6279.4966, 7810.3691,0]]'),
(10,'[106,[5265.94,5492.29,0]]'),
(10,'[116,[13343.8,12919,0]]'),
(10,'[124,[11309.963, 6646.3989,0]]'),
(10,'[133,[8310.9902, 3348.3579,0]]'),
(10,'[137,[2159.68,7907.71,0]]'),
(10,'[160,[11940.6,8868.87,0]]'),
(10,'[19,[10828.8,2703.23,0]]'),
(10,'[19,[11066.828,7915.2275,0]]'),
(10,'[194,[9727.78,8932.72,0]]'),
(10,'[207,[1740.8503,3622.6938,0]]'),
(10,'[222,[5165.7231,2375.7642,0]]'),
(10,'[223,[4817.6572, 2556.5034,0]]'),
(10,'[223,[6288.416, 7834.3521,0]]'),
(10,'[226,[1975.1283, 9150.0195,0]]'),
(10,'[228,[12355.3,10821.6,0]]'),
(10,'[229,[6914.04,2487.6,0]]'),
(10,'[241,[2614.0862,5079.6357,0]]'),
(10,'[266,[9157.8408,11019.819,0]]'),
(10,'[274,[11604.3,10636.8,0]]'),
(10,'[291,[8125.36,3167.17,0]]'),
(10,'[298,[9076.47,8016.35,0]]'),
(10,'[316,[7427.61,5155.17,0]]'),
(10,'[324,[13388,6603.21,0]]'),
(10,'[336,[7006.14,7717.57,0]]'),
(10,'[337,[8120.3057,9305.4912,0]]'),
(10,'[337,[9715.0352,6522.8286,0]]'),
(10,'[339,[11243.3,5376.82,0]]'),
(10,'[344,[2045.3989,7267.4165,0]]'),
(10,'[352,[12058.555,3577.8667,0]]'),
(10,'[353,[12869.565,4450.4077,0]]'),
(10,'[363,[5337.62,8656.55,0]]'),
(11,'[230,[3762.5764,8736.1709,0]]'),
(11,'[245,[4580.3203,4515.9282,0]]'),
(11,'[279,[10628.433,8037.8188,0]]'),
(11,'[333,[6040.0923,7806.5439,0]]'),
(11,'[59,[6705.8887, 2991.9358,0]]'),
(11,'[76,[10314.745, 2147.5374,0]]'),
(12,'[19,[11246.52, 7534.7954,0]]'),
(12,'[195,[9681.8213,8947.2354,0]]'),
(12,'[220,[3083.52,9202.18,0]]'),
(12,'[262,[3825.1318,8941.4873,0]]'),
(12,'[95,[1690.58,5095.92,0]]'),
(13,'[178,[13276.482, 6098.4463,0]]'),
(13,'[338,[1890.9952,12417.333,0]]'),
(14,'[245,[14417.589,12886.104,0]]'),
(14,'[268,[13098.13, 8250.8828,0]]'),
(14,'[315,[13222.181,10015.431,0]]'),
(14,'[315,[8317.2676,2348.6055,0]]'),
(14,'[55,[13454.882, 13731.796,0]]');
/*!40000 ALTER TABLE `vehicle_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_spawns`
--

DROP TABLE IF EXISTS `vehicle_spawns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_spawns` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Classname` varchar(255) NOT NULL,
  `Chance` double NOT NULL,
  `MaxNum` int(11) NOT NULL DEFAULT 1,
  `Location` int(11) NOT NULL,
  `Inventory` int(11) DEFAULT NULL,
  `Hitpoints` int(11) DEFAULT NULL,
  `MinDamage` double NOT NULL,
  `MaxDamage` double NOT NULL,
  `MinFuel` double NOT NULL,
  `MaxFuel` double NOT NULL,
  `MaxWeapons` int(11) NOT NULL,
  `MaxMagazines` int(11) NOT NULL,
  `MaxBackpacks` int(11) NOT NULL,
  `CleanupTime` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Classname` (`Classname`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_spawns`
--

LOCK TABLES `vehicle_spawns` WRITE;
/*!40000 ALTER TABLE `vehicle_spawns` DISABLE KEYS */;
INSERT INTO `vehicle_spawns` VALUES
(1,'UAZ_Unarmed_TK_EP1',0.7,2,7,NULL,1,0.2,0.8,0,0.8,1,3,0,300),
(2,'UAZ_Unarmed_UN_EP1',0.59,2,10,NULL,1,0.2,0.8,0,0.8,1,0,0,300),
(3,'UAZ_RU',0.59,1,7,NULL,1,0.2,0.8,0,0.8,1,2,0,300),
(4,'UAZ_Unarmed_TK_CIV_EP1',0.59,3,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(5,'SkodaBlue',0.68,2,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(6,'Skoda',0.68,2,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(7,'SkodaGreen',0.68,2,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(8,'ATV_US_EP1',0.7,6,0,NULL,1,0.2,0.8,0,0.8,0,0,0,120),
(9,'TT650_Ins',0.72,1,1,NULL,2,0.2,0.8,0,0.8,0,0,0,120),
(10,'TT650_TK_CIV_EP1',0.72,3,1,NULL,2,0.2,0.8,0,0.8,0,0,0,120),
(11,'Old_bike_TK_CIV_EP1',0.64,8,6,NULL,NULL,0.2,0.8,0,0,0,0,0,60),
(12,'hilux1_civil_3_open',0.59,3,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(13,'Ikarus',0.59,2,11,NULL,1,0.2,0.8,0,0.8,0,0,0,180),
(14,'Ikarus_TK_CIV_EP1',0.59,2,11,NULL,1,0.2,0.8,0,0.8,0,0,0,180),
(15,'Tractor',0.7,3,12,NULL,1,0.2,0.8,0,0.8,0,0,0,60),
(16,'S1203_TK_CIV_EP1',0.69,2,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(17,'V3S_Civ',0.66,2,13,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(18,'UralCivil',0.59,2,13,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(19,'car_hatchback',0.73,2,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(20,'Fishing_Boat',0.61,1,14,NULL,2,0.2,0.8,0,0.8,0,0,0,300),
(21,'PBX',0.59,1,14,NULL,2,0.2,0.8,0,0.8,0,0,0,300),
(22,'Smallboat_1',0.59,2,14,NULL,2,0.2,0.8,0,0.8,0,0,0,300),
(23,'Volha_1_TK_CIV_EP1',0.71,3,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(24,'Volha_2_TK_CIV_EP1',0.71,3,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(25,'SUV_DZ',0.59,1,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(26,'car_sedan',0.59,2,10,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(27,'UH1H_DZ',0.59,2,2,NULL,3,0.2,0.8,0,0.8,0,0,0,900),
(28,'AH6X_DZ',0.48,3,3,NULL,4,0.2,0.8,0,0.8,0,0,0,900),
(29,'Mi17_DZ',0.49,1,4,NULL,4,0.2,0.8,0,0.8,0,0,0,900),
(30,'AN2_DZ',0.6,1,5,NULL,NULL,0,0,0.1,0.4,0,0,0,900),
(31,'BAF_Offroad_D',0.54,2,7,NULL,5,0.2,0.8,0,0.8,0,0,0,300),
(32,'BAF_Offroad_W',0.54,2,7,NULL,5,0.2,0.8,0,0.8,0,0,0,300),
(33,'MH6J_DZ',0.48,2,3,NULL,3,0.2,0.8,0,0.8,0,0,0,900),
(34,'HMMWV_DZ',0.21,2,7,NULL,1,0.2,0.8,0,0.8,0,0,0,300),
(35,'Pickup_PK_INS',0.1,2,7,NULL,6,0.2,0.8,0,0.8,0,0,0,300),
(36,'Offroad_DSHKM_INS',0.07,1,7,NULL,6,0.2,0.8,0,0.8,0,0,0,300),
(37,'AN2_2_DZ',1,1,5,NULL,NULL,0,0,0.1,0.4,0,0,0,900),
(38,'UH1H_2_DZ',0.3,1,2,NULL,3,0.2,0.8,0,0.8,0,0,0,900);
/*!40000 ALTER TABLE `vehicle_spawns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_spawns_groups`
--

DROP TABLE IF EXISTS `vehicle_spawns_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicle_spawns_groups` (
  `Spawn_ID` int(11) NOT NULL,
  `Group_ID` int(11) NOT NULL,
  PRIMARY KEY (`Spawn_ID`,`Group_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_spawns_groups`
--

LOCK TABLES `vehicle_spawns_groups` WRITE;
/*!40000 ALTER TABLE `vehicle_spawns_groups` DISABLE KEYS */;
INSERT INTO `vehicle_spawns_groups` VALUES
(2,6),
(4,6),
(5,6),
(6,6),
(7,6),
(12,6),
(13,5),
(14,5),
(16,6),
(17,4),
(18,4),
(19,6),
(23,6),
(24,6),
(26,6),
(27,0),
(27,10),
(28,0),
(29,0),
(30,9),
(31,1),
(32,1),
(33,0),
(34,1),
(35,2),
(36,2),
(37,9),
(38,0),
(38,10);
/*!40000 ALTER TABLE `vehicle_spawns_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dayz'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `3h updates` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb3 */ ;;
/*!50003 SET character_set_results = utf8mb3 */ ;;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`%`*/ /*!50106 EVENT `3h updates` ON SCHEDULE EVERY 1 HOUR STARTS '2014-04-11 11:30:00' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
	update event_scheduler set LastRun = NOW() where System = "3hRespawns";
	
	CALL `pMain`('1');
	
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'dayz'
--
/*!50003 DROP FUNCTION IF EXISTS `countVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehicles`(`inst` int) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT DEFAULT 0;
	
	SELECT COUNT(*)
	INTO count
	FROM object_data
	WHERE CharacterID = 0
		AND Instance = inst;
	
	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `countVehiclesClass` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehiclesClass`(`inst` int,`c` varchar(255)) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT DEFAULT 0;
	
	SELECT COUNT(*)
		INTO count
		FROM object_data
		WHERE Instance = inst
		AND CharacterID = 0
		AND Classname = c;
	
	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `countVehiclesGroup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `countVehiclesGroup`(`inst` int, `groupid` int) RETURNS int(11)
    READS SQL DATA
BEGIN
	DECLARE count INT;
	
	
	
	SELECT COUNT(*)
	INTO count
	FROM object_data
	WHERE CharacterID = 0
		AND Instance = inst
		AND Classname IN
		(
			SELECT Classname
			FROM vehicle_spawns
			WHERE ID IN
			(
				SELECT Spawn_ID
				FROM vehicle_spawns_groups
				WHERE Group_ID = groupid
			)
		);
	
	RETURN count;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `generateUID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `generateUID`(`inst` int) RETURNS bigint(20)
BEGIN
	DECLARE Min BIGINT DEFAULT 10000000;
	DECLARE Max BIGINT DEFAULT 99999999;
	
	DECLARE UID BIGINT DEFAULT 0;
	
	WHILE (UID = 0) DO
		SET UID = ROUND(Min + RAND() * (Max - Min));
		
		IF (UID IN (SELECT ObjectUID FROM object_data WHERE CharacterID = 0 AND Instance = inst)) THEN
			SET UID = 0;
		END IF;
	END WHILE;
	
	RETURN UID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `getNumSpawnable` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `getNumSpawnable`(`inst` int, `spawnid` int) RETURNS int(11)
BEGIN
	DECLARE Class_Max INT DEFAULT (SELECT MaxNum - countVehiclesClass(inst, Classname) FROM vehicle_spawns WHERE ID = spawnid LIMIT 1);
	DECLARE Group_Max INT DEFAULT
	(
		SELECT MIN(MaxNum - countVehiclesGroup(inst, ID))
		FROM vehicle_groups
		WHERE ID IN
		(
			SELECT Group_ID
			FROM vehicle_spawns_groups
			WHERE Spawn_ID = spawnid
		)
	);
	
	RETURN IF(ISNULL(Group_Max), Class_Max, IF(Class_Max < Group_Max, Class_Max, Group_Max));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `randomizeVehicleHitpoints` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `randomizeVehicleHitpoints`(`class` varchar(255)) RETURNS varchar(2000) CHARSET latin1
    READS SQL DATA
BEGIN
	
	
	
	DECLARE Threshold DOUBLE DEFAULT 0.5;
	
	
	DECLARE Result varchar(2000);
	DECLARE Hitpoints_ID INT DEFAULT (SELECT Hitpoints FROM vehicle_spawns WHERE Classname = class LIMIT 1);
	
	IF (ISNULL(Hitpoints_ID)) THEN
		RETURN "[]";
	END IF;
	
	SELECT GROUP_CONCAT("[\"", PartName, "\",", TRUNCATE(IF ((@r := MinDamage + RAND() * (MaxDamage - MinDamage)) < Threshold, MinDamage, @r), 4), "]")
		INTO Result
		FROM vehicle_hitpoints
		WHERE ID = Hitpoints_ID;
	
	RETURN CONCAT_WS("", "[", Result, "]");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `randomizeVehicleInventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` FUNCTION `randomizeVehicleInventory`(`c` varchar(255)) RETURNS longtext CHARSET latin1
    READS SQL DATA
BEGIN
	DECLARE WeaponClasses		VARCHAR(255);
	DECLARE WeaponAmounts		VARCHAR(255);
	DECLARE MagazineClasses		VARCHAR(255);
	DECLARE MagazineAmounts		VARCHAR(255);
	DECLARE BackpackClasses		VARCHAR(255);
	DECLARE BackpackAmounts		VARCHAR(255);
	
	DECLARE InventoryID INT DEFAULT (SELECT Inventory FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	
	DECLARE MaxWeapons		INT DEFAULT (SELECT MaxWeapons		FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	DECLARE MaxMagazines	INT DEFAULT (SELECT MaxMagazines	FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	DECLARE MaxBackpacks	INT DEFAULT (SELECT MaxBackpacks	FROM vehicle_spawns WHERE Classname = c LIMIT 1);
	
	IF (ISNULL(InventoryID)) THEN
		RETURN "[]";
	END IF;
	
	
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxWeapons, MaxWeapons - @sum + @amt, @amt))
	INTO WeaponClasses, WeaponAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory
		WHERE ID = InventoryID
			AND Type = "Weapon" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxWeapons;
	
	
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxMagazines, MaxMagazines - @sum + @amt, @amt))
	INTO MagazineClasses, MagazineAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory 
		WHERE ID = InventoryID
			AND Type = "Magazine" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxMagazines;
	
	
	SET @amt := 0;
	SET @sum := 0;
	SELECT	GROUP_CONCAT("\"", Classname, "\""),
			GROUP_CONCAT(IF(@sum > MaxBackpacks, MaxBackpacks - @sum + @amt, @amt))
	INTO BackpackClasses, BackpackAmounts
	FROM 
	(
		SELECT *
		FROM vehicle_inventory 
		WHERE ID = InventoryID
			AND Type = "Backpack" 
			AND RAND() < Chance
		ORDER BY RAND()
	) AS x
	WHERE (@amt := ROUND(x.MinAmount + RAND() * (x.MaxAmount - x.MinAmount))) IS NOT NULL
		AND (@sum := @sum + @amt) IS NOT NULL
		AND @sum - @amt < MaxBackpacks;
	
	
	
	RETURN CONCAT_WS
	(
		"",
		"[[[",			WeaponClasses,
		"], [",			WeaponAmounts,
		"]], [[",		MagazineClasses,
		"], [",			MagazineAmounts,
		"]], [[",		BackpackClasses,
		"], [",			BackpackAmounts,
		"]]]"
	);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `rndspawn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` FUNCTION `rndspawn`(`chance` double) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN

	DECLARE bspawn tinyint(1) DEFAULT 0;

	IF (RAND() <= chance) THEN
		SET bspawn = 1;
	END IF;

	RETURN bspawn;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pCleanup` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanup`()
BEGIN 

	update event_scheduler set LastRun = NOW() where System = "pCleanup";


        CALL pCleanupOOB();
 

        DELETE
                FROM object_data
                WHERE CharacterID != 0 AND Damage = 1;


	DELETE FROM object_data
	WHERE CharacterID = 0
		AND Damage = 1
		AND SYSDATE() > DATE(last_updated) + INTERVAL (
			SELECT CleanupTime
			FROM vehicle_spawns
			WHERE vehicle_spawns.Classname = object_data.Classname
			LIMIT 1) MINUTE;


        DELETE
                FROM object_data
                WHERE (Classname like 'TentStorage%' or Classname like 'StashSmall%' or Classname like 'StashMedium%' or Classname like 'DomeTentStorage%')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[[[],[]],[[],[]],[[],[]]]';
       
        DELETE
                FROM object_data
                WHERE (Classname like 'TentStorage%' or Classname like 'StashSmall%' or Classname like 'StashMedium%' or Classname like 'DomeTentStorage%')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
                        AND Inventory = '[]';          
 

        DELETE
            FROM object_data
				WHERE Classname = 'Wire_cat1'
					AND DATE(last_updated) < CURDATE() - INTERVAL 2 DAY;
					                      

        DELETE
                FROM object_data
                WHERE Classname = 'Hedgehog_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 15 DAY;
 

        DELETE
                FROM object_data
                WHERE Classname = 'Sandbag1_DZ'
                        AND DATE(last_updated) < CURDATE() - INTERVAL 20 DAY;
 

        DELETE
                FROM object_data
                WHERE (Classname = 'BearTrap_DZ' or Classname = 'TrapBearTrapFlare' or Classname = 'TrapBearTrapSmoke' or Classname = 'Trap_Cans' or Classname = 'TrapTripwireFlare' or Classname = 'TrapTripwireGrenade' or Classname = 'TrapTripwireSmoke')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY; 
                        

        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenFence_1_foundation')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 1 Day;  
                        

        DELETE
                FROM object_data
                WHERE (Classname = 'WoodenFence_1_frame' or Classname = 'WoodenFence_quaterpanel' or Classname = 'WoodenFence_halfpanel' or Classname = 'WoodenFence_thirdpanel')
                        AND DATE(last_updated) < CURDATE() - INTERVAL 3 Day; 
                       

        DELETE
                FROM character_data
                WHERE Alive=0 AND DATE(last_updated) < CURDATE() - INTERVAL 90 Day; 

				DELETE
								FROM object_data
								WHERE Classname like '%_base';
			

		DELETE
			FROM Object_DATA
			USING Object_DATA, Character_DATA
				WHERE Object_DATA.Classname = 'Wire_cat1'
					AND Object_DATA.CharacterID = Character_DATA.CharacterID
					AND Character_DATA.Alive = 0;
					

        DELETE
            FROM object_data
				WHERE Classname = 'Base_Fire_DZ'
					AND DATE(last_updated) < CURDATE() - INTERVAL 5 DAY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pCleanupBase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pCleanupBase`()
BEGIN

	update event_scheduler set LastRun = NOW() where System = "pCleanupBase";
	

	Update
		object_data 
			set Hitpoints = '["Maintenance"]'                    
				WHERE (Classname = 'WoodenFence_1' or Classname = 'WoodenFence_2' or Classname = 'WoodenFence_3' or Classname = 'WoodenFence_4' or Classname = 'WoodenFence_5' or Classname = 'WoodenFence_6' or Classname = 'WoodenFence_7')
				AND DATE(last_updated) < CURDATE() - INTERVAL 7 DAY
 				AND Hitpoints = '[]';
 				

	update
		object_data
			set Classname = 'WoodenFence_1_foundation'
				where Classname = 'WoodenFence_1_frame'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;


	update
		object_data
			set Classname = 'WoodenFence_1_frame'
				where Classname = 'WoodenFence_quaterpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;


	update
		object_data
			set Classname = 'WoodenFence_quaterpanel'
				where Classname = 'WoodenFence_halfpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				

	update
		object_data
			set Classname = 'WoodenFence_halfpanel'
				where Classname = 'WoodenFence_thirdpanel'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;
				 

	update
		object_data
			set Classname = 'WoodenFence_thirdpanel'
				where Classname = 'WoodenFence_1'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;

	update
		object_data
			set Classname = 'WoodenFence_1'
				where Classname = 'WoodenFence_2'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;	

	update
		object_data
			set Classname = 'WoodenFence_2'
				where Classname = 'WoodenFence_3'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					

	update
		object_data
			set Classname = 'WoodenFence_3'
				where Classname = 'WoodenFence_4'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					

	update
		object_data
			set Classname = 'WoodenFence_4'
				where Classname = 'WoodenFence_5'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					

	update
		object_data
			set Classname = 'WoodenFence_5'
				where Classname = 'WoodenFence_6'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;					

	update
		object_data
			set Classname = 'WoodenFence_6'
				where Classname = 'WoodenFence_7'
				AND Hitpoints = '["Maintenance"]'
				AND DATE(last_updated) < CURDATE() - INTERVAL 3 DAY;												       
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pCleanupOOB` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `pCleanupOOB`()
BEGIN

	DECLARE intLineCount	INT DEFAULT 0;
	DECLARE intDummyCount	INT DEFAULT 0;
	DECLARE intDoLine			INT DEFAULT 0;
	DECLARE intWest				INT DEFAULT 0;
	DECLARE intNorth			INT DEFAULT 0;

	SELECT COUNT(*)
		INTO intLineCount
		FROM Object_DATA;

	SELECT COUNT(*)
		INTO intDummyCount
		FROM Object_DATA
		WHERE Classname = 'dummy';

	WHILE (intLineCount > intDummyCount) DO
	
		SET intDoLine = intLineCount - 1;

		SELECT ObjectUID, Worldspace
			INTO @rsObjectUID, @rsWorldspace
			FROM Object_DATA
			LIMIT intDoLine, 1;

		SELECT REPLACE(@rsWorldspace, '[', '') INTO @rsWorldspace;
		SELECT REPLACE(@rsWorldspace, ']', '') INTO @rsWorldspace;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 2), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 2 -1)) + 1), ',', '') INTO @West;
		SELECT REPLACE(SUBSTRING(SUBSTRING_INDEX(@rsWorldspace, ',', 3), LENGTH(SUBSTRING_INDEX(@rsWorldspace, ',', 3 -1)) + 1), ',', '') INTO @North;

		SELECT INSTR(@West, '-') INTO intWest;
		SELECT INSTR(@North, '-') INTO intNorth;

		IF (intNorth = 0) THEN
			SELECT CONVERT(@North, DECIMAL(16,8)) INTO intNorth;
		END IF;

		IF (intWest > 0 OR intNorth > 15360) THEN
			DELETE FROM Object_DATA
				WHERE ObjectUID = @rsObjectUID;
		END IF;
			
		SET intLineCount = intLineCount - 1;

	END WHILE;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pMain` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pMain`(IN `i` INT)
    MODIFIES SQL DATA
BEGIN


	DECLARE sInstance VARCHAR(8) DEFAULT i;


	update event_scheduler set LastRun = NOW() where System = "pMain";

	CALL pCleanupBase(); 
	CALL pCleanup();

	CALL pSpawnVehicles(sInstance);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `pSpawnVehicles` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb3 */ ;
/*!50003 SET character_set_results = utf8mb3 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`dayzhivemind`@`%` PROCEDURE `pSpawnVehicles`(IN `i` int)
BEGIN
	
	
	DECLARE MaxVehicles INT DEFAULT 80;
	
	
	
	DECLARE SearchRadius DOUBLE DEFAULT 10;
	
	
	DECLARE ServerInstance INT DEFAULT i;
	DECLARE MaxNumSpawn INT DEFAULT MaxVehicles - countVehicles(ServerInstance);
	
	DROP TEMPORARY TABLE IF EXISTS temp_objects;
	CREATE TEMPORARY TABLE temp_objects AS
	(
		SELECT	CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 2), LENGTH(SUBSTRING_INDEX(@ws, ",", 1)) + 2), DECIMAL(10, 5)) AS X,
				CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 3), LENGTH(SUBSTRING_INDEX(@ws, ",", 2)) + 2), DECIMAL(10, 5)) AS Y
		FROM object_data
		WHERE CharacterID = 0
			AND Instance = ServerInstance
			AND (@ws := Worldspace) IS NOT NULL
			AND (@ws := REPLACE(@ws, "[", "")) IS NOT NULL
			AND (@ws := REPLACE(@ws, "]", "")) IS NOT NULL
	);
	
	DROP TEMPORARY TABLE IF EXISTS temp_locations;
	CREATE TEMPORARY TABLE temp_locations AS
	(
		SELECT vehicle_locations.ID, temp2.Worldspace
		FROM
		(
			SELECT Worldspace
			FROM
			(
				SELECT	Worldspace,
						CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 2), LENGTH(SUBSTRING_INDEX(@ws, ",", 1)) + 2), DECIMAL(10, 5)) AS X,
						CONVERT(SUBSTRING(SUBSTRING_INDEX(@ws, ",", 3), LENGTH(SUBSTRING_INDEX(@ws, ",", 2)) + 2), DECIMAL(10, 5)) AS Y
				FROM (SELECT Worldspace FROM vehicle_locations GROUP BY Worldspace) AS temp
				WHERE (@ws := Worldspace) IS NOT NULL
					AND (@ws := REPLACE(@ws, "[", "")) IS NOT NULL
					AND (@ws := REPLACE(@ws, "]", "")) IS NOT NULL
			) AS temp1
			WHERE
			(
				@distance :=
				(
					SELECT MIN(SQRT((temp_objects.X - temp1.X) * (temp_objects.X - temp1.X) + (temp_objects.Y - temp1.Y) * (temp_objects.Y - temp1.Y)))
					FROM temp_objects
				)
			) IS NULL OR @distance > SearchRadius
		) AS temp2
		JOIN vehicle_locations
			ON vehicle_locations.Worldspace = temp2.Worldspace
	);
	
	DROP TEMPORARY TABLE IF EXISTS temp_spawns;
	CREATE TEMPORARY TABLE temp_spawns AS
	(
		SELECT temp.ID, Classname, Worldspace, Chance, MinFuel, MaxFuel, MinDamage, MaxDamage
		FROM
		(
			SELECT *
			FROM vehicle_spawns
			WHERE (@numSpawnable := getNumSpawnable(ServerInstance, ID)) IS NOT NULL
				AND @numSpawnable > 0
			ORDER BY RAND()
		) AS temp
		JOIN temp_locations
			ON temp_locations.ID = temp.Location
		ORDER BY RAND()
	);
	
	SET @numSpawned = 0;
	WHILE (@numSpawned < MaxNumSpawn AND (SELECT COUNT(*) FROM temp_spawns) > 0) DO
		SET @spawnid = (SELECT ID FROM temp_spawns LIMIT 1);
		SET @chance = (SELECT Chance FROM temp_spawns LIMIT 1);
		SET @numSpawnable = getNumSpawnable(ServerInstance, @spawnid);
		IF (@numSpawnable > 0 AND RAND() < @chance) THEN
			SET @worldspace = (SELECT Worldspace FROM temp_spawns LIMIT 1);
			INSERT INTO object_data (ObjectUID, Classname, Instance, CharacterID, Worldspace, Inventory, Hitpoints, Fuel, Damage, Datestamp)
			SELECT generateUID(ServerInstance), Classname, ServerInstance, 0, Worldspace,
				randomizeVehicleInventory(Classname),
				randomizeVehicleHitpoints(Classname),
				MinFuel + RAND() * (MaxFuel - MinFuel),
				MinDamage + RAND() * (MaxDamage - MinDamage),
				SYSDATE()
			FROM temp_spawns
			LIMIT 1;
			
			DELETE FROM temp_spawns WHERE Worldspace = @worldspace;
			
			SET @numSpawned = @numSpawned + 1;
		END IF;
		
		SET @numSpawnable = @numSpawnable - 1;
		
		IF (@numSpawnable < 1) THEN
			DELETE FROM temp_spawns WHERE ID = @spawnid;
		END IF;
	END WHILE;
	
	SELECT CONCAT(@numSpawned, " vehicles spawned.");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-07 22:14:04
