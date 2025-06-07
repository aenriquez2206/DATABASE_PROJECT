-- migrate:up

CREATE TABLE app_billeteras_digitales (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(15) NOT NULL,
  id_metodo_pago INTEGER NOT NULL,
  FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos (id)
);

--migrate:down

DROP TABLE app_billeteras_digitales;