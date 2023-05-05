-- LA 2023.05.03
-- FICHIER MYSQL POUR FAIRE FONCTIONNER LES EXEMPLES
-- DE REQUETES MYSQL
-- Database: agostini_leo_info1a_inventaire

-- Destruction de la BD si elle existe.
-- Pour être certain d'avoir la dernière version des données

DROP DATABASE IF EXISTS agostini_leo_info1a_inventaire;

-- Création d'un nouvelle base de donnée

CREATE DATABASE IF NOT EXISTS agostini_leo_info1a_inventaire;

-- Utilisation de cette base de donnée

USE agostini_leo_info1a_inventaire;
-- --------------------------------------------------------
-- mettre ma base de données ci-dessous :

-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.27 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour agostini_leo_info1a_inventaire
DROP DATABASE IF EXISTS `agostini_leo_info1a_inventaire`;
CREATE DATABASE IF NOT EXISTS `agostini_leo_info1a_inventaire` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `agostini_leo_info1a_inventaire`;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_adresse
DROP TABLE IF EXISTS `t_adresse`;
CREATE TABLE IF NOT EXISTS `t_adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `adresse` varchar(50) DEFAULT NULL,
  `complement adresse` varchar(50) DEFAULT NULL,
  `code postale` varchar(20) DEFAULT NULL,
  `localite` varchar(20) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `pays` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_adresse : ~4 rows (environ)
/*!40000 ALTER TABLE `t_adresse` DISABLE KEYS */;
INSERT INTO `t_adresse` (`id`, `adresse`, `complement adresse`, `code postale`, `localite`, `numero`, `pays`) VALUES
	(1, 'rue de la Paix', NULL, '1018', 'Lausanne', 7, 'Suisse'),
	(2, 'Chemin du martinet', '3ème étage', '1007', 'Lausanne', 5, 'Suisse'),
	(3, 'Chemin des rosiers', NULL, '1004', 'Lausanne', 3, 'Suisse'),
	(4, 'Rue des haricots', 'REZ', '1010', 'Lausanne', 32, 'Suisse');
/*!40000 ALTER TABLE `t_adresse` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_batiment
DROP TABLE IF EXISTS `t_batiment`;
CREATE TABLE IF NOT EXISTS `t_batiment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `etage` int DEFAULT NULL,
  `acces` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_batiment : ~2 rows (environ)
/*!40000 ALTER TABLE `t_batiment` DISABLE KEYS */;
INSERT INTO `t_batiment` (`id`, `nom`, `etage`, `acces`) VALUES
	(1, 'Batiment D', 2, 1),
	(2, 'Batiment F', 3, 1),
	(3, 'Batiment A', 3, 1);
/*!40000 ALTER TABLE `t_batiment` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_batiment_avoir_adresse
DROP TABLE IF EXISTS `t_batiment_avoir_adresse`;
CREATE TABLE IF NOT EXISTS `t_batiment_avoir_adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_batiment` int NOT NULL,
  `fk_adresse` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_adresse` (`fk_adresse`),
  KEY `fk_batiment` (`fk_batiment`),
  CONSTRAINT `FK_t_batiment_avoir_adresse_t_adresse` FOREIGN KEY (`fk_adresse`) REFERENCES `t_adresse` (`id`),
  CONSTRAINT `FK_t_batiment_avoir_adresse_t_batiment` FOREIGN KEY (`fk_batiment`) REFERENCES `t_batiment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_batiment_avoir_adresse : ~3 rows (environ)
/*!40000 ALTER TABLE `t_batiment_avoir_adresse` DISABLE KEYS */;
INSERT INTO `t_batiment_avoir_adresse` (`id`, `fk_batiment`, `fk_adresse`) VALUES
	(0, 1, 3),
	(1, 3, 2),
	(2, 2, 4);
