-- migrate:up

CREATE TABLE bancos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL
);

--migrate:down

DROP TABLE bancos;