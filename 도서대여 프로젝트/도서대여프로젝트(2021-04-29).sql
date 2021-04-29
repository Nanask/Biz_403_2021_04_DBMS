-- bookuser로 접속



CREATE TABLE tbl_books (
    bk_isbn	    CHAR(13)		PRIMARY KEY,
    bk_title	nVARCHAR2(125)	NOT NULL,	
    bk_ccode	CHAR(5)	NOT NULL,	
    bk_acode	CHAR(5)	NOT NULL,	
    bk_date	    VARCHAR2(10),	
    bk_price	VARCHAR2(10),		
    bk_pages	NUMBER		

);



DROP TABLE tbl_books;

SELECT * FROM tbl_books;

CREATE TABLE tbl_company (
    cp_code	    CHAR(13)		PRIMARY KEY,
    cp_title	nVARCHAR2(125)	NOT NULL,	
    cp_ceo	    nVARCHAR2(20),		
    cp_tel	    VARCHAR2(20),		
    cp_addr	    nVARCHAR2(125),		
    cp_genre	nVARCHAR2(10)		

);

SELECT
    *
FROM tbl_company;

DROP TABLE tbl_company;

CREATE TABLE tbl_author (
    au_code	    CHAR(5)		PRIMARY KEY,
    au_name	    nVARCHAR2(50)	NOT NULL,	
    au_tel	    nVARCHAR2(20),		
    au_addr	    VARCHAR2(125),		
    au_genre	nVARCHAR2(30)		

);

DROP TABLE tbl_author;

-- 데이터 import 후에 확인
SELECT COUNT(*) FROM tbl_books;
SELECT COUNT(*) FROM tbl_company;
SELECT COUNT(*) FROM tbl_author;

-- 3개의 table을 join하여 view 만들기
CREATE VIEW view_도서정보
AS
(
    SELECT bk_isbn AS ISBN, bk_title AS 도서명,
    C.cp_title AS 출판사명, C.cp_ceo As 출판사대표,
    A.au_name AS 저자명, A.au_tel AS 저자연락처,
    bk_date AS 출판일, bk_price AS 가격
    FROM tbl_books B
        LEFT JOIN tbl_company C
            ON B.bk_ccode = C.cp_code
        LEFT JOIN tbl_author A
            ON B.bk_acode = A.au_code
);            
    SELECT * FROM tbl_books;       
/*
고정문자열 type칼럼의 주의사항
CHAR() Type의 문자열 칼럼은 실제 저장되는 데이터의 type에 따라
주의를 해야 한다.

만약 데이터가 숫자값으로만 되어 있는 경우 
00001,00002와 같이 입력할 경우 0을 삭제해버리는 경우가 있다.

(엑셀에서 import하는) 실제데이터가 날짜 타입일 경우
SQL의 날짜형 데이터로 변환한 후 다시 문자열로 변환하여 저장

칼럼의 PK로 설정하지 않는 경우는 가급적 CHAR로 설정하지 말고 VARCCHAR2로
설정하는 것이 좋다.

고정문자열 칼럼으로 조회를 할 때 아래와 같은 조건을 부여하면 데이터가 조회 되지 않는
현상이 발생할 수 있다.
WHERE 코드 = '00001'

*/

