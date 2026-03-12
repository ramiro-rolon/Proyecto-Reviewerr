-- Inserciones para usuarios

INSERT INTO Usuarios (Nombre, Apellido, Email, Pass, Rol) VALUES
('Ramiro', 'Castelluccio', 'ramiro@gmail.com', '1234hash', true),
('Lucía', 'Fernández', 'luciaf@gmail.com', 'pass1', false),
('Marcos', 'López', 'marcoslopez@gmail.com', 'pass2', false),
('Sofía', 'Pérez', 'sofia.p@gmail.com', 'pass3', false),
('Tomás', 'Rivas', 'tomasr@gmail.com', 'pass4', false),
('Camila', 'Gómez', 'camigomez@gmail.com', 'pass5', false),
('Ignacio', 'Benítez', 'ignacio.b@gmail.com', 'pass6', false),
('Valentina', 'Suárez', 'valesuarez@gmail.com', 'pass7', false),
('Julián', 'Torres', 'julian.t@gmail.com', 'pass8', false),
('Martina', 'Acosta', 'martina.acosta@gmail.com', 'pass9', false),
('Ezequiel', 'Moreno', 'eze.moreno@gmail.com', 'pass10', false),
('Brenda', 'Santos', 'brenda.s@gmail.com', 'pass11', false),
('Matías', 'Herrera', 'matias.h@gmail.com', 'pass12', false),
('Nicolás', 'Silva', 'nicosilva@gmail.com', 'pass13', false),
('Agustina', 'Martínez', 'agusmartinez@gmail.com', 'pass14', false),
('Florencia', 'Juárez', 'florjuarez@gmail.com', 'pass15', false),
('Facundo', 'Ruiz', 'facuruiz@gmail.com', 'pass16', false),
('Milagros', 'Díaz', 'mili.diaz@gmail.com', 'pass17', false),
('Diego', 'Navarro', 'diegonavarro@gmail.com', 'pass18', false),
('Carla', 'Romero', 'carla.romero@gmail.com', 'pass19', false);

select * from usuarios;

-- Inserciones para series

INSERT INTO Series (Titulo, sinopsis, temporadas, capitulos, Anio_estreno, url_trailer) VALUES
('Breaking Bad', 'Un profesor de química se convierte en fabricante de metanfetamina.', 5, 62, 2008, 'https://youtu.be/HhesaQXLuRY'),
('Stranger Things', 'Un grupo de niños enfrenta fuerzas sobrenaturales en su pueblo.', 4, 34, 2016, 'https://youtu.be/mnd7sFt5c3A'),
('The Witcher', 'Un cazador de monstruos lucha entre la humanidad y la magia.', 3, 24, 2019, 'https://youtu.be/ndl1W4ltcmg'),
('Peaky Blinders', 'Una familia criminal controla Birmingham en los años 20.', 6, 36, 2013, 'https://youtu.be/oVzVdvGIC7U'),
('The Boys', 'Superhéroes corruptos son enfrentados por un grupo de vigilantes.', 4, 32, 2019, 'https://youtu.be/M1bhOaLV4FU'),
('Game of Thrones', 'Nobles familias luchan por el trono de hierro en Westeros.', 8, 73, 2011, 'https://youtu.be/BpJYNVhGf1s'),
('Loki', 'El dios del engaño altera la línea temporal.', 2, 12, 2021, 'https://youtu.be/nW948Va-l10'),
('Narcos', 'Basada en la historia del narcotráfico colombiano.', 3, 30, 2015, 'https://youtu.be/U7elNhHwgBU'),
('Dark', 'Un pueblo alemán es afectado por viajes en el tiempo.', 3, 26, 2017, 'https://youtu.be/rrwycJ08PSA'),
('The Mandalorian', 'Un cazarrecompensas viaja por la galaxia junto a Grogu.', 3, 24, 2019, 'https://youtu.be/aOC8E8z_ifw'),
('House of the Dragon', 'Precuela de Game of Thrones centrada en los Targaryen.', 2, 20, 2022, 'https://youtu.be/w2c5JZ6vC1I'),
('The Office', 'Comedia sobre la vida diaria en una oficina de papel.', 9, 201, 2005, 'https://youtu.be/djT0VZC_7Qg'),
('Friends', 'Seis amigos enfrentan la vida y el amor en Nueva York.', 10, 236, 1994, 'https://youtu.be/hDNNmeeJs1Q'),
('The Last of Us', 'Un hombre y una niña sobreviven a una pandemia mundial.', 1, 9, 2023, 'https://youtu.be/uLtkt8BonwM'),
('Vikings', 'Ragnar Lothbrok busca fama y poder como guerrero nórdico.', 6, 89, 2013, 'https://youtu.be/9GgxinPwAGc'),
('Black Mirror', 'Historias independientes sobre tecnología y sociedad.', 6, 27, 2011, 'https://youtu.be/jROLrhQkK78'),
('The Walking Dead', 'Supervivientes enfrentan un apocalipsis zombi.', 11, 177, 2010, 'https://youtu.be/sfAc2U20uyg'),
('Better Call Saul', 'Historia del abogado Saul Goodman antes de Breaking Bad.', 6, 63, 2015, 'https://youtu.be/l1xIGfVFb-U'),
('Chernobyl', 'Miniserie sobre el desastre nuclear de 1986.', 1, 5, 2019, 'https://youtu.be/s9APLXM9Ei8'),
('One Piece', 'Piratas buscan el mayor tesoro del mundo.', 1, 10, 2023, 'https://youtu.be/l6kp780S-os');

