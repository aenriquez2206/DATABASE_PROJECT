--migrate:up 

INSERT INTO bancos (id, nombre) VALUES (1, 'Torralba y Ayala S.L.N.E');
INSERT INTO bancos (id, nombre) VALUES (2, 'Restauración Avanzadas S.L.');
INSERT INTO bancos (id, nombre) VALUES (3, 'Grupo Prada S.L.');
INSERT INTO bancos (id, nombre) VALUES (4, 'Franch y Palomar S.Coop.');
INSERT INTO bancos (id, nombre) VALUES (5, 'Tomé y Sevillano S.L.L.');
INSERT INTO bancos (id, nombre) VALUES (6, 'Mata & Asociados S.A.');
INSERT INTO bancos (id, nombre) VALUES (7, 'Iniesta & Asociados S.C.P');
INSERT INTO bancos (id, nombre) VALUES (8, 'Gálvez y asociados S.L.');
INSERT INTO bancos (id, nombre) VALUES (9, 'Infraestructuras Ibérica S.L.L.');
INSERT INTO bancos (id, nombre) VALUES (10, 'Desarrollo Infante & Asociados S.A.');
INSERT INTO bancos (id, nombre) VALUES (11, 'Alimentación PNX S.Coop.');
INSERT INTO bancos (id, nombre) VALUES (12, 'Hnos Bejarano S.C.P');
INSERT INTO bancos (id, nombre) VALUES (13, 'Construcción ONP S.Com.');
INSERT INTO bancos (id, nombre) VALUES (14, 'Samuel Amaya Olivares S.A.');
INSERT INTO bancos (id, nombre) VALUES (15, 'Banco LCL S.L.L.');

--migrate:down 

DELETE FROM bancos;