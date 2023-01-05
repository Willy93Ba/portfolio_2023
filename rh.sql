-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Serveur: 127.0.0.1
-- Généré le : Jeu 05 Janvier 2023 à 16:36
-- Version du serveur: 5.5.10
-- Version de PHP: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `rh`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `NoEmp` int(11) NOT NULL,
  `Nom` varchar(20) NOT NULL,
  `Prenom` varchar(20) NOT NULL,
  `Sexe` varchar(1) NOT NULL,
  `Salaire` int(11) NOT NULL,
  `TypeContrat` varchar(20) NOT NULL,
  `Fonction` varchar(20) NOT NULL,
  `Site` varchar(20) NOT NULL,
  `DateEmbauche` date NOT NULL,
  `DateNaissance` date NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoEmp`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`NoEmp`, `Nom`, `Prenom`, `Sexe`, `Salaire`, `TypeContrat`, `Fonction`, `Site`, `DateEmbauche`, `DateNaissance`, `NoSrv`) VALUES
(1, 'Weber', 'Waldo', 'H', 9969, 'CDI', 'Directeur', 'Rosny', '1998-06-23', '2002-07-07', 7),
(2, 'Mestre', 'Tristan', 'H', 6969, 'CDI', 'Directeur', 'Rosny', '2007-01-11', '1994-12-16', 4525),
(231, 'Laure', 'FRIALAC', 'F', 4000, 'CDI', 'Comptable', 'Rosny', '2009-01-05', '1999-05-04', 11172),
(23414, 'Marie', 'Sahaira', 'F', 1500, 'CDI', 'Femme de Ménage', 'Rosny', '2009-12-16', '1999-02-04', 4525),
(112121, 'Azevail', 'Williou', 'H', 100000, 'CDI', 'Voiturier', 'Rosny', '2023-01-05', '2004-07-01', 7);

-- --------------------------------------------------------

--
-- Structure de la table `intervenir`
--

CREATE TABLE IF NOT EXISTS `intervenir` (
  `Num_Interv` varchar(20) NOT NULL,
  `NoProj` int(11) NOT NULL,
  `NoEmp` int(11) NOT NULL,
  `NbHeures` int(11) NOT NULL,
  PRIMARY KEY (`Num_Interv`),
  KEY `NoProj` (`NoProj`),
  KEY `NoEmp` (`NoEmp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `intervenir`
--

INSERT INTO `intervenir` (`Num_Interv`, `NoProj`, `NoEmp`, `NbHeures`) VALUES
('1212132414', 1113, 231, 5),
('1255', 1324, 112121, 6),
('16626', 31231, 23414, 12);

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE IF NOT EXISTS `projet` (
  `NoProj` int(11) NOT NULL,
  `LibelleProjet` varchar(20) NOT NULL,
  `NoSrv` int(11) NOT NULL,
  PRIMARY KEY (`NoProj`),
  KEY `NoSrv` (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `projet`
--

INSERT INTO `projet` (`NoProj`, `LibelleProjet`, `NoSrv`) VALUES
(1113, 'Akali', 7),
(1324, 'Sylas', 11172),
(31231, 'Yone', 4525);

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `NoSrv` int(11) NOT NULL,
  `NomSrv` varchar(20) NOT NULL,
  PRIMARY KEY (`NoSrv`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `service`
--

INSERT INTO `service` (`NoSrv`, `NomSrv`) VALUES
(7, 'Service Voiturier'),
(4525, 'Acceuil'),
(11172, 'Nettoyage ');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `employe_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `intervenir`
--
ALTER TABLE `intervenir`
  ADD CONSTRAINT `intervenir_ibfk_2` FOREIGN KEY (`NoEmp`) REFERENCES `employe` (`NoEmp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `intervenir_ibfk_1` FOREIGN KEY (`NoProj`) REFERENCES `projet` (`NoProj`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`NoSrv`) REFERENCES `service` (`NoSrv`) ON DELETE CASCADE ON UPDATE CASCADE;
