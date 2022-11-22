
-- Consultas SQL US8678. Se toman de la parte de Staging del DWH. Base de Datos con el nombre  [DWH_UFINET_STAGE]

--US8692  Nombre de conductores con categoria superior o igual a 15

SELECT
	Nombre
FROM [PORTES].[Conductor]

WHERE Categoria >=15

GO
-- US8694 Nombre en orden Ascendente de los conductores que hayan trabajado con el Camión 3 en Costa Rica

SELECT	DISTINCT 	-- Para no contabilizar si han trabajado 2 o mas vecese con el mismo camion y el mismo pais
	C.Nombre	

FROM PORTES.Trabajo AS TR

INNER JOIN PORTES.Conductor AS C
	ON C.CodC  = TR.CodC

INNER JOIN PORTES.Maquinaria as MA

	ON MA.CodM  = TR.CodM

WHERE Ma.Nombre = 'Camion 3' 
   AND
	  C.Pais= 'Costa Rica'

ORDER BY C.Nombre ASC


--US8695 Información de los conductores que han participado en proyectos realizados en Colombia, o sean del cliente Ceferino

GO

SELECT DISTINCT   -- Para contabilizar solo un trabajo en caso de tener mas participaciones con el mismo pais y Cliente

	C.CodC
	,C.Nombre
	,C.Categoria

FROM PORTES.Trabajo AS TR

INNER JOIN [PORTES].[Proyecto] AS PRY
	ON PRY.Codp = TR.CodP

INNER JOIN PORTES.Conductor AS C
	ON C.CodC  = TR.CodC

WHERE PRY.Pais = 'Colombia'
OR	
	  PRY.Cliente='Ceferino'	

--US8696 Conductores que estén en más de 2 trabajos
GO

SELECT    
	C.Nombre
	,COUNT(C.Nombre) AS [Cantidad Trabajos]

FROM PORTES.Trabajo AS TR

INNER JOIN PORTES.Conductor AS C
	ON C.CodC  = TR.CodC

GROUP BY C.Nombre 

HAVING COUNT(C.Nombre)>=2


--US8697 Ingresos obtenidos por la industria pesquera

GO

SELECT    

PRY.[Desc]        
,SUM(MA.Precio) AS [Total Ingreso]

FROM PORTES.Trabajo AS TR

INNER JOIN PORTES.Proyecto AS PRY

	ON PRY.Codp = TR.CodP

INNER JOIN PORTES.Maquinaria as MA

	ON MA.CodM  = TR.CodM

WHERE PRY.[Desc]   = 'Pescado'

GROUP BY PRY.[Desc] 

