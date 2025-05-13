USE [marktrigger]
GO
/****** Object:  Trigger [dbo].[PraktikaUPDATE]    Script Date: 13.05.2025 15:55:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[PraktikaUPDATE]
ON [dbo].[praktikabaas]
FOR UPDATE
AS
INSERT INTO Praktikabaas_logi(tegevus, aeg, andmed, kasutaja)
SELECT 'praktikabaasis on uuendatud',
GETDATE(),
CONCAT('praktikabaasID - ',deleted.praktikabaasID,' , ','FirmaNimi - ',f2.firmanimi,', ','juhendajaEesnimi - '
,p2.eesnimi,', | ','Vana arvutiprogramm - ', deleted.arvutiprogramm, ', ','Vanad praktikatingimused - '
,deleted.praktikatingimused,' ,','FirmaNimi - ',f1.firmanimi,' ,','JuhendajaEesnimi - ',p1.eesnimi,' , ',
' | Uus arvutiprogramm - ',inserted.arvutiprogramm,', ','Uued praktikatingimused - ', inserted.praktikatingimused),
SYSTEM_USER
from deleted INNER JOIN inserted
ON deleted.praktikabaasID=inserted.praktikabaasID
inner join firma f1 on f1.firmaID=inserted.firmaID
inner join firma f2 on f2.firmaID=deleted.firmaID
inner join praktikajuhendaja p1 on p1.prakikajuhendajaID=inserted.juhendajaID
inner join praktikajuhendaja p2 on p2.prakikajuhendajaID=deleted.juhendajaID;
