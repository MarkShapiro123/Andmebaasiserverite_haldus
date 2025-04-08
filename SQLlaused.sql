--Xampp control panel
--Conect TO:
--server name: localhost -127.0.0.1
--Authentification:
--kasutaja: root
--paroot: ei ole
CREATE DATABASE MarkShapiroLOGITpv23;
USE MarkShapiroLOGITpv23;

--tabeli loomine
--AUTO_INCREMENT - ise täidab tabeli 1,2,3,...
CREATE TABLE inimene(
inimeneID int Primary Key AUTO_INCREMENT,
nimi varchar(50) unique,
synniaeg date,
telefon char(12),
pikkus decimal(5,2),
opilaskodu bit
);
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;
SELECT * FROM inimene;

--tabeli kustutamine
DROP table inimene;

--andmete lisamine
--DDL - data definition language
--DML -data manipulation language

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu)
VALUES
('Peeter Uus', '2021-12-30', '2568952', 90.5, 0),
('Kaarel Oja', '2000-12-30', '2568952', 90.5, 0),
('Kask Mati', '1983-12-30', '33333', 140.5, 0),
('Peeter Oja', '2021-12-30', '333333', 190.5, 0)
;
SELECT * FROM inimene;
--tabel elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY AUTO_INCREMENT,
elukoht varchar(50) UNIQUE,
maakond varchar(50)
);
SELECT * FROM elukoht;
--andmete lisamine tabeli elukoht
INSERT INTO elukoht(elukoht, maakond)
VALUES ('Tallinn', 'Harjumaa'),
('Tartu', 'Tartumaa'),
('Pärnu', 'Pärnumaa');
--taabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD elukohtID int;
SELECT * FROM inimene;
-- foreign key lisamine
ALTER TABLE inimene
ADD Constraint fk_elukoht
FOREIGN KEY (elukohtID)
references elukoht(elukohtID);

Select * from inimene;
Select * from elukoht;

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID)
VALUES ('Danila Ivanov', '2021-12-4' , '543678', 170.1, 0, 3);

SELECT inimene.nimi, inimene.synniaeg, elukoht.elukoht from inimene join elukoht
ON inimene.elukohtID=elukoht.elukohtID;
--tabel auto loomine
CREATE TABLE auto(
autoID int PRIMARY KEY AUTO_INCREMENT,
autoNr varchar(30) UNIQUE,
mudell varchar(30),
mark varchar(30),
vaasta int
);

select * from auto;
--andmete lisamine tabeli auto
INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('296YKM', 'Corolla', 'Toyota', 2025);
--taabeli muutmine uue veergu lisamine
ALTER TABLE inimene ADD autoID int;
-- foreign key lisamine
ALTER TABLE inimene
ADD Constraint fk_auto
FOREIGN KEY (autoID)
references auto(autoID);

select * from inimene;
select * from auto;

INSERT INTO inimene
(nimi, synniaeg, telefon, pikkus, opilaskodu, elukohtID, autoID)
VALUES ('Danila Shapiro', '2021-12-4' , '543678', 170.2, 0, 2, 1);

SELECT * from inimene join auto
ON inimene.autoID=auto.autoID;

INSERT INTO elukoht(elukoht, maakond)
VALUES ('Narva', 'Ida-Virumaa'),
       ('Viljandi', 'Viljandimaa'),
       ('Rakvere', 'Lääne-Virumaa');

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('512ABC', 'Civic', 'Honda', 2023);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('834XYZ', 'Model 3', 'Tesla', 2024);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('178MKL', 'Octavia', 'Škoda', 2022);

INSERT INTO auto
(autoNr, mudell, mark, vaasta)
VALUES ('909DFG', 'Mustang', 'Ford', 2021);


CREATE TABLE tyyp
( tyypID int PRIMARY KEY AUTO_INCREMENT,
tyyp char(30) UNIQUE,
kirjeldus char(40)
);

INSERT INTO tyyp
(tyyp, kirjeldus)
VALUES ('kass', 'must'),
('koer', 'valge'),
('kilpkonn', 'aeglane'),
('sisalik', 'kiire'),
('kapübara', 'lahke'),
('põder', 'kuri');

CREATE TABLE loom
( loomID int PRIMARY KEY AUTO_INCREMENT,
nimi char(30),
kirjeldus char(40),
kaal decimal(5,2)
);

ALTER TABLE loom ADD tyypID int;

ALTER TABLE loom
ADD Constraint fk_tyyp
FOREIGN KEY (tyypID)
references tyyp(tyypID);

ALTER TABLE loom 
MODIFY COLUMN kaal VARCHAR(10);

INSERT INTO loom (nimi, kirjeldus, kaal)
VALUES ('Cherniy', 'talle meeldib süüa', '7.4KG'),
('Sharik', 'väga lahke ja sõnakuulelik', '40.8KG'),
('Natashka', 'sigalahe', '800G'),
('Drogon', 'armastab päikese käes peesitada', '200G'),
('ChillGuy', 'lihtsalt tšillib', '45.3KG'),
('Markus', 'lihtsalt Markus', '650KG');

ALTER TABLE inimene ADD loomID int;


