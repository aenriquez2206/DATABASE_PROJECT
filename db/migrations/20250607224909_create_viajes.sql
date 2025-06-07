-- migrate:up

CREATE TABLE viajes (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  fecha DATE NOT NULL,
  final_estacion_id INTEGER NOT NULL,
  inicial_estacion_id INTEGER NOT NULL,
  FOREIGN KEY (final_estacion_id) REFERENCES estaciones (id),
  FOREIGN KEY (inicial_estacion_id) REFERENCES estaciones (id)
);

--migrate:down

DROP TABLE viajes;