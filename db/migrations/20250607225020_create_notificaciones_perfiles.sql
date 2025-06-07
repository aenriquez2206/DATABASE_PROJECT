-- migrate:up

CREATE TABLE notificaciones_perfiles (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_notificacion INTEGER NOT NULL,
  id_perfil INTEGER NOT NULL,
  FOREIGN KEY (id_notificacion) REFERENCES notifaciones (id),
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id)
);

--migrate:down

DROP TABLE notificaciones_perfiles;