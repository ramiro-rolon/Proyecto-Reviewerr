
-- Procedimientos para agregar registros de peliculas, series, usuarios, generos

-- Genero

DELIMITER $$

CREATE PROCEDURE AgregarGenero(in p_gen varchar(20))
BEGIN
	INSERT INTO Genero (genero) VALUES
    (p_gen);
END$$

-- Directores

CREATE PROCEDURE AgregarDirector(IN p_nombre VARCHAR(20), IN p_apellido VARCHAR(20))
BEGIN
	INSERT INTO directores(nombre, apellido)VALUES
    (p_nombre, p_apellido);
END$$

-- Actores

CREATE PROCEDURE AgregarActor(IN p_nombre VARCHAR(20), IN p_apellido VARCHAR(20))
BEGIN
	INSERT INTO actores(nombre, apellido)VALUES
    (p_nombre, p_apellido);
END$$

-- Plataforma

CREATE PROCEDURE AgregarPlataforma(IN p_plataforma VARCHAR(20), IN p_logo MEDIUMBLOB)
BEGIN
	INSERT INTO plataforma(plataforma, logo)VALUES
    (p_plataforma, p_logo);
END$$

DELIMITER ;

-- Ususarios

DELIMITER $$

CREATE PROCEDURE AgregarUsuario (in p_nombre varchar(100), in p_apellido varchar(100), in p_email varchar(150), in p_pass varchar(255), in p_imagen MEDIUMBLOB)
BEGIN
	INSERT INTO Usuarios (Nombre, Apellido, Email, Pass, Rol, imagen)
    VALUES(p_nombre, p_apellido, p_email, p_pass, false, p_imagen);
END$$

CREATE PROCEDURE CambiarFotoAUsuario (IN p_id_usuario INT, in p_imagen MediumBlob)
BEGIN
	UPDATE USUARIOS
	SET imagen = p_imagen
    WHERE id_usuario = p_id_usuario;
END$$

DELIMITER ;

-- Peliculas

DELIMITER $$

CREATE PROCEDURE AgregarPelicula (in p_titulo varchar(100), in p_sinopsis varchar(500), in p_duracion int, in p_fecha_estreno datetime, in p_imagen mediumblob, in p_url_trailer varchar(300))
BEGIN
	INSERT INTO Peliculas (Titulo, sinopsis, duracion, FechaEstreno, imagen, url_trailer)
	VALUES (p_titulo, p_sinopsis, p_duracion, p_fecha_estreno, p_imagen, p_url_trailer);
END$$

-- Series

CREATE PROCEDURE AgregarSerie (in p_titulo varchar(100), in p_sinopsis varchar(500), in p_temporadas int,
							   in p_capitulos int, in p_imagen mediumblob, in p_estreno int, in p_url_trailer varchar(300))
BEGIN
	INSERT INTO Series (Titulo, sinopsis, temporadas, capitulos, imagen, anio_estreno, url_trailer)
	VALUES (p_titulo, p_sinopsis, p_temporadas, p_capitulos, p_imagen, p_estreno, p_url_trailer);
END$$
 
 
-- Genero x contenido

CREATE PROCEDURE AgregarGeneroAContenido(in p_opcion int, in p_id_genero int, in p_id_contenido int)
BEGIN
	IF p_opcion = 1 THEN -- Opcion para insertar un genero de una serie
		INSERT INTO genero_serie(id_genero, id_serie) 
        VALUES (p_id_genero, p_id_contenido);
	ELSEIF p_opcion = 2 THEN -- Opcion para insertar un genero a una pelicula
		INSERT INTO genero_pelicula(id_genero, id_pelicula)
        VALUES (p_id_genero, p_id_contenido);
	END IF;
END$$

-- Valoraciones de series y peliculas

CREATE PROCEDURE AgregarValoracion(in p_opcion int, in p_id_contenido int, in p_id_user int, in p_comentario varchar(400), in p_valor int)
BEGIN
	IF p_opcion = 1 THEN -- Opcion para insertar una valoracion de una serie
		INSERT INTO valoraciones_series (id_serie, id_usuario, comentario, valoracion)
		VALUES(p_id_contenido, p_id_user, p_comentario, p_valor);
	ELSEIF p_opcion = 2 THEN -- Opcion para insertar una valoracio de una pelicula
		INSERT INTO valoraciones_pelicula (id_pelicula, id_usuario, comentario, valoracion)
		VALUES(p_id_contenido, p_id_user, p_comentario, p_valor);
	END IF;
END$$


-- Para agregar visualizaciones, tanto de series como de peliculas

