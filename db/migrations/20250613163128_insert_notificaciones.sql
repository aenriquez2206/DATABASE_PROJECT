--migrate:up 

INSERT INTO notificaciones (id,  nombre) VALUES (1,  'Alias sint rerum suscipit');
INSERT INTO notificaciones (id,  nombre) VALUES (2,  'Provident quas tenetur animi');
INSERT INTO notificaciones (id,  nombre) VALUES (3,  'Dignissimos quos dolore');
INSERT INTO notificaciones (id,  nombre) VALUES (4,  'Ad labore omnis');
INSERT INTO notificaciones (id,  nombre) VALUES (5,  'Velit maiores harum aperiam incidunt');

--migrate:down 

DELETE FROM notificaciones;
