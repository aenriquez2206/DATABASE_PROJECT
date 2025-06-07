-- migrate:up

CREATE TABLE metodo_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL,
  id_perfil INTEGER NOT NULL,
  id_banco INTEGER NOT NULL,
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id),
  FOREIGN KEY (id_banco) REFERENCES bancos (id)
);

--migrate:down

DROP TABLE metodo_pagos;