Encuentra la cantidad total de extintores por cada ubicación.
SELECT u.nombre AS ubicacion, COUNT(e.id) AS cantidad_extintores
FROM ubicaciones u
LEFT JOIN extintores e ON u.id = e.idubicacion
GROUP BY u.id;



Calcula la suma de las capacidades de todos los extintores por cada tipo de extintor.
SELECT t.nombre AS tipo_extintor, SUM(e.capacidad) AS suma_capacidades
FROM tipos t
JOIN extintores e ON t.id = e.id
GROUP BY t.id;



Obtiene la fecha de fabricación más reciente de cada tipo de extintor
SELECT tipos.nombre AS Tipo_Extintor, MAX(extintores.fechafabricacion) AS Fecha_Fabricacion_Reciente
FROM extintores
JOIN tipos ON extintores.id
GROUP BY tipos.nombre;





Encuentra el número de inspecciones realizadas en cada extintor.
SELECT idextintor, COUNT(*) AS Numero_Inspecciones
FROM inspecciones
GROUP BY idextintor;



Calcula la suma de las capacidades de los extintores suministrados por cada 
proveedor en un rango de fechas (usted define las fechas).

SELECT p.nombre AS Proveedor,
       SUM(e.capacidad) AS Suma_Capacidades
FROM extintores AS e
JOIN proveedores AS p ON e.idproveedor = p.id
WHERE e.fechafabricacion BETWEEN '2023-01-01' AND '2024-01-01'
GROUP BY p.nombre;


Encuentra la cantidad de recargas realizadas en extintores de un tipo específico en 
ubicaciones que sean salas (sala 1, sala 2, sala n, etc.).






Encuentra el número de recargas realizadas en extintores cuya última inspección fue 
hace más de seis meses.

SELECT COUNT(r.id) AS Numero_Recargas
FROM recargas AS r
JOIN (
    SELECT idextintor, MAX(fecha) AS Ultima_Inspeccion
    FROM inspecciones
    GROUP BY idextintor
) AS ultima_inspeccion_extintor ON r.idextintor = ultima_inspeccion_extintor.idextintor
WHERE ultima_inspeccion_extintor.Ultima_Inspeccion < DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH);


Encuentra la cantidad de inspecciones realizadas en extintores que tienen al menos 
dos recargas en el último año.

SELECT COUNT(i.id) AS Cantidad_Inspecciones
FROM inspecciones AS i
JOIN (
    SELECT idextintor, COUNT(*) AS Recargas_En_Ultimo_Anio
    FROM recargas
    WHERE fecha >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 YEAR)
    GROUP BY idextintor
    HAVING Recargas_En_Ultimo_Anio >= 2
) AS recargas_ult_anio ON i.idextintor = recargas_ult_anio.idextintor;



Determina el promedio de las capacidades de los extintores que tienen más de tres 
recargas en total.
SELECT AVG(e.capacidad) AS Promedio_Capacidades
FROM extintores AS e
JOIN (
    SELECT idextintor, COUNT(*) AS Total_Recargas
    FROM recargas
    GROUP BY idextintor
    HAVING Total_Recargas > 3
) AS recargas_totales ON e.id = recargas_totales.idextintor;


Encuentra la cantidad de recargas realizadas en extintores cuya fecha de última 
inspección está entre dos fechas específicas
SELECT COUNT(r.id) AS Cantidad_Recargas
FROM recargas AS r
JOIN (
    SELECT idextintor, MAX(fecha) AS Ultima_Inspeccion
    FROM inspecciones
    WHERE fecha BETWEEN '2024-09-05' AND '2024-10-09'
    GROUP BY idextintor
) AS ultima_inspeccion_extintor ON r.idextintor = ultima_inspeccion_extintor.idextintor;

