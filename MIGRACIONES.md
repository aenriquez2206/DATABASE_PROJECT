# Plantilla Svelte - Flask

1. Descargar y descomprimir
2. Abrir el CMD en la carpeta raiz.
3. Instalar las dependencias de Svelte:
    > npm install

Crear migración:

  > npm run dbmate:new <nombre-migración>

Ejecutar

  > npm run dbmate:up

Deshacer

  > npm run dbmate:rollback
  
4. instalar dependencias de python

  >pip install pandas numpy


Ejemplos de código en Sqlite3

```sql
-- Crear una entidad fuerte
CREATE TABLE paises (
  id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  nombre VARCHAR(40) NOT NULL,
  bandera_url VARCHAR(100) NOT NULL,
  gentilicio VARCHAR(30) NOT NULL
);
-- Crear una entidad debil
CREATE TABLE recurso_coleccion (
  id	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  coleccion_id INTEGER NOT NULL,
  recurso_id INTEGER NOT NULL,
  FOREIGN KEY (coleccion_id) REFERENCES coleccion (id),
  FOREIGN KEY (recurso_id) REFERENCES recurso (id)
);
```