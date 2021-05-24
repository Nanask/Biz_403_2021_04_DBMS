CREATE DATABASE TodoList;
CREATE USER tdUser;
DROP USER tdUser;


CREATE USER tdUser@localhost;

CREATE USER tdUser@localhost IDENTIFIED BY '1234';
GRANT all privileges on *.* TO
tdUser@localhost;
SHOW GRANTS FOR gbUser@localhost;
show GRANTS for tdUser@localhost;
REVOKE ALL ON *.* FROM gbUser@localhost;
REVOKE ALL ON *.* FROM tdUser@localhost;

DROP USER tdUser@localhost;
DROP USER tdUser;
CREATE USER tdUser@localhost IDENTIFIED BY '1234';




