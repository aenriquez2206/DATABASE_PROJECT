-- migrate:up

CREATE TABLE perfiles (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  celular INTEGER NOT NULL,
  DNI INTEGER NOT NULL,
  nombre VARCHAR(40) NOT NULL,
  apellidos VARCHAR(40) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  correo VARCHAR(50) NOT NULL,
  contraseña VARCHAR(20) NOT NULL
);

--migrate:down

DROP TABLE perfiles;