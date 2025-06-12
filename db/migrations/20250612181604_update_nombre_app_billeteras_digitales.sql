-- migrate:up

CREATE TABLE nombre_app_billeteras_digitales (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(40) NOT NULL
);

--migrate:down

DROP TABLE nombre_app_billeteras_digitales;
