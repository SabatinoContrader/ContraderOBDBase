CREATE DATABASE contraderproject;

SET FOREIGN_KEY_CHECKS = 0;

USE contraderproject;

CREATE TABLE appuntamento (
  id_appuntamento INT(11) NOT NULL,
  id_officina INT(11) NOT NULL,
  id_driver INT(11) NOT NULL,
  data VARCHAR(10) NOT NULL,
  stato BIT(1) NOT NULL,
  PRIMARY KEY (id_appuntamento),
  FOREIGN KEY (id_officina) REFERENCES officina (id_officina),
  FOREIGN KEY (id_driver) REFERENCES driver (id_driver)
);

INSERT INTO appuntamento VALUES (1,6,9991,'15/05/18', 0),
								(2,7,28956,'13/04/18', 0),
								(3,10,9991,'12/12/17',0);


CREATE TABLE automobile (
  cod_dispositivo INT(11) NOT NULL,
  targa VARCHAR(25) NOT NULL,
  telaio INT(11) NOT NULL,
  casa_Costruttrice VARCHAR(25) NOT NULL,
  modello VARCHAR(25) NOT NULL,
  alimentazione VARCHAR(25) NOT NULL,
  tipologia VARCHAR(25) NOT NULL,
  cambio CHAR(1) NOT NULL,
  proprietario VARCHAR(10) NOT NULL,
  revisione VARCHAR(10) NOT NULL,
  tagliando_data VARCHAR(10) NOT NULL,
  tagliando_km INT(11) DEFAULT NULL,
  id_driver INT(11),
  PRIMARY KEY (cod_dispositivo),
  FOREIGN KEY (id_driver) REFERENCES driver (id_driver)
);

INSERT INTO automobile VALUES	(1,'AS123PC',3421343,'FORD','FIESTA','DIESEL','UTILITARIA','A','a_01','18/04/17','17/02/18',32000,NULL),
								(2,'AS123MN',342135452,'FIAT','PANDA','DIESEL','UTILITARIA','M','a_01','18/04/17','17/02/18',6000,NULL),
                                (3,'AS654PC',125642,'FIAT','PUNTO','DIESEL','COMMERCIALE','M','a_02','10/04/16','17/02/18',3200,1),
                                (4,'FG050588',213465321,'FERRARI','F430','DIESEL','COMMERCIALE','A','a_03','18/04/17','17/02/18',3200,1),
                                (5,'FE643DE',8346743,'NISSAN','QASHQAI','DIESEL','SUV','M','a_02','02/10/17','12/12/17',3200,1),
                                (6,'AA832DB',685436081,'VOLKSWAGEN','POLO','BENZINA','UTILITARIA','M','a_02','02/02/18','17/03/18',3200,1);

CREATE TABLE azienda (
  id_azienda INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(25) NOT NULL,
  citta VARCHAR(25) NOT NULL,
  PRIMARY KEY (id_azienda)
);

INSERT INTO azienda VALUES 	(1,'Azienda_1','Roma'),
							(2,'Azienda_2','Roma'),
                            (3,'Azienda_3','Roma'),
                            (4,'Azienda_4','Modena'),
                            (5,'Azienda_5','Benevento'),
                            (6,'Azienda_6','Torino'),
                            (7,'Azienda_7','Benevento'),
                            (8,'Azienda_8','Siracusa'),
                            (9,'Azienda_9','Modena');

CREATE TABLE città (
  nome VARCHAR(25) NOT NULL,
  cap INT(11) NOT NULL,
  provincia CHAR(2) NOT NULL,
  regione VARCHAR(15) NOT NULL,
  PRIMARY KEY (nome, cap)
);

INSERT INTO città VALUES ('Benevento',82100,'BN','CAMPANIA'),
						('Modena',41121,'MO','EMILIA ROMAGNA'),
						('MODENA',41125,'MO','EMILIA ROMAGNA'),
                        ('Roma',100,'RM','LAZIO'),
                        ('Roma',123,'RM','LAZIO'),
                        ('Siracusa',96100,'SR','SICILIA'),
                        ('Torino',10121,'TO','PIEMONTE'),
                        ('Torino',10124,'TO','PIEMONTE');

CREATE TABLE dati_dispositivo (
  n INT(11) AUTO_INCREMENT NOT NULL,
  cod_dispositivo INT(11) NOT NULL,
  data VARCHAR(10) NOT NULL,
  km INT(11) NOT NULL,
  livello_olio FLOAT DEFAULT NULL,
  cod_errore VARCHAR(25),
  stato BIT(1),
  PRIMARY KEY (n),
  FOREIGN KEY (cod_dispositivo) REFERENCES automobile (cod_dispositivo)
);

