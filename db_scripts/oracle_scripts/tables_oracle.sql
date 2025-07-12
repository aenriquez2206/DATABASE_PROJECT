-- 1 nombre app billeteras digitales(si)
CREATE TABLE nombre_app_billeteras(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
);

ALTER TABLE nombre_app_billeteras ADD (
  CONSTRAINT nombre_app_billeteras_pk PRIMARY KEY (ID));

CREATE SEQUENCE nombre_app_billeteras_seq START WITH 1;

CREATE OR REPLACE TRIGGER nombre_app_billeteras_pk 
BEFORE INSERT ON nombre_app_billeteras 
FOR EACH ROW

BEGIN
  SELECT nombre_app_billeteras_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 2 alumnos(si)

CREATE TABLE alumnos(
	id NUMBER(7) PRIMARY KEY,
	codigo NUMBER(10)
);

ALTER TABLE alumnos ADD (
  CONSTRAINT alumnos_pk PRIMARY KEY (ID));

CREATE SEQUENCE alumnos_seq START WITH 1;

CREATE OR REPLACE TRIGGER alumnos_pk 
BEFORE INSERT ON alumnos 
FOR EACH ROW

BEGIN
  SELECT alumnos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 3 distritos(si)

CREATE TABLE distritos(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
);

ALTER TABLE distritos ADD (
  CONSTRAINT distritos_pk PRIMARY KEY (ID));

CREATE SEQUENCE distritos_seq START WITH 1;

CREATE OR REPLACE TRIGGER distritos_pk 
BEFORE INSERT ON distritos 
FOR EACH ROW

BEGIN
  SELECT distritos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 4 notificaciones(si)

CREATE TABLE notificaciones(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
);

ALTER TABLE notificaciones ADD (
  CONSTRAINT notificaciones_pk PRIMARY KEY (ID));

CREATE SEQUENCE notificaciones_seq START WITH 1;

CREATE OR REPLACE TRIGGER notificaciones_pk 
BEFORE INSERT ON notificaciones 
FOR EACH ROW

BEGIN
  SELECT notificaciones_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 5 red pago(si)
CREATE TABLE red_pagos(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
);

ALTER TABLE red_pagos ADD (
  CONSTRAINT red_pagos_pk PRIMARY KEY (ID));

CREATE SEQUENCE red_pagos_seq START WITH 1;

CREATE OR REPLACE TRIGGER red_pagos_pk 
BEFORE INSERT ON red_pagos 
FOR EACH ROW

BEGIN
  SELECT red_pagos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 6 bancos(si)
CREATE TABLE bancos(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
);

ALTER TABLE bancos ADD (
  CONSTRAINT bancos_pk PRIMARY KEY (ID));

CREATE SEQUENCE bancos_seq START WITH 1;

CREATE OR REPLACE TRIGGER bancos_pk 
BEFORE INSERT ON bancos 
FOR EACH ROW

BEGIN
  SELECT bancos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 7 perfiles(si)
CREATE TABLE perfiles(
	id NUMBER(7) PRIMARY KEY,
  user_id NUMBER(10),
  celular NUMBER(9),
  DNI NUMBER(8),
	nombre VARCHAR2(30),
  apellidos VARCHAR2(30),
  fecha_nacimiento DATE,
  correo VARCHAR2(100),
  contraseña VARCHAR2(100)
);

ALTER TABLE perfiles ADD (
  CONSTRAINT perfiles_pk PRIMARY KEY (ID));

CREATE SEQUENCE perfiles_seq START WITH 1;

CREATE OR REPLACE TRIGGER perfiles_pk 
BEFORE INSERT ON perfiles 
FOR EACH ROW

BEGIN
  SELECT perfiles_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 8 estaciones(si)
CREATE TABLE estaciones(
	id NUMBER(7) PRIMARY KEY,
  nombre VARCHAR2(40),
	id_distrito NUMBER(7),
  FOREIGN KEY(id_distrito) REFERENCES distritos
);

ALTER TABLE estaciones ADD (
  CONSTRAINT estaciones_pk PRIMARY KEY (ID));

CREATE SEQUENCE estaciones_seq START WITH 1;

CREATE OR REPLACE TRIGGER estaciones_pk 
BEFORE INSERT ON estaciones 
FOR EACH ROW

BEGIN
  SELECT estaciones_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 9 tarjetas corredor(si)
