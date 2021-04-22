--관리자 권한접속

-- TableSpace 생성하기
CREATE TABLESPACE iolistDB
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;


-- TableSpace 삭제
-- DROP TABLESPACE iolistDB 이렇게만 기록하면 문제가 발생하기 때문에 
-- 그 밑에 옵션들을 붙여 삭제해주는 것이 좋다.
DROP TABLESPACE iolistDB -- 반드시
INCLUDING CONTENTS AND DATAFILES -- 옵션
CASCADE CONSTRAINTS; --옵션

-- 새로운 사용자 등록
CREATE USER iouser IDENTIFIED BY iouser
DEFAULT TABLESPACE iolistdb;

-- 사용자 삭제
DROP USER iouser CASCADE;

-- 사용자 권한 부여
GRANT DBA TO iouser; 