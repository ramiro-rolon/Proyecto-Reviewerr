CREATE DATABASE TP_FINAL;

USE TP_FINAL;

/* 

Usuarios: ID, nombre, apellido, mail, password, dni, fecha_registro, estado, rol
Peliculas: ID, Nombre, Duracion, ruta_imagen
Series: ID, Nombre, Director, Temporadas, Capitulos, ruta_imagen
Genero: id_gen, genero
Actores: id_actor, nombre, apellido
Director: id_director, nombre, apellido
Plataforma: id_plataforma, plataforma

PIVOT:
Valoraciones_Series: id_valoracion, id_usuario, id_serie, valoracion, comentarios DEFAULT ""
Valoraciones_peliculas: id_valoracion, id_usuario, id_serie, valoracion, comentarios DEFAULT ""
Genero_por_serie: id_gxs, id_serie, id_genero
Genero_por_pelicula: id_gxp, id_pelicula, id_genero
Visualizaciones_Series: id_vxs, id_peli, id_user
Visualizaciones_Peliculas: id_vxp, id_serie, id_user
Pelicula_por_actor: id_pxa, id_peli, id_actor
serie_por_actor: id_sxa, id_serie, id_actor
Pelicula_por_director: id_pxd, id_peli, id_director
serie_por_director: id_sxd, id_serie, id_director
plataforma_por_serie: id_pxs, id_serie, id_plataforma
plataforma_por_pelicula: id_pxp, id_pelicula, id_plataforma

*/

CREATE TABLE Usuarios(
	Id_Usuario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Apellido VARCHAR(100) NOT NULL,
    Email VARCHAR(150) UNIQUE NOT NULL,
    Pass VARCHAR(255) NOT NULL,
    FechaRegistro DATETIME NOT NULL DEFAULT NOW(),
    Rol BOOL NOT NULL DEFAULT false,
    CodigoExpira DATETIME NULL,
    CodigoRecuperacion VARCHAR(10) NULL,
    Imagen mediumblob
);

CREATE TABLE Series(
	Id_Serie INT auto_increment PRimary key not null,
    Titulo varchar(100) unique not null,
    sinopsis varchar (500) unique not null,
    temporadas int not null,
    capitulos int not null,
    imagen mediumblob, -- not null?
    Anio_estreno int not null,
    url_trailer varchar(300)
);

CREATE TABLE Peliculas(
	Id_Pelicula INT auto_increment PRimary key not null,
    Titulo varchar(100) UNIQUE not null,
    sinopsis varchar (500) not null,
    duracion int not null,
    FechaEstreno datetime not null,
    imagen mediumblob,-- not null?
    url_trailer varchar(300)
);

create table Genero(
	id_gen int primary key not null auto_increment,
    genero varchar(20) not null
);

CREATE TABLE Actores(
	id_actor INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL
);

CREATE TABLE Directores(
	id_director INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL
);

CREATE TABLE Plataforma(
	id_plataforma INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    plataforma VARCHAR(20) NOT NULL,
    logo MEDIUMBLOB
);