CREATE PROCEDURE AgregarVisualizacion(in p_opcion int, in p_id_usuario int, in p_id_contenido int, in p_fecha datetime)
BEGIN
	IF p_opcion = 1 THEN
		INSERT INTO visualizaciones_por_serie (id_serie, id_usuario, fecha)
        VALUES (p_id_contenido, p_id_usuario, p_fecha);
	ELSEIF p_opcion = 2 THEN
		INSERT INTO visualizaciones_por_pelicula (id_pelicula, id_usuario, fecha)
        VALUES (p_id_contenido, p_id_usuario, p_fecha); 
    END IF;
END$$

-- ban de usuario

CREATE PROCEDURE BanearUsuario(in p_id_usuario int)
BEGIN
	INSERT INTO usuarios_baneados (id_usuario)
    VALUES (p_id_usuario);
END$$

-- Para conectar directores y actores con series y peliculas

CREATE PROCEDURE AgregarDirectorOActor(in p_opcion int, in p_id_protag int, in p_id_contenido int)
BEGIN
	CASE p_opcion
		WHEN 1 THEN -- Para agregar un director a una pelicula
			INSERT INTO director_por_pelicula(id_pelicula, id_director)
            VALUES (p_id_contenido, p_id_protag);
        WHEN 2 THEN -- Para agregar un actor a una pelicula
			INSERT INTO actor_por_pelicula(id_pelicula, id_actor)
            VALUES (p_id_contenido, p_id_protag);
        WHEN 3 THEN -- Para agregar un director a una serie
			INSERT INTO director_por_serie(id_serie, id_director)
            VALUES (p_id_contenido, p_id_protag);
        WHEN 4 THEN -- Para agregar un actor a una serie
			INSERT INTO actor_por_serie(id_serie, id_actor)
            VALUES (p_id_contenido, p_id_protag);
	END CASE;
END$$

DELIMITER ;

-- PROCEDIMIENTOS PARA LOS UPDATES

DELIMITER $$

-- PARA LOS USUARIOS

CREATE PROCEDURE ActualizarUsuarios (IN p_opcion INT, IN p_id_usuario INT, IN p_dato VARCHAR(255))
BEGIN
	CASE p_opcion
		WHEN 1 THEN -- UPDATE DE NOMBRE
			UPDATE Usuarios SET nombre = p_dato WHERE id_usuario = p_id_usuario;
        WHEN 2 THEN -- UPDATE DE APELLIDO
			UPDATE Usuarios SET apellido = p_dato WHERE id_usuario = p_id_usuario;
        WHEN 3 THEN -- UPDATE DE CONTRASEÑA
			UPDATE Usuarios SET pass = p_dato WHERE id_usuario = p_id_usuario;
	END CASE;
END$$

-- ACTUALIZAR USUARIOS FULL

CREATE PROCEDURE ActualizarUsuariosFull (IN p_id_usuario INT, IN p_nombre VARCHAR(100), IN p_apellido VARCHAR(100), IN p_email VARCHAR(150), IN p_pass VARCHAR(255), IN p_imagen MEDIUMBLOB)
BEGIN
	UPDATE Usuarios SET nombre = p_nombre WHERE id_usuario = p_id_usuario;
	UPDATE Usuarios SET apellido = p_apellido WHERE id_usuario = p_id_usuario;
	UPDATE Usuarios SET email = p_email WHERE id_usuario = p_id_usuario;
	UPDATE Usuarios SET pass = p_pass WHERE id_usuario = p_id_usuario;
	UPDATE Usuarios SET imagen = p_imagen WHERE id_usuario = p_id_usuario;
END$$

-- PARA ASIGNAR PLATAFORMAS A PELICULAS Y SERIES

CREATE PROCEDURE AsignarPlataformaAPelicula (IN p_id_plataforma INT, IN p_id_pelicula INT)
BEGIN
	INSERT INTO plataforma_por_pelicula (id_plataforma, id_pelicula)
    VALUES (p_id_plataforma, p_id_pelicula);
END$$

CREATE PROCEDURE AsignarPlataformaASerie (IN p_id_plataforma INT, IN p_id_serie INT)
BEGIN
	INSERT INTO plataforma_por_serie (id_plataforma, id_serie)
    VALUES (p_id_plataforma, p_id_serie);
END$$

-- LEVANTAR TODOS LOS DATOS DE PELICULAS: TIENEN QUE ENTRAR CON EL ID DE LA PELICULA, SACAN EL TITULO
-- EL GENERO, LA DURACION, LOS DIRECTORES, LA SINOPSIS, 
	
