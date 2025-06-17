--migrate:up 

INSERT INTO red_pagos (id, nombre) VALUES (1, 'Visa');
INSERT INTO red_pagos (id, nombre) VALUES (2, 'Mastercard');
INSERT INTO red_pagos (id, nombre) VALUES (3, 'American Express');
INSERT INTO red_pagos (id, nombre) VALUES (4, 'Discover');

--migrate:down 

DELETE FROM red_pagos;