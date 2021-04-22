-- IOUSER 권한으로 접속
-- IOUSER DBA 권한을 갖고 있기 때문에 일반적인 
-- 표준 DDL, DML, DCL 명령들을 사용할 수 있다.
-- DDL(Data Definition Lang.데이터 정의어)
--              객체생성 CREATE TABLE, VIEW, INDEX 생성
--              객체삭제 DROP TABLE, VIEW < INDEX
--              객체변경(수정) ALTER TABLE, INDEX
-- ORACLE 전용 DDL
--      객체 생성 CREATE SEQUENCE

-- 거래내역 저장 table

CREATE TABLE tbl_iolist (
--date
 io_date VARCHAR2(10), -- 2021-04-21
 io_buyer NVARCHAR2(20), -- 이름
 io_pname NVARCHAR2(20), -- 상품이름
 io_qty NUMBER, 
 io_price NUMBER,
 io_total NUMBER

);

-- 생성된 table에 데이터 추가
INSERT INTO tbl_iolist(io_date, io_buyer,io_qty, io_price)
VALUES ('2021-01-01', '홍길동', 10 , 1000);

-- 전체 조회
SELECT io_date, io_buyer, io_pname, io_qty, io_price , io_total
From tbl_iolist;
-- 실수로 상품이름을 입력하지 않아 상품이름에 null이됨

-- 위에서 생성한 tbl_iolist는 데이터를 추가하는데 아무런 '제약조건'
-- 을 설정하지 않았다.
-- 그랬더니 insert를 수행했을때 실수로 상품명을 입력하지 않았는데도
-- 데이터가 insert 되어버렸다.
-- 나중에 확인을 해보니 상품명이 없어서 데이터 활용 가치가 매우 떨어지는
-- 현상이 발생했다.
-- 이런 상황을 "insert(추가,삽입) 이상현상"이 발생했다고 한다.
-- => 무결성이 훼손되었다.
-- 기존의 Table을 제거하고 무결성을 유지하기 위한 "제약조건을 설정"하여
-- Table을 다시 만들자

DROP TABLE tbl_iolist;

-- 데이터를 INSERT하는데 
CREATE TABLE tbl_iolist (

 io_date VARCHAR2(10), -- 2021-04-21
 io_buyer NVARCHAR2(20), -- 이름
 io_pname NVARCHAR2(20) NOT NULL, -- 상품이름
 io_qty NUMBER, 
 io_price NUMBER,
 io_total NUMBER

);

-- 다시 데이터 insert 테스트(상품데이터를 입력하지 않은 상태로)
INSERT INTO tbl_iolist(io_date, io_buyer,io_qty, io_price)
VALUES ('2021-01-01', '홍길동', 10 , 1000);
-- 명령수행에서 오류발생
-- io_pname 칼럼에 null을 insert 할 수 없다.
-- io_pname 에 데이터가 setter되지 않았다.

INSERT INTO tbl_iolist(io_pname) VALUES('새우깡');

-- 조건없이 모든 데이터를 조회하라(출력하라)
SELECT * FROM tbl_iolist;
--원하는 칼럼을 배열하고 조건없이 모든 데이터를 조회하라
SELECT io_pname, io_buyer FROM tbl_iolist;

DROP TABLE tbl_iolist;

-- 데이터를 INSERT하는데 
CREATE TABLE tbl_iolist (

 io_date VARCHAR2(10)NOT NULL, -- 2021-04-21
 io_buyer NVARCHAR2(20)NOT NULL, -- 이름
 io_pname NVARCHAR2(20) NOT NULL, -- 상품이름
 io_qty NUMBER NOT NULL, 
 io_price NUMBER NOT NULL,
 io_total NUMBER
);

INSERT INTO tbl_iolist(io_date,io_buyer,io_pname,io_qty,io_price)
VALUES('2021-04-21','홍길동','새우깡', 30, 1000);
--select 명령문의 as(alias)원래 table의 칼럼명을 변경하여 표현하고 싶을때

-- 1. tbl_iolist로 부터 데이터를 가져오고
-- 2. project로 설정된 칼럼들 데이터만 추출하여
-- 3. 리스트를 출력한다.
SELECT io_date as 거래일자,
        io_buyer as 고객명, 
        io_pname as 상품명, 
        io_qty as 수량, 
        io_price as 단가, 
        io_qty * io_price AS 합계
        FROM tbl_iolist; --iolistDB.iouser.tbl_iolist에서 데이터를 가져와라
        
INSERT INTO tbl_iolist(io_date,io_buyer,io_pname,io_qty,io_price)
VALUES('2021-04-21','성춘향','신라면', 10, 1500);
INSERT INTO tbl_iolist(io_date,io_buyer,io_pname,io_qty,io_price)
VALUES('2021-04-21','이몽룡','어묵탕', 20, 2500);
INSERT INTO tbl_iolist(io_date,io_buyer,io_pname,io_qty,io_price)
VALUES('2021-04-21','임꺽정','빗자루', 50, 4000);

INSERT INTO tbl_iolist(io_date,io_buyer,io_pname,io_qty,io_price)
VALUES('2021-04-21','홍길동','매일우유', 10, 5000);

SELECT * FROM tbl_iolist;

-- 1. tbl_iolist로부터 데이터를 가져오기
-- 2. 가져온 데이터 중에서 io_buyer 칼럼에 저장된 값이 '홍길동'인 데이터만
--      간추려서 보여달라
SELECT * FROM tbl_iolist
WHERE io_buyer = '홍길동';
-- 전체 리스트 중에 홍길동이란 사람의 데이터를 전부 보여달라

-- tbl_iolist에 저장되어있는 데이터 리스트중에서
-- io_buyer 칼럼의 값이 '홍길동'인 데이터만 간추려서
-- io_buyer, io_pname 칼럼내용만 보이고 나머지는 숨김으로 하여 보여달라
-- 보여지는 칼럼에는 별명을 붙여서 보여라
SELECT io_buyer as 고객이름, io_pname as 구매상품
FROM tbl_iolist
WHERE io_buyer = '홍길동';
-- 리스트가 아닌 홍길동 이름의 특정 칼럼만 표시해달라

      
        
        
        