CREATE PROCEDURE LevantarPeliculasFull (IN p_id_peli INT, OUT p_titulo VARCHAR(50), OUT p_genero VARCHAR(50), OUT p_duracion INT, OUT p_directores VARCHAR(100),
										OUT p_sinopsis VARCHAR(500), OUT p_plataforma VARCHAR(50), Out p_actores VARCHAR(200), OUT p_imagen MEDIUMBLOB, OUT p_fechaestreno DATETIME, OUT p_trailer VARCHAR(300))
BEGIN

    SET p_actores = (SELECT group_concat(nombre_completo SEPARATOR " | ") as actores
					 FROM Vista_Actores_Y_Peliculas
                     WHERE id_pelicula = p_id_peli);
	SET p_directores = (SELECT group_concat(nombre_completo SEPARATOR " | ") as directores
						FROM Vista_Directores_Y_Peliculas
						WHERE id_pelicula = p_id_peli);
	SET p_plataforma = (SELECT group_concat(plataforma SEPARATOR " | ") as plataformas
						FROM Vista_Plataforma_Por_Contenido
						WHERE id = p_id_peli AND Tipo = 'Pelicula');
	SET p_genero = (SELECT group_concat(genero SEPARATOR " | ") as genero
					FROM Vista_Peliculas_Y_Generos
					WHERE id_pelicula = p_id_peli);
                        
	SET p_titulo = (SELECT Titulo FROM Peliculas WHERE id_pelicula = p_id_peli);
	SET p_sinopsis = (SELECT sinopsis FROM Peliculas WHERE id_pelicula = p_id_peli);
    SET p_duracion = (SELECT duracion FROM Peliculas WHERE id_pelicula = p_id_peli);
    SET p_imagen = (SELECT imagen FROM Peliculas WHERE id_pelicula = p_id_peli);
    SET p_fechaEstreno = (SELECT fechaEstreno FROM Peliculas WHERE id_pelicula = p_id_peli);
	SET p_trailer = (SELECT url_trailer FROM Peliculas WHERE id_pelicula = p_id_peli);
    
END$$

-- PARA LEVANTAR TODOS LOS DATOS DE UNA SERIE

CREATE PROCEDURE LevantarSerieFull(IN p_id_serie INT, OUT p_titulo VARCHAR(50), OUT p_genero VARCHAR(50), OUT p_temporadas INT, OUT p_capitulos INT, OUT p_directores VARCHAR(100),
								   OUT p_sinopsis VARCHAR(500), OUT p_plataforma VARCHAR(50), Out p_actores VARCHAR(200), OUT p_imagen MEDIUMBLOB, OUT p_anioEstreno INT, OUT p_trailer VARCHAR(300))
BEGIN

    SET p_actores = (SELECT group_concat(nombre_completo SEPARATOR " | ") as actores
					 FROM Vista_Actores_Y_Series
                     WHERE id_serie = p_id_serie);
	SET p_directores = (SELECT group_concat(nombre_completo SEPARATOR " | ") as directores
						FROM Vista_Directores_Y_Series
						WHERE id_serie = p_id_serie);
	SET p_plataforma = (SELECT group_concat(plataforma SEPARATOR " | ") as plataformas
						FROM Vista_Plataforma_por_contenido
						WHERE id = p_id_serie AND tipo = 'Serie');
	SET p_genero = (SELECT group_concat(genero SEPARATOR " | ") as genero
					FROM Vista_Series_Y_Generos
					WHERE id_serie = p_id_serie);
                        
	SET p_titulo = (SELECT Titulo FROM Series WHERE id_serie = p_id_serie);
	SET p_sinopsis = (SELECT sinopsis FROM Series WHERE id_serie = p_id_serie);
    SET p_temporadas = (SELECT temporadas FROM Series WHERE id_serie = p_id_serie);
    SET p_imagen = (SELECT imagen FROM Series WHERE id_serie = p_id_serie);
    SET p_capitulos = (SELECT capitulos FROM Series WHERE id_serie = p_id_serie);
    SET p_anioEstreno = (SELECT anio_estreno FROM Series WHERE id_serie = p_id_serie);
    SET p_trailer = (SELECT url_trailer FROM Series WHERE id_serie = p_id_serie);

END$$

-- PARA LEVANTAR TODOS LOS DATOS DE LOS USUARIOS

CREATE PROCEDURE LevantarUsuarioFull(IN p_id_usuario INT, OUT p_nombre VARCHAR(25), OUT p_apellido VARCHAR(25), OUT p_email VARCHAR(25), OUT p_imagen MEDIUMBLOB, OUT p_peli_favorita VARCHAR(50),
									 OUT p_serie_favorita VARCHAR(50), OUT p_fechaRegistro DATETIME)
