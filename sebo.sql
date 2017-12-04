-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Lun 04 Décembre 2017 à 13:33
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `sebo`
--
CREATE DATABASE IF NOT EXISTS `sebo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `sebo`;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

DROP TABLE IF EXISTS `article`;
CREATE TABLE IF NOT EXISTS `article` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `Reference` varchar(25) NOT NULL,
  `Titre` varchar(100) NOT NULL,
  `Prix` decimal(15,3) NOT NULL,
  `Reappro_Possible` tinyint(1) NOT NULL,
  `TVA` float NOT NULL,
  `Prix_Promo` decimal(15,3) NOT NULL,
  `Debut_Promo` date NOT NULL,
  `Fin_promo` date NOT NULL,
  `Seuil` int(11) NOT NULL,
  `Quantite` int(11) NOT NULL,
  `Quantite_Reappro` int(11) NOT NULL,
  `Genre` varchar(25) NOT NULL,
  `Editeur` varchar(25) NOT NULL,
  `id_auteur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_article`),
  KEY `FK_Article_Genre` (`Genre`),
  KEY `FK_Article_Editeur` (`Editeur`),
  KEY `FK_Article_id_auteur` (`id_auteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id_article`, `Reference`, `Titre`, `Prix`, `Reappro_Possible`, `TVA`, `Prix_Promo`, `Debut_Promo`, `Fin_promo`, `Seuil`, `Quantite`, `Quantite_Reappro`, `Genre`, `Editeur`, `id_auteur`) VALUES
(1, 'orel2017', 'La fête est finie', '15.000', 1, 20, '13.000', '2017-12-12', '2017-12-30', 10, 1000, 100, 'Rap', 'Polygram', 3),
(2, 'bachjs001', 'The very best of', '13.000', 1, 20, '12.000', '2017-12-26', '2017-12-31', 5, 100, 100, 'Classique', 'Fuckin''Rock', 5),
(3, 'vuillard2017', 'L''ordre du jour', '24.000', 1, 20, '20.000', '2017-12-21', '2017-12-28', 10, 1000, 120, 'roman policier', 'Hachette', 8),
(4, 'asimov1950', 'Fondation', '10.000', 0, 20, '8.000', '2017-12-14', '2018-01-25', 10, 150, 0, 'roman science-fiction', 'génération SYFY', 2),
(5, 'tolk003', 'Le seigneur des anneaux', '25.000', 1, 20, '22.000', '2017-12-27', '2017-12-31', 10, 1553, 120, 'roman fantastique', 'génération SYFY', 1);

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

DROP TABLE IF EXISTS `auteur`;
CREATE TABLE IF NOT EXISTS `auteur` (
  `Prenom` varchar(25) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `id_auteur` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_auteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`Prenom`, `Nom`, `id_auteur`) VALUES
('J.R.R.', 'Tolkien', 1),
('Isaac', 'Asimov', 2),
('Orelsan', 'Orelsan', 3),
('Booba', 'Booba', 4),
('Jean-Sébastien', 'Bach', 5),
('Terry', 'Goodkind', 6),
('Dr dre', 'Dr dre', 7),
('Eric', 'Vuillard', 8);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add auteur', 7, 'add_auteur'),
(20, 'Can change auteur', 7, 'change_auteur'),
(21, 'Can delete auteur', 7, 'delete_auteur'),
(22, 'Can add commande', 8, 'add_commande'),
(23, 'Can change commande', 8, 'change_commande'),
(24, 'Can delete commande', 8, 'delete_commande'),
(25, 'Can add editeur', 9, 'add_editeur'),
(26, 'Can change editeur', 9, 'change_editeur'),
(27, 'Can delete editeur', 9, 'delete_editeur'),
(28, 'Can add django migrations', 10, 'add_djangomigrations'),
(29, 'Can change django migrations', 10, 'change_djangomigrations'),
(30, 'Can delete django migrations', 10, 'delete_djangomigrations'),
(31, 'Can add motcle', 11, 'add_motcle'),
(32, 'Can change motcle', 11, 'change_motcle'),
(33, 'Can delete motcle', 11, 'delete_motcle'),
(34, 'Can add ligne de commande', 12, 'add_lignedecommande'),
(35, 'Can change ligne de commande', 12, 'change_lignedecommande'),
(36, 'Can delete ligne de commande', 12, 'delete_lignedecommande'),
(37, 'Can add client', 13, 'add_client'),
(38, 'Can change client', 13, 'change_client'),
(39, 'Can delete client', 13, 'delete_client'),
(40, 'Can add categorie', 14, 'add_categorie'),
(41, 'Can change categorie', 14, 'change_categorie'),
(42, 'Can delete categorie', 14, 'delete_categorie'),
(43, 'Can add article', 15, 'add_article'),
(44, 'Can change article', 15, 'change_article'),
(45, 'Can delete article', 15, 'delete_article'),
(46, 'Can add genre', 16, 'add_genre'),
(47, 'Can change genre', 16, 'change_genre'),
(48, 'Can delete genre', 16, 'delete_genre'),
(49, 'Can add contient', 17, 'add_contient'),
(50, 'Can change contient', 17, 'change_contient'),
(51, 'Can delete contient', 17, 'delete_contient');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$Wkc9Wf81RxZw$9tFT09kJtq9iUYIk6owtgLzCdSg+lxcFIqF4HpCj9OM=', '2017-12-04 09:15:42.251422', 1, 'visiteur2', '', '', 'visiteur2@afpa.fr', 1, 1, '2017-12-04 09:15:09.027866'),
(2, 'pbkdf2_sha256$36000$xLXQct4hLRDy$SCRl6wlGiNo0LmS1sqgXgLUyMwDdyaqk58hP6bChi1I=', NULL, 1, 'gilles', 'Gilles', 'Bonnet', 'gilles.bonnet@gmx.fr', 1, 1, '2017-12-04 09:24:00.000000');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=52 ;

--
-- Contenu de la table `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(1, 2, 1),
(2, 2, 2),
(3, 2, 3),
(4, 2, 4),
(5, 2, 5),
(6, 2, 6),
(7, 2, 7),
(8, 2, 8),
(9, 2, 9),
(10, 2, 10),
(11, 2, 11),
(12, 2, 12),
(13, 2, 13),
(14, 2, 14),
(15, 2, 15),
(16, 2, 16),
(17, 2, 17),
(18, 2, 18),
(19, 2, 19),
(20, 2, 20),
(21, 2, 21),
(22, 2, 22),
(23, 2, 23),
(24, 2, 24),
(25, 2, 25),
(26, 2, 26),
(27, 2, 27),
(28, 2, 28),
(29, 2, 29),
(30, 2, 30),
(31, 2, 31),
(32, 2, 32),
(33, 2, 33),
(34, 2, 34),
(35, 2, 35),
(36, 2, 36),
(37, 2, 37),
(38, 2, 38),
(39, 2, 39),
(40, 2, 40),
(41, 2, 41),
(42, 2, 42),
(43, 2, 43),
(44, 2, 44),
(45, 2, 45),
(46, 2, 46),
(47, 2, 47),
(48, 2, 48),
(49, 2, 49),
(50, 2, 50),
(51, 2, 51);

