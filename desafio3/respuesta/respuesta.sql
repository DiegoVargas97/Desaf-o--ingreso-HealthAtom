
-- creacion de la tabla personas para asociar responsabilidades a esta entidad
CREATE TABLE IF NOT EXISTS personas (
    id bigint PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100)
                     );
-- creacion de la tabla autorizaciones que contendra el detalle como la hora y la persona que autorizo
CREATE TABLE IF NOT EXISTS autorizaciones(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT,
    fecha DATE,
    hora TIME
);

-- creacion de la tabla de reportes con la finalidad de detallar que persona reporto el avistamiento, fecha y hora
CREATE TABLE IF NOT EXISTS reportes(
    id bigint PRIMARY KEY AUTO_INCREMENT,
    persona_id BIGINT,
    fecha DATE,
    hora TIME
);

-- se agregan columnas hora, id_reporte, id_autorizacion en la tabla avistamientos
ALTER TABLE avistamientos
   ADD COLUMN `hora` TIME AFTER `fecha`,
   ADD COLUMN `id_reporte` bigint ,
    
   ADD CONSTRAINT FK_AVISTAMIENTOS_TABLE_ID_REPORTE FOREIGN KEY (`id_reporte`)
    REFERENCES reportes(`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- se agrega columna id_autorizacion para representar el detalle de la autorizacion 
ALTER TABLE movimientos_recursos
    ADD COLUMN  `id_autorizacion` bigint,
   ADD CONSTRAINT FK_MOVIMIENTOS_RECURSOS_TABLE_ID_AUTORIZACIONES FOREIGN KEY (`id_autorizacion`)
    REFERENCES autorizaciones(`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE;

-- se agrega columna id_persona para indexar una muerte con la persona responsable

ALTER TABLE muertes
   ADD COLUMN `id_persona` bigint,
   ADD CONSTRAINT FK_AMUERTES_TABLE_ID_PERSONA FOREIGN KEY (`id_persona`)
    REFERENCES personas(`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE; 
    
-- consulta para obtener persona que mato a mas titanes el año 2020

SELECT id_persona, COUNT(*) AS total_muertes
FROM muertes
WHERE year(fecha) = 2020
GROUP BY id_persona
ORDER BY total_muertes DESC
LIMIT 1;
