-- migrate:up

CREATE TABLE estaciones (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(40) NOT NULL,
  id_distrito INTEGER NOT NULL,
  FOREIGN KEY (id_distrito) REFERENCES distritos (id)
);

--migrate:down

DROP TABLE estaciones;