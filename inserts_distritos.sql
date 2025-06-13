--migrate:up 

INSERT INTO distritos (id, nombre) VALUES (1, 'Ancón');
INSERT INTO distritos (id, nombre) VALUES (2, 'Ate');
INSERT INTO distritos (id, nombre) VALUES (3, 'Barranco');
INSERT INTO distritos (id, nombre) VALUES (4, 'Breña');
INSERT INTO distritos (id, nombre) VALUES (5, 'Carabayllo');
INSERT INTO distritos (id, nombre) VALUES (6, 'Chaclacayo');
INSERT INTO distritos (id, nombre) VALUES (7, 'Chorrillos');
INSERT INTO distritos (id, nombre) VALUES (8, 'Cieneguilla');
INSERT INTO distritos (id, nombre) VALUES (9, 'Comas');
INSERT INTO distritos (id, nombre) VALUES (10, 'El Agustino');
INSERT INTO distritos (id, nombre) VALUES (11, 'Independencia');
INSERT INTO distritos (id, nombre) VALUES (12, 'Jesús María');
INSERT INTO distritos (id, nombre) VALUES (13, 'La Molina');
INSERT INTO distritos (id, nombre) VALUES (14, 'La Victoria');
INSERT INTO distritos (id, nombre) VALUES (15, 'Lince');
INSERT INTO distritos (id, nombre) VALUES (16, 'Los Olivos');
INSERT INTO distritos (id, nombre) VALUES (17, 'Lurigancho');
INSERT INTO distritos (id, nombre) VALUES (18, 'Lurín');
INSERT INTO distritos (id, nombre) VALUES (19, 'Magdalena del Mar');
INSERT INTO distritos (id, nombre) VALUES (20, 'Miraflores');
INSERT INTO distritos (id, nombre) VALUES (21, 'Pachacámac');
INSERT INTO distritos (id, nombre) VALUES (22, 'Pucusana');
INSERT INTO distritos (id, nombre) VALUES (23, 'Pueblo Libre');
INSERT INTO distritos (id, nombre) VALUES (24, 'Puente Piedra');
INSERT INTO distritos (id, nombre) VALUES (25, 'Punta Hermosa');
INSERT INTO distritos (id, nombre) VALUES (26, 'Punta Negra');
INSERT INTO distritos (id, nombre) VALUES (27, 'Rímac');
INSERT INTO distritos (id, nombre) VALUES (28, 'San Bartolo');
INSERT INTO distritos (id, nombre) VALUES (29, 'San Borja');
INSERT INTO distritos (id, nombre) VALUES (30, 'San Isidro');
INSERT INTO distritos (id, nombre) VALUES (31, 'San Juan de Lurigancho');
INSERT INTO distritos (id, nombre) VALUES (32, 'San Juan de Miraflores');
INSERT INTO distritos (id, nombre) VALUES (33, 'San Luis');
INSERT INTO distritos (id, nombre) VALUES (34, 'San Martín de Porres');
INSERT INTO distritos (id, nombre) VALUES (35, 'San Miguel');
INSERT INTO distritos (id, nombre) VALUES (36, 'Santa Anita');
INSERT INTO distritos (id, nombre) VALUES (37, 'Santa María del Mar');
INSERT INTO distritos (id, nombre) VALUES (38, 'Santa Rosa');
INSERT INTO distritos (id, nombre) VALUES (39, 'Santiago de Surco');
INSERT INTO distritos (id, nombre) VALUES (40, 'Surquillo');
INSERT INTO distritos (id, nombre) VALUES (41, 'Villa El Salvador');
INSERT INTO distritos (id, nombre) VALUES (42, 'Villa María del Triunfo');

--migrate:down 

DELETE FROM distritos;