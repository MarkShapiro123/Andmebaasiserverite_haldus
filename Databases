SELECT * FROM inimene;
--tabel elukoht
CREATE TABLE elukoht(
elukohtID int PRIMARY KEY identity(1,1),
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
autoID int PRIMARY KEY identity(1,1),
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
