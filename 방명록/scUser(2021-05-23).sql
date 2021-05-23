create database school;

create user scUser@localhost;

show tables;

SHOW GRANTS FOR scUser@localhost;
drop user scUser;
drop user scUser@'192.168.0.%';
drop user scUser@localhost;

create user scUser@localhost identified by '1234';
grant All privileges on *.* to scUser@localhost;

