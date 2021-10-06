alter session set NLS_DATE_FORMAT='YYYY-MM-DD';
 commit;
  drop table achat; 
 drop table stocklivre;
  drop table librairie;
  drop table livre;
  drop table editeur;
 
 drop table  client;
  drop table history;
  drop table stockhistory;

CREATE TABLE editeur (  IdEditeur int NOT NULL,  nom varchar(45) DEFAULT NULL,
pays varchar(20) DEFAULT NULL,
  PRIMARY KEY (IdEditeur));
  
  CREATE TABLE livre (
  IdLivre varchar(10) NOT NULL,
  titre varchar(45) DEFAULT NULL,
  domaine varchar(45) DEFAULT NULL,
  NbPages int DEFAULT NULL,
  DateEdition date DEFAULT NULL,
  IdEditeur int NOT NULL,
  PRIMARY KEY (IdLivre),
  CONSTRAINT fk_Livre_Editeur FOREIGN KEY (IdEditeur) REFERENCES editeur (IdEditeur)  );
  
  
  CREATE TABLE client (
  IdClient int NOT NULL,
  nom varchar(45) DEFAULT NULL,
  prenom varchar(45) DEFAULT NULL,
  contact varchar(45) DEFAULT NULL,
  PRIMARY KEY (IdClient)
) ;


CREATE TABLE librairie (
  IdLib int NOT NULL,
  nom varchar(45) DEFAULT NULL,
  CodeWilaya varchar(45) DEFAULT NULL,
  PRIMARY KEY (IdLib)
);


CREATE TABLE stocklivre (
  IdLib int NOT NULL,
  IdLivre varchar(10) NOT NULL,
  prix int DEFAULT NULL,
  NB_Exemplaires int DEFAULT 0,
  PRIMARY KEY (IdLib,IdLivre),

  CONSTRAINT fk_Librairie_has_Livre_Libra FOREIGN KEY (IdLib) REFERENCES librairie (IdLib) ON DELETE set null,
  CONSTRAINT fk_Librairie_has_Livre_Livre1k FOREIGN KEY (IdLivre) REFERENCES livre (IdLivre) ON DELETE set null
);


CREATE TABLE achat (
  IdLivre varchar(10) NOT NULL,
  IdLib int NOT NULL,
  IdClient int NOT NULL,
  DateAchat date DEFAULT NULL,
  Quantite int DEFAULT NULL,
  PRIMARY KEY (IdLivre,IdLib,IdClient, DateAchat),
 
  CONSTRAINT fk_Achat_Client1 FOREIGN KEY (IdClient) REFERENCES client (IdClient) ,
  CONSTRAINT fk_Achat_Librairie1 FOREIGN KEY (IdLib) REFERENCES librairie (IdLib) ,
  CONSTRAINT fk_Achat_Livre1 FOREIGN KEY (IdLivre) REFERENCES livre (IdLivre)
);


create table History (users varchar(50) not null, IdLivre varchar(10) not null, operation_date date, operation_type varchar(20));

create table  StockHistory(IdLib int NOT NULL,
  IdLivre varchar(10) NOT NULL,
  prix int DEFAULT NULL,
  NB_Exemplaires int DEFAULT 0,
  state_date date); 

   ----TAble Editeur-------
INSERT INTO editeur VALUES (1,'DUNOD','france');
INSERT INTO editeur VALUES(2,'Eni','France');
INSERT INTO editeur VALUES(3,'Pearson','Algérie');

-----------Table Livre-------------------

INSERT INTO livre VALUES ('ISBN316645','Html5 et css3','informatique',580,'2013-05-02',2);
INSERT INTO livre VALUES('ISBN322345','Probabilité continue','mathématique',600,'1013-05-02',1);
INSERT INTO livre VALUES('ISBN326845','mathématique appliqué','mathématique',506,'2011-12-02',1);
INSERT INTO livre VALUES ('ISBN549215','NodeJs','informatique',350,'2015-01-02',1);
INSERT INTO livre VALUES('ISBN556559','Spring en Action','informatique',1100,'2016-05-02',2);
INSERT INTO livre VALUES('ISBN568464','Statistique','mathÃ©matique',580,'2013-10-02',2);
INSERT INTO livre VALUES('ISBN597546','Logique Mathématique','mathématique',490,'2010-10-02',2);
INSERT INTO livre VALUES('ISBN625833','JAVA 8','Informatique',460,'2016-10-02',3);
INSERT INTO livre VALUES('ISBN658622','Oracle 12c','informatique',1200,'2017-01-02',2);
INSERT INTO livre VALUES('ISBN658625','Php5 et mysql','informatique',450,'2009-05-02',2);
INSERT INTO livre VALUES('ISBN659552','Analyse différentielle','mathématique',800,'2014-10-02',1);
INSERT INTO livre VALUES('ISBN664258','Analyse pour le 1 et 2 cycle','Mathématique',900,'2008-10-02',3);
INSERT INTO livre VALUES('ISBN692324','Big Data','informatique',250,'2016-10-02',1);
INSERT INTO livre VALUES('ISBN968236','Programmation orienté objet','informatique',900,'2012-05-04',1);
INSERT INTO livre VALUES('ISBN998266','Développer avec google Map','Informatique',569,'2012-06-04',1);