BEGIN

	SET p_nombre = (SELECT nombre FROM usuarios WHERE id_usuario = p_id_usuario);
	SET p_apellido = (SELECT apellido FROM usuarios WHERE id_usuario = p_id_usuario);
	SET p_email = (SELECT email FROM usuarios WHERE id_usuario = p_id_usuario);
	SET p_imagen = (SELECT imagen FROM usuarios WHERE id_usuario = p_id_usuario);
	SET p_peli_favorita = (SELECT titulo 
						   FROM vista_valoraciones_usuarios 
                           WHERE nombre_usuario = concat(p_nombre, ' ', p_apellido) AND Tipo = 'Pelicula'
                           ORDER BY valoracion DESC
                           LIMIT 1);
	SET p_serie_favorita = (SELECT titulo 
						   FROM vista_valoraciones_usuarios 
                           WHERE nombre_usuario = concat(p_nombre, ' ', p_apellido) AND Tipo = 'Serie'
                           ORDER BY valoracion DESC
                           LIMIT 1);
	SET p_fechaRegistro = (SELECT fechaRegistro FROM usuarios WHERE id_usuario = p_id_usuario);
    
END$$

-- ELIMINACION DE USUARIOS

CREATE PROCEDURE EliminarUsuario (IN p_id_usuario INT)
BEGIN
	DELETE FROM USUARIOS WHERE ID_USUARIO = P_ID_USUARIO;
END$$

CREATE PROCEDURE EliminarPelicula (IN p_id_pelicula INT)
BEGIN
	DELETE FROM Peliculas WHERE id_pelicula = p_id_pelicula;
END$$

CREATE PROCEDURE EliminarSerie (IN p_id_serie INT)
BEGIN
	DELETE FROM Series WHERE id_serie = p_id_serie;
END$$

CREATE PROCEDURE ActualizarPeliculaFULL (IN p_id_peli INT, IN p_titulo VARCHAR(50), IN p_duracion INT, IN p_fecha_estreno DATETIME,
										IN p_sinopsis VARCHAR(500), IN p_imagen MEDIUMBLOB, IN p_trailer VARCHAR(300))
BEGIN
	UPDATE Peliculas
	SET Titulo = p_titulo, duracion = p_duracion, fechaEstreno = p_fecha_estreno,
		sinopsis = p_sinopsis, imagen = p_imagen, url_trailer = p_trailer
	WHERE id_pelicula = p_id_peli;
    DELETE FROM actor_por_pelicula WHERE id_pelicula = p_id_peli;
    DELETE FROM director_por_pelicula WHERE id_pelicula = p_id_peli;
    DELETE FROM plataforma_por_pelicula WHERE id_pelicula = p_id_peli;
    DELETE FROM genero_pelicula WHERE id_pelicula = p_id_peli;
    
END$$

CREATE PROCEDURE ActualizarSerieFULL (IN p_id_serie INT, IN p_titulo VARCHAR(50), IN p_temporadas INT, IN p_capitulos INT,
									  IN p_sinopsis VARCHAR(500), IN p_imagen MEDIUMBLOB, IN p_estreno DATETIME, IN p_trailer VARCHAR(300))
BEGIN
	UPDATE Series
	SET Titulo = p_titulo, temporadas = p_temporadas, capitulos = p_capitulos,
		sinopsis = p_sinopsis, imagen = p_imagen, url_trailer = p_trailer
	WHERE id_serie = p_id_serie;
    DELETE FROM actor_por_serie WHERE id_serie = p_id_serie;
    DELETE FROM director_por_serie WHERE id_serie = p_id_serie;
    DELETE FROM plataforma_por_serie WHERE id_serie = p_id_serie;
    DELETE FROM genero_serie WHERE id_serie = p_id_serie;
    
    -- Desde el back vuelven a llamar los asignar (plataforma, genero, actores y directores)
    
END$$

-- Para cambiarle el rol a un usuario

CREATE PROCEDURE PasarUsuarioAAdmin (IN p_id_usuario INT)
BEGIN
	UPDATE usuarios
    SET rol = true
    WHERE id_usuario = p_id_usuario;
END$$

-- Desbanear usuario 

CREATE PROCEDURE DesbanearUsuario (IN p_id_usuario INT)
BEGIN
	DELETE FROM usuarios_baneados WHERE id_usuario = p_id_usuario;
END$$

-- Para eliminar comentario, toma por parametro el tipo de contenido, el id del contenido y el usuario