/*!40000 ALTER TABLE `t_batiment_avoir_adresse` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_batiment_avoir_site
DROP TABLE IF EXISTS `t_batiment_avoir_site`;
CREATE TABLE IF NOT EXISTS `t_batiment_avoir_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_batiment` int NOT NULL,
  `fk_site` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_batiment` (`fk_batiment`),
  KEY `fk_site` (`fk_site`),
  CONSTRAINT `FK_t_batiment_avoir_site_t_batiment` FOREIGN KEY (`fk_batiment`) REFERENCES `t_batiment` (`id`),
  CONSTRAINT `FK_t_batiment_avoir_site_t_site` FOREIGN KEY (`fk_site`) REFERENCES `t_site` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_batiment_avoir_site : ~0 rows (environ)
/*!40000 ALTER TABLE `t_batiment_avoir_site` DISABLE KEYS */;
INSERT INTO `t_batiment_avoir_site` (`id`, `fk_batiment`, `fk_site`) VALUES
	(1, 2, 1),
	(2, 3, 2),
	(3, 1, 3);
/*!40000 ALTER TABLE `t_batiment_avoir_site` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_clef
DROP TABLE IF EXISTS `t_clef`;
CREATE TABLE IF NOT EXISTS `t_clef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_clef : ~2 rows (environ)
/*!40000 ALTER TABLE `t_clef` DISABLE KEYS */;
INSERT INTO `t_clef` (`id`, `nom`) VALUES
	(1, 'Chaufferie'),
	(2, 'Datacenter'),
	(3, 'Salle de conférence');
/*!40000 ALTER TABLE `t_clef` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_clef_avoir_type_clef
DROP TABLE IF EXISTS `t_clef_avoir_type_clef`;
CREATE TABLE IF NOT EXISTS `t_clef_avoir_type_clef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_clef` int NOT NULL,
  `fk_type_clef` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clef` (`fk_clef`),
  KEY `fk_type_clef` (`fk_type_clef`),
  CONSTRAINT `FK_t_clef_avoir_type_clef_t_clef` FOREIGN KEY (`fk_clef`) REFERENCES `t_clef` (`id`),
  CONSTRAINT `FK_t_clef_avoir_type_clef_t_type_clef` FOREIGN KEY (`fk_type_clef`) REFERENCES `t_type_clef` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_clef_avoir_type_clef : ~0 rows (environ)
/*!40000 ALTER TABLE `t_clef_avoir_type_clef` DISABLE KEYS */;
INSERT INTO `t_clef_avoir_type_clef` (`id`, `fk_clef`, `fk_type_clef`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);
/*!40000 ALTER TABLE `t_clef_avoir_type_clef` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_contact
DROP TABLE IF EXISTS `t_contact`;
CREATE TABLE IF NOT EXISTS `t_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `prenom` varchar(50) DEFAULT NULL,
  `adresse de courriel` varchar(50) DEFAULT NULL,
  `telephone mobile` varchar(50) DEFAULT NULL,
  `telephone fixe` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone fax` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `titre de politesse` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_contact : ~3 rows (environ)
/*!40000 ALTER TABLE `t_contact` DISABLE KEYS */;
INSERT INTO `t_contact` (`id`, `nom`, `prenom`, `adresse de courriel`, `telephone mobile`, `telephone fixe`, `telephone fax`, `titre de politesse`) VALUES
	(1, 'Jacq', 'Kevin', 'kevin@outlook.com', '078 553 32 22', '021 333 22 98', '021 943 93 23', 'Monsieur'),
	(2, 'Leclair', 'Sarah', 'sarah@outlook.com', '079 234 84 23', '021 532 23 95', '021 742 24 82', 'Madame'),
	(3, 'Latour', 'Emma', 'emma@outlook.com', '078 342 24 92', '021 432 24 24', '021 439 94 24', 'Madame'),
	(4, 'Dupont', 'John', 'john@outlook.com', '078 324 95 24', '021 592 99 33', '021 925 29 53', 'Monsieur');
/*!40000 ALTER TABLE `t_contact` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_contact_avoir_role
DROP TABLE IF EXISTS `t_contact_avoir_role`;
CREATE TABLE IF NOT EXISTS `t_contact_avoir_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_personne` int NOT NULL,
  `fk_role` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_personne` (`fk_personne`),
  KEY `fk_role` (`fk_role`),
  CONSTRAINT `FK_t_contact_avoir_role_t_contact` FOREIGN KEY (`fk_personne`) REFERENCES `t_contact` (`id`),
  CONSTRAINT `FK_t_contact_avoir_role_t_role` FOREIGN KEY (`fk_role`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_contact_avoir_role : ~0 rows (environ)
/*!40000 ALTER TABLE `t_contact_avoir_role` DISABLE KEYS */;
INSERT INTO `t_contact_avoir_role` (`id`, `fk_personne`, `fk_role`) VALUES
	(1, 1, 3),
	(2, 2, 2),
	(3, 3, 1);