create table valoraciones_series(
	id_vxs int primary key auto_increment not null,
    id_serie int not null,
    id_usuario int not null,
    comentario varchar(400) default null,
    valoracion int not null,
    constraint Fk_Serie_vs foreign key (id_serie) REFERENCES Series(id_serie) ON DELETE CASCADE,
    constraint Fk_Usuario_vs foreign key (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

create table valoraciones_pelicula(
	id_vxp int primary key auto_increment not null,
    id_pelicula int not null,
    id_usuario int not null,
    comentario varchar(400) default null,
    valoracion int not null,
    constraint Fk_Pelicula_vp foreign key (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE,
    constraint Fk_Usuario_vp foreign key (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

create table genero_pelicula(
	id_gxp int primary key not null auto_increment,
    id_genero int not null,
    id_pelicula int not null,
    constraint FK_Genero_gp foreign key (id_genero) references Genero(id_gen) ON DELETE CASCADE,
    constraint Fk_Pelicula_gp foreign key (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE
);

create table genero_serie(
	id_gxs int primary key not null auto_increment,
    id_genero int not null,
    id_serie int not null,
    constraint FK_Genero_gs foreign key (id_genero) references Genero(id_gen) ON DELETE CASCADE,
    constraint Fk_Serie_gs foreign key (id_serie) REFERENCES Series(id_serie) ON DELETE CASCADE
);

CREATE TABLE Visualizaciones_por_serie(
	id_vxs INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_serie INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL,
    CONSTRAINT FK_Serie_vis_s FOREIGN KEY (id_serie) REFERENCES Series(id_serie) ON DELETE CASCADE,
    CONSTRAINT FK_Usuario_vis_s FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE Visualizaciones_por_pelicula(
	id_vxp INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_pelicula INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha DATETIME NOT NULL,
    CONSTRAINT FK_Pelicula_vis_p FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE,
    CONSTRAINT FK_Usuario_vis_p FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

CREATE TABLE Director_por_pelicula(
	id_dxp INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_director INT NOT NULL,
    id_pelicula INT NOT NULL,
    CONSTRAINT FK_Pelicula_dp FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE,
    CONSTRAINT FK_Director_dp FOREIGN KEY (id_director) REFERENCES Directores(id_director) ON DELETE CASCADE
);

CREATE TABLE Director_por_serie(
	id_dxs INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_director INT NOT NULL,
    id_serie INT NOT NULL,
    CONSTRAINT FK_Serie_ds FOREIGN KEY (id_serie) REFERENCES Series(id_serie) ON DELETE CASCADE,
    CONSTRAINT FK_Director_ds FOREIGN KEY (id_director) REFERENCES Directores(id_director) ON DELETE CASCADE
);

CREATE TABLE Actor_por_pelicula(
	id_axp INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_actor INT NOT NULL,
    id_pelicula INT NOT NULL,
    CONSTRAINT FK_Pelicula_ap FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE,
    CONSTRAINT FK_Actor_ap FOREIGN KEY (id_actor) REFERENCES Actores(id_actor) ON DELETE CASCADE
);

CREATE TABLE Actor_por_serie(
	id_axs INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_actor INT NOT NULL,
    id_serie INT NOT NULL,
    CONSTRAINT FK_Serie_as FOREIGN KEY (id_serie) REFERENCES Series(id_serie) ON DELETE CASCADE,
    CONSTRAINT FK_Actor_as FOREIGN KEY (id_actor) REFERENCES Actores(id_actor) ON DELETE CASCADE
);

CREATE TABLE Plataforma_por_serie(
	id_pxs INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_plataforma INT NOT NULL,
    id_serie INT NOT NULL,
    CONSTRAINT FK_Serie_ps FOREIGN KEY (id_serie) REFERENCES Series(id_serie) ON DELETE CASCADE,
    CONSTRAINT FK_Plataforma_ps FOREIGN KEY (id_plataforma) REFERENCES Plataforma(id_plataforma) ON DELETE CASCADE
);

CREATE TABLE Plataforma_por_pelicula(
	id_pxp INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_plataforma INT NOT NULL,
    id_pelicula INT NOT NULL,
    CONSTRAINT FK_Pelicula_pp FOREIGN KEY (id_pelicula) REFERENCES Peliculas(id_pelicula) ON DELETE CASCADE,
    CONSTRAINT FK_Plataforma_pp FOREIGN KEY (id_plataforma) REFERENCES Plataforma(id_plataforma) ON DELETE CASCADE
);

CREATE TABLE Usuarios_Baneados(
	Id_Baneo INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    Id_usuario INT NOT NULL,
    Fecha_Baneo DATETIME NOT NULL DEFAULT NOW(),
    CONSTRAINT FK_Usuario_ban FOREIGN KEY (Id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);
