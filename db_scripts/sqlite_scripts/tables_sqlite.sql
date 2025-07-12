-- 1 nombre app billeteras digitales(si)
CREATE TABLE nombre_app_billeteras_digitales (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(40) NOT NULL
);


-- 2 alumnos(si)
CREATE TABLE alumnos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  código INTEGER NOT NULL
);

-- 3 distritos(si)
CREATE TABLE distritos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL
);

-- 4 notificaciones(si)
CREATE TABLE notificaciones (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL 					
);

-- 5 red pago(si)
CREATE TABLE red_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(20) NOT NULL
);

-- 6 bancos(si)
CREATE TABLE bancos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(30) NOT NULL
);

-- 7 perfiles(si)
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

-- 8 estaciones(si)
CREATE TABLE estaciones (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(40) NOT NULL,
  id_distrito INTEGER NOT NULL,
  FOREIGN KEY (id_distrito) REFERENCES distritos (id)
);



-- 9 tarjetas corredor(si)
CREATE TABLE tarjetas_corredor (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_tarjeta_fisica INTEGER NOT NULL,
  saldo FLOAT NOT NULL,
  id_perfil INTEGER NOT NULL,
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id)
);

-- 10 metodos de pago(si)
CREATE TABLE metodo_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_banco INTEGER NOT NULL,
  id_perfil INTEGER NOT NULL,
  FOREIGN KEY (id_banco) REFERENCES bancos (id),
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id)
);


-- 11 tarjetas univesitaio(si)

CREATE TABLE tarjetas_universitario (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_tarjeta_corredor INTEGER NOT NULL,
  id_alumno INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor (id),
  FOREIGN KEY (id_alumno) REFERENCES alumnos (id)
);

-- 12 tarjetas general(si)

CREATE TABLE tarjetas_general (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_tarjeta_corredor INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor (id)
);

-- 13 transacciones pagos(si)
CREATE TABLE transacciones_pagos (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  monto FLOAT NOT NULL,
  fecha DATE NOT NULL,
  id_tarjeta_corredor INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor(id)
);


-- 14 transacciones ingresos(si)
CREATE TABLE transacciones_ingreso (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  monto FLOAT NOT NULL,
  fecha DATE NOT NULL,
  id_tarjeta_corredor INTEGER NOT NULL,
  id_metodo_pago INTEGER NOT NULL,
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor(id),
  FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos(id)
);

-- 15 app billeteras digitales(si)
CREATE TABLE app_billeteras_digitales (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_metodo_pago INTEGER NOT NULL,
  id_nombre_app_billetera_digital INTEGER NOT NULL,
  FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos (id)
  FOREIGN KEY (id_nombre_app_billetera_digital) REFERENCES nombre_app_billeteras_digitales (id)
);


-- 16 tarjeta(si)
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
-- 17 viajes
CREATE TABLE viajes (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  fecha DATE NOT NULL,
  final_estacion_id INTEGER NOT NULL,
  inicial_estacion_id INTEGER NOT NULL,
  perfil_id INTEGER NOT NULL,
  FOREIGN KEY (final_estacion_id) REFERENCES estaciones (id),
  FOREIGN KEY (inicial_estacion_id) REFERENCES estaciones (id),
  FOREIGN KEY (perfil_id) REFERENCES perfiles (id)
);
-- 18 notificaciones perfiles
CREATE TABLE notificaciones_perfiles (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  id_notificacion INTEGER NOT NULL,
  id_perfil INTEGER NOT NULL,
  FOREIGN KEY (id_notificacion) REFERENCES notificaciones (id),
  FOREIGN KEY (id_perfil) REFERENCES perfiles (id)
);

--TRIGGERS
--triggers para resta de transacciones pagos

CREATE TRIGGER actualizar_saldo_pago
AFTER INSERT ON transacciones_pagos
FOR EACH ROW
BEGIN
UPDATE tarjetas_corredor
SET saldo = saldo - NEW.monto
WHERE id = NEW.id_tarjeta_corredor;
END;

--triggers para suma de transacciones ingresos


CREATE TRIGGER actualizar_saldo_ingreso
AFTER INSERT ON transacciones_ingreso
FOR EACH ROW
BEGIN
  UPDATE tarjetas_corredor
  SET saldo = saldo + NEW.monto
  WHERE id = NEW.id_tarjeta_corredor;
END;

