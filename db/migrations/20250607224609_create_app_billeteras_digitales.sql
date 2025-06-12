-- migrate:up

CREATE TABLE app_billeteras_digitales (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_metodo_pago INTEGER NOT NULL,
  id_nombre_app_billetera_digital INTEGER NOT NULL,
  FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos (id)
  FOREIGN KEY (id_nombre_app_billetera_digital) REFERENCES nombre_app_billeteras_digitales (id)
);

--migrate:down

DROP TABLE app_billeteras_digitales;