--migrate:up 

INSERT INTO notificaciones (id, estado, nombre) VALUES (1, False, 'Alias sint rerum suscipit');
INSERT INTO notificaciones (id, estado, nombre) VALUES (2, True, 'Provident quas tenetur animi');
INSERT INTO notificaciones (id, estado, nombre) VALUES (3, False, 'Dignissimos quos dolore');
INSERT INTO notificaciones (id, estado, nombre) VALUES (4, False, 'Ad labore omnis');
INSERT INTO notificaciones (id, estado, nombre) VALUES (5, False, 'Velit maiores harum aperiam incidunt');

--migrate:down 

DELETE FROM notificaciones;