/*!40000 ALTER TABLE `t_contact_avoir_role` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_locale
DROP TABLE IF EXISTS `t_locale`;
CREATE TABLE IF NOT EXISTS `t_locale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_locale : ~2 rows (environ)
/*!40000 ALTER TABLE `t_locale` DISABLE KEYS */;
INSERT INTO `t_locale` (`id`, `nom`) VALUES
	(1, 'Locale A'),
	(2, 'Locale B'),
	(3, 'Locale C');
/*!40000 ALTER TABLE `t_locale` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_locale_avoir_clef
DROP TABLE IF EXISTS `t_locale_avoir_clef`;
CREATE TABLE IF NOT EXISTS `t_locale_avoir_clef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_locale` int NOT NULL,
  `fk_clef` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_locale` (`fk_locale`),
  KEY `fk_clef` (`fk_clef`),
  CONSTRAINT `FK_t_locale_avoir_clef_t_clef` FOREIGN KEY (`fk_clef`) REFERENCES `t_clef` (`id`),
  CONSTRAINT `FK_t_locale_avoir_clef_t_locale` FOREIGN KEY (`fk_locale`) REFERENCES `t_locale` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_locale_avoir_clef : ~0 rows (environ)
/*!40000 ALTER TABLE `t_locale_avoir_clef` DISABLE KEYS */;
INSERT INTO `t_locale_avoir_clef` (`id`, `fk_locale`, `fk_clef`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);
/*!40000 ALTER TABLE `t_locale_avoir_clef` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_objet
DROP TABLE IF EXISTS `t_objet`;
CREATE TABLE IF NOT EXISTS `t_objet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `garantie` varchar(50) DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  `etat` varchar(50) DEFAULT NULL,
  `code barre` varchar(50) DEFAULT NULL,
  `localisation` varchar(50) DEFAULT NULL,
  `emplacement` varchar(50) DEFAULT NULL,
  `est consomable` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_objet : ~2 rows (environ)
/*!40000 ALTER TABLE `t_objet` DISABLE KEYS */;
INSERT INTO `t_objet` (`id`, `nom`, `garantie`, `description`, `etat`, `code barre`, `localisation`, `emplacement`, `est consomable`) VALUES
	(1, 'Laptop01', '2 ans', 'Ordinateur portable', 'Neuf', '8901234567891', 'Suisse', 'locale A', 0),
	(2, 'SRV01', '3 ans', 'HP Serveur Gen 8', 'Ocasion', '7890123456785', 'Suisse', 'Locale B', 0),
	(3, 'Câble ethernet', 'Aucune', 'Câble RJ45', 'Neuf', '6789012345679', 'Suisse', 'Locale C', 1);
/*!40000 ALTER TABLE `t_objet` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_objet_avoir_locale
DROP TABLE IF EXISTS `t_objet_avoir_locale`;
CREATE TABLE IF NOT EXISTS `t_objet_avoir_locale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_objet` int NOT NULL,
  `fk_locale` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_objet` (`fk_objet`),
  KEY `fk_locale` (`fk_locale`),
  CONSTRAINT `FK_t_objet_avoir_locale_t_locale` FOREIGN KEY (`fk_locale`) REFERENCES `t_locale` (`id`),
  CONSTRAINT `FK_t_objet_avoir_locale_t_objet` FOREIGN KEY (`fk_objet`) REFERENCES `t_objet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_objet_avoir_locale : ~0 rows (environ)
/*!40000 ALTER TABLE `t_objet_avoir_locale` DISABLE KEYS */;
INSERT INTO `t_objet_avoir_locale` (`id`, `fk_objet`, `fk_locale`) VALUES
	(1, 3, 1),
	(2, 2, 2),
	(3, 1, 3);