CREATE TABLE tarjetas_corredor(
	id NUMBER(7) PRIMARY KEY,
  id_tarjeta_fisica NUMBER(10),
  saldo FLOAT(10),
  id_perfil NUMBER(7),
	FOREIGN KEY(id_perfil) REFERENCES perfiles
);

ALTER TABLE tarjetas_corredor ADD (
  CONSTRAINT tarjetas_corredor_pk PRIMARY KEY (ID));

CREATE SEQUENCE tarjetas_corredor_seq START WITH 1;

CREATE OR REPLACE TRIGGER tarjetas_corredor_pk 
BEFORE INSERT ON tarjetas_corredor 
FOR EACH ROW

BEGIN
  SELECT tarjetas_corredor_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 10 metodos de pago(si)
CREATE TABLE metodo_pagos(
	id NUMBER(7) PRIMARY KEY,
	id_banco NUMBER(7),
  id_perfil NUMBER(7),
  FOREIGN KEY(id_perfil) REFERENCES perfiles,
  FOREIGN KEY(id_banco) REFERENCES bancos
);

ALTER TABLE metodo_pagos ADD (
  CONSTRAINT metodo_pagos_pk PRIMARY KEY (ID));

CREATE SEQUENCE metodo_pagos_seq START WITH 1;

CREATE OR REPLACE TRIGGER metodo_pagos_pk 
BEFORE INSERT ON metodo_pagos 
FOR EACH ROW

BEGIN
  SELECT metodo_pagos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 11 tarjetas univesitaio(si)

CREATE TABLE tarjetas_universitarios(
	id NUMBER(7) PRIMARY KEY,
  id_tarjeta_corredor NUMBER(10),
	id_alumno NUMBER(10),
  FOREIGN KEY(id_tarjeta_corredor) REFERENCES tarjetas_corredor,
  FOREIGN KEY(id_alumno) REFERENCES alumnos
);

ALTER TABLE tarjetas_universitarios ADD (
  CONSTRAINT tarjetas_universitarios_pk PRIMARY KEY (ID));

CREATE SEQUENCE tarjetas_universitarios_seq START WITH 1;

CREATE OR REPLACE TRIGGER tarjetas_universitarios_pk 
BEFORE INSERT ON tarjetas_universitarios 
FOR EACH ROW

BEGIN
  SELECT tarjetas_universitarios_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- 12 tarjetas general(si)

CREATE TABLE tarjetas_general(
	id NUMBER(7) PRIMARY KEY,
  id_tarjeta_corredor NUMBER(7),
  FOREIGN KEY(id_tarjeta_corredor) REFERENCES tarjetas_corredor
);

ALTER TABLE tarjetas_general ADD (
  CONSTRAINT tarjetas_general_pk PRIMARY KEY (ID));

CREATE SEQUENCE tarjetas_general_seq START WITH 1;

CREATE OR REPLACE TRIGGER tarjetas_general_pk 
BEFORE INSERT ON tarjetas_general 
FOR EACH ROW

BEGIN
  SELECT tarjetas_general_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 13 transacciones pagos(si)

CREATE TABLE transacciones_pagos(
	id NUMBER(7) PRIMARY KEY,
  monto FLOAT,
  fecha DATE,
  id_tarjeta_corredor NUMBER(7),
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor
);

ALTER TABLE transacciones_pagos ADD (
  CONSTRAINT transacciones_pagos_pk PRIMARY KEY (ID));

CREATE SEQUENCE transacciones_pagos_seq START WITH 1;

CREATE OR REPLACE TRIGGER transacciones_pagos_pk 
BEFORE INSERT ON transacciones_pagos 
FOR EACH ROW

BEGIN
  SELECT transacciones_pagos_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 14 transacciones ingresos(si)

CREATE TABLE transacciones_ingreso(
	id NUMBER(7) PRIMARY KEY,
  monto FLOAT,
  fecha DATE,
  id_tarjeta_corredor NUMBER(7),
  id_metodo_pago NUMBER(7),
  FOREIGN KEY (id_tarjeta_corredor) REFERENCES tarjetas_corredor,
	FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos
);

ALTER TABLE transacciones_ingreso ADD (
  CONSTRAINT transacciones_ingreso_pk PRIMARY KEY (ID));

CREATE SEQUENCE transacciones_ingreso_seq START WITH 1;

CREATE OR REPLACE TRIGGER transacciones_ingreso_pk 
BEFORE INSERT ON transacciones_ingreso 
FOR EACH ROW

BEGIN
  SELECT transacciones_ingreso_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 15 app billeteras digitales(si)

