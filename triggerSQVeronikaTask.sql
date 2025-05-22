create database veronika;
use veronika;
create table riieteNimekiri(
riieteID int primary key identity(1,1),
riieteNimi varchar(30),
ostukuupäev date,
hind int,
disaineriteID int FOREIGN KEY REFERENCES disaineriteNimekiri(disaineriteID)
);
create table disaineriteNimekiri(
disaineriteID int primary key identity(1,1),
disaineriteNimi varchar(30),
Vaanus int);

insert into disaineriteNimekiri(disaineriteNimi, Vaanus)
VALUES
('Ive Illem', 34),
('Jeromy Huntingdon', 78),
('Mile Tarry', 33),
('Rancell Beams', 80),
('Matthaeus Librum', 36),
('Chalmers Woof', 37),
('Lesley Fossitt', 46),
('Noemi Condliffe', 31),
('Emie Keat', 42),
('Chilton Bowler', 28);

insert into riieteNimekiri(riieteNimi, ostukuupäev, hind, disaineriteID)
VALUES
('Särk', '2024-02-14', 397, 1),
('saapad', '2025-07-12', 206, 2),
('sokid', '2025-05-17', 157, 3),
('kleit', '2025-06-22', 389, 4),
('müts', '2025-10-23', 367, 5),
('jope', '2024-11-01', 115, 6),
('müts', '2025-11-09', 263, 7),
('saapad', '2024-06-21', 270, 8),
('Särk', '2025-02-24', 219, 9),
('sokid', '2025-10-26', 333, 10);
select * from riieteNimekiri;
select * from disaineriteNimekiri;

create table logg(
id int primary key identity(1,1),
tegevus varchar(40),
andmed text,
aeg date,
kasutaja varchar(30));

create trigger riieteINSERT
ON riieteNimekiri
FOR INSERT
AS
INSERT INTO logg(tegevus, andmed, aeg, kasutaja)
SELECT 'Andmed on lisatud',
concat('RiieteID - ',inserted.riieteID,' , '
,'riieteNimi - ',inserted.riieteNimi,' , '
,'hind euro - ',inserted.hind,' , '
,'disaineriteID - '
,inserted.disaineriteID,' , '
,'Disainerite Nimi - '
,disaineriteNimekiri.disaineriteNimi,' , '
,'ostukuupaev - ',inserted.ostukuupäev),
GETDATE(),
SYSTEM_USER
from inserted INNER JOIN disaineriteNimekiri on disaineriteNimekiri.disaineriteID=inserted.disaineriteID;

insert into riieteNimekiri(riieteNimi, ostukuupäev, hind, disaineriteID)
VALUES
('test2', '2025-06-23', 400, 3);
select * from logg;
select * from riieteNimekiri;

create trigger riieteDELETE
ON riieteNimekiri
FOR DELETE
AS
INSERT INTO logg(tegevus, andmed, aeg, kasutaja)
SELECT 'Andmed on kustutatud',
concat('RiieteID - ',deleted.riieteID,' , '
,'riieteNimi - ',deleted.riieteNimi,' , '
,'hind euro - ',deleted.hind,' , '
,'disaineriteID - '
,deleted.disaineriteID,' , '
,'Disainerite Nimi - '
,disaineriteNimekiri.disaineriteNimi,' , '
,'ostukuupaev - ',deleted.ostukuupäev),
GETDATE(),
SYSTEM_USER
from deleted INNER JOIN disaineriteNimekiri on disaineriteNimekiri.disaineriteID=deleted.disaineriteID;

delete from riieteNimekiri
where riieteID=12;

create trigger riieteUPDATE
ON riieteNimekiri
FOR UPDATE
AS
INSERT INTO logg(tegevus, andmed, aeg, kasutaja)
SELECT 'Andmed on uuendatud',
concat('VanaRiieteID - ',deleted.riieteID,' , '
,'VanaRiieteNimi - ',deleted.riieteNimi,' , '
,'VanaHind euro - ',deleted.hind,' , '
,'disaineriteID - '
,deleted.disaineriteID,' , '
,'Disainerite Nimi - '
,d1.disaineriteNimi,' , '
,'VanaOstukuupaev - ',deleted.ostukuupäev,' , '
,'UusRiieteID - ',inserted.riieteID,' , '
,'UusRiieteNimi - ',inserted.riieteNimi,' , '
,'UusHind euro - ',inserted.hind,' , '
,'disaineriteID - '
,inserted.disaineriteID,' , '
,'Disainerite Nimi - '
,d2.disaineriteNimi,' , '
,'UusOstukuupaev - ',inserted.ostukuupäev),
GETDATE(),
SYSTEM_USER
from deleted INNER JOIN inserted
ON deleted.riieteID=inserted.riieteID
inner join disaineriteNimekiri d1 on d1.disaineriteID=inserted.disaineriteID
inner join disaineriteNimekiri d2 on d2.disaineriteID=deleted.disaineriteID;

update riieteNimekiri set riieteNimi='test4',ostukuupäev='2024-04-04',hind=400,disaineriteID=10
where riieteID=4
select * from logg;
select * from riieteNimekiri;
grant all on riieteNimekiri to opilane1
grant all on disaineriteNimekiri to opilane1
revoke select on logg to opilane1


create procedure Lisamine
@Nimi varchar(30),
@ostukuupäev date,
@hind int,
@disainerID int
AS
BEGIN
INSERT INTO riieteNimekiri(riieteNimi, ostukuupäev, hind, disaineriteID)
VALUES(@Nimi,@ostukuupäev,@hind,@disainerID);
select * from riieteNimekiri;
select * from disaineriteNimekiri;
END;

exec Lisamine 'test','2025-05-25',100,1;
select * from logg;


CREATE PROCEDURE search
@disainerID INT
AS
BEGIN
SELECT riieteNimekiri.riieteID,riieteNimekiri.riieteNimi,riieteNimekiri.ostukuupäev,riieteNimekiri.hind,riieteNimekiri.disaineriteID,disaineriteNimekiri.disaineriteNimi AS disainerNimi,disaineriteNimekiri.disaineriteID AS searchID from riieteNimekiri
INNER JOIN disaineriteNimekiri on disaineriteNimekiri.disaineriteID=riieteNimekiri.disaineriteID
WHERE riieteNimekiri.disaineriteID=@disainerID
END;
drop procedure search

exec search 3;


CREATE PROCEDURE search2
@Nimi varchar(30)
AS
BEGIN
SELECT riieteNimekiri.riieteID,riieteNimekiri.riieteNimi,riieteNimekiri.ostukuupäev,riieteNimekiri.hind,riieteNimekiri.disaineriteID,disaineriteNimekiri.disaineriteNimi AS searchNimi from riieteNimekiri
INNER JOIN disaineriteNimekiri on disaineriteNimekiri.disaineriteID=riieteNimekiri.disaineriteID
WHERE disaineriteNimekiri.disaineriteNimi=@Nimi
END;

select * from disaineriteNimekiri

exec search2 'Mile Tarry';


create procedure uuendamine
@Nimi varchar(30),
@ID int
AS
BEGIN
update riieteNimekiri set riieteNimi=@nimi
where riieteID=@ID
select riieteID, riieteNimi, ostukuupäev, hind from riieteNimekiri
end;

drop procedure uuendamine

exec uuendamine 'test2',1
