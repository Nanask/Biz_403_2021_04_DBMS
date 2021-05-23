-- 관리자모드로 접속

--시스템에 작성된 TableSpace 

DROP USER iouser CASCADE;

DROP TABLESPACE IolistDB
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

CREATE TABLESPACE IolistDB
DATAFILE 'C:/oraclexe/data/iolist.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1K;

CREATE USER iouser IDENTIFIED BY iouser
DEFAULT TABLESPACE iolistDB;

GRANT DBA TO iouser;

-- 오라클에 새로 등록한 사용자의 패스워드 만료일자
-- 기본값이 180으로 되어있어서
-- 새로운 사용자 등록 후 비번을 변경하지 않으면 180일 후에는 접속이 불가능해진다.

SELECT * FROM dba_profiles
WHERE resource_name = 'PASSWORD_LIFE_TIME';

-- 사용자의 password 만료일자를 무제한으로 변경
ALTER PROFILE
DEFAULT LIMIT PASSWORD_LIFE_TIME
UNLIMITED;
