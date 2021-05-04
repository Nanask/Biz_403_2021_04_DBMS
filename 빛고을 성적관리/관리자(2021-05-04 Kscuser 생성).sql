-- 관리자로 접속

CREATE TABLESPACE KschoolDB
DataFile 'C:/oraclexe/data/kschool.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER kscuser IDENTIFIED BY kscuser
DEFAULT TABLESPACE KschoolDB;

GRANT DBA TO kscuser;

