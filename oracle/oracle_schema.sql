-- 1 nombre app billeteras digitales
CREATE TABLE app_billeteras_digitales(
	id NUMBER(7) PRIMARY KEY,
	nombre VARCHAR2(30)
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
-- 2 alumnos

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
-- 3 distritos

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
-- 4 notificaciones

CREATE TABLE notificaciones(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(30)
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
-- 5 red pago
CREATE TABLE red_pagos(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(30)
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
-- 6 bancos
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
-- 7 perfiles
CREATE TABLE perfiles(
	id NUMBER(7) PRIMARY KEY,
  user_id NUMBER(10),
  celular NUMBER(9),
  DNI NUMBER(8),
	nombre VARCHAR2(30),
  apellidos VARCHAR(30),
  fecha_naciemnto VARCHAR(10)
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
-- 8 estaciones

-- 9 tarjetas corredor
-- 10 metodos de pago
-- 11 tarjetas univesitaio
-- 12 tarjetas general
-- 13 transacciones pagos
-- 14 transacciones ingresos
-- 15 app billeteras digitales
-- 16 tarjeta
-- 17 viajes
-- 18 notificaciones perfiles

