-- 현재 존재하는 DataBase를 보여달라
SHOW databases;
-- 지금부터 MYSQL DataBase를 사용하겠다.
-- 사용자와 연관없이 기본적으로 사용할 DataBase를 지정하여 사용할 준비
USE MYSQL;
-- 현재 접속한 DataBase(mysql)에 있는 모든 table을 보여달라
SHOW tables;
-- myDB라는 DataBase (데이터 저장소) 생성
create DATABASE myDB;
-- 생성된 저장소 확인
SHOW databases;
-- MySQL에서는 제일 먼저 사용할 DB를 open하기
-- use라는 명령을 사용하여 DB open
USE MyDB;
-- 현재 DB(MyDB)에 있는 모든 Table을 보여달라
SHOW tables;

-- MySQL에서는 일련번호와 관련된 칼럼에
-- AUTO_INCREMENT 옵션을 설정하면
-- INSERT 할때 값을 지정하지 않아도
--  자동으로 ID, SEQ 값을 생성하여 칼럼에 추가하여 준다.

-- 원하는 칸에 블럭 씌워서 Ctrl + Shift + U 하면 소문자를 대문자로 변경!!!!!
CREATE table tbl_test (
	id BIGINT primary key auto_increment,
    name VARCHAR(50) NOT NULL,
    tel VARCHAR(20),
    addr VARCHAR(125)
);
SHOW tables;
DESC tbl_test;

INSERT INTO tbl_test(NAME, TEL, ADDR)
VALUE('홍길동','010-111-1111','서울시');
SELECT * FROM TBL_TEST;
-- auto_increment를 사용하여 ID에 숫자를 자동으로 채워줌

-- MySQL은 Linux 철학을 유지하고 있기 때문에 명령이 정상으로 수행되면
-- 아무런 메시지도 보이지 않는다
create table tbl_books (
	bk_isbn   CHAR(13)      PRIMARY KEY,
	bk_comp   VARCHAR(15)   NOT NULL,   
	bk_title   VARCHAR(125)   NOT NULL,   
	bk_author   VARCHAR(50)   NOT NULL,   
	bk_trans   VARCHAR(20),      
	bk_date   VARCHAR(10),      
	bk_pages   INT,      
	bk_price   INT      
);
show tables;
DESC tbl_books;
select *FROM tbl_books;
drop table tbl_books;
DESC tbl_books;
SELECT * FROM tbl_books;

SELECT COUNT(*) FROM tbl_books;

-- 도서 가격이 25000원 이상인 데이터
SELECT * FROM tbl_books
WHERE bk_price >= 20000;

-- 도서 가격이 만원 이상 2만원 이하
SELECT * FROM tbl_books
WHERE bk_price >= 10000 AND bk_price <= 20000;

SELECT * FROM tbl_books
WHERE bk_title LIKE '%왕%';

-- Java 등 코딩에서 중간 문자열 검색
SELECT * FROM tbl_books
WHERE bk_title
LIKE concat('%', '왕', '%');

-- 날짜 칼럼의 앞에 4글자만 보여라
SELECT left(bk_date, 4)
FROM tbl_books;
-- 날짜 칼럼의 앞에 4글자가 2018인 데이터를 보여라
SELECT * from tbl_books
WHERE left(bk_date, 4) = '2018';

-- 전체 데이터를 날짜 순으로 보여라
SELECT * FROM tbl_books
ORDER BY bk_date;

-- 도서명을 역순으로 정렬하여 보여라
SELECT * FROM tbl_books
ORDER BY bk_title DESC;

-- 처음 3개의 데이터만 보여라
SELECT *
FROM tbl_books
limit 3;

-- 0부터 시작하는 3번째 데이터부터 2개
-- 게시판 등 코딩에서 pagination을 구현할 때 사용하는 코딩
select *
FROM tbl_books
limit 3,2 ;

create database BookRent;
USE BookRent;

create table tbl_books (
	bk_isbn	CHAR(13)		PRIMARY KEY,
	bk_title	VARCHAR(125)	NOT NULL,	
	bk_ccode	CHAR(5)	NOT NULL,	
	bk_acode	CHAR(5)	NOT NULL,	
	bk_date	VARCHAR(10),		
	bk_price	INT,		
	bk_page	INT		

);

create table tbl_company (
	cp_code	CHAR(13)		PRIMARY KEY,
	cp_title	VARCHAR(125)	NOT NULL,	
	cp_ceo	VARCHAR(20),		
	cp_tel	VARCHAR(20),	
	cp_addr	VARCHAR(125),		
	cp_genre	VARCHAR(10)

);

create table tbl_author (
	au_code	CHAR(5)		PRIMARY KEY,
	au_name	VARCHAR(50)	NOT NULL,	
	au_tel	VARCHAR(20),		
	au_addr	VARCHAR(125),		
	au_genre	VARCHAR(30)		

);

create table tbl_buyer (
	bu_code	CHAR(5)		PRIMARY KEY,
	bu_name	VARCHAR(50)	NOT NULL,	
	bu_brith	INT	NOT NULL,	
	bu_tel	VARCHAR(20)	,	
	bu_addr	VARCHAR(125)		
);

create table tbl_book_rent (
	br_seq	BIGINT		PRIMARY KEY auto_increment,
	br_sdate	VARCHAR(10)	NOT NULL,	
	br_isbn	CHAR(13)	NOT NULL,	
	br_bcode	CHAR(5)	NOT NULL,	
	br_edate	VARCHAR(10),		
	br_price	INT

);


