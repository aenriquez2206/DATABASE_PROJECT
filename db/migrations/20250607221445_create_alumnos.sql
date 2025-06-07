-- migrate:up

CREATE TABLE alumnos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  código INTEGER NOT NULL
);

--migrate:down

DROP TABLE alumnos;
