--migrate:up 

INSERT INTO nombre_metodo_pagos (id, nombre) VALUES (1, 'app_billetera_digital');
INSERT INTO nombre_metodo_pagos (id, nombre) VALUES (2, 'tarjeta');

--migrate:down 

DELETE FROM nombre_metodo_pagos;