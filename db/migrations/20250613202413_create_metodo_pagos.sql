-- migrate:up

CREATE TABLE metodo_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_banco INTEGER NOT NULL,
  id_perfil INTEGER NOT NULL,
  FOREIGN KEY (id_banco) REFERENCES bancos (id),
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id)
);

--migrate:down

DROP TABLE metodo_pagos;