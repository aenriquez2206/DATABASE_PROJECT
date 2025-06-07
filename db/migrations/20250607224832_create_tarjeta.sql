-- migrate:up

CREATE TABLE tarjetas (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  numero_tarjeta INTEGER NOT NULL,
  fecha_caducidad DATE NOT NULL,
  cvv INTEGER NOT NULL,
  nombre_titular VARCHAR(50) NOT NULL,
  id_metodo_pago INTEGER NOT NULL,
  id_red_pago INTEGER NOT NULL,
  FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos (id),
  FOREIGN KEY (id_red_pago) REFERENCES red_pagos (id)
);

--migrate:down

DROP TABLE tarjetas;