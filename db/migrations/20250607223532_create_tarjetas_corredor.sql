-- migrate:up

CREATE TABLE tarjetas_corredor (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_tarjeta_fisica INTEGER NOT NULL,
  id_perfil FLOAT NOT NULL,
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id)
);

--migrate:down

DROP TABLE tarjetas_corredor;

