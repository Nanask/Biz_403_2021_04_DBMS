-- 여기는 관리자화면 접속

/*
오라클에서는 관리자(sys, system, sysdba)계정이 존재하며
관리자 계정으로 접속을 하면 오라클 시스템 자체를 컨트롤 할 수 있는 권한이 생긴다.
sysdba 권한이라고 한다.

보안사고 : 허가받지 않은 사용자가 네트워크를 통해서 불법적으로 시스템에 침투하여
데이터, 시스템을 파괴하는 행위
관리자(sysdba)권한의 노출로 인하여 관리자 권한 탈취

데이터 무결성 파괴 : 허가된 사용자에게 권한이 잘못 부여되거나 과도하게 권한을 부여하여
명령을 잘못 사용하여 데이터의 문제를 일으키는 것

관리자 권한에서는 최소한으로 tablespace 생성, 사용자 생성, 사용자에게 권한 부여
정도만 사용하도록 권장한다.

실무에서는 관리자 접속을 하지 않고 별로 권한을 받아 할 것이다.
*/

CREATE TABLESPACE testDB
DATAFILE 'C:/oraclexe/data/testDB.dbf'
SIZE 1M AUTOEXTEND ON NEXT 1k;

-- testUser 라는 '사용자계정(User Account)'을 생성하고 비번을 testUser로 하고
-- 기본 tableSpace testDB로 설정
CREATE USER testUser IDENTIFIED BY testUser
DEFAULT TABLESPACE testDB;

/*
오라클에서는 최초로 사용자계정을 생성한 후에는 아직 아무런 권한이 없기 때문에
DB에 접속하는 것 조차 할 수 없음
실습을 쉽게 하기 위하여 생성한 사용자계정에 DBA권한을 부여한다

DBA 권한 : 시스템 DB에 접근은 할 수 없으나 기타 table을 만드는 일부터
        대부분의 DBMS 관련 명령을 사용하여 DB를 핸들링 할 수 있는 권한
*/

GRANT DBA TO testUser;