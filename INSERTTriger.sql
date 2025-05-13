USE [marktrigger]
GO
/****** Object:  Trigger [dbo].[PraktikaINSERT]    Script Date: 13.05.2025 15:55:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[PraktikaINSERT]
ON [dbo].[praktikabaas]
FOR INSERT
AS
INSERT INTO Praktikabaas_logi(tegevus, aeg, andmed, kasutaja)
SELECT 'praktikabaasis on lisatud',
GETDATE(),
concat('PraktikabaasID - ',inserted.praktikabaasID ,' , ','FirmaNimi - ',firma.firmanimi,' , ','JuhendajaEesnimi - ',praktikajuhendaja.eesnimi,
' , | ','lisatud arvutiprogramm - ',inserted.arvutiprogramm,' , ','lisatud praktikatingimused - ',inserted.praktikatingimused),
SYSTEM_USER
from inserted INNER JOIN firma on firma.firmaID=inserted.firmaID
inner join praktikajuhendaja on praktikajuhendaja.prakikajuhendajaID=inserted.juhendajaID;
