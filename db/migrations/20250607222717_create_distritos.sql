-- migrate:up

CREATE TABLE distritos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL
);

--migrate:down

DROP TABLE distritos;
