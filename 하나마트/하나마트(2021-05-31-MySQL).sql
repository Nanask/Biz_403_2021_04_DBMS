-- 하나마트

-- 데이터베이스 생성
CREATE DATABASE nhDB;

-- 데이터베이스를 사용하기 위한 연결, 사용할 Database에 연결하기
USE nhDB;

DROP table tbl_iolist;

-- table 생성
CREATE TABLE tbl_iolist (
	io_seq	BIGINT	AUTO_INCREMENT 	PRIMARY KEY,
	io_date	VARCHAR(10)	NOT NULL,
	io_time	VARCHAR(10)	NOT NULL,
	io_pname	VARCHAR(50)	NOT NULL,	
	io_bname	VARCHAR(50)	NOT NULL,	
	io_dceo	VARCHAR(20)	NOT NULL,	
	io_inout	VARCHAR(5)	NOT NULL,	
	io_qty	INT	NOT NULL,
	io_price	INT	NOT NULL

);

-- 테이블 확인
DESC tbl_iolist;

-- 테이블 데이터 확인
SELECT COUNT(*) tbl_iolist;

-- 매입과 매출의 합계
-- io_inout 칼럼 1이면 매입, 2이면 매출
-- 수량*단계를 곱하여 합계계산
SELECT (io_qty * io_price) 합계
FROM tbl_iolist;

--  통계함수와 GROUP을 이용하여 매입합계, 매출합계
SELECT SUM(io_qty * io_price) 합계
FROM tbl_iolist
GROUP BY io_inout;

-- 값이 나왔으나 1,2 번으로만 나와서 구분하기 어려움
SELECT io_inout,SUM(io_qty * io_price) 합계
FROM tbl_iolist
GROUP BY io_inout;

-- case, end 를 사용
-- Oracle DECODE(조건, true, false)
SELECT CASE WHEN io_inout = '1' THEN '매입'
			WHEN io_inout = '2' THEN '매출'
       END AS '구분', SUM(io_qty * io_price) AS '합계'
FROM tbl_iolist
GROUP BY io_inout;

-- if(조건, true, false) : MySQL 전용함수
SELECT IF(io_inout = '1','매입','매출') AS 구분,
SUM(io_qty * io_price) AS 합계
FROM tbl_iolist
GROUP BY io_inout;       

-- 매입합계와 매출합계를 PIVOT 형식으로 조회
SELECT SUM(if(io_inout = '1', io_qty * io_price , 0)) AS 매입,
		SUM(if(io_inout = '2', io_qty * io_price , 0)) AS 매출
FROM tbl_iolist;    

-- 일자별로 보여주기
SELECT io_date AS 일자,
		SUM(if(io_inout = '1', io_qty * io_price , 0)) AS 매입,
		SUM(if(io_inout = '2', io_qty * io_price , 0)) AS 매출
FROM tbl_iolist
GROUP BY io_date
ORDER BY io_date;

-- 거래처별로 매입, 매출합계
-- 거래처는 무조건 GROUP BY를 사용해줘야 한다.
-- PiVOT 방식으로 조회하기, IF 사용
SELECT io_bname AS 거래처,
		SUM(if(io_inout = '1', io_qty * io_price, 0)) AS 매입,
        SUM(if(io_inout = '2', io_qty * io_price, 0)) AS 매출
FROM tbl_iolist
GROUP BY io_bname
ORDER BY io_bname;

-- if문을 사용하지 않고 조회하기, CASE WHEN 사용
-- 표준 SQL을 사용하여 거래처별로 매입 매출 합계
SELECT io_bname,
SUM(CASE WHEN io_inout = '1' THEN io_qty * io_price ELSE 0 END) AS 매입,
SUM(CASE WHEN io_inout = '2' THEN io_qty * io_price ELSE 0 END) AS 매출
FROM tbl_iolist
GROUP BY io_bname;

-- 2020년 4월의 매입매출 전체리스트 조회
SELECT *
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-31';


-- 2020년 4월의 거래처별로 매입매출 합계
SELECT io_bname AS 거래처, io_date AS 날짜,
SUM(CASE WHEN io_inout = '1' THEN io_qty * io_price ELSE 0 END) AS 매입,
SUM(CASE WHEN io_inout = '2' THEN io_qty * io_price ELSE 0 END) AS 매출
FROM tbl_iolist
WHERE io_date BETWEEN '2020-04-01' AND '2020-04-31'
GROUP BY io_bname, io_date
ORDER BY io_bname;

-- LEFT, MID, RIGHT
-- 문자열 칼럼의 데이터를 일부만 추출할때
-- LEFT(칼럼, 개수) : 왼쪽부터 문자열 추출
-- MID(칼럼, 위치, 개수) : 중간문자열 추출 
-- Oracle SUBSTR(칼럼, 의지, 개수)
-- RIGHT(칼럼, 개수) : 오른쪽부터 문자열 추출
SELECT * FROM tbl_iolist
WHERE left(io_date,7) = '2020-04';

SELECT LEFT('대한민국',2);
SELECT LEFT('Republic of','2');
-- MySQL은 언어와 관계없이 글자수로 인식
SELECT LEFT('대한민국',2), LEFT('Korea',2);
SELECT MID('대한민국',2,2), MID('Korea',2,2);
SELECT right('대한민국',2), right('korea',2);


   
        


CREATE TABLE tbl_dept (
	dp_code	CHAR(5)		PRIMARY KEY,
	dp_name	VARCHAR(50)	NOT NULL,
	dp_ceo	VARCHAR(50)	NOT NULL,
	dp_tel	VARCHAR(20)	,
	dp_addr	VARCHAR(125)	

);

CREATE TABLE tbl_product (
	p_code	CHAR(6)		PRIMARY KEY,
	p_name	VARCHAR(50)	NOT NULL,
	p_iprice	INT	NOT NULL,
	p_oprice	INT	NOT NULL,
	p_vat	VARCHAR(1)	DEFAULT ''	

);