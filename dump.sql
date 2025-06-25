-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: Minecraft
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `ACQUIRES`
--

DROP TABLE IF EXISTS `ACQUIRES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ACQUIRES` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Item_id` int NOT NULL,
  `Count` int DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`,`Item_id`),
  KEY `FK_ACQUIRES_ITEM` (`Item_id`),
  KEY `FK_ACQUIRES_WORLD` (`Owner_pid`,`Wname`),
  CONSTRAINT `FK_ACQUIRES_ITEM` FOREIGN KEY (`Item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACQUIRES_PLAYER` FOREIGN KEY (`Pid`) REFERENCES `PLAYER` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_ACQUIRES_WORLD` FOREIGN KEY (`Owner_pid`, `Wname`) REFERENCES `WORLD` (`Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ACQUIRES`
--

LOCK TABLES `ACQUIRES` WRITE;
/*!40000 ALTER TABLE `ACQUIRES` DISABLE KEYS */;
/*!40000 ALTER TABLE `ACQUIRES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ARMAMENT`
--

DROP TABLE IF EXISTS `ARMAMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ARMAMENT` (
  `Item_id` int NOT NULL,
  `Damage` int DEFAULT 0,
  `Durability` int DEFAULT 0,
  `Armor_points` int DEFAULT 0,
  PRIMARY KEY (`Item_id`),
  CONSTRAINT `fk_armament_item_id` FOREIGN KEY (`Item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARMAMENT`
--

LOCK TABLES `ARMAMENT` WRITE;
/*!40000 ALTER TABLE `ARMAMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARMAMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BIOME`
--

DROP TABLE IF EXISTS `BIOME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BIOME` (
  `Bname` varchar(200) NOT NULL,
  `Btype` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Bname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BIOME`
--

LOCK TABLES `BIOME` WRITE;
/*!40000 ALTER TABLE `BIOME` DISABLE KEYS */;
/*!40000 ALTER TABLE `BIOME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BLOCK`
--

DROP TABLE IF EXISTS `BLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BLOCK` (
  `Item_id` int NOT NULL,
  `Height` float DEFAULT 1,
  `Flammable` tinyint(1) DEFAULT 1,
  `Blast_resistance` float DEFAULT 0,
  PRIMARY KEY (`Item_id`),
  CONSTRAINT `FK_item_id_block` FOREIGN KEY (`Item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BLOCK`
--

LOCK TABLES `BLOCK` WRITE;
/*!40000 ALTER TABLE `BLOCK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BREAKS`
--

DROP TABLE IF EXISTS `BREAKS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BREAKS` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Block_id` int NOT NULL,
  `count` int DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`,`Block_id`),
  KEY `FK_BREAKS_WORLD` (`Owner_pid`,`Wname`),
  KEY `FK_BREAKS_BLOCK` (`Block_id`),
  CONSTRAINT `FK_BREAKS_BLOCK` FOREIGN KEY (`Block_id`) REFERENCES `BLOCK` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BREAKS_PLAYER` FOREIGN KEY (`Pid`) REFERENCES `PLAYER` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_BREAKS_WORLD` FOREIGN KEY (`Owner_pid`, `Wname`) REFERENCES `WORLD` (`Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BREAKS`
--

LOCK TABLES `BREAKS` WRITE;
/*!40000 ALTER TABLE `BREAKS` DISABLE KEYS */;
/*!40000 ALTER TABLE `BREAKS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONSUMABLE`
--

DROP TABLE IF EXISTS `CONSUMABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONSUMABLE` (
  `Item_id` int NOT NULL,
  `Saturation` int DEFAULT 0,
  `Hunger_filled` int DEFAULT 0,
  PRIMARY KEY (`Item_id`),
  CONSTRAINT `CONSUMABLE_ibfk_1` FOREIGN KEY (`Item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONSUMABLE`
--

LOCK TABLES `CONSUMABLE` WRITE;
/*!40000 ALTER TABLE `CONSUMABLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CONSUMABLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CRAFTS`
--

DROP TABLE IF EXISTS `CRAFTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CRAFTS` (
  `Reactant_id` int NOT NULL,
  `Product_id` int NOT NULL,
  PRIMARY KEY (`Reactant_id`,`Product_id`),
  KEY `Product_fk_item` (`Product_id`),
  CONSTRAINT `Product_fk_item` FOREIGN KEY (`Product_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Reactant_fk_item` FOREIGN KEY (`Reactant_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CRAFTS`
--

LOCK TABLES `CRAFTS` WRITE;
/*!40000 ALTER TABLE `CRAFTS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CRAFTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DROPS`
--

DROP TABLE IF EXISTS `DROPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DROPS` (
  `Mname` varchar(200) NOT NULL,
  `Item_id` int NOT NULL,
  `Drop_rate` float DEFAULT 0,
  PRIMARY KEY (`Mname`,`Item_id`),
  KEY `FK_Item_id` (`Item_id`),
  CONSTRAINT `FK_Item_id` FOREIGN KEY (`Item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Mname_drops` FOREIGN KEY (`Mname`) REFERENCES `MOB` (`Mname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DROPS`
--

LOCK TABLES `DROPS` WRITE;
/*!40000 ALTER TABLE `DROPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `DROPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EFFECT`
--

DROP TABLE IF EXISTS `EFFECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EFFECT` (
  `Effect_name` varchar(250) NOT NULL,
  `Description` text,
  PRIMARY KEY (`Effect_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EFFECT`
--

LOCK TABLES `EFFECT` WRITE;
/*!40000 ALTER TABLE `EFFECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `EFFECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FRIENDSHIP`
--

DROP TABLE IF EXISTS `FRIENDSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FRIENDSHIP` (
  `PID1` int NOT NULL,
  `PID2` int NOT NULL,
  PRIMARY KEY (`PID1`,`PID2`),
  KEY `fk_friend2` (`PID2`),
  CONSTRAINT `fk_friend2` FOREIGN KEY (`PID2`) REFERENCES `PLAYER` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FRIENDSHIP`
--

LOCK TABLES `FRIENDSHIP` WRITE;
/*!40000 ALTER TABLE `FRIENDSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FRIENDSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GAMERULE`
--

DROP TABLE IF EXISTS `GAMERULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GAMERULE` (
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Rule_name` varchar(200) NOT NULL,
  `Value` int DEFAULT 0,
  PRIMARY KEY (`Rule_name`,`Owner_pid`,`Wname`),
  KEY `FK_GAMERULE` (`Owner_pid`,`Wname`),
  CONSTRAINT `FK_GAMERULE` FOREIGN KEY (`Owner_pid`, `Wname`) REFERENCES `WORLD` (`Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GAMERULE`
--

LOCK TABLES `GAMERULE` WRITE;
/*!40000 ALTER TABLE `GAMERULE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GAMERULE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `INVENTORY`
--

DROP TABLE IF EXISTS `INVENTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `INVENTORY` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Item_id` int NOT NULL,
  `Count` int DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`,`Item_id`),
  CONSTRAINT `Inventory_player_instance` FOREIGN KEY (`Pid`, `Owner_pid`, `Wname`) REFERENCES `PLAYER_INSTANCE` (`Pid`, `Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `INVENTORY`
--

LOCK TABLES `INVENTORY` WRITE;
/*!40000 ALTER TABLE `INVENTORY` DISABLE KEYS */;
/*!40000 ALTER TABLE `INVENTORY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ITEM`
--

DROP TABLE IF EXISTS `ITEM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ITEM` (
  `Item_id` int NOT NULL,
  `Iname` varchar(200) DEFAULT NULL,
  `Itype` varchar(200) DEFAULT NULL,
  `Stackable` tinyint(1) DEFAULT 0,
  `Texture` blob,
  PRIMARY KEY (`Item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ITEM`
--

LOCK TABLES `ITEM` WRITE;
/*!40000 ALTER TABLE `ITEM` DISABLE KEYS */;
/*!40000 ALTER TABLE `ITEM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KILLS`
--

DROP TABLE IF EXISTS `KILLS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KILLS` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Mname` varchar(200) NOT NULL,
  `Count` int DEFAULT 0,
  `Experience_gain` int DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`,`Mname`),
  KEY `FK_KILLS_WORLD` (`Owner_pid`,`Wname`),
  KEY `FK_KILLS_MOB` (`Mname`),
  CONSTRAINT `FK_KILLS_MOB` FOREIGN KEY (`Mname`) REFERENCES `MOB` (`Mname`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_KILLS_WORLD` FOREIGN KEY (`Owner_pid`, `Wname`) REFERENCES `WORLD` (`Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci; 
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KILLS`
--

LOCK TABLES `KILLS` WRITE;
/*!40000 ALTER TABLE `KILLS` DISABLE KEYS */;
/*!40000 ALTER TABLE `KILLS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOOT`
--

DROP TABLE IF EXISTS `LOOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOOT` (
  `Bname` varchar(200) NOT NULL,
  `Sname` varchar(200) NOT NULL,
  `Item_id` int NOT NULL,
  `Chance_of_finding` float DEFAULT 0,
  PRIMARY KEY (`Bname`,`Sname`,`Item_id`),
  CONSTRAINT `FK_LOOT_STRUCTURE` FOREIGN KEY (`Bname`, `Sname`) REFERENCES `STRUCTURE` (`Bname`, `Sname`)  ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOOT`
--

LOCK TABLES `LOOT` WRITE;
/*!40000 ALTER TABLE `LOOT` DISABLE KEYS */;
/*!40000 ALTER TABLE `LOOT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MOB`
--

DROP TABLE IF EXISTS `MOB`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MOB` (
  `Mname` varchar(255) NOT NULL,
  `Name_tag` varchar(255) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Naturally_Spawnable` tinyint(1) DEFAULT 0,
  `Max_HP` int DEFAULT 0,
  `Base_Damage` int DEFAULT 0,
  `Length` float DEFAULT 0,
  `Width` float DEFAULT 0,
  `Height` float DEFAULT 0,
  PRIMARY KEY (`Mname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MOB`
--

LOCK TABLES `MOB` WRITE;
/*!40000 ALTER TABLE `MOB` DISABLE KEYS */;
/*!40000 ALTER TABLE `MOB` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER`
--

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER` (
  `Pid` int NOT NULL,
  `skin` blob,
  `gamertag` varchar(255) DEFAULT NULL,
  `minecoins` int DEFAULT 0,
  PRIMARY KEY (`Pid`),
  UNIQUE KEY `gamertag` (`gamertag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER`
--

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_EFFECT`
--

DROP TABLE IF EXISTS `PLAYER_EFFECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER_EFFECT` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Effect_name` varchar(200) NOT NULL,
  `COUNT` int DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`,`Effect_name`),
  KEY `FK_PLAYER_EFFECT_EFFECT` (`Effect_name`),
  CONSTRAINT `FK_PLAYER_EFFECT_EFFECT` FOREIGN KEY (`Effect_name`) REFERENCES `EFFECT` (`Effect_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PLAYER_EFFECT_PLAYER_INSTANCE` FOREIGN KEY (`Pid`, `Owner_pid`, `Wname`) REFERENCES `PLAYER_INSTANCE` (`Pid`, `Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_EFFECT`
--

LOCK TABLES `PLAYER_EFFECT` WRITE;
/*!40000 ALTER TABLE `PLAYER_EFFECT` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYER_EFFECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER_INSTANCE`
--

DROP TABLE IF EXISTS `PLAYER_INSTANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER_INSTANCE` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(255) NOT NULL,
  `Health` int DEFAULT 0,
  `Hunger` int DEFAULT 0,
  `Experience` int DEFAULT 0,
  `Gamemode` varchar(50) DEFAULT 'survival',
  `Blocks_placed` int DEFAULT 0,
  `Items_crafted` int DEFAULT 0,
  `Distance_travelled` float DEFAULT 0,
  `Time_played` float DEFAULT 0,
  `Respawn_x` float DEFAULT 0,
  `Respawn_y` float DEFAULT 0,
  `Respawn_z` float DEFAULT 0,
  `Current_x` float DEFAULT 0,
  `Current_y` float DEFAULT 0,
  `Current_z` float DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`),
  KEY `Owner_pid` (`Owner_pid`,`Wname`),
  CONSTRAINT `PLAYER_INSTANCE_ibfk_1` FOREIGN KEY (`Owner_pid`, `Wname`) REFERENCES `WORLD` (`Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER_INSTANCE`
--

LOCK TABLES `PLAYER_INSTANCE` WRITE;
/*!40000 ALTER TABLE `PLAYER_INSTANCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `PLAYER_INSTANCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POSSIBLE_ENCHANTMENT`
--

DROP TABLE IF EXISTS `POSSIBLE_ENCHANTMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POSSIBLE_ENCHANTMENT` (
  `Armament_id` int NOT NULL,
  `Enchantment` varchar(100) NOT NULL,
  PRIMARY KEY (`Armament_id`,`Enchantment`),
  CONSTRAINT `fk_enchantment_armamentid` FOREIGN KEY (`Armament_id`) REFERENCES `ARMAMENT` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POSSIBLE_ENCHANTMENT`
--

LOCK TABLES `POSSIBLE_ENCHANTMENT` WRITE;
/*!40000 ALTER TABLE `POSSIBLE_ENCHANTMENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `POSSIBLE_ENCHANTMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RECIPE`
--

DROP TABLE IF EXISTS `RECIPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECIPE` (
  `Item_id` int NOT NULL,
  `Item_recipe_1` int NOT NULL,
  `Item_recipe_2` int NOT NULL,
  `Item_recipe_3` int NOT NULL,
  `Item_recipe_4` int NOT NULL,
  `Item_recipe_5` int NOT NULL,
  `Item_recipe_6` int NOT NULL,
  `Item_recipe_7` int NOT NULL,
  `Item_recipe_8` int NOT NULL,
  `Item_recipe_9` int NOT NULL,
  PRIMARY KEY (`Item_id`,`Item_recipe_1`,`Item_recipe_2`,`Item_recipe_3`,`Item_recipe_4`,`Item_recipe_5`,`Item_recipe_6`,`Item_recipe_7`,`Item_recipe_8`,`Item_recipe_9`),
  CONSTRAINT `FK_RECIPE_ITEM` FOREIGN KEY (`Item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RECIPE`
--

LOCK TABLES `RECIPE` WRITE;
/*!40000 ALTER TABLE `RECIPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RECIPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPAWN_IN_BIOME`
--

DROP TABLE IF EXISTS `SPAWN_IN_BIOME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPAWN_IN_BIOME` (
  `Mname` varchar(200) NOT NULL,
  `Bname` varchar(200) NOT NULL,
  `Spawn_rate` float DEFAULT 0,
  `Despawn_time` int DEFAULT 0,
  PRIMARY KEY (`Mname`,`Bname`),
  CONSTRAINT `FK_Mname` FOREIGN KEY (`Mname`) REFERENCES `MOB` (`Mname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPAWN_IN_BIOME`
--

LOCK TABLES `SPAWN_IN_BIOME` WRITE;
/*!40000 ALTER TABLE `SPAWN_IN_BIOME` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPAWN_IN_BIOME` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SPAWN_IN_STRUCTURE`
--

DROP TABLE IF EXISTS `SPAWN_IN_STRUCTURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SPAWN_IN_STRUCTURE` (
  `Mname` varchar(200) NOT NULL,
  `Bname` varchar(200) NOT NULL,
  `Sname` varchar(200) NOT NULL,
  `Spawn_rate` float DEFAULT 0,
  PRIMARY KEY (`Mname`,`Bname`,`Sname`),
  KEY `FK_SPAWN_IN_S_STRUCTURE` (`Bname`,`Sname`),
  CONSTRAINT `FK_SPAWN_IN_S_STRUCTURE` FOREIGN KEY (`Bname`, `Sname`) REFERENCES `STRUCTURE` (`Bname`, `Sname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SPAWN_IN_STRUCTURE`
--

LOCK TABLES `SPAWN_IN_STRUCTURE` WRITE;
/*!40000 ALTER TABLE `SPAWN_IN_STRUCTURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `SPAWN_IN_STRUCTURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STRUCTURE`
--

DROP TABLE IF EXISTS `STRUCTURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STRUCTURE` (
  `Bname` varchar(200) NOT NULL,
  `Sname` varchar(200) NOT NULL,
  `Generate_chance` float DEFAULT 0,
  PRIMARY KEY (`Bname`,`Sname`),
  CONSTRAINT `FK_Bname` FOREIGN KEY (`Bname`) REFERENCES `BIOME` (`Bname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STRUCTURE`
--

LOCK TABLES `STRUCTURE` WRITE;
/*!40000 ALTER TABLE `STRUCTURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `STRUCTURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRADE`
--

DROP TABLE IF EXISTS `TRADE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRADE` (
  `Pid` int NOT NULL,
  `Owner_pid` int NOT NULL,
  `Wname` varchar(200) NOT NULL,
  `Given_item_id` int NOT NULL,
  `Received_item_id` int NOT NULL,
  `cost` int DEFAULT 0,
  `Experience_gain` int DEFAULT 0,
  PRIMARY KEY (`Pid`,`Owner_pid`,`Wname`,`Given_item_id`,`Received_item_id`),
  KEY `FK_TRADE_ITEM1` (`Given_item_id`),
  KEY `FK_TRADE_ITEM2` (`Received_item_id`),
  KEY `FK_TRADE_WORLD` (`Owner_pid`,`Wname`),
  CONSTRAINT `FK_TRADE_ITEM1` FOREIGN KEY (`Given_item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TRADE_ITEM2` FOREIGN KEY (`Received_item_id`) REFERENCES `ITEM` (`Item_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TRADE_PLAYERS` FOREIGN KEY (`Pid`) REFERENCES `PLAYER` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_TRADE_WORLD` FOREIGN KEY (`Owner_pid`, `Wname`) REFERENCES `WORLD` (`Owner_pid`, `Wname`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRADE`
--

LOCK TABLES `TRADE` WRITE;
/*!40000 ALTER TABLE `TRADE` DISABLE KEYS */;
/*!40000 ALTER TABLE `TRADE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WORLD`
--

DROP TABLE IF EXISTS `WORLD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WORLD` (
  `Owner_pid` int NOT NULL,
  `Wname` varchar(250) NOT NULL,
  `Spawn_x_coord` int DEFAULT 0,
  `Spawn_y_coord` int DEFAULT 0,
  `Spawn_z_coord` int DEFAULT 0,
  `Def_gamemode` varchar(250) DEFAULT 'survival',
  `Difficulty` varchar(250) DEFAULT 'normal',
  `Cheats` tinyint(1) DEFAULT 0,
  `Tickspeed` int DEFAULT 0,
  `Create_year` int DEFAULT 0,
  `Create_month` int DEFAULT 0,
  `Create_date` int DEFAULT 0,
  `Create_time` time DEFAULT 0,
  PRIMARY KEY (`Owner_pid`,`Wname`),
  CONSTRAINT `fk_world_owner` FOREIGN KEY (`Owner_pid`) REFERENCES `PLAYER` (`Pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WORLD`
--

LOCK TABLES `WORLD` WRITE;
/*!40000 ALTER TABLE `WORLD` DISABLE KEYS */;
/*!40000 ALTER TABLE `WORLD` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-28 16:15:34

-- BIOME table
INSERT INTO BIOME (Bname, Btype) VALUES
('Plains', 'Overworld'),
('Desert', 'Overworld'),
('Forest', 'Forest'),
('Ocean', 'Aquatic'),
('Mountains', 'Extreme'),
('Nether_Wastes', 'Nether'),
('End', 'End'),
('Jungle', 'Forest'),
('Savanna', 'Overworld'),
('Mushroom_Fields', 'Special'),
('Swamp', 'Wetland'),
('Taiga', 'Forest'),
('Mesa', 'Overworld'),
('Ice_Plains', 'Cold'),
('Deep_Ocean', 'Aquatic');

-- EFFECT table
INSERT INTO EFFECT (Effect_name, Description) VALUES
('Speed', 'Increases movement speed'),
('Strength', 'Increases attack damage'),
('Regeneration', 'Restores health over time'),
('Night_Vision', 'Allows seeing in dark'),
('Weakness', 'Decreases attack damage'),
('Jump_Boost', 'Increases jump height'),
('Fire_Resistance', 'Prevents fire damage'),
('Water_Breathing', 'Allows underwater breathing'),
('Invisibility', 'Makes player invisible'),
('Poison', 'Deals damage over time'),
('Haste', 'Increases mining speed'),
('Slow_Falling', 'Reduces falling speed'),
('Resistance', 'Reduces damage taken'),
('Absorption', 'Adds temporary health'),
('Saturation', 'Restores hunger instantly');

-- PLAYER table
INSERT INTO PLAYER (Pid, gamertag, minecoins) VALUES
(1, 'Varun_Gaming', 1000),
(2, 'Saiyam_MC', 1500),
(3, 'Nidhish_Pro', 1200),
(4, 'Krishak_Craft', 800),
(5, 'BondBrother1', 2000),
(6, 'BondBrother2', 1800),
(7, 'DragonSlayer99', 2500),
(8, 'MineKing123', 1700),
(9, 'CraftMaster', 1900),
(10, 'RedstoneWizard', 2200),
(11, 'BuilderPro', 1600),
(12, 'ExplorerElite', 2100);

-- MOB table
INSERT INTO MOB (Mname, Name_tag, Type, Naturally_Spawnable, Max_HP, Base_Damage, Length, Width, Height) VALUES
('Zombie', 'Hostile', 'Undead', 1, 20, 5, 0.6, 0.6, 1.8),
('Creeper', 'Hostile', 'Explosive', 1, 20, 15, 0.6, 0.6, 1.7),
('Sheep', 'Passive', 'Animal', 1, 8, 0, 0.9, 0.9, 1.3),
('Villager', 'Passive', 'NPC', 1, 20, 0, 0.6, 0.6, 1.8),
('Ender_Dragon', 'Boss', 'Boss', 0, 200, 30, 16, 16, 8),
('Skeleton', 'Hostile', 'Undead', 1, 20, 4, 0.6, 0.6, 1.8),
('Spider', 'Hostile', 'Arthropod', 1, 16, 3, 1.4, 1.4, 0.9),
('Cow', 'Passive', 'Animal', 1, 10, 0, 0.9, 0.9, 1.4),
('Pig', 'Passive', 'Animal', 1, 10, 0, 0.9, 0.9, 0.9),
('Witch', 'Hostile', 'NPC', 1, 26, 0, 0.6, 0.6, 1.8),
('Blaze', 'Hostile', 'Nether', 1, 20, 6, 0.6, 0.6, 1.8),
('Enderman', 'Hostile', 'End', 1, 40, 7, 0.6, 0.6, 2.9),
('Iron_Golem', 'Neutral', 'Utility', 0, 100, 15, 1.4, 1.4, 2.7),
('Chicken', 'Passive', 'Animal', 1, 4, 0, 0.4, 0.4, 0.7),
('Wither', 'Boss', 'Boss', 0, 300, 40, 0.9, 0.9, 3.5);

-- Updated Items Table with All Items
INSERT INTO ITEM (Item_id, Iname, Itype, Stackable) VALUES
(1, 'Diamond_Sword', 'Weapon', 0),
(2, 'Iron_Pickaxe', 'Tool', 0),
(3, 'Diamond', 'Resource', 1),
(4, 'Stone', 'Block', 1),
(5, 'Apple', 'Food', 1),
(6, 'Diamond_Helmet', 'Armor', 0),
(7, 'Wooden_Planks', 'Block', 1),
(8, 'Iron_Ingot', 'Resource', 1),
(9, 'Bread', 'Food', 1),
(10, 'Diamond_Chestplate', 'Armor', 0),
(11, 'Iron_Sword', 'Weapon', 0),
(12, 'Golden_Sword', 'Weapon', 0),
(13, 'Iron_Helmet', 'Armor', 0),
(14, 'Golden_Apple', 'Food', 1),
(15, 'Emerald', 'Resource', 1),
(16, 'Obsidian', 'Block', 1),
(17, 'Cooked_Beef', 'Food', 1),
(18, 'Diamond_Boots', 'Armor', 0),
(19, 'Iron_Chestplate', 'Armor', 0),
(20, 'Cobblestone', 'Block', 1),
(21, 'Netherite_Sword', 'Weapon', 0),
(22, 'Gold_Ingot', 'Resource', 1),
(23, 'Cooked_Chicken', 'Food', 1),
(24, 'Diamond_Pickaxe', 'Tool', 0),
(25, 'Netherite_Helmet', 'Armor', 0),
(26, 'Carrot', 'Food', 1),
(27, 'Potato', 'Food', 1),
(28, 'Mushroom Stew', 'Food', 1),
(29, 'Cooked Porkchop', 'Food', 1),
(30, 'Rabbit Stew', 'Food', 1),
(31, 'Bread (Different ID)', 'Food', 1),
(32, 'Sweet Berries', 'Food', 1),
(33, 'Cooked Mutton', 'Food', 1),
(34, 'Baked Potato', 'Food', 1),
(35, 'Beetroot Soup', 'Food', 1),
(36, 'Enchanted Golden Apple', 'Food', 1),
(37, 'Glistering Melon', 'Food', 1),
(38, 'Cooked Rabbit', 'Food', 1),
(39, 'Cooked Salmon', 'Food', 1),
(40, 'Tropical Fish', 'Food', 1),
(41, 'Cooked Lamb Chop', 'Food', 1),
(42, 'Cooked Duck', 'Food', 1),
(43, 'Cooked Chicken Leg', 'Food', 1),
(44, 'Steamed Fish', 'Food', 1),
(45, 'Grilled Vegetables', 'Food', 1),
(46, 'Dirt', 'Block', 1),
(47, 'Wood', 'Block', 1),
(48, 'Sapling', 'Block', 1),
(49, 'Bedrock', 'Block', 1),
(50, 'Sand', 'Block', 1),
(51, 'Gravel', 'Block', 1),
(52, 'Clay', 'Block', 1),
(53, 'Gold Ore', 'Block', 1),
(54, 'Iron Ore', 'Block', 1),
(55, 'Diamond Ore', 'Block', 1),
(56, 'Lapis Lazuli Ore', 'Block', 1),
(57, 'Redstone Ore', 'Block', 1),
(58, 'Snow Block', 'Block', 1),
(59, 'Sandstone', 'Block', 1),
(60, 'Bookshelf', 'Block', 1),
(61, 'Glowstone', 'Block', 1),
(62, 'Nether Quartz Ore', 'Block', 1),
(63, 'Netherrack', 'Block', 1),
(64, 'Nether Brick', 'Block', 1),
(65, 'End Stone', 'Block', 1);



-- WORLD table
INSERT INTO WORLD (Owner_pid, Wname, Spawn_x_coord, Spawn_y_coord, Spawn_z_coord, Def_gamemode, Difficulty, Cheats, Tickspeed) VALUES
(1, 'Varun_World', 100, 64, 100, 'survival', 'normal', 0, 20),
(2, 'Saiyam_Realm', 0, 64, 0, 'creative', 'hard', 1, 20),
(3, 'Nidhish_Land', 50, 70, 50, 'survival', 'peaceful', 0, 20),
(4, 'Krishak_Server', -100, 64, -100, 'adventure', 'hard', 0, 20),
(5, 'Dragon_World', 200, 70, 200, 'survival', 'hard', 0, 20),
(6, 'Creative_Hub', 0, 100, 0, 'creative', 'peaceful', 1, 20),
(7, 'Survival_Island', -50, 64, -50, 'survival', 'hard', 0, 20),
(8, 'Adventure_Land', 150, 64, 150, 'adventure', 'normal', 0, 20);

-- STRUCTURE table
INSERT INTO STRUCTURE (Bname, Sname, Generate_chance) VALUES
('Plains', 'Village', 0.3),
('Desert', 'Pyramid', 0.2),
('Forest', 'Woodland_Mansion', 0.1),
('Ocean', 'Shipwreck', 0.4),
('Mountains', 'Mineshaft', 0.5),
('Nether_Wastes', 'Fortress', 0.25),
('End', 'End_City', 0.2),
('Desert', 'Desert_Well', 0.15),
('Plains', 'Pillager_Outpost', 0.2),
('Ocean', 'Ocean_Monument', 0.1),
('Swamp', 'Witch_Hut', 0.15),
('Mountains', 'Igloos', 0.2);

-- ARMAMENT table
INSERT INTO ARMAMENT (Item_id, Damage, Durability, Armor_points) VALUES
(1, 7, 1561, 0),    -- Diamond Sword
(2, 4, 250, 0),     -- Iron Pickaxe
(6, 0, 363, 3),     -- Diamond Helmet
(10, 0, 528, 8),    -- Diamond Chestplate
(11, 6, 250, 0),    -- Iron Sword
(12, 4, 32, 0),     -- Golden Sword
(13, 0, 165, 2),    -- Iron Helmet
(18, 0, 429, 3),    -- Diamond Boots
(19, 0, 240, 6),    -- Iron Chestplate
(21, 8, 2031, 0),   -- Netherite Sword
(24, 5, 1561, 0),   -- Diamond Pickaxe
(25, 0, 407, 3);    -- Netherite Helmet

-- New Consumables Table
INSERT INTO CONSUMABLE (Item_id, Saturation, Hunger_filled) VALUES
(26, 4, 4),       -- Carrot
(27, 2.4, 3),     -- Potato
(28, 4.8, 2),     -- Mushroom Stew
(29, 8.4, 7),     -- Cooked Porkchop
(30, 3.2, 3),     -- Rabbit Stew
(31, 5, 5),       -- Bread (Different ID for variety)
(32, 6, 5),       -- Sweet Berries
(33, 10, 8),      -- Cooked Mutton
(34, 9, 7),       -- Baked Potato
(35, 6, 5),       -- Beetroot Soup
(36, 12, 10),     -- Enchanted Golden Apple
(37, 5, 4),       -- Glistering Melon
(38, 7, 6),       -- Cooked Rabbit
(39, 8.4, 7),     -- Cooked Salmon
(40, 4, 4),       -- Tropical Fish
(41, 9, 8),       -- Cooked Lamb Chop
(42, 6.5, 6),     -- Cooked Duck
(43, 7.2, 6),     -- Cooked Chicken Leg
(44, 5, 4),       -- Steamed Fish
(45, 6.5, 6);     -- Grilled Vegetables


-- New Blocks Table
INSERT INTO BLOCK (Item_id, Height, Flammable, Blast_resistance) VALUES
(46, 1, 0, 6),     -- Dirt
(47, 1, 1, 15),    -- Wood
(48, 1, 1, 15),    -- Sapling
(49, 2, 0, 10),    -- Bedrock
(50, 0.5, 0, 15),  -- Sand
(51, 1.5, 0, 12),  -- Gravel
(52, 0.5, 1, 5),   -- Clay
(53, 0.8, 0, 6),   -- Gold Ore
(54, 1, 1, 4),     -- Iron Ore
(55, 1.2, 0, 10),  -- Diamond Ore
(56, 1, 0, 8),     -- Lapis Lazuli Ore
(57, 1, 0, 6),     -- Redstone Ore
(58, 1, 1, 10),    -- Snow Block
(59, 1.5, 0, 4),   -- Sandstone
(60, 1, 0, 6),     -- Bookshelf
(61, 1, 0, 3),     -- Glowstone
(62, 1, 0, 7),     -- Nether Quartz Ore
(63, 0.9, 0, 6),   -- Netherrack
(64, 2, 1, 10),    -- Nether Brick
(65, 1.5, 0, 5);   -- End Stone

INSERT INTO CRAFTS (Reactant_id, Product_id) VALUES
(3, 1),    -- Diamond -> Diamond Sword
(8, 11),   -- Iron Ingot -> Iron Sword
(8, 13),   -- Iron Ingot -> Iron Helmet
(8, 19),   -- Iron Ingot -> Iron Chestplate
(3, 6),    -- Diamond -> Diamond Helmet
(3, 10),   -- Diamond -> Diamond Chestplate
(3, 18),   -- Diamond -> Diamond Boots
(3, 24),   -- Diamond -> Diamond Pickaxe
(8, 2),    -- Iron Ingot -> Iron Pickaxe
(22, 12),  -- Gold Ingot -> Golden Sword
(47, 7),   -- Wood -> Wooden Planks
(54, 8),   -- Iron Ore -> Iron Ingot
(53, 22),  -- Gold Ore -> Gold Ingot
(55, 3),   -- Diamond Ore -> Diamond
(27, 34),  -- Potato -> Baked Potato
(50, 59);  -- Sand -> Sandstone


-- FRIENDSHIP table
INSERT INTO FRIENDSHIP (PID1, PID2) VALUES
(1, 2), (2, 1),   -- Varun and Saiyam are friends
(3, 4), (4, 3),   -- Nidhish and Krishak are friends
(5, 6), (6, 5),   -- Bond brothers are friends
(7, 8), (8, 7),   -- DragonSlayer99 and MineKing123 are friends
(9, 10), (10, 9), -- CraftMaster and RedstoneWizard are friends
(1, 3), (3, 1),   -- Varun and Nidhish are friends
(2, 4), (4, 2);   -- Saiyam and Krishak are friends

INSERT INTO GAMERULE (Owner_pid, Wname, Rule_name, Value) VALUES
(1, 'Varun_World', 'keepInventory', 1),
(1, 'Varun_World', 'doDaylightCycle', 1),
(2, 'Saiyam_Realm', 'mobGriefing', 0),
(2, 'Saiyam_Realm', 'doFireTick', 0),
(3, 'Nidhish_Land', 'keepInventory', 1),
(3, 'Nidhish_Land', 'doMobSpawning', 1),
(4, 'Krishak_Server', 'pvp', 1),
(4, 'Krishak_Server', 'doWeatherCycle', 1),
(5, 'Dragon_World', 'showDeathMessages', 1),
(6, 'Creative_Hub', 'doMobSpawning', 0),
(7, 'Survival_Island', 'naturalRegeneration', 1),
(8, 'Adventure_Land', 'commandBlockOutput', 0);

-- DROPS table
INSERT INTO DROPS (Mname, Item_id, Drop_rate) VALUES
('Zombie', 5, 0.025),     -- Zombies might drop apples
('Sheep', 9, 0.1),        -- Sheep might drop bread
('Ender_Dragon', 3, 1),   -- Ender Dragon drops diamond
('Zombie', 8, 0.025),     -- Zombies might drop iron ingots
('Creeper', 20, 0.5),     -- Creepers often drop cobblestone
('Villager', 15, 0.1),    -- Villagers might drop emeralds
('Sheep', 17, 0.05),      -- Sheep might drop cooked beef
('Chicken', 23, 0.8),     -- Chickens drop cooked chicken
('Blaze', 22, 0.3),       -- Blazes drop gold ingots
('Spider', 7, 0.2),       -- Spiders might drop wooden planks
('Enderman', 16, 0.1),    -- Endermen might drop obsidian
('Wither', 25, 0.5);      -- Wither might drop netherite helmet

-- SPAWN_IN_BIOME table
INSERT INTO SPAWN_IN_BIOME (Mname, Bname, Spawn_rate, Despawn_time) VALUES
('Zombie', 'Plains', 0.7, 300),
('Creeper', 'Forest', 0.6, 300),
('Sheep', 'Plains', 0.8, 0),
('Villager', 'Plains', 0.5, 0),
('Spider', 'Forest', 0.6, 300),
('Cow', 'Plains', 0.7, 0),
('Pig', 'Forest', 0.6, 0),
('Chicken', 'Plains', 0.6, 0),
('Enderman', 'End', 0.4, 300),
('Blaze', 'Nether_Wastes', 0.3, 300);

-- PLAYER_INSTANCE table
INSERT INTO PLAYER_INSTANCE (Pid, Owner_pid, Wname, Health, Hunger, Experience, Gamemode, Blocks_placed, Items_crafted) VALUES
(1, 1, 'Varun_World', 20, 20, 1000, 'survival', 500, 200),
(2, 2, 'Saiyam_Realm', 20, 20, 2000, 'creative', 1000, 500),
(3, 3, 'Nidhish_Land', 20, 20, 1500, 'survival', 750, 300),
(4, 4, 'Krishak_Server', 20, 20, 1800, 'adventure', 600, 250),
(5, 5, 'Dragon_World', 20, 20, 2500, 'survival', 800, 400),
(6, 6, 'Creative_Hub', 20, 20, 3000, 'creative', 1500, 700),
(7, 7, 'Survival_Island', 20, 20, 1700, 'survival', 550, 280),
(8, 8, 'Adventure_Land', 20, 20, 1600, 'adventure', 450, 200);

-- POSSIBLE_ENCHANTMENT table
INSERT INTO POSSIBLE_ENCHANTMENT (Armament_id, Enchantment) VALUES
(1, 'Sharpness'),
(1, 'Unbreaking'),
(1, 'Fire_Aspect'),
(6, 'Protection'),
(6, 'Unbreaking'),
(11, 'Sharpness'),
(11, 'Knockback'),
(18, 'Protection'),
(18, 'Feather_Falling'),
(21, 'Sharpness'),
(21, 'Looting'),
(24, 'Efficiency'),
(24, 'Fortune'),
(25, 'Protection'),
(25, 'Thorns');

INSERT INTO BREAKS (Pid, Owner_pid, Wname, Block_id, count) VALUES
(1, 1, 'Varun_World', 46, 500),      -- Dirt
(1, 1, 'Varun_World', 47, 200),      -- Wood
(2, 2, 'Saiyam_Realm', 55, 50),      -- Diamond Ore
(2, 2, 'Saiyam_Realm', 54, 100),     -- Iron Ore
(3, 3, 'Nidhish_Land', 50, 300),     -- Sand
(3, 3, 'Nidhish_Land', 51, 150),     -- Gravel
(4, 4, 'Krishak_Server', 52, 75),     -- Clay
(4, 4, 'Krishak_Server', 53, 25),     -- Gold Ore
(5, 5, 'Dragon_World', 63, 400),      -- Netherrack
(5, 5, 'Dragon_World', 65, 100),      -- End Stone
(6, 6, 'Creative_Hub', 60, 50),       -- Bookshelf
(6, 6, 'Creative_Hub', 61, 30),       -- Glowstone
(7, 7, 'Survival_Island', 47, 250),   -- Wood
(7, 7, 'Survival_Island', 48, 100),   -- Sapling
(8, 8, 'Adventure_Land', 46, 150),    -- Dirt
(8, 8, 'Adventure_Land', 50, 200);    -- Sand


-- RECIPE table continued (using 0 for empty slots)
INSERT INTO RECIPE (Item_id, Item_recipe_1, Item_recipe_2, Item_recipe_3, Item_recipe_4, Item_recipe_5, Item_recipe_6, Item_recipe_7, Item_recipe_8, Item_recipe_9) VALUES
(1, 3, 0, 0, 3, 0, 0, 3, 0, 0),     -- Diamond Sword (3 diamonds + 2 sticks)
(11, 8, 0, 0, 8, 0, 0, 8, 0, 0),    -- Iron Sword (3 iron ingots + 2 sticks)
(19, 8, 0, 8, 8, 8, 8, 8, 8, 8),    -- Iron Chestplate (8 iron ingots)
(6, 3, 3, 3, 3, 3, 0, 0, 0, 0),     -- Diamond Helmet (5 diamonds)
(10, 3, 0, 3, 3, 3, 3, 3, 3, 3),    -- Diamond Chestplate (8 diamonds)
(18, 3, 0, 3, 3, 0, 3, 0, 0, 0),    -- Diamond Boots (4 diamonds)
(24, 3, 3, 3, 0, 7, 0, 0, 7, 0),    -- Diamond Pickaxe (3 diamonds + 2 sticks)
(2, 8, 8, 8, 0, 7, 0, 0, 7, 0);     -- Iron Pickaxe (3 iron ingots + 2 sticks)

-- SPAWN_IN_STRUCTURE table
INSERT INTO SPAWN_IN_STRUCTURE (Mname, Bname, Sname, Spawn_rate) VALUES
('Zombie', 'Plains', 'Village', 0.4),
('Villager', 'Plains', 'Village', 0.8),
('Creeper', 'Mountains', 'Mineshaft', 0.3),
('Zombie', 'Desert', 'Pyramid', 0.5),
('Skeleton', 'Mountains', 'Mineshaft', 0.4),
('Witch', 'Swamp', 'Witch_Hut', 1.0),
('Iron_Golem', 'Plains', 'Village', 0.3),
('Spider', 'Mountains', 'Mineshaft', 0.4),
('Blaze', 'Nether_Wastes', 'Fortress', 0.7),
('Enderman', 'End', 'End_City', 0.5);

-- LOOT table
INSERT INTO LOOT (Bname, Sname, Item_id, Chance_of_finding) VALUES
('Plains', 'Village', 8, 0.6),         -- Iron Ingot in Village
('Desert', 'Pyramid', 15, 0.4),        -- Emerald in Pyramid
('Mountains', 'Mineshaft', 3, 0.2),    -- Diamond in Mineshaft
('Ocean', 'Shipwreck', 14, 0.3),       -- Golden Apple in Shipwreck
('Nether_Wastes', 'Fortress', 22, 0.5), -- Gold Ingot in Fortress
('End', 'End_City', 3, 0.7),           -- Diamond in End City
('Mountains', 'Mineshaft', 8, 0.5),    -- Iron Ingot in Mineshaft
('Ocean', 'Ocean_Monument', 3, 0.4),   -- Diamond in Ocean Monument
('Desert', 'Pyramid', 22, 0.5),        -- Gold Ingot in Pyramid
('Forest', 'Woodland_Mansion', 14, 0.2); -- Golden Apple in Woodland Mansion

-- PLAYER_EFFECT table
INSERT INTO PLAYER_EFFECT (Pid, Owner_pid, Wname, Effect_name, COUNT) VALUES
(1, 1, 'Varun_World', 'Speed', 1),
(2, 2, 'Saiyam_Realm', 'Night_Vision', 1),
(3, 3, 'Nidhish_Land', 'Strength', 2),
(4, 4, 'Krishak_Server', 'Regeneration', 1),
(1, 1, 'Varun_World', 'Jump_Boost', 2),
(2, 2, 'Saiyam_Realm', 'Fire_Resistance', 1),
(3, 3, 'Nidhish_Land', 'Water_Breathing', 1),
(4, 4, 'Krishak_Server', 'Resistance', 2),
(5, 5, 'Dragon_World', 'Strength', 3),
(6, 6, 'Creative_Hub', 'Night_Vision', 1);

-- ACQUIRES table
INSERT INTO ACQUIRES (Pid, Owner_pid, Wname, Item_id, Count) VALUES
(1, 1, 'Varun_World', 3, 5),     -- Varun has 5 diamonds
(1, 1, 'Varun_World', 8, 10),    -- Varun has 10 iron ingots
(2, 2, 'Saiyam_Realm', 16, 20),  -- Saiyam has 20 obsidian
(3, 3, 'Nidhish_Land', 15, 8),   -- Nidhish has 8 emeralds
(4, 4, 'Krishak_Server', 17, 6), -- Krishak has 6 cooked beef
(5, 5, 'Dragon_World', 3, 12),   -- DragonSlayer has 12 diamonds
(6, 6, 'Creative_Hub', 22, 15),  -- BondBrother1 has 15 gold ingots
(7, 7, 'Survival_Island', 24, 1), -- Player has diamond pickaxe
(8, 8, 'Adventure_Land', 14, 3), -- Player has 3 golden apples
(1, 1, 'Varun_World', 1, 1);     -- Varun has diamond sword

-- TRADE table
INSERT INTO TRADE (Pid, Owner_pid, Wname, Given_item_id, Received_item_id, cost, Experience_gain) VALUES
(1, 1, 'Varun_World', 15, 3, 5, 10),       -- Trade emerald for diamond
(2, 2, 'Saiyam_Realm', 8, 15, 3, 5),       -- Trade iron ingot for emerald
(3, 3, 'Nidhish_Land', 15, 14, 8, 15),     -- Trade emerald for golden apple
(4, 4, 'Krishak_Server', 15, 11, 6, 12),    -- Trade emerald for iron sword
(5, 5, 'Dragon_World', 22, 14, 4, 8),      -- Trade gold ingot for golden apple
(6, 6, 'Creative_Hub', 15, 24, 10, 20),    -- Trade emerald for diamond pickaxe
(7, 7, 'Survival_Island', 8, 9, 2, 4),     -- Trade iron ingot for bread
(8, 8, 'Adventure_Land', 15, 17, 3, 6);    -- Trade emerald for cooked beef

INSERT INTO KILLS (Pid, Owner_pid, Wname, Mname, Count, Experience_gain) VALUES
(1, 1, 'Varun_World', 'Zombie', 50, 250),
(1, 1, 'Varun_World', 'Creeper', 25, 175),
(2, 2, 'Saiyam_Realm', 'Skeleton', 40, 200),
(3, 3, 'Nidhish_Land', 'Spider', 30, 150),
(4, 4, 'Krishak_Server', 'Zombie', 45, 225),
(5, 5, 'Dragon_World', 'Ender_Dragon', 1, 500),
(6, 6, 'Creative_Hub', 'Blaze', 20, 160),
(7, 7, 'Survival_Island', 'Enderman', 15, 225),
(8, 8, 'Adventure_Land', 'Witch', 10, 150),
(1, 1, 'Varun_World', 'Skeleton', 35, 175);

-- Adding new INVENTORY entries (depends on PLAYER_INSTANCE and ITEM)
INSERT INTO INVENTORY (Pid, Owner_pid, Wname, Item_id, Count) VALUES
(1, 1, 'Varun_World', 1, 1),    -- Diamond Sword
(1, 1, 'Varun_World', 3, 64),   -- Diamond Stack
(2, 2, 'Saiyam_Realm', 2, 1),   -- Iron Pickaxe
(3, 3, 'Nidhish_Land', 5, 32),  -- Apple Stack
(4, 4, 'Krishak_Server', 8, 64), -- Iron Ingot Stack
(5, 5, 'Dragon_World', 6, 1),   -- Diamond Helmet
(6, 6, 'Creative_Hub', 14, 5),  -- Golden Apple
(7, 7, 'Survival_Island', 17, 16), -- Cooked Beef
(8, 8, 'Adventure_Land', 24, 1), -- Diamond Pickaxe
(1, 1, 'Varun_World', 10, 1);   -- Diamond Chestplate
