#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: Categorie
#------------------------------------------------------------

CREATE TABLE Categorie(
        Categorie Varchar (25) NOT NULL ,
        PRIMARY KEY (Categorie )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Genre
#------------------------------------------------------------

CREATE TABLE Genre(
        Genre     Varchar (25) NOT NULL ,
        Categorie Varchar (25) NOT NULL ,
        PRIMARY KEY (Genre )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Article
#------------------------------------------------------------

CREATE TABLE Article(
        id_article       int (11) Auto_increment  NOT NULL ,
        Reference        Varchar (25) NOT NULL ,
        Titre            Varchar (100) NOT NULL ,
        Prix             DECIMAL (15,3)  NOT NULL ,
        Reappro_Possible Bool NOT NULL ,
        TVA              Float NOT NULL ,
        Prix_Promo       DECIMAL (15,3)  NOT NULL ,
        Debut_Promo      Date NOT NULL ,
        Fin_promo        Date NOT NULL ,
        Seuil            Int NOT NULL ,
        Quantite         Int NOT NULL ,
        Quantite_Reappro Int NOT NULL ,
        Genre            Varchar (25) NOT NULL ,
        Editeur          Varchar (25) NOT NULL ,
        id_auteur        Int ,
        PRIMARY KEY (id_article )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: MotCle
#------------------------------------------------------------

CREATE TABLE MotCle(
        Mot_Cle Varchar (25) NOT NULL ,
        PRIMARY KEY (Mot_Cle )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Commande
#------------------------------------------------------------

CREATE TABLE Commande(
        Numero_Commande       Varchar (25) NOT NULL ,
        Autorisation_payement Bool NOT NULL ,
        Numero_Autorisation   Varchar (25) NOT NULL ,
        Date_autorisation     Date NOT NULL ,
        Numero_livraison      Varchar (25) NOT NULL ,
        Date_commande         Date NOT NULL ,
        Livre                 Bool NOT NULL ,
        Etat_Commande         Varchar (25) NOT NULL ,
        Identifiant           Varchar (25) NOT NULL ,
        PRIMARY KEY (Numero_Commande )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Client
#------------------------------------------------------------

CREATE TABLE Client(
        Identifiant Varchar (25) NOT NULL ,
        Prenom      Varchar (25) NOT NULL ,
        Nom         Varchar (50) NOT NULL ,
        email       Varchar (50) ,
        Adresse     Varchar (25) NOT NULL ,
        CP          Int NOT NULL ,
        Ville       Varchar (50) NOT NULL ,
        PRIMARY KEY (Identifiant )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Editeur
#------------------------------------------------------------

CREATE TABLE Editeur(
        Editeur Varchar (25) NOT NULL ,
        PRIMARY KEY (Editeur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Auteur
#------------------------------------------------------------

CREATE TABLE Auteur(
        Prenom    Varchar (25) NOT NULL ,
        Nom       Varchar (50) NOT NULL ,
        id_auteur int (11) Auto_increment  NOT NULL ,
        PRIMARY KEY (id_auteur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Ligne de commande
#------------------------------------------------------------

CREATE TABLE Ligne_de_commande(
        Quantite_livre   Int NOT NULL ,
        Prix_unitaire    DECIMAL (15,3)  NOT NULL ,
        QuantiteCommande Int NOT NULL ,
        Numero_Commande  Varchar (25) NOT NULL ,
        id_article       Int NOT NULL ,
        PRIMARY KEY (Numero_Commande ,id_article )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: caracterise
#------------------------------------------------------------

CREATE TABLE caracterise(
        id_article Int NOT NULL ,
        Mot_Cle    Varchar (25) NOT NULL ,
        PRIMARY KEY (id_article ,Mot_Cle )
)ENGINE=InnoDB;

ALTER TABLE Genre ADD CONSTRAINT FK_Genre_Categorie FOREIGN KEY (Categorie) REFERENCES Categorie(Categorie);
ALTER TABLE Article ADD CONSTRAINT FK_Article_Genre FOREIGN KEY (Genre) REFERENCES Genre(Genre);
ALTER TABLE Article ADD CONSTRAINT FK_Article_Editeur FOREIGN KEY (Editeur) REFERENCES Editeur(Editeur);
ALTER TABLE Article ADD CONSTRAINT FK_Article_id_auteur FOREIGN KEY (id_auteur) REFERENCES Auteur(id_auteur);
ALTER TABLE Commande ADD CONSTRAINT FK_Commande_Identifiant FOREIGN KEY (Identifiant) REFERENCES Client(Identifiant);
ALTER TABLE Ligne_de_commande ADD CONSTRAINT FK_Ligne_de_commande_Numero_Commande FOREIGN KEY (Numero_Commande) REFERENCES Commande(Numero_Commande);
ALTER TABLE Ligne_de_commande ADD CONSTRAINT FK_Ligne_de_commande_id_article FOREIGN KEY (id_article) REFERENCES Article(id_article);
ALTER TABLE caracterise ADD CONSTRAINT FK_caracterise_id_article FOREIGN KEY (id_article) REFERENCES Article(id_article);
ALTER TABLE caracterise ADD CONSTRAINT FK_caracterise_Mot_Cle FOREIGN KEY (Mot_Cle) REFERENCES MotCle(Mot_Cle);