CREATE TABLE app_billeteras_digitales(
	id NUMBER(7) PRIMARY KEY,
	id_metodo_pago NUMBER(7),
  id_nombre_app_billetera NUMBER(7),
	FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos,
  FOREIGN KEY (id_nombre_app_billetera) REFERENCES nombre_app_billeteras
);

ALTER TABLE app_billeteras_digitales ADD (
  CONSTRAINT app_billeteras_digitales_pk PRIMARY KEY (ID));

CREATE SEQUENCE app_billeteras_digitales_seq START WITH 1;

CREATE OR REPLACE TRIGGER app_billeteras_digitales_pk 
BEFORE INSERT ON app_billeteras_digitales 
FOR EACH ROW

BEGIN
  SELECT app_billeteras_digitales_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- 16 tarjeta(si)
CREATE TABLE tarjetas(
	id NUMBER(7) PRIMARY KEY,
  numero_tarjeta NUMBER(20),
  fecha_caducidad DATE,
  cvv NUMBER(7),
  nombre_titular VARCHAR2(100),
  id_metodo_pago NUMBER(7),
  id_red_pago NUMBER(7),
	FOREIGN KEY (id_metodo_pago) REFERENCES metodo_pagos,
  FOREIGN KEY (id_red_pago) REFERENCES red_pagos
);

ALTER TABLE tarjetas ADD (
  CONSTRAINT tarjetas_pk PRIMARY KEY (ID));

CREATE SEQUENCE tarjetas_seq START WITH 1;

CREATE OR REPLACE TRIGGER tarjetas_pk 
BEFORE INSERT ON tarjetas 
FOR EACH ROW

BEGIN
  SELECT tarjetas_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 17 viajes

CREATE TABLE viajes(
	id NUMBER(7) PRIMARY KEY,
	fecha DATE,
  final_estacion_id NUMBER(7),
  inicial_estacion_id NUMBER(7),
  perfil_id NUMBER(7),
  FOREIGN KEY (perfil_id) REFERENCES perfiles,
  FOREIGN KEY (final_estacion_id) REFERENCES estaciones,
  FOREIGN KEY (inicial_estacion_id) REFERENCES estaciones
);

ALTER TABLE viajes ADD (
  CONSTRAINT viajes_pk PRIMARY KEY (ID));

CREATE SEQUENCE viajes_seq START WITH 1;

CREATE OR REPLACE TRIGGER viajes_pk 
BEFORE INSERT ON viajes 
FOR EACH ROW

BEGIN
  SELECT viajes_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/
-- 18 notificaciones perfiles
CREATE TABLE notificaciones_perfiles(
	id NUMBER(7) PRIMARY KEY,
  id_notificacion NUMBER(7),
  id_perfil NUMBER(7),
  FOREIGN KEY (id_perfil) REFERENCES perfiles,
  FOREIGN KEY (id_notificacion) REFERENCES notificaciones
);

ALTER TABLE notificaciones_perfiles ADD (
  CONSTRAINT notificaciones_perfiles_pk PRIMARY KEY (ID));

CREATE SEQUENCE notificaciones_perfiles_seq START WITH 1;

CREATE OR REPLACE TRIGGER notificaciones_perfiles_pk 
BEFORE INSERT ON notificaciones_perfiles 
FOR EACH ROW

BEGIN
  SELECT notificaciones_perfiles_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

--TRIGGERS
--triggers para resta de transacciones pagos

CREATE OR REPLACE TRIGGER actualizar_saldo_pago
AFTER INSERT ON transacciones_pagos
FOR EACH ROW
DECLARE
  v_saldo_actual NUMBER;
BEGIN
  SELECT saldo INTO v_saldo_actual
  FROM tarjetas_corredor
  WHERE id = :NEW.id_tarjeta_corredor;

  IF v_saldo_actual >= :NEW.monto THEN
    UPDATE tarjetas_corredor
    SET saldo = saldo - :NEW.monto
    WHERE id = :NEW.id_tarjeta_corredor;
  ELSE
    RAISE_APPLICATION_ERROR(-20001, 'Saldo insuficiente para realizar el pago.');
  END IF;
END;
/

--triggers para suma de transacciones ingresos
CREATE OR REPLACE TRIGGER actualizar_saldo_ingreso
AFTER INSERT ON transacciones_ingreso
FOR EACH ROW
BEGIN
  UPDATE tarjetas_corredor
  SET saldo = saldo + :NEW.monto
  WHERE id = :NEW.id_tarjeta_corredor;
END;
/