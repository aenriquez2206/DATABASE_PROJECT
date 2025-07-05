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