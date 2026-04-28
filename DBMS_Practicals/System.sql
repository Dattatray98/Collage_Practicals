-- Switch to the pluggable database
ALTER SESSION SET CONTAINER = XEPDB1;

-- Now create your user
CREATE USER Assignment_01 IDENTIFIED BY Dattu98;
GRANT CONNECT, RESOURCE, DBA TO Assignment_01;