select * from series;

-- Inserciones para peliculas

INSERT INTO Peliculas (Titulo, sinopsis, duracion, FechaEstreno, url_trailer) VALUES
('Inception', 'Un ladrón roba secretos a través de los sueños.', 148, '2010-07-16', 'https://youtu.be/YoHD9XEInc0'),
('Interstellar', 'Exploradores viajan a través de un agujero de gusano.', 169, '2014-11-07', 'https://youtu.be/zSWdZVtXT7E'),
('The Dark Knight', 'Batman enfrenta al Joker en Gotham.', 152, '2008-07-18', 'https://youtu.be/EXeTwQWrcwY'),
('Avatar', 'Un ex marine se une a los Na’vi en Pandora.', 162, '2009-12-18', 'https://youtu.be/5PSNL1qE6VY'),
('Titanic', 'Una historia de amor a bordo del Titanic.', 195, '1997-12-19', 'https://youtu.be/kVrqfYjkTdQ'),
('Gladiator', 'Un general romano busca venganza.', 155, '2000-05-05', 'https://youtu.be/owK1qxDselE'),
('The Matrix', 'Un hacker descubre la verdad del mundo simulado.', 136, '1999-03-31', 'https://youtu.be/vKQi3bBA1y8'),
('Oppenheimer', 'La creación de la bomba atómica.', 180, '2023-07-21', 'https://youtu.be/uYPbbksJxIg'),
('Spider-Man: No Way Home', 'Peter Parker enfrenta villanos de otros universos.', 148, '2021-12-17', 'https://youtu.be/JfVOs4VSpmA'),
('Parasite', 'Una familia pobre se infiltra en una rica.', 132, '2019-05-30', 'https://youtu.be/SEUXfv87Wpk'),
('Joker', 'La historia de origen del icónico villano.', 122, '2019-10-04', 'https://youtu.be/zAGVQLHvwOY'),
('Avengers: Endgame', 'Los Vengadores intentan revertir el chasquido.', 181, '2019-04-26', 'https://youtu.be/TcMBFSGVi1c'),
('The Batman', 'Un joven Bruce Wayne investiga crímenes en Gotham.', 176, '2022-03-04', 'https://youtu.be/mqqft2x_Aa4'),
('Pulp Fiction', 'Historias entrelazadas de crimen y redención.', 154, '1994-10-14', 'https://youtu.be/s7EdQ4FqbhY'),
('Fight Club', 'Un oficinista crea un club de lucha secreto.', 139, '1999-10-15', 'https://youtu.be/SUXWAEX2jlg'),
('The Godfather', 'El patriarca de una familia mafiosa cede el poder.', 175, '1972-03-24', 'https://youtu.be/sY1S34973zA'),
('The Shawshank Redemption', 'Un hombre es encarcelado injustamente.', 142, '1994-09-23', 'https://youtu.be/6hB3S9bIaco'),
('Forrest Gump', 'Un hombre simple vive momentos clave de la historia.', 142, '1994-07-06', 'https://youtu.be/bLvqoHBptjg'),
('Dune', 'Un joven noble se convierte en el elegido.', 155, '2021-10-22', 'https://youtu.be/8g18jFHCLXk'),
('The Lion King', 'Un león huye para recuperar su reino.', 118, '1994-06-24', 'https://youtu.be/7TavVZMewpY');


