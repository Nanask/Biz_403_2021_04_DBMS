CREATE TABLESPACE Score;

CREATE DATABASE score;

CREATE USER scUser@localhost;

USE score; 
SHOW TABLES;
DESC USER;

GRANT 
all privileges on *.* TO
scUser@localhost;

SHOW GRANTS FOR 
scUser@localhost;

CREATE USER 'scUser@localhost' IDENTIFIED BY '1234';
