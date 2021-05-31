use myDB;

CREATE TABLE tbl_todolist (
	td_seq BIGINT auto_increment PRIMARY KEY,
    td_sdate VARCHAR(10) NOT NULL, -- 추가된 날짜
    td_stime VARCHAR(10) NOT NULL, -- 추가된 시간
	td_doit VARCHAR(300) NOT NULL,
    
    td_edate VARCHAR(10) DEFAULT'', -- 완료된 날짜
    td_etime VARCHAR(10) DEFAULT'' -- 완료된 시간
);

DESC tbl_todolist; -- 생성됐는지 확인, 칼럼과 타입과 널값이 같이 나온다

SELECT * FROM gbUser;

SHOW DATABASES;
USE mysql;

SELECT * FROM USER
WHERE User='gbUser';

DESC USER;

ALTER USER 
'gbUser'@'192.168.0.%'
identified WITH 
mysql_native_password 
BY '12345';

GRANT 
ALL privileges ON *.* TO
'gbUser'@'192.168.0.%';
-- 연결된 것을 업데이트 시켜라!
flush privileges;

GRANT 
all privileges on *.* TO
gbUser@localhost;

use mydb;

SELECT * from tbl_todolist;