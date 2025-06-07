-- migrate:up

CREATE TABLE red_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(20) NOT NULL
);

--migrate:down

DROP TABLE red_pagos;