select * from peliculas;

-- Para genero

INSERT INTO Genero (genero) VALUES
('Acción'),
('Aventura'),
('Comedia'),
('Drama'),
('Ciencia Ficción'),
('Terror'),
('Romance'),
('Animación'),
('Fantasia'),
('Thriller'),
('Crimen'),
('Documental'),
('Histórica'),
('Musical'),
('Superhéroes'),
('Suspenso'),
('Deportes'),
('Guerra'),
('Misterio'),
('Western');

select * from genero;

-- Para actores

INSERT INTO Actores (nombre, apellido) VALUES
('Bryan', 'Cranston'),
('Millie', 'Bobby Brown'),
('Henry', 'Cavill'),
('Cillian', 'Murphy'),
('Karl', 'Urban'),
('Emilia', 'Clarke'),
('Tom', 'Hiddleston'),
('Pedro', 'Pascal'),
('Norman', 'Reedus'),
('Aaron', 'Paul'),
('Leonardo', 'DiCaprio'),
('Matthew', 'McConaughey'),
('Christian', 'Bale'),
('Zoe', 'Saldana'),
('Joaquin', 'Phoenix'),
('Keanu', 'Reeves'),
('Robert', 'Downey Jr.'),
('Tom', 'Holland'),
('Margot', 'Robbie'),
('Timothée', 'Chalamet');


select * from actores;

-- Para directores

INSERT INTO Directores (nombre, apellido) VALUES
('Christopher', 'Nolan'),
('Quentin', 'Tarantino'),
('Steven', 'Spielberg'),
('Martin', 'Scorsese'),
('Ridley', 'Scott'),
('James', 'Cameron'),
('Peter', 'Jackson'),
('Denis', 'Villeneuve'),
('Greta', 'Gerwig'),
('Todd', 'Phillips'),
('George', 'Lucas'),
('Francis', 'Coppola'),
('Guy', 'Ritchie'),
('David', 'Fincher'),
('Robert', 'Zemeckis'),
('Zack', 'Snyder'),
('Sam', 'Raimi'),
('Patty', 'Jenkins'),
('Bong', 'Joon-ho'),
('Guillermo', 'del Toro');

select * from directoreS;

-- Para plataformas 

INSERT INTO Plataforma (plataforma) VALUES
('Netflix'),
('Amazon Prime Video'),
('Disney+'),
('HBO Max'),
('Star+'),
('Paramount+'),
('Apple TV+'),
('Crunchyroll'),
('YouTube'),
('Peacock'),
('Hulu'),
('Discovery+'),
('Movistar Play'),
('Flow'),
('Tubi'),
('Pluto TV'),
('Rakuten TV'),
('Mubi'),
('Cine.ar'),
('Netflix Kids');

select * from plataforma;

-- Vamos con las tablas pivot

-- VISUALIZACIONES DE PELIS Y DE SERIES

INSERT INTO Visualizaciones_por_pelicula (id_pelicula, id_usuario, fecha) VALUES
(1, 1, '2024-11-20 20:45:00'),
(2, 1, '2024-12-05 21:30:00'),
(3, 2, '2024-12-10 22:00:00'),
(4, 3, '2024-12-12 19:50:00'),
(5, 4, '2025-01-05 23:15:00'),
(6, 5, '2025-02-10 18:00:00'),
(7, 6, '2025-03-01 22:30:00'),
(8, 7, '2025-03-15 20:40:00'),
(9, 8, '2025-04-02 23:00:00'),
(10, 9, '2025-04-05 21:00:00'),
(11, 10, '2025-04-15 22:20:00'),
(12, 11, '2025-05-01 22:10:00'),
(13, 12, '2025-05-03 20:45:00'),
(14, 13, '2025-06-10 19:30:00'),
(15, 14, '2025-06-25 22:40:00'),
(16, 15, '2025-07-02 20:00:00'),
(17, 16, '2025-07-15 19:45:00'),
(18, 17, '2025-08-05 21:50:00'),
(19, 18, '2025-08-20 22:15:00'),
(20, 19, '2025-09-10 21:30:00');