/*!40000 ALTER TABLE `t_objet_avoir_locale` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_objet_avoir_type_objet
DROP TABLE IF EXISTS `t_objet_avoir_type_objet`;
CREATE TABLE IF NOT EXISTS `t_objet_avoir_type_objet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_objet` int NOT NULL,
  `fk_type_objet` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_objet` (`fk_objet`),
  KEY `fk_type_objet` (`fk_type_objet`),
  CONSTRAINT `FK_t_objet_avoir_type_objet_t_objet` FOREIGN KEY (`fk_objet`) REFERENCES `t_objet` (`id`),
  CONSTRAINT `FK_t_objet_avoir_type_objet_t_type_objet` FOREIGN KEY (`fk_type_objet`) REFERENCES `t_type_objet` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_objet_avoir_type_objet : ~0 rows (environ)
/*!40000 ALTER TABLE `t_objet_avoir_type_objet` DISABLE KEYS */;
INSERT INTO `t_objet_avoir_type_objet` (`id`, `fk_objet`, `fk_type_objet`) VALUES
	(1, 3, 2),
	(2, 1, 1),
	(3, 2, 1);
/*!40000 ALTER TABLE `t_objet_avoir_type_objet` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_role
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE IF NOT EXISTS `t_role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_role : ~0 rows (environ)
/*!40000 ALTER TABLE `t_role` DISABLE KEYS */;
INSERT INTO `t_role` (`id`, `nom`) VALUES
	(1, 'PDG'),
	(2, 'Informaticien'),
	(3, 'IT support');
/*!40000 ALTER TABLE `t_role` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_site
DROP TABLE IF EXISTS `t_site`;
CREATE TABLE IF NOT EXISTS `t_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `coordonnee` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_site : ~0 rows (environ)
/*!40000 ALTER TABLE `t_site` DISABLE KEYS */;
INSERT INTO `t_site` (`id`, `nom`, `coordonnee`) VALUES
	(1, 'Site 1', '1'),
	(2, 'Site 2', '2'),
	(3, 'Site 3', '3');
/*!40000 ALTER TABLE `t_site` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_societe
DROP TABLE IF EXISTS `t_societe`;
CREATE TABLE IF NOT EXISTS `t_societe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `adresse de courriel` varchar(50) DEFAULT NULL,
  `adresse web` varchar(50) DEFAULT NULL,
  `telephone fixe` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telephone fax` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `IDE` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_societe : ~0 rows (environ)
/*!40000 ALTER TABLE `t_societe` DISABLE KEYS */;
INSERT INTO `t_societe` (`id`, `nom`, `adresse de courriel`, `adresse web`, `telephone fixe`, `telephone fax`, `IDE`) VALUES
	(1, 'Global Industries Corp.', 'info@globalindustriescorp.com', 'http://www.globalindustriescorp.com/', '+1 (555) 123-4568', '+1 (555) 123-4567', 'GIC123456'),
	(2, 'Innovate Solutions Inc.', 'info@innovatesolutions.com', 'http://www.innovatesolutions.com/', '+1 (555) 987-6543', '+1 (555) 987-6544', 'ISI789012'),
	(3, 'Apex Enterprises LLC', 'info@apexenterprisesllc.com', 'http://www.apexenterprisesllc.com/', '+1 (555) 456-7890', '+1 (555) 456-7891', 'AEL678901'),
	(4, 'Acme Industries Group', 'info@acmeindustriesgroup.com', 'http://www.acmeindustriesgroup.com/', '+1 (555) 234-5678', '+1 (555) 234-5679', 'AIG234567');
/*!40000 ALTER TABLE `t_societe` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_societe_avoir_adresse
DROP TABLE IF EXISTS `t_societe_avoir_adresse`;
CREATE TABLE IF NOT EXISTS `t_societe_avoir_adresse` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_societe` int NOT NULL,
  `fk_adresse` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_societe` (`fk_societe`),
  KEY `fk_adresse` (`fk_adresse`),
  CONSTRAINT `FK_t_societe_avoir_adresse_t_adresse` FOREIGN KEY (`fk_adresse`) REFERENCES `t_adresse` (`id`),
  CONSTRAINT `FK_t_societe_avoir_adresse_t_societe` FOREIGN KEY (`fk_societe`) REFERENCES `t_societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_societe_avoir_adresse : ~0 rows (environ)
/*!40000 ALTER TABLE `t_societe_avoir_adresse` DISABLE KEYS */;
INSERT INTO `t_societe_avoir_adresse` (`id`, `fk_societe`, `fk_adresse`) VALUES
	(1, 2, 2),
	(2, 4, 4),
	(3, 3, 3);
