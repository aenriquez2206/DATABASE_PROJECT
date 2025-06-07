-- migrate:up

CREATE TABLE tarjetas_universitario (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_tarjeta_corredor INTEGER NOT NULL,
  id_alumno INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor (id),
  FOREIGN KEY (id_alumno) REFERENCES alumnos (id)
);

--migrate:down

DROP TABLE tarjetas_universitario;

