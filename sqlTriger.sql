create database marktrigger;
use marktrigger;
CREATE TABLE firma(
	firmaID int not null primary key identity(1,1),
	firmanimi varchar(20) unique,
	aadress varchar(20),
	telefon varchar(20)
	);

create table praktikajuhendaja(
prakikajuhendajaID int primary key identity(1,1),
eesnimi varchar(30),
perekonnanimi varchar (30),
synniaeg date,
telefon int);

create table praktikabaas(
praktikabaasID int not null primary key identity(1,1),
firmaID int,
praktikatingimused varchar(20),
arvutiprogramm varchar(20),
juhendajaID int,
FOREIGN KEY (firmaID) references firma(firmaID),
FOREIGN KEY (juhendajaID) references praktikajuhendaja(prakikajuhendajaID)
);

create table Praktikabaas_logi(
id int primary key identity(1,1),
kasutaja varchar(30),
aeg date, 
tegevus varchar(25),
andmed text);

CREATE TRIGGER PraktikaINSERT
ON praktikabaas
FOR INSERT
AS
INSERT INTO Praktikabaas_logi(tegevus, aeg, andmed, kasutaja)
SELECT 'praktikabaasis on lisatud',
GETDATE(),
inserted.arvutiprogramm,
SYSTEM_USER
from inserted;

insert into firma(firmanimi, aadress, telefon)
VALUES ('Rimi','sõpruse pst 174','55602174');
select * from firma;
insert into praktikajuhendaja(eesnimi, perekonnanimi, synniaeg, telefon)
VALUES ('Veronika','Hahan','01-06-2007',55681923);
select * from praktikajuhendaja;
insert into praktikabaas(firmaID, praktikatingimused, arvutiprogramm, juhendajaID)
VALUES (2,'test','testWindows',2);
SELECT * from Praktikabaas_logi;
select * from praktikabaas;
delete from praktikabaas
where praktikabaasID=3;

CREATE TRIGGER PraktikaUPDATE
ON praktikabaas
FOR UPDATE
AS
INSERT INTO Praktikabaas_logi(tegevus, aeg, andmed, kasutaja)
SELECT 'praktikabaasis on uuendatud',
GETDATE(),
CONCAT('Vanad andmed - ', deleted.arvutiprogramm, ', ',deleted.praktikatingimused,
'Uued andmed - ',inserted.arvutiprogramm,', ' ,inserted.praktikatingimused),
SYSTEM_USER
from deleted INNER JOIN inserted
ON deleted.praktikabaasID=inserted.praktikabaasID;

UPDATE praktikabaas set arvutiprogramm='Linux4'
WHERE praktikatingimused='test';
SELECT * from Praktikabaas
