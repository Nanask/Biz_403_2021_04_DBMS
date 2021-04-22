-- 여기는 scUser로 접속

CREATE TABLE tbl_student (

st_num CHAR(5),
st_name NVARCHAR2(20), --가변문자
st_dept NVARCHAR2(10),
st_grade VARCHAR2(5),
st_tel VARCHAR2(20),
st_addr NVARCHAR2(125)

);

-- 생성한 Table에 데이터 추가
-- DML(데이터조작어) 명령을 사용하여 데이터 추가(create)
-- create : 테이블에 존재하지 않는 데이터를 새로 추가한다 라는 개념
INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade)
VALUES('00001','홍길동','국어국문','3');

--데이터를 추가한 후에는 잘 추가되었는지 확인
--tbl_student table에 저장되어있는 모든 데이터를 무조건 보여달라
SELECT * FROM tbl_student;

INSERT INTO tbl_student(st_num,st_dept,st_grade)
VALUES('00001','컴퓨터공학','2');
SELECT * FROM tbl_student;

-- 위에서 생성한 tbl_student 테이블에는 데이터를 추가하려고 할때
-- 이름데이터가 없어도 데이터가 정상적으로 추가가 되어버린다.
-- 같은 학번의 데이터가 이미 추가되어 있어도 또다시 추가가 되어버린다.
-- 이런식으로 데이터가 계속 추가된다면 전체 데이터의 신뢰성에 문제가 된다.
-- DBMS에서는 table(Entity)를 설계할때 이러한 오류를 방지하기 위해 
-- Table을 생성할 때 '제약조건'을 설정하여 데이터가 INSERT가 되지 못하도록
-- 하는 기능이 있다.
-- 작성된 table을 삭제하고 다시 제약조건을 설정하여 생성하자.

DROP TABLE tbl_student;
DROP TABLE tbl_sudent;


-- 학생의 이름은 데이터가 반드시 있어야 한다.
-- st_Name(학생 이름) 칼럼은 NOT NULL이여야 한다.

CREATE TABLE tbl_student (

st_num CHAR(5) UNIQUE NOT NULL,
st_name NVARCHAR2(20)NOT NULL, --가변문자
st_dept NVARCHAR2(10),
st_grade VARCHAR2(5),
st_tel VARCHAR2(20),
st_addr NVARCHAR2(125)

);

INSERT INTO tbl_student(st_num,st_dept,st_grade)
VALUES('컴퓨터공학','2');
SELECT * FROM tbl_student;

INSERT INTO tbl_student(st_num,st_dept,st_Na
)
VALUES('00001','컴퓨터공학','2');
SELECT * FROM tbl_student;

SELECT * FROM tbl_student;



