-- migrate:up

CREATE TABLE transacciones_ingreso (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  monto FLOAT NOT NULL,
  fecha DATE NOT NULL,
  id_tarjeta_corredor INTEGER NOT NULL,
  id_metodo_pago INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor(id),
  FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos(id)
);

--migrate:down

DROP TABLE transacciones_ingreso;