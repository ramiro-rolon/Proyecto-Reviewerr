
-- Funcion para sacar el promedio de las calificaciones hechas por los usuarios
-- para determinada pelicula, le sigue lo mismo pero para las series

DELIMITER $$

CREATE FUNCTION PromedioCalificacionesPelis(p_id_pelicula INT)
RETURNS DECIMAL(7,2)
DETERMINISTIC
BEGIN
	DECLARE Promedio DECIMAL(7,2);
    SET Promedio = (SELECT
						AVG(valoracion)
					FROM
						valoraciones_pelicula
                    WHERE
						id_pelicula = p_id_pelicula
					GROUP BY
						id_pelicula);
	IF Promedio IS NULL THEN
		RETURN 0;
	ELSE
	RETURN Promedio;
	END IF;
END$$

CREATE FUNCTION PromedioCalificacionesSeries(p_id_serie INT)
RETURNS DECIMAL(7,2)
DETERMINISTIC
BEGIN
	DECLARE Promedio DECIMAL(7,2);
    SET Promedio = (SELECT
						AVG(valoracion)
					FROM
						valoraciones_series
                    WHERE
						id_serie = p_id_serie
					GROUP BY
						id_serie);
	IF Promedio IS NULL THEN
		RETURN 0;
	ELSE
	RETURN Promedio;
	END IF;
END$$


-- Funcion para el login, devuelve la contraseña a partir de la solicitud en la app
-- que pasa el email como parametro

CREATE FUNCTION Login(p_email VARCHAR(100))
RETURNS VARCHAR (255)
DETERMINISTIC
BEGIN
	DECLARE Contra VARCHAR(255);
    SET Contra = (SELECT
					pass
				  FROM
					Usuarios
				  WHERE
					email = p_email);
	RETURN Contra;
END$$

-- Funcion para determinar si un usuario existe

CREATE FUNCTION UsuarioExiste (p_email VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE Respuesta INT;
    SET Respuesta = (SELECT
						COUNT(*)
					 FROM
						Usuarios
                     WHERE
						email = p_email
					);
	RETURN Respuesta;
END$$

-- Para obtener el ID de un usuario, pelicula o serie 

CREATE FUNCTION ObtenerID (p_opcion INT, p_dato VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE ID INT;
    
    CASE p_opcion
        WHEN 1 THEN -- Opcion para levantar el id de un usuario
            SET ID = (SELECT id_usuario
                      FROM Usuarios
                      WHERE email = p_dato);
        WHEN 2 THEN -- Opcion para levantar el id de una pelicula
            SET ID = (SELECT id_pelicula
                      FROM Peliculas
                      WHERE Titulo = p_dato);
        WHEN 3 THEN -- Opcion para levantar el id de una serie
            SET ID = (SELECT id_serie
                      FROM Series
                      WHERE Titulo = p_dato);
		WHEN 4 THEN -- Opcion para levantar el id de una plataforma
            SET ID = (SELECT id_plataforma
                      FROM Plataforma
                      WHERE plataforma = p_dato);
        WHEN 5 THEN -- Opcion para levantar el id de un actor
            SET ID = (SELECT id_actor
                      FROM Actores
                      WHERE concat(nombre, ' ', apellido) = p_dato
					  LIMIT 1);
        WHEN 6 THEN  -- Opcion para levantar el id de un director
            SET ID = (SELECT id_director
                      FROM Directores
                      WHERE concat(nombre, ' ', apellido) = p_dato
					  LIMIT 1);
        WHEN 7 THEN -- Opcion para levantar el id de un genero
            SET ID = (SELECT id_gen
                      FROM Genero
                      WHERE Genero = p_dato);
        ELSE
            SET ID = NULL;
	END CASE;
    RETURN ID;
END$$

-- Para saber si un usuario esta o no baneado

CREATE FUNCTION UsuarioBan (p_id_baneado INT)
RETURNS BOOL
DETERMINISTIC
BEGIN
	IF EXISTS (SELECT 1 FROM usuarios_baneados WHERE id_usuario = p_id_baneado) THEN
    RETURN TRUE;
    END IF;
    RETURN FALSE;
END$$

-- Para sacar la cantidad de visualizaciones

CREATE FUNCTION CantVisualizaciones (p_opcion INT, p_id_contenido int)
RETURNS INT
DETERMINISTIC
BEGIN
	DECLARE vistas INT;
    
    CASE p_opcion 
		WHEN 1 THEN
			SET vistas = (SELECT COUNT(*)
						  FROM visualizaciones_por_serie
						  WHERE id_serie = p_id_contenido);
		WHEN 2 THEN
			SET vistas = (SELECT COUNT(*)
						  FROM visualizaciones_por_pelicula
						  WHERE id_pelicula = p_id_contenido);
		END CASE;
	RETURN vistas;
    
END$$

DELIMITER ;
