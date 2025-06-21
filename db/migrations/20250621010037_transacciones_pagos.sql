-- migrate:up

CREATE TABLE transacciones_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  monto FLOAT NOT NULL,
  fecha DATE NOT NULL,
  id_tarjeta_corredor INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor(id)
);

--migrate:down

DROP TABLE transacciones_pagos;
