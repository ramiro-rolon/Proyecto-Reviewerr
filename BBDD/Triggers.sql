-- TRIGGERS 

DELIMITER $$

-- Los siguientes triggers elimina el registro de un comentario con su valoracion cada vez que se elimina una visualizacion
-- de un contenido. Primero para series

CREATE TRIGGER EliminarComentarioYValoracionSerie
AFTER DELETE ON visualizaciones_por_serie
FOR EACH ROW
BEGIN
	DELETE FROM valoraciones_series WHERE id_usuario = OLD.id_usuario AND id_serie = OLD.id_serie;
END$$

CREATE TRIGGER EliminarComentarioYValoracionPelicula
AFTER DELETE ON visualizaciones_por_pelicula
FOR EACH ROW
BEGIN
	DELETE FROM valoraciones_pelicula WHERE id_usuario = OLD.id_usuario AND id_pelicula = OLD.id_pelicula;
END$$

DELIMITER ;