-- --------------------------------------------------------

--
-- Structure de la table `caracterise`
--

DROP TABLE IF EXISTS `caracterise`;
CREATE TABLE IF NOT EXISTS `caracterise` (
  `id_article` int(11) NOT NULL,
  `Mot_Cle` varchar(25) NOT NULL,
  PRIMARY KEY (`id_article`,`Mot_Cle`),
  KEY `FK_caracterise_Mot_Cle` (`Mot_Cle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `caracterise`
--

INSERT INTO `caracterise` (`id_article`, `Mot_Cle`) VALUES
(3, 'Livre'),
(4, 'Livre'),
(5, 'Livre'),
(1, 'Musique'),
(2, 'Musique');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
CREATE TABLE IF NOT EXISTS `categorie` (
  `Categorie` varchar(25) NOT NULL,
  PRIMARY KEY (`Categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`Categorie`) VALUES
('Hgh-Tech et informatique'),
('Jeux vidéos et consoles'),
('Livres & audibles'),
('Musique,DVD et Blu-ray');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `Identifiant` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `Adresse` varchar(25) NOT NULL,
  `CP` int(11) NOT NULL,
  `Ville` varchar(50) NOT NULL,
  PRIMARY KEY (`Identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`Identifiant`, `Prenom`, `Nom`, `email`, `Adresse`, `CP`, `Ville`) VALUES
('arcu.', 'Tasha', 'Morrison', 'nunc@auctorMauris.com', 'CP 603, 2815 Ornare Rue', 64668, 'Tavigny'),
('Duis', 'Tiger', 'Grimes', 'neque.vitae.semper@pretium.edu', 'CP 548, 6208 Enim. Route', 25323, 'HŽlŽcine'),
('habitant', 'Patricia', 'Snyder', 'Donec.luctus.aliquet@lorem.ca', 'Appartement 537-3347 Mi R', 40838, 'Coquimbo'),
('Mauris', 'James', 'Hampton', 'Aenean.eget@amet.org', '390-9447 Tellus Rue', 69465, 'Neustadt am Rübenberge'),
('neque.', 'Winifred', 'Morrow', 'nisi.sem.semper@quis.net', '6155 Et Rd.', 336931, 'Pitt Meadows'),
('non,', 'Anthony', 'Farley', 'dolor@rutrum.co.uk', 'CP 215, 9856 Egestas, Rd.', 9854, 'Baie-Comeau'),
('ultrices,', 'Mariko', 'Benton', 'Donec.feugiat.metus@aliquetodioEtiam.co.uk', '429 Non Ave', 52541, 'Houtave'),
('ut', 'Gannon', 'Craft', 'mattis.Integer@dui.ca', 'Appartement 560-8498 Null', 77, 'Sangerhausen'),
('vel', 'Erin', 'Byrd', 'Aliquam.vulputate@antedictum.co.uk', 'CP 894, 3716 A, Rue', 400898, 'Quedlinburg'),
('vitae,', 'Cally', 'Nichols', 'Ut.semper.pretium@enimnislelementum.net', '1982 Et Rd.', 69120, 'Ilkeston');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `Numero_Commande` varchar(25) NOT NULL,
  `Autorisation_payement` tinyint(1) NOT NULL,
  `Numero_Autorisation` varchar(25) NOT NULL,
  `Date_autorisation` date NOT NULL,
  `Numero_livraison` varchar(25) NOT NULL,
  `Date_commande` date NOT NULL,
  `Livre` tinyint(1) NOT NULL,
  `Etat_Commande` varchar(25) NOT NULL,
  `Identifiant` varchar(25) NOT NULL,
  PRIMARY KEY (`Numero_Commande`),
  KEY `FK_Commande_Identifiant` (`Identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `commande`
--

INSERT INTO `commande` (`Numero_Commande`, `Autorisation_payement`, `Numero_Autorisation`, `Date_autorisation`, `Numero_livraison`, `Date_commande`, `Livre`, `Etat_Commande`, `Identifiant`) VALUES
('94', 0, '', '0000-00-00', '', '2017-12-19', 0, 'PANIER', 'neque.');

--
-- Déclencheurs `commande`
--
DROP TRIGGER IF EXISTS `commande_before_insert`;
DELIMITER //
CREATE TRIGGER `commande_before_insert` BEFORE INSERT ON `commande`
 FOR EACH ROW IF NEW.Etat_Commande <> 'PANIER'
THEN
	SIGNAL SQLSTATE '45000';
END IF
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Contenu de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2017-12-04 09:24:01.112223', '2', 'gilles', 1, '[{"added": {}}]', 4, 1),
(2, '2017-12-04 09:24:59.570803', '2', 'gilles', 2, '[{"changed": {"fields": ["first_name", "last_name", "email", "is_staff", "is_superuser", "user_permissions"]}}]', 4, 1),
(3, '2017-12-04 10:10:31.287965', '7', 'Dr dre', 2, '[{"changed": {"fields": ["nom"]}}]', 7, 1),
(4, '2017-12-04 10:10:57.159483', '4', 'Booba', 2, '[{"changed": {"fields": ["nom"]}}]', 7, 1),
(5, '2017-12-04 10:11:10.639153', '3', 'Orelsan', 2, '[{"changed": {"fields": ["nom"]}}]', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(15, 'lesite', 'article'),
(7, 'lesite', 'auteur'),
(14, 'lesite', 'categorie'),
(13, 'lesite', 'client'),
(8, 'lesite', 'commande'),
(17, 'lesite', 'contient'),
(10, 'lesite', 'djangomigrations'),
(9, 'lesite', 'editeur'),
(16, 'lesite', 'genre'),
(12, 'lesite', 'lignedecommande'),
(11, 'lesite', 'motcle'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2017-12-04 09:12:54.912947'),
(2, 'auth', '0001_initial', '2017-12-04 09:13:01.618636'),
(3, 'admin', '0001_initial', '2017-12-04 09:13:03.687322'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-12-04 09:13:03.917321'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-12-04 09:13:05.081007'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-12-04 09:13:05.903821'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-12-04 09:13:06.810384'),
(8, 'auth', '0004_alter_user_username_opts', '2017-12-04 09:13:06.894966'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-12-04 09:13:07.472394'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-12-04 09:13:07.503837'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-12-04 09:13:07.556404'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-12-04 09:13:08.203721'),
(13, 'lesite', '0001_initial', '2017-12-04 09:13:08.313774'),
(14, 'sessions', '0001_initial', '2017-12-04 09:13:08.907611');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('n61bsros47r9vpyrcz52k8lzj3l41hw9', 'YTM2MjMyMDIxY2E3OTdhZjFlN2E3YTA0YzdiODgyMzhmYjYxNTNkMjp7Il9hdXRoX3VzZXJfaGFzaCI6ImEwNGM5N2JhNjAzMzFhYjlhY2RmYzg5ZjA3ZmJkMDUzMzcyMjM2ODEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-12-18 09:15:42.272087');

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

DROP TABLE IF EXISTS `editeur`;
CREATE TABLE IF NOT EXISTS `editeur` (
  `Editeur` varchar(25) NOT NULL,
  PRIMARY KEY (`Editeur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `editeur`
--

INSERT INTO `editeur` (`Editeur`) VALUES
('Folio'),
('Fuckin''Rock'),
('génération SYFY'),
('Hachette'),
('Polygram'),
('Roman Noir'),
('WeedMusic');

-- --------------------------------------------------------

--
-- Structure de la table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `Genre` varchar(25) NOT NULL,
  `Categorie` varchar(25) NOT NULL,
  PRIMARY KEY (`Genre`),
  KEY `FK_Genre_Categorie` (`Categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `genre`
--

INSERT INTO `genre` (`Genre`, `Categorie`) VALUES
('roman fantastique', 'Livres & audibles'),
('roman policier', 'Livres & audibles'),
('roman science-fiction', 'Livres & audibles'),
('Classique', 'Musique,DVD et Blu-ray'),
('Hip-Hop', 'Musique,DVD et Blu-ray'),
('Horreur', 'Musique,DVD et Blu-ray'),
('Policier', 'Musique,DVD et Blu-ray'),
('Rap', 'Musique,DVD et Blu-ray'),
('Rock & roll', 'Musique,DVD et Blu-ray');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_de_commande`
--

DROP TABLE IF EXISTS `ligne_de_commande`;
CREATE TABLE IF NOT EXISTS `ligne_de_commande` (
  `Quantite_livre` int(11) NOT NULL,
  `Prix_unitaire` decimal(15,3) NOT NULL,
  `QuantiteCommande` int(11) NOT NULL,
  `Numero_Commande` varchar(25) NOT NULL,
  `id_article` int(11) NOT NULL,
  PRIMARY KEY (`Numero_Commande`,`id_article`),
  KEY `FK_Ligne_de_commande_id_article` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `motcle`
--

DROP TABLE IF EXISTS `motcle`;
CREATE TABLE IF NOT EXISTS `motcle` (
  `Mot_Cle` varchar(25) NOT NULL,
  PRIMARY KEY (`Mot_Cle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contenu de la table `motcle`
--

INSERT INTO `motcle` (`Mot_Cle`) VALUES
('Livre'),
('Musique');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_Article_Editeur` FOREIGN KEY (`Editeur`) REFERENCES `editeur` (`Editeur`),
  ADD CONSTRAINT `FK_Article_Genre` FOREIGN KEY (`Genre`) REFERENCES `genre` (`Genre`),
  ADD CONSTRAINT `FK_Article_id_auteur` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id_auteur`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Contraintes pour la table `caracterise`
--
ALTER TABLE `caracterise`
  ADD CONSTRAINT `FK_caracterise_id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `FK_caracterise_Mot_Cle` FOREIGN KEY (`Mot_Cle`) REFERENCES `motcle` (`Mot_Cle`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_Commande_Identifiant` FOREIGN KEY (`Identifiant`) REFERENCES `client` (`Identifiant`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `genre`
--
ALTER TABLE `genre`
  ADD CONSTRAINT `FK_Genre_Categorie` FOREIGN KEY (`Categorie`) REFERENCES `categorie` (`Categorie`);

--
-- Contraintes pour la table `ligne_de_commande`
--
ALTER TABLE `ligne_de_commande`
  ADD CONSTRAINT `FK_Ligne_de_commande_id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`),
  ADD CONSTRAINT `FK_Ligne_de_commande_Numero_Commande` FOREIGN KEY (`Numero_Commande`) REFERENCES `commande` (`Numero_Commande`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