INSERT INTO Visualizaciones_por_serie (id_serie, id_usuario, fecha) VALUES
(1, 1, '2024-10-15 22:00:00'),
(2, 2, '2024-11-03 20:10:00'),
(3, 3, '2024-11-10 21:00:00'),
(4, 4, '2024-11-20 22:30:00'),
(5, 5, '2024-12-05 19:45:00'),
(6, 6, '2024-12-10 23:10:00'),
(7, 7, '2025-01-02 22:15:00'),
(8, 8, '2025-01-15 21:40:00'),
(9, 9, '2025-02-02 20:00:00'),
(10, 10, '2025-02-15 23:30:00'),
(11, 11, '2025-03-01 22:45:00'),
(12, 12, '2025-03-05 21:10:00'),
(13, 13, '2025-03-20 22:20:00'),
(14, 14, '2025-04-10 20:15:00'),
(15, 15, '2025-04-25 22:50:00'),
(16, 16, '2025-05-01 19:55:00'),
(17, 17, '2025-05-10 21:40:00'),
(18, 18, '2025-06-01 22:00:00'),
(19, 19, '2025-06-10 23:00:00'),
(20, 20, '2025-07-05 20:30:00');

-- VALORACIONES DE PELICULAS Y SERIES

INSERT INTO valoraciones_pelicula (id_pelicula, id_usuario, comentario, valoracion) VALUES
(1, 1, 'Excelente trama y final impactante.', 10),
(2, 1, 'Muy profunda, pero algo lenta en partes.', 9),
(3, 2, 'El mejor Joker de todos.', 10),
(4, 3, 'Visualmente espectacular.', 9),
(5, 4, 'Clásico romántico, aunque algo largo.', 8),
(6, 5, 'Acción e historia impecables.', 9),
(7, 6, 'Una joya del cine moderno.', 10),
(8, 7, 'Una obra maestra de Nolan.', 10),
(9, 8, 'Emotiva y llena de nostalgia.', 9),
(10, 9, 'Obra maestra surcoreana.', 10),
(11, 10, 'Impactante interpretación de Phoenix.', 9),
(12, 11, 'Final épico, aunque algo predecible.', 8),
(13, 12, 'Oscura y realista. Gran Batman.', 9),
(14, 13, 'Guion brillante.', 10),
(15, 14, 'Confusa pero fascinante.', 8),
(16, 15, 'La mejor película de mafias.', 10),
(17, 16, 'Inspiradora y emotiva.', 10),
(18, 17, 'Increíble fotografía y banda sonora.', 9),
(19, 18, 'Excelente adaptación.', 9),
(20, 19, 'Una joya animada atemporal.', 10);

INSERT INTO valoraciones_series (id_serie, id_usuario, comentario, valoracion) VALUES
(1, 1, 'Walter White es un genio.', 10),
(2, 2, 'Gran historia, personajes entrañables.', 9),
(3, 3, 'Visualmente hermosa, pero algo confusa.', 8),
(4, 4, 'Excelente ambientación y actuaciones.', 9),
(5, 5, 'Una serie distinta y adictiva.', 10),
(6, 6, 'Final decepcionante, pero gran serie.', 8),
(7, 7, 'Gran concepto y humor.', 9),
(8, 8, 'Historia fascinante basada en hechos reales.', 9),
(9, 9, 'Intrigante y oscura. Muy bien lograda.', 10),
(10, 10, 'Grogu es lo mejor.', 9),
(11, 11, 'Muy buena precuela de GoT.', 8),
(12, 12, 'Comedia clásica. Rewatch eterno.', 9),
(13, 13, 'Inolvidable, pura nostalgia.', 10),
(14, 14, 'Excelente adaptación del videojuego.', 10),
(15, 15, 'Épica y sangrienta, gran historia.', 9),
(16, 16, 'Cada capítulo te deja pensando.', 9),
(17, 17, 'Zombis y emociones a full.', 8),
(18, 18, 'Precuela digna, casi al nivel de BB.', 9),
(19, 19, 'Brillante y perturbadora.', 10),
(20, 20, 'Live action muy fiel al original.', 9);

-- CRUCES ENTRE ACTORES Y PELICULAS

