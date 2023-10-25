-- RESPUESTA 1
SELECT t.nombre, t.altura, m.fecha 
    from titanes as t 
        JOIN muertes as m on t.id = m.id_titan 
            WHERE m.causa = 'accidente' order by m.fecha;


-- RESPUESTA 2

SELECT t.nombre, t.altura FROM titanes as t 
    JOIN muertes as m ON m.id_titan = t.id 
        WHERE m.causa = "Batallon 1" 
            order by t.altura LIMIT 1;

-- RESPUESTA 3

SELECT t.id, t.nombre, t.altura FROM titanes as t 
    LEFT JOIN muertes as m ON m.id_titan = t.id 
    WHERE m.id_titan IS NULL;

-- RESPUESTA 4

SELECT t.*, a.fecha, COUNT(year(a.fecha)) FROM titanes as t
    INNER JOIN avistamientos as a ON t.id = a.id_titan
    group by t.nombre
    HAVING COUNT(year(a.fecha)) > 1
        order by t.nombre asc;

-- pregunta 5

select r.nombre, mr.cantidad, r.unidad from muertes as m
    join movimientos_recursos as mr on m.id = mr.id_muerte
    join recursos r on mr.id_recurso = r.id
    join titanes t on m.id_titan = t.id
        where t.altura <= 5
GROUP BY r.nombre
order by mr.cantidad;

-- pregunta 6

select mr.id_recurso, recursos.nombre, count(mr.id_recurso) total from movimientos_recursos mr
    join muertes on mr.id_muerte = muertes.id
    join titanes on muertes.id_titan = titanes.id
    join recursos on mr.id_recurso = recursos.id
    where titanes.altura = 9
 group by id_recurso order by total desc;

 -- pregunta 7

 select muertes.id_titan, muertes.fecha fecha_muerte, a.fecha fecha_avistamiento  from muertes
    join avistamientos a on muertes.id_titan = a.id_titan
where muertes.fecha < a.fecha
order by muertes.id_titan asc;

-- pregunta 8

 R: una razon teorica seria que el servidor tiene la hora y fecha mala o bien el titan no murio solo se hizo el muerto. (xD)