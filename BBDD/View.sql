-- ACA VAN A IR LAS TABLAS VIRTUALES, CONEXIONES ENTRE TABLAS, ETC

-- VISTA PARA LEVANTAR A LOS USUARIOS QUE NO SON ADMINS

CREATE OR REPLACE VIEW Vista_Usuarios AS
	SELECT
    * 
    FROM 
    Usuarios
    WHERE
    Rol = false;

-- VISTA PARA LEVANTAR LOS USUARIOS QUE SI SON ADMINS
    
CREATE OR REPLACE VIEW Vista_Usuarios_Admin AS
	SELECT
    *
    FROM
    Usuarios
    WHERE
    Rol = TRUE;

-- VISTA PARA LAS PELICULAS Y GENEROS

CREATE OR REPLACE VIEW Vista_Peliculas_Y_Generos AS
	SELECT 
	p.Titulo,p.id_Pelicula,g.Genero
    FROM
    Peliculas AS p INNER JOIN genero_pelicula as GP ON p.Id_Pelicula = GP.id_pelicula
    INNER JOIN Genero AS g ON g.Id_gen = GP.Id_genero;

-- VISTA PARA LAS SERIES Y GENEROS
        
CREATE OR REPLACE VIEW Vista_Series_Y_Generos AS
	SELECT
	s.Titulo,s.Id_Serie, g.genero
    FROM
    Series as s INNER JOIN genero_serie AS GS ON s.Id_Serie = GS.id_serie
    INNER JOIN Genero AS g ON g.Id_gen = GS.Id_genero;

-- VISTA PARA LOS DIRECTORES Y PELICULAS

CREATE OR REPLACE VIEW Vista_Directores_Y_Peliculas AS
	SELECT
    	Concat(D.nombre, ' ', D.apellido) as nombre_completo,p.Id_pelicula,p.Titulo
    FROM
    Directores AS D INNER JOIN Director_por_pelicula AS Dp ON d.Id_director = Dp.id_director
    INNER JOIN Peliculas AS p ON p.Id_pelicula = Dp.Id_pelicula;

-- VISTA PARA LOS DIRECTORES Y SERIES

CREATE OR REPLACE VIEW Vista_Directores_Y_Series AS 
	SELECT 
	Concat(D.nombre, ' ', D.apellido) as nombre_completo,s.id_serie,s.Titulo
    FROM
    directores AS D INNER JOIN director_por_serie AS Ds ON D.id_director = Ds.id_director
    INNER JOIN Series AS s ON s.id_serie = Ds.id_serie;

-- VISTA PARA LOS ACTORES Y SERIES

CREATE OR REPLACE VIEW Vista_Actores_Y_Series AS
	SELECT 
    	Concat(A.nombre, ' ', A.apellido) as nombre_completo,s.id_serie,s.titulo
    FROM
	actores AS A INNER JOIN actor_por_serie AS Sa ON A.id_actor = Sa.id_actor
    INNER JOIN series as S ON s.id_serie = Sa.id_serie;

-- VISTA PARA LOS ACTORES Y PELICULAS

CREATE OR REPLACE VIEW Vista_Actores_Y_Peliculas AS
	SELECT 
    Concat(A.nombre, ' ', A.apellido) as nombre_completo,p.id_pelicula,p.titulo
    FROM
	actores AS A INNER JOIN actor_por_pelicula AS Ap ON A.id_actor = Ap.id_actor
    INNER JOIN peliculas AS p ON p.id_pelicula = Ap.id_pelicula;

-- VISTA PARA LAS PLATAFORMAS, SERIES Y PELICULAS

CREATE OR REPLACE VIEW Vista_Plataforma_Por_Contenido AS
	SELECT
		pel.id_pelicula AS id, pel.titulo AS titulo, plat.plataforma, 'Pelicula' as Tipo
	FROM
		Peliculas AS pel
        INNER JOIN plataforma_por_pelicula AS pxp ON pel.id_pelicula = pxp.id_pelicula
        INNER JOIN plataforma as plat ON plat.id_plataforma = pxp.id_plataforma
        
	UNION
    
    SELECT 
		s.id_serie AS id, s.titulo AS titulo, plat.plataforma, 'Serie' as Tipo
	FROM
		Series AS s
        INNER JOIN plataforma_por_serie AS pxs ON s.id_serie = pxs.id_serie
        INNER JOIN plataforma AS plat ON plat.id_plataforma = pxs.id_plataforma;
        
-- PARA LAS VALORACIONES Y COMENTARIOS DE USUARIOS SOBRE PELICULAS O SERIES

CREATE OR REPLACE VIEW Vista_Valoraciones_Usuarios AS
	SELECT
		concat(u.nombre, ' ', u.apellido) as Nombre_Usuario, s.titulo as Titulo, vs.comentario as Comentario, vs.valoracion as Valoracion, 'Serie' AS Tipo
	FROM
		usuarios AS u
        INNER JOIN valoraciones_series AS vs ON u.Id_Usuario = vs.id_usuario
        INNER JOIN series AS s ON s.id_serie = vs.id_serie
	
    UNION 
    
	SELECT
		concat(u.nombre, ' ', u.apellido) as Nombre_Usuario, p.titulo as Titulo, vp.comentario as Comentario, vp.valoracion as Valoracion, 'Pelicula' AS Tipo
	FROM
		usuarios AS u
        INNER JOIN valoraciones_pelicula AS vp ON u.Id_Usuario = vp.id_usuario
        INNER JOIN peliculas AS p ON p.id_pelicula = vp.id_pelicula;

-- VISTA FULL CONTENIDOS
-- titulos, tipo, genero, actores y directores, plataforma, count de visualizaciones, promedios