CREATE PROCEDURE EliminarComentario(IN p_tipo INT, IN p_id_contenido INT, IN p_id_usuario INT)
BEGIN
    IF p_tipo = 1 THEN
        DELETE FROM valoraciones_series 
        WHERE id_serie = p_id_contenido AND id_usuario = p_id_usuario;
    ELSEIF p_tipo = 2 THEN
        DELETE FROM valoraciones_pelicula 
        WHERE id_pelicula = p_id_contenido AND id_usuario = p_id_usuario;
    END IF;
END$$

-- Procedimiento que filtre los comentarios y valoraciones a contenidos segun lo que le pasemos por parametro

CREATE PROCEDURE FiltroComentariosPorUsuario (IN p_id_usuario INT, OUT p_nombre VARCHAR(100), OUT p_apellido VARCHAR(100), OUT p_id_contenido INT, OUT p_titulo VARCHAR(100), 
											  OUT p_id_visualizacion INT, OUT p_comentario VARCHAR(400), OUT p_valoracion INT, OUT p_tipo VARCHAR(10))
BEGIN
	SET p_nombre = (SELECT nombre FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_apellido = (SELECT apellido FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_id_contenido = (SELECT ID_Contenido FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_titulo = (SELECT Titulo FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_id_visualizacion = (SELECT Id_visualizacion FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_comentario = (SELECT Comentario FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_valoracion = (SELECT Valoracion FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
    SET p_tipo = (SELECT Tipo FROM vista_comentarios_visualizaciones_full WHERE ID_Usuario = p_id_usuario);
END$$

-- Procedimiento para eliminar alguna visualizacion

CREATE PROCEDURE EliminarVisualizacion (IN p_opcion INT, IN p_id_visualizacion INT)
BEGIN
	CASE p_opcion
		WHEN 1 THEN
			DELETE FROM visualizaciones_por_serie WHERE id_vxs = p_id_visualizacion;
        WHEN 2 THEN
			DELETE FROM visualizaciones_por_pelicula WHERE id_vxp = p_id_visualizacion;
	END CASE;
END$$

-- Procedimiento para filtrar valoraciones segun peliculas by Renchus

CREATE PROCEDURE FiltrarValoracionesPeliculas (IN p_id_pelicula INT)
BEGIN
    SELECT
        vcv.nombre, vcv.apellido, vcv.comentario, vcv.valoracion, vcv.id_usuario, U.imagen -- <-- AÑADIDO: Selecciona la imagen del usuario
        -- , vp.fecha_valoracion -- Si tienes fecha
    FROM
        vista_comentarios_visualizaciones_full AS vcv
    INNER JOIN
        -- Usar la tabla 'Usuarios' o tu vista de usuarios que contenga la imagen
        Usuarios AS u ON vcv.id_usuario = u.id_usuario
    WHERE
        vcv.id_contenido = p_id_pelicula
        AND Tipo = 'Pelicula'
    ORDER BY
        vcv.id_visualizacion DESC; -- O por fecha
END$$

-- Lo mismo pero para series

CREATE PROCEDURE FiltrarValoracionesSeries (IN p_id_serie INT)
BEGIN
	SELECT
		vcv.nombre, vcv.apellido, vcv.comentario, vcv.valoracion, vcv.id_usuario, U.imagen
    FROM
        vista_comentarios_visualizaciones_full AS vcv
    INNER JOIN
        Usuarios AS u ON vcv.id_usuario = u.id_usuario
    WHERE
		vcv.id_contenido = p_id_serie
        AND Tipo = 'Serie'
    ORDER BY
		vcv.id_visualizacion DESC;
END$$

-- Editar valoracion (se pasa primero la opicion de a que tipo de contenido queremos cambiarle la valoracion y el comentario:
-- opcion 1 se cambia para series, opcion 2 se cambia para peliculas)

CREATE PROCEDURE EditarValoracion (IN p_opcion INT, IN p_id_contenido INT, IN p_id_usuario INT, IN p_valoracion INT, IN p_comentario VARCHAR(400))
BEGIN
	CASE p_opcion
		WHEN 1 THEN 
			UPDATE valoraciones_series
            SET comentario = p_comentario,
            valoracion = p_valoracion
            WHERE id_serie = p_id_contenido AND id_usuario = p_id_usuario;
        WHEN 2 THEN
			UPDATE valoraciones_pelicula
            SET comentario = p_comentario,
            valoracion = p_valoracion
            WHERE id_pelicula = p_id_contenido AND id_usuario = id_usuario;
	END CASE;
END$$

DELIMITER ;


-- DROP PROCEDURE IF EXISTS ;