INSERT INTO Actor_por_pelicula (id_actor, id_pelicula) VALUES
(1, 1),  -- Bryan Cranston no, pero a modo de ejemplo
(2, 9),  -- Millie en Spider-Man No Way Home
(3, 3),
(4, 8),
(5, 10),
(6, 5),
(7, 7),
(8, 18),
(9, 17),
(10, 1),
(11, 5),
(12, 2),
(13, 3),
(14, 4),
(15, 11),
(16, 7),
(17, 12),
(18, 9),
(19, 19),
(20, 18);


-- CRUCES ENTRE ACTORES Y SERIES


INSERT INTO Actor_por_serie (id_actor, id_serie) VALUES
(1, 1),  -- Breaking Bad
(2, 2),  -- Stranger Things
(3, 3),  -- The Witcher
(4, 4),  -- Peaky Blinders
(5, 5),  -- The Boys
(6, 6),  -- Game of Thrones
(7, 7),  -- Loki
(8, 14), -- The Last of Us
(9, 17), -- The Walking Dead
(10, 18), -- Better Call Saul
(11, 15), -- Vikings
(12, 9),  -- Dark
(13, 11), -- House of the Dragon
(14, 19), -- Chernobyl
(15, 8),  -- Narcos
(16, 10), -- The Mandalorian
(17, 13), -- Friends
(18, 12), -- The Office
(19, 16), -- Black Mirror
(20, 20); -- One Piece

-- CRUCES ENTRE DIRECTORES Y PELICULAS

INSERT INTO Director_por_pelicula (id_director, id_pelicula) VALUES
(1, 1),
(1, 2),
(1, 3),
(6, 4),
(6, 5),
(5, 6),
(1, 8),
(2, 14),
(4, 16),
(14, 15),
(15, 18),
(19, 10),
(8, 19),
(10, 11),
(16, 12),
(13, 13),
(3, 20),
(11, 7),
(12, 17),
(7, 9);

-- CRUCES ENTRE DIRECTORES Y SERIES

INSERT INTO Director_por_serie (id_director, id_serie) VALUES
(19, 9),
(4, 4),
(8, 3),
(14, 16),
(10, 18),
(3, 6),
(7, 15),
(1, 1),
(2, 5),
(13, 7),
(12, 11),
(17, 10),
(9, 14),
(6, 20),
(15, 19),
(18, 2),
(5, 17),
(16, 8),
(20, 13),
(11, 12);

-- GENEROS POR PELICULAS

INSERT INTO genero_pelicula (id_genero, id_pelicula) VALUES
(10, 1),
(5, 2),
(10, 3),
(9, 4),
(7, 5),
(1, 6),
(5, 7),
(13, 8),
(15, 9),
(4, 10),
(4, 11),
(15, 12),
(10, 13),
(10, 14),
(10, 15),
(11, 16),
(4, 17),
(5, 18),
(9, 19),
(8, 20);

-- GENEROS POR SERIES

INSERT INTO genero_serie (id_genero, id_serie) VALUES
(11, 1),
(9, 2),
(9, 3),
(11, 4),
(15, 5),
(9, 6),
(9, 7),
(13, 8),
(16, 9),
(1, 10),
(9, 11),
(3, 12),
(3, 13),
(4, 14),
(9, 15),
(16, 16),
(6, 17),
(11, 18),
(13, 19),
(9, 20);

-- PLATAFORMAS POR PELICULAS

INSERT INTO Plataforma_por_pelicula (id_plataforma, id_pelicula) VALUES
(1, 1),
(1, 2),
(4, 3),
(3, 4),
(3, 5),
(5, 6),
(1, 7),
(4, 8),
(3, 9),
(1, 10),
(4, 11),
(4, 12),
(3, 13),
(5, 14),
(4, 15),
(4, 16),
(1, 17),
(8, 18),
(3, 19),
(3, 20);

-- PLATAFORMAS POR SERIES

INSERT INTO Plataforma_por_serie (id_plataforma, id_serie) VALUES
(1, 1),
(1, 2),
(3, 3),
(5, 4),
(4, 5),
(4, 6),
(3, 7),
(4, 8),
(1, 9),
(3, 10),
(4, 11),
(1, 12),
(1, 13),
(4, 14),
(5, 15),
(1, 16),
(5, 17),
(4, 18),
(4, 19),
(3, 20);

-- USUARIOS BANEADOS

INSERT INTO Usuarios_Baneados (Id_usuario, Fecha_Baneo) VALUES
(20, '2025-09-30 14:15:00'),
(7, '2025-10-05 18:40:00'),
(14, '2025-10-12 20:10:00');

