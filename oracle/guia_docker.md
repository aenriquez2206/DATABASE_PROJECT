docker ps
docker exec -it <id_container> bash

sqlplus

Este comando hará solicitar un usuario y contraseña para poder continuar. El
usuario es system y la contraseña es oracle. Una vez dentro, procederemos a crear
un usuario, se llamará USERDB y su contraseña será PASSWORD. Estos datos se
pueden apreciar en la última línea de las mostradas a continuación:

CREATE TABLESPACE TSD_USERDB LOGGING DATAFILE 'TSD_USERDB.DBF' SIZE
200M AUTOEXTEND ON NEXT 200M MAXSIZE 400M;
CREATE TABLESPACE TSI_USERDB LOGGING DATAFILE 'TSI_USERDB.DBF' SIZE 200M
AUTOEXTEND ON NEXT 50M MAXSIZE 400M;
CREATE USER USERDB IDENTIFIED BY PASSWORD DEFAULT TABLESPACE
TSI_USERDB QUOTA UNLIMITED ON TSD_USERDB QUOTA UNLIMITED ON
TSI_USERDB;

Una vez creado el usuario procederemos a asignarle los roles para que pueda hacer
las operaciones antes mencionadas. Usaremos para ello los siguientes comandos:

GRANT CREATE SESSION TO USERDB;
GRANT CREATE PROCEDURE TO USERDB;
GRANT CREATE VIEW TO USERDB;
GRANT CREATE TABLE TO USERDB;
GRANT CREATE SEQUENCE TO USERDB;
GRANT CREATE TRIGGER TO USERDB;

Para verificar que privilegios tiene el usario
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'USERDB';