----Table Client--------------------
INSERT INTO client VALUES (1,'karim','fouad','0778954578');
INSERT INTO client VALUES(2,'ouafi','jalil','0770126587');
INSERT INTO client VALUES(3,'rachid','mohamed','0659569874');
INSERT INTO client VALUES(4,'nouri','bachir','0699456575');
INSERT INTO client VALUES(5,'tarek','nasim','0597126589');
INSERT INTO client VALUES(6,'maleh','rafik','0798563212');
INSERT INTO client VALUES(7,'bouayade',' bachir','0598563214');


------------Table Librairie--------

INSERT INTO librairie VALUES (1,'houda','22');
INSERT INTO librairie VALUES(2,'mibrass','31');


------------Table StockLivre----------
INSERT INTO stocklivre VALUES (1,'ISBN316645',2500,4);
INSERT INTO stocklivre VALUES(1,'ISBN326845',4000,4);
INSERT INTO stocklivre VALUES(1,'ISBN549215',5000,10);
INSERT INTO stocklivre VALUES(1,'ISBN556559',6500,1);
INSERT INTO stocklivre VALUES(1,'ISBN568464',3200,7);
INSERT INTO stocklivre VALUES(1,'ISBN597546',6000,4); 
INSERT INTO stocklivre VALUES(1,'ISBN625833',6000,1); 
INSERT INTO stocklivre VALUES(1,'ISBN658622',9000,0);
INSERT INTO stocklivre VALUES(1,'ISBN658625',3600,2); 
INSERT INTO stocklivre VALUES(1,'ISBN659552',2300,0);
INSERT INTO stocklivre VALUES(1,'ISBN664258',3600,5);
INSERT INTO stocklivre VALUES(1,'ISBN692324',6000,2); 
INSERT INTO stocklivre VALUES(1,'ISBN968236',7000,5);
INSERT INTO stocklivre VALUES(2,'ISBN316645',2500,3);
INSERT INTO stocklivre VALUES(2,'ISBN322345',5000,3);
INSERT INTO stocklivre VALUES(2,'ISBN326845',4100,3);
INSERT INTO stocklivre VALUES(2,'ISBN549215',5100,0);
INSERT INTO stocklivre VALUES(2,'ISBN556559',5000,0); 
INSERT INTO stocklivre VALUES(2,'ISBN568464',3200,7);
INSERT INTO stocklivre VALUES(2,'ISBN597546',6100,0);
INSERT INTO stocklivre VALUES(2,'ISBN625833',6000,4);
INSERT INTO stocklivre VALUES(2,'ISBN658622',8500,1);
INSERT INTO stocklivre VALUES(2,'ISBN658625',2500,1);
INSERT INTO stocklivre VALUES(2,'ISBN659552',2300,3);
INSERT INTO stocklivre VALUES(2,'ISBN664258',3500,2);
INSERT INTO stocklivre VALUES(2,'ISBN692324',6000,4); 
INSERT INTO stocklivre VALUES(2,'ISBN968236',6500,3);



-------------Table Achat-----------------

INSERT INTO achat VALUES ('ISBN326845',1,1,'2016-05-10',2);
INSERT INTO Achat VALUES('ISBN658625',1,1,'2016-05-10',1); 
INSERT INTO Achat VALUES('ISBN549215',1,2,'2016-09-12',1); 
INSERT INTO Achat VALUES('ISBN658622',1,2,'2016-09-11',1); 
INSERT INTO Achat VALUES('ISBN659552',1,2,'2016-09-11',2);
INSERT INTO Achat VALUES('ISBN597546',1,3,'2016-12-12',1); 
INSERT INTO Achat VALUES('ISBN692324',1,3,'2016-12-12',1); 
INSERT INTO Achat VALUES('ISBN568464',1,3,'2016-12-12',1);
INSERT INTO Achat VALUES('ISBN568464',1,1,'2016-05-10',1);
INSERT INTO Achat VALUES('ISBN659552',1,3,'2016-07-05',2);
INSERT INTO Achat VALUES('ISBN968236',1,4,'2016-08-12',1); 
INSERT INTO Achat VALUES('ISBN568464',1,4,'2016-04-12',2);
INSERT INTO Achat VALUES('ISBN658625',1,4,'2016-04-12',1);
INSERT INTO Achat VALUES('ISBN326845',1,4,'2016-04-12',1); 
INSERT INTO Achat VALUES('ISBN968236',1,5,'2016-05-12',3); 
INSERT INTO Achat VALUES('ISBN556559',1,6,'2016-03-12',1); 
INSERT INTO Achat VALUES('ISBN549215',1,5,'2016-05-12',1);
INSERT INTO Achat VALUES('ISBN692324',1,6,'2016-03-12',2);
INSERT INTO Achat VALUES('ISBN625833',1,7,'2016-12-31',1);
INSERT INTO Achat VALUES('ISBN664258',2,7,'2016-05-03',3);


commit;