/*!40000 ALTER TABLE `t_societe_avoir_adresse` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_societe_avoir_batiment
DROP TABLE IF EXISTS `t_societe_avoir_batiment`;
CREATE TABLE IF NOT EXISTS `t_societe_avoir_batiment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_societe` int NOT NULL,
  `fk_batiment` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_societe` (`fk_societe`),
  KEY `fk_batiment` (`fk_batiment`),
  CONSTRAINT `FK_t_societe_avoir_batiment_t_batiment` FOREIGN KEY (`fk_batiment`) REFERENCES `t_batiment` (`id`),
  CONSTRAINT `FK_t_societe_avoir_batiment_t_societe` FOREIGN KEY (`fk_societe`) REFERENCES `t_societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_societe_avoir_batiment : ~0 rows (environ)
/*!40000 ALTER TABLE `t_societe_avoir_batiment` DISABLE KEYS */;
INSERT INTO `t_societe_avoir_batiment` (`id`, `fk_societe`, `fk_batiment`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);
/*!40000 ALTER TABLE `t_societe_avoir_batiment` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_societe_avoir_contact
DROP TABLE IF EXISTS `t_societe_avoir_contact`;
CREATE TABLE IF NOT EXISTS `t_societe_avoir_contact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_societe` int NOT NULL,
  `fk_contact` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_societe` (`fk_societe`),
  KEY `fk_contact` (`fk_contact`),
  CONSTRAINT `FK_t_societe_avoir_contact_t_contact` FOREIGN KEY (`fk_contact`) REFERENCES `t_contact` (`id`),
  CONSTRAINT `FK_t_societe_avoir_contact_t_societe` FOREIGN KEY (`fk_societe`) REFERENCES `t_societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_societe_avoir_contact : ~0 rows (environ)
/*!40000 ALTER TABLE `t_societe_avoir_contact` DISABLE KEYS */;
INSERT INTO `t_societe_avoir_contact` (`id`, `fk_societe`, `fk_contact`) VALUES
	(1, 4, 4),
	(2, 3, 3),
	(3, 2, 2),
	(4, 1, 1);
/*!40000 ALTER TABLE `t_societe_avoir_contact` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_societe_avoir_objet
DROP TABLE IF EXISTS `t_societe_avoir_objet`;
CREATE TABLE IF NOT EXISTS `t_societe_avoir_objet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fk_societe` int NOT NULL,
  `fk_objet` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_societe` (`fk_societe`),
  KEY `fk_objet` (`fk_objet`),
  CONSTRAINT `FK_t_societe_avoir_objet_t_objet` FOREIGN KEY (`fk_objet`) REFERENCES `t_objet` (`id`),
  CONSTRAINT `FK_t_societe_avoir_objet_t_societe` FOREIGN KEY (`fk_societe`) REFERENCES `t_societe` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_societe_avoir_objet : ~0 rows (environ)
/*!40000 ALTER TABLE `t_societe_avoir_objet` DISABLE KEYS */;
INSERT INTO `t_societe_avoir_objet` (`id`, `fk_societe`, `fk_objet`) VALUES
	(1, 3, 1),
	(2, 1, 2),
	(3, 2, 3);
/*!40000 ALTER TABLE `t_societe_avoir_objet` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_type_clef
DROP TABLE IF EXISTS `t_type_clef`;
CREATE TABLE IF NOT EXISTS `t_type_clef` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_type_clef : ~0 rows (environ)
/*!40000 ALTER TABLE `t_type_clef` DISABLE KEYS */;
INSERT INTO `t_type_clef` (`id`, `nom type`) VALUES
	(1, 'type 1'),
	(2, 'type 2'),
	(3, 'type 3');
/*!40000 ALTER TABLE `t_type_clef` ENABLE KEYS */;

-- Listage de la structure de la table agostini_leo_info1a_inventaire. t_type_objet
DROP TABLE IF EXISTS `t_type_objet`;
CREATE TABLE IF NOT EXISTS `t_type_objet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table agostini_leo_info1a_inventaire.t_type_objet : ~0 rows (environ)
/*!40000 ALTER TABLE `t_type_objet` DISABLE KEYS */;
INSERT INTO `t_type_objet` (`id`, `nom type`) VALUES
	(1, 'Bureautique'),
	(2, 'Consomable'),
	(3, 'Câble');
/*!40000 ALTER TABLE `t_type_objet` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
