-- migrate:up

CREATE TABLE tarjetas_general (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_tarjeta_corredor INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor (id)
);

--migrate:down

DROP TABLE tarjetas_general;