INSERT INTO dati_dispositivo VALUES (1, 1, '04/07/18', 13444, 1.1, NULL, NULL),
									(2, 1, '05/07/18', 13445, 1.1, NULL, NULL),
                                    (3, 1, '06/07/18', 13446, 1.1, NULL, NULL),
                                    (4, 1, '07/07/18', 13447, 1.1, '992JN', 0),
                                    (5, 3, '19/03/18', 10000, 1.1, NULL, NULL),
                                    (6, 4, '19/03/18', 10000, 1.1, NULL, NULL),
                                    (7, 5, '19/03/18', 10000, 1.1, 'P6788', 0),
                                    (8, 6, '19/03/18', 18000, 1.1, NULL, NULL);

CREATE TABLE driver (
  id_driver INT(11) NOT NULL,
  nome VARCHAR(25) NOT NULL,
  cognome VARCHAR(25) NOT NULL,
  cf CHAR(16) NOT NULL,
  residenza VARCHAR(25) NOT NULL,
  PRIMARY KEY (id_driver)
);

INSERT INTO driver VALUES (1258,'Antonio','Rossi','ASDFA230AAFRWE4R','Napoli'),
							(9991,'Pippo','Demagistris','SLONGBLONGSERADM','Torino'),
							(12589,'Carmine','Albero','RSSDFETEADFTSFDF','Modena'),
                            (28956,'Alessia','Bardo','NGRONDNRONGGUNR','Benevento'),
                            (31415,'Givevra','Luce','GRUNCGRRUNCGRUNC','Roma');

CREATE TABLE login (
  username VARCHAR(25) NOT NULL,
  password VARCHAR(25) NOT NULL,
  ruolo INT(11) NOT NULL,
  id INT(11) NOT NULL,
  PRIMARY KEY (username)
);

INSERT INTO login VALUES ('OWNER','OWNER',1,0),
						 ('O_01','O_01',2,1),
						 ('O_02','O_02',2,2),
                         ('O_03','O_03',2,3),
                         ('A_01','A_01',3,1),
                         ('A_02','A_02',3,2),
                         ('A_03','A_03',3,3),
                         ('D_01','D_01',4,1),
                         ('D_02','D_02',4,2),
                         ('D_03','D_03',4,3);

CREATE TABLE offerta (
  id_offerta INT(11) NOT NULL,
  id_officina INT(11) NOT NULL,
  descrizione VARCHAR(100) DEFAULT NULL,
  PRIMARY KEY (id_offerta),
  FOREIGN KEY (id_offerta) REFERENCES officina (id_officina)
);

INSERT INTO offerta VALUES (6,1,'CAMBIA OLIO A SOLI 15 EURO'),
							(7,2,'CONTROLLO FRENI E TAGLIANDO AD UN COSTO BASSISSIMO!'),
							(8,1,'SOSTITUZIONE PASTICCHE AD UM PREZZO DA SVENIRE'),
                            (10,1,'VIENI A SCOPRIRE I NUOVI PNEUMATICI SUPER RESISTENTI');

CREATE TABLE officina (
  id_officina INT(11) NOT NULL AUTO_INCREMENT,
  nome_officina VARCHAR(25) NOT NULL,
  indirizzo VARCHAR(100) NOT NULL,
  citta VARCHAR(25) NOT NULL,
  PRIMARY KEY (id_officina)
);

INSERT INTO officina VALUES (6,'OFFICINA_1','Via dei principi 715','Roma'),
							(7,'OFFICINA_2','Via dei Re','Torino'),
                            (8,'OFFICINA_4','Via delle betulle','Roma'),
                            (9,'OFFICINA_5','Via delle orchidee','Modena'),
                            (10,'OFFICINA_6','Via delle Querce','Benevento');

CREATE TABLE preventivo (
  id_preventivo INT(11) NOT NULL,
  cod_dispositivo INT(11) NOT NULL,
  id_officina INT(11) NOT NULL,
  id_driver INT(11) NOT NULL,
  casa_Costruttrice VARCHAR(25) NOT NULL,
  modello VARCHAR(25) NOT NULL,
  descrizione VARCHAR(200) DEFAULT NULL,
  costo FLOAT DEFAULT NULL,
  stato BIT(1) DEFAULT 0,
  PRIMARY KEY (id_preventivo),
  FOREIGN KEY (id_officina) REFERENCES officina (id_officina),
  FOREIGN KEY (cod_dispositivo) REFERENCES automobile (cod_dispositivo)
);

INSERT INTO preventivo VALUES 	(1,1,6,9991,'FIAT','PUNTO','FRENI NON FUNZIONANTI',NULL, 0),
								(2,2,7,28956,'FORD','FIESTA','CAMBIO ROTTO',NULL,0),
								(3,2,10,1258,'FIAT','PANDA','SURRISCALDAMENTO ECCESSIVO MOTORE',NULL,0),
								(4,1,6,9991,'FIAT','PUNTO','FRENI NON FUNZIONANTI',200,1),
								(5,2,7,28956,'FORD','FIESTA','CAMBIO ROTTO',300,1);