CREATE OR REPLACE VIEW VistaComentariosFullContenidos AS 
    -- Comentarios de series
    SELECT 
        vs.id_serie AS id_contenido,
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_usuario, -- nombre completo
        vs.comentario,
        vs.valoracion,
        1 AS tipo,
        s.titulo AS titulo
    FROM valoraciones_series vs
    JOIN series s ON vs.id_serie = s.id_serie
    JOIN usuarios u ON vs.id_usuario = u.id_usuario

    UNION ALL

    -- Comentarios de películas
    SELECT 
        vp.id_pelicula AS id_contenido,
        u.id_usuario,
        CONCAT(u.nombre, ' ', u.apellido) AS nombre_usuario, -- nombre completo
        vp.comentario,
        vp.valoracion,
        2 AS tipo,
        p.titulo AS titulo
    FROM valoraciones_pelicula vp
    JOIN peliculas p ON vp.id_pelicula = p.id_pelicula
    JOIN usuarios u ON vp.id_usuario = u.id_usuario;
    
-- vista con toda la info de visualizaciones cruzadas con comentarios, aun asi no tengan comentarios o valoraciones
    
CREATE OR REPLACE VIEW Vista_Comentarios_Visualizaciones_Full AS
	SELECT
		u.id_usuario AS ID_Usuario, u.nombre AS Nombre, u.apellido AS Apellido, p.id_pelicula AS ID_Contenido, p.titulo AS Titulo, 
        vis_p.id_vxp AS ID_Visualizacion, val_p.comentario AS Comentario, val_p.valoracion AS Valoracion, 'Pelicula' AS Tipo
	FROM 
		visualizaciones_por_pelicula AS vis_p
        INNER JOIN peliculas AS p ON p.id_pelicula = vis_p.id_pelicula
        INNER JOIN usuarios AS u ON u.id_usuario = vis_p.id_usuario
		LEFT JOIN valoraciones_pelicula AS val_p ON val_p.id_pelicula = p.id_pelicula AND val_p.id_usuario = u.id_usuario
	
    UNION ALL
    SELECT
		u.id_usuario AS ID_Usuario, u.nombre AS Nombre, u.apellido AS Apellido, s.id_serie AS ID_Contenido, s.titulo AS Titulo, 
        vis_s.id_vxs AS ID_Visualizacion, val_s.comentario AS Comentario, val_s.valoracion AS Valoracion, 'Serie' AS Tipo
	FROM 
		visualizaciones_por_serie AS vis_s
        INNER JOIN series AS s ON s.id_serie = vis_s.id_serie
        INNER JOIN usuarios AS u ON u.id_usuario = vis_s.id_usuario
        LEFT JOIN valoraciones_series AS val_s ON val_s.id_serie = s.id_serie AND val_s.id_usuario = u.id_usuario;
	
-- VISTA CON TODA LA DATA DE TODOS LOS CONTENIDOS + ESTADISTICAS 
    
CREATE OR REPLACE VIEW Vista_Full_Contenidos AS
	SELECT 
		id_pelicula AS ID_Contenido, Titulo, Sinopsis, Imagen, Url_Trailer, CantVisualizaciones(2, id_pelicula) AS Cantidad_Visualizaciones, PromedioCalificacionesPelis(id_pelicula) AS Promedio,
		'Pelicula' AS Tipo
	FROM
		Peliculas
	UNION ALL
	SELECT
		id_serie AS ID_Contenido, Titulo, Sinopsis, Imagen, Url_Trailer, CantVisualizaciones(1, id_serie) AS Cantidad_Visualizaciones, PromedioCalificacionesSeries(id_serie) AS Promedio,
        'Serie' AS Tipo
	FROM
		Series;
        
-- VISTA BASADA EN LA ANTERIOR QUE LEVANTA LAS MEJORES 4 DE CADA TIPO SEGUN SU PROMEDIO

-- Para pelis
CREATE OR REPLACE VIEW Vista_Top_Promedios_Peliculas AS
	SELECT
		*
	FROM
		Vista_Full_Contenidos
	WHERE
		Tipo = 'Pelicula'
	ORDER BY
		Promedio DESC
	LIMIT
		4;
        
-- Para series
CREATE OR REPLACE VIEW Vista_Top_Promedios_Series AS
	SELECT
		*
	FROM
		Vista_Full_Contenidos
	WHERE
		Tipo = 'Serie'
	ORDER BY
		Promedio DESC
	LIMIT
		4;

-- VISTA BASADA EN LA ANTERIOR QUE LEVABTA LAS MEJORES 4 DE CADA TIPO SEGUN SU CANTIDAD DE VISUALIZACIONES

-- Para pelis
CREATE OR REPLACE VIEW Vista_Top_Visualizaciones_Peliculas AS
	SELECT
		*
	FROM
		Vista_Full_Contenidos
	WHERE
		Tipo = 'Pelicula'
	ORDER BY
		Cantidad_Visualizaciones DESC
	LIMIT
		4;
        
-- Para series
CREATE OR REPLACE VIEW Vista_Top_Visualizaciones_Series AS
	SELECT
		*
	FROM
		Vista_Full_Contenidos
	WHERE
		Tipo = 'Serie'
	ORDER BY
		Cantidad_Visualizaciones DESC
	LIMIT
		4;

-- Para contenidos en general
-- Segun las visualizaciones

CREATE OR REPLACE VIEW Vista_Top_Visualizaciones AS
	SELECT
		*
	FROM
		Vista_Full_Contenidos
	ORDER BY
		Cantidad_Visualizaciones DESC
	LIMIT
		4;

-- Segun los promedios
        
CREATE OR REPLACE VIEW Vista_Top_Promedios AS
	SELECT
		*
	FROM
		Vista_Full_Contenidos
	ORDER BY
		Promedio DESC
	LIMIT
		4;
