--Trigerid
--SQL Triger (trigger) - protsess,
--mille abil tema sisse
--kirjutatud tegevused automaatselt käivitatakse
--INSERT, UPDATE, DELETE trigerid, mis jälgivad antud tegevused tabelites
--ja kirjutavad logi tabeli mida  jälgisid
CREATE DATABASE trigerLOGIT;
USE trigerLOGIT;

CREATE TABLE toode(
toodeID int primary key identity(1,1),
toodeNimetus varchar(25),
toodeHind decimal(5,2));
--taabel logi, mis täidab triger
CREATE TABLE logi(
logID int primary key identity(1,1),
tegevus varchar(25),
kuupaev datetime,
andmed TEXT);

--INSERT triger, mis jälgib andmete lisamine toode tabelisse
CREATE TRIGGER toodeLisamine
ON toode --какая таблица
FOR INSERT -- для чего
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on lisatud',
GETDATE(),
inserted.toodeNimetus
FROM inserted;


--kontroll
INSERT INTO toode(toodeNimetus, toodeHind)
VALUES
('Coca-cola', 2.20);

SELECT * FROM toode;
SELECT * FROM logi;

--DELETE TRIGER, mis jälgib toode kustutamine tablis
CREATE TRIGGER toodeKustutamine
ON toode --какая таблица
FOR DELETE -- для чего
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on kustutatud',
GETDATE(),
CONCAT(deleted.toodeNimetus, ' | tegi kasutaja ', SYSTEM_USER)
FROM deleted;
--kontroll
DELETE FROM toode
WHERE toodeID = 4;

--update triger, mis jälgib toode uuendamine tabelis
CREATE TRIGGER toodeUuendamine
ON toode --какая таблица
FOR UPDATE -- для чего
AS
INSERT INTO logi(tegevus, kuupaev, andmed)
SELECT 'toode on uuendatud',
GETDATE(),
CONCAT('Vanad andmed - ', deleted.toodeNimetus,', ' ,deleted.toodeHind,
'Uued andmed - ', inserted.toodeNimetus,', ' ,inserted.toodeHind,
' | tegi kasutaja ', SYSTEM_USER)
FROM deleted INNER JOIN inserted
ON deleted.toodeID=inserted.toodeID;
--kontroll
UPDATE toode SET toodeHind=4.00
WHERE toodeNimetus='Coca-Cola'

SELECT * FROM toode;
SELECT * FROM logi;
