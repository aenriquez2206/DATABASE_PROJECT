--migrate:up 

INSERT INTO nombre_app_billeteras_digitales (id, nombre) VALUES (1, 'Yape');
INSERT INTO nombre_app_billeteras_digitales (id, nombre) VALUES (2, 'Plin');

--migrate:down 

DELETE FROM nombre_app_billeteras_digitales;