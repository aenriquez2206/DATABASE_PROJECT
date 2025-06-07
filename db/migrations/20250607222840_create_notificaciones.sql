-- migrate:up

CREATE TABLE notificaciones (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  estado BOOLEAN NOT NULL,
  nombre VARCHAR(30) NOT NULL 					
);

--migrate:down

DROP TABLE notificaciones;

