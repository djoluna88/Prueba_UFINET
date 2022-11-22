CREATE DATABASE DWH_UFINET

GO

--US8683 
USE DWH_UFINET;
GO
CREATE SCHEMA PORTES

GO 

--US8684
GO

CREATE TABLE PORTES.Proyecto(
	 Codp			   VARCHAR(3)
	,"Desc"			   VARCHAR(70)
	,Pais			   VARCHAR(70)
	,Cliente		   VARCHAR(80)
	,Tlf               int,
	"Fecha Adjudicado" date
)

GO

CREATE TABLE PORTES.Maquinaria(
	 CodM			   VARCHAR(50)
	,Nombre			   VARCHAR(70)
	,Precio			   FLOAT
)

GO

CREATE TABLE PORTES.Conductor(
	 CodC			   VARCHAR(5)
	,Nombre 		   VARCHAR(80)
	,Pais			   VARCHAR(70)
	,Categoria         INT

)

CREATE TABLE PORTES.Trabajo(
	 CodC			   VARCHAR(50)
	,CodM			   VARCHAR(50)
	,CodP			   VARCHAR(50)
	,"Fecha Inicio"	   DATE

)


--Crear Registro
INSERT INTO [PORTES].[Conductor](CodC,Nombre,Pais,Categoria)
VALUES('C07','Dennis Luna','Costa Rica',15)


--Creacion Fecha Alta Conductor

GO 

ALTER TABLE [PORTES].[Conductor]
ADD  [Fecha Alta] DATE;

--Completar registro en el campo Fecha Alta 

GO

UPDATE [PORTES].[Conductor]

SET [Fecha Alta] = '2021-12-01'

WHERE CodC='C07'

GO

-- Eliminar toda la información de conductor excepto la de su registro

GO

DELETE FROM  [PORTES].[Conductor]

GO

--- Eliminar toda la información de conductor

TRUNCATE TABLE [PORTES].[Conductor]

--- Eliminar entidad Conductor

DROP TABLE [PORTES].[Conductor]