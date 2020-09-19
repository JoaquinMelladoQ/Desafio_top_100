CREATE DATABASE peliculas;

CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR(70),
    año_estreno INT,
    director VARCHAR(30),
    PRIMARY KEY(id)
);

CREATE TABLE reparto(
    id INT,
    actor VARCHAR(50),
    FOREIGN KEY(id) REFERENCES peliculas(id)
);

