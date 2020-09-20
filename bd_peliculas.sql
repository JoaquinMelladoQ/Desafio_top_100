CREATE DATABASE peliculas;

CREATE TABLE peliculas(
    id INT,
    pelicula VARCHAR(200),
    año_estreno INT,
    director VARCHAR(200),
    PRIMARY KEY (id)
);

CREATE TABLE reparto(
    id INT,
    actor VARCHAR(200),
    FOREIGN KEY (id) REFERENCES peliculas (id)
);

\COPY peliculas FROM '/Users/mac/Desktop/desafio_top_100/peliculas.csv' csv header
\COPY reparto FROM '/Users/mac/Desktop/desafio_top_100/reparto.csv' csv

-- Checking data from each table
-- SELECT * FROM peliculas;
-- SELECT * FROM reparto;

SELECT pelicula,
año_estreno,
director,
actor FROM peliculas AS peli
INNER JOIN reparto AS rep ON 
peli.id=rep.id WHERE peli.pelicula='Titanic';

SELECT pelicula 
FROM peliculas AS pelis
INNER JOIN reparto AS repa
ON pelis.id=repa.id
WHERE repa.actor='Harrison Ford';

SELECT COUNT(
pelicula) AS n_peli,
director FROM peliculas
GROUP BY director
ORDER BY n_peli
DESC LIMIT 10;

SELECT COUNT(
actor) FROM reparto;

SELECT pelicula FROM peliculas
WHERE año_estreno >=1990 AND
año_estreno <=1999
ORDER BY pelicula ASC;

SELECT actor FROM
reparto AS repa
INNER JOIN peliculas
AS peli
ON repa.id=peli.id
WHERE año_estreno='2001';