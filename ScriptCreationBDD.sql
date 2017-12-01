-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 01 Décembre 2017 à 10:53
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

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auteur`
--

CREATE TABLE IF NOT EXISTS `auteur` (
  `Prenom` varchar(25) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `id_auteur` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id_auteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Contenu de la table `auteur`
--

INSERT INTO `auteur` (`Prenom`, `Nom`, `id_auteur`) VALUES
('J.R.R.', 'Tolkien', 1),
('Isaac', 'Asimov', 2),
('Orelsan', '', 3),
('Booba', '', 4),
('Jean-Sébastien', 'Bach', 5),
('Terry', 'Goodkind', 6),
('Dr dre', '', 7);

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

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

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `caracterise`
--

CREATE TABLE IF NOT EXISTS `caracterise` (
  `id_article` int(11) NOT NULL,
  `Mot_Cle` varchar(25) NOT NULL,
  PRIMARY KEY (`id_article`,`Mot_Cle`),
  KEY `FK_caracterise_Mot_Cle` (`Mot_Cle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

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

CREATE TABLE IF NOT EXISTS `client` (
  `Identifiant` varchar(25) NOT NULL,
  `Prenom` varchar(25) NOT NULL,
  `Nom` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
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

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

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
(1, 'contenttypes', '0001_initial', '2017-12-01 09:56:41.019230'),
(2, 'auth', '0001_initial', '2017-12-01 09:56:48.883471'),
(3, 'admin', '0001_initial', '2017-12-01 09:56:50.960830'),
(4, 'admin', '0002_logentry_remove_auto_add', '2017-12-01 09:56:51.111082'),
(5, 'contenttypes', '0002_remove_content_type_name', '2017-12-01 09:56:52.291571'),
(6, 'auth', '0002_alter_permission_name_max_length', '2017-12-01 09:56:52.999488'),
(7, 'auth', '0003_alter_user_email_max_length', '2017-12-01 09:56:53.621337'),
(8, 'auth', '0004_alter_user_username_opts', '2017-12-01 09:56:53.657596'),
(9, 'auth', '0005_alter_user_last_login_null', '2017-12-01 09:56:54.133132'),
(10, 'auth', '0006_require_contenttypes_0002', '2017-12-01 09:56:54.162881'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2017-12-01 09:56:54.225648'),
(12, 'auth', '0008_alter_user_username_max_length', '2017-12-01 09:56:55.080623'),
(13, 'lesite', '0001_initial', '2017-12-01 09:56:55.184990'),
(14, 'sessions', '0001_initial', '2017-12-01 09:56:55.883136');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `editeur`
--

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
('Rock & roll', 'Musique,DVD et Blu-ray');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_de_commande`
--

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

CREATE TABLE IF NOT EXISTS `motcle` (
  `Mot_Cle` varchar(25) NOT NULL,
  PRIMARY KEY (`Mot_Cle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_Article_id_auteur` FOREIGN KEY (`id_auteur`) REFERENCES `auteur` (`id_auteur`),
  ADD CONSTRAINT `FK_Article_Editeur` FOREIGN KEY (`Editeur`) REFERENCES `editeur` (`Editeur`),
  ADD CONSTRAINT `FK_Article_Genre` FOREIGN KEY (`Genre`) REFERENCES `genre` (`Genre`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `caracterise`
--
ALTER TABLE `caracterise`
  ADD CONSTRAINT `FK_caracterise_Mot_Cle` FOREIGN KEY (`Mot_Cle`) REFERENCES `motcle` (`Mot_Cle`),
  ADD CONSTRAINT `FK_caracterise_id_article` FOREIGN KEY (`id_article`) REFERENCES `article` (`id_article`);

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_Commande_Identifiant` FOREIGN KEY (`Identifiant`) REFERENCES `client` (`Identifiant`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

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
