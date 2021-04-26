--scuser로 접속
--학생정보 table 생성
--학번 : 고정문자열 5, 기본키 설정
--이름 : 한글가변문자열 20, null값이 올 수 없다.
--학과 : 한글가변문자열 10
--학년 : 가변문자열5
--전화번호 : 가변문자열 20
--주소  : 한글가변문자열 125
DROP TABLE tbl_student;

CREATE TABLE tbl_student (
    st_num CHAR(5) PRIMARY KEY,
    st_name NVARCHAR2(20) NOT NULL,
    st_dept NVARCHAR2(10) NOT NULL,
    st_grade VARCHAR2(5) NOT NULL,
    st_tel VARCHAR2(20),
    st_addr NVARCHAR2(125)
);

DROP TABLE tbl_score;

-- 점수테이블
-- 학번 : 고정문자열 5, 기본키
-- 국어,영어,수학 숫자, null값 없이
CREATE TABLE tbl_score (
    sc_num CHAR(5) PRIMARY KEY,
    sc_kor NUMBER NOT NULL,
    sc_eng NUMBER NOT NULL,
    sc_math NUMBER NOT NULL
);

DROP VIEW view_1반학생;
DROP VIEW view_Score;
DROP VIEW view_영어점수;

SELECT * FROM tbl_student;

--임포트한 데이터의 개수(데이터 레코드 수) 확인
--COUNT() : sql의 통계함수, 개수를 계산

SELECT * FROM tbl_score;
SELECT COUNT(*) FROM tbl_score;

--임포트 된 성적데이터의 전체 과목 총점 계산
--통계함수 sum() :숫자칼럼의 합계를 계산
--전체 레코드의 데이터를 합산

SELECT SUM(sc_kor) as 국어총점,
    SUM(sc_eng) AS 영어총점,
    SUM(sc_math) AS 수학총점
From tbl_score;

--숫자칼럼의 연산을 하여 표시
SELECT sc_num AS 학번,
(sc_kor + sc_eng + sc_math) AS 총점
FROM tbl_score;

--전체 과목의 평균점수
--통계함수 avg()를 사용하여 과목평균 계산
-- ALIAS 설정을 할때 AS 키워드를 생략가능
SELECT AVG(sc_kor) 국어, AVG(sc_eng) 영어, AVG(sc_math) 수학
FROM tbl_score;

-- 전체학생 성적중에 국어 최고점, 국어 최저점
-- 통계함수 MAX(), MIN()
SELECT MAX(sc_kor) 국어최고, MIN(sc_kor) 국어최저
FROM tbl_score;

-- 통계함수 중 가장 많이 사용하는 것들
-- count(), sum(), avg(), min(), max()
-- 개수,  합산,  평균,  최소값,  최대값
-- 통계함수를 사용할때 ㅗㅇ계에 포함하지 않는 칼럼을
-- 보고자 할때는 GROUP BY를 사용하여 묶어줘야 한다
-- 학번으로 묶어서, 동일한 학번의 국어점수를 합계 할때
SELECT sc_num, SUM(sc_kor)
FROM tbl_score
GROUP BY sc_num;

SELECT * FROM tbl_score;

SELECT * FROM tbl_student
WHERE st_num = 'S0005';

-- 성적데이터를 보면서 
-- 각 학생의 이름 등을 같이 보고 싶다.
-- 2개의 테이블을 JOIN을 하여 함께 보자
-- tbl_score 테이블을 나열하고
-- tbl_score의 sc_num 칼럼의 값과 같은 데이터를 
-- tbl_student에서 찾아서 함께 나열하라
SELECT
    *
FROM tbl_score, tbl_student
WHERE sc_num = st_num;

SELECT sc_num, st_name, st_dept, sc_kor, sc_eng, sc_math
FROM tbl_score, tbl_student
WHERE sc_num = st_num;

-- 2개 이상의 테이블을 JOIN할때
-- 각각 테이블의 칼럼(속성)이름이 같은경우
-- 문제가 발생할 수 있다.
SELECT tbl_score.sc_num,
    tbl_student.st_num,
    tbl_student.st_dept,
    tbl_score.sc_kor,
    tbl_score.sc_eng,
    tbl_score.sc_math    
FROM tbl_score, tbl_student
WHERE sc_num = st_num;

-- 테이블이름을 부착하기 저에
-- 테이블 Alias를 추가한 후
-- 각 칼럼 이름에 Alias를 사용할 수 있다.
-- 테이블 Alias에도 AS키워드를 사용하지만
-- 오라클에서는 테이블 Alias에 AS키워드를 사용하면
-- 문법오류가 발생한다.
SELECT SC.sc_num,
    ST.st_num,
    ST.st_dept,
    SC.sc_kor,
    SC.sc_eng,
    SC.sc_math    
FROM tbl_score SC, tbl_student ST
WHERE sc_num = st_num;

--테스트를 하기 위해서 학생데이터 일부를 삭제
DELETE FROM tbl_student
WHERE st_num >= 'S0080';

-- 학생데이터에서 일부를 삭제한 후 JOIN을 실행하였더니
-- 성적데이터가 79개 밖에 조회되지 않는다.
-- 성적데이터는 모두 100개가 있지만 학생데이터는 79개만 남아 있기 때문에
-- JOIN을 한 결과가 학생데이터와 같은 수인 79개만 조회(인출)되고 있다.
-- EQ JOIN(참조 무결성이 보장되는 경우 사용하는 일반적인 JOIN)
SELECT SC.sc_num,
    ST.st_num,
    ST.st_dept,
    SC.sc_kor,
    SC.sc_eng,
    SC.sc_math    
FROM tbl_score SC, tbl_student ST
WHERE sc_num = st_num;

-- 학생데이터에는 1 ~79번까지만 있고
-- 성적데이터에는 1 ~100번까지 있다.
-- 성적데이터의 80~100까지는 실제로 존재하는 학생인지 아닌지 증명할 방법이 없다.
-- 성적데이터는 무결성이 깨진상태가 된다.
-- 학생테이블과 성적테이블간의 연관(관계)가 참조가 무너진 상태가 된다.
-- 참조 무결성이 오류가 발생했다 라고 표현한다.
-- 참조무결성에 문제가 생긴 후 JOIN을 했을 때 인출되는 데이터의 신뢰성을 보증할 수 없다.
SELECT *FROM tbl_score;
SELECT * FROM tbl_student;

--참조무결성에 문제가 있는 경우
-- 참조 무결성 여부와 관계없이 모든 데이터를 JOIN하여 보고 싶을때
-- LEFT JOIN(LEFT OUT JOIN)
-- tbl_score 테이블의 데이터는 모두 보여주고
-- 학생테이블에서 학번이 일치하는 학생이 있으면 같이 보여달라
-- 보통 table의 참조 무결성 보증을 설정하는 경우가 있는데
-- 참조관계에 없는 다수의 테이블을 JOIN하여 보고 싶을때는 LEFT JOIN을 사용한다.
-- 참조 무결성 보증이 된 경우도 LEFT JOIN을 수행하면
-- 모든 데이터의 참조 무결성이 잘 되고 있는지 확인할 수 있다.

SELECT SC.sc_num,
    ST.st_num,
    ST.st_dept,
    SC.sc_kor,
    SC.sc_eng,
    SC.sc_math    
FROM tbl_score SC LEFT JOIN tbl_student ST
ON sc_num = st_num;

-- EQ JOIN을 실행할 때 조건을 부여하지 않으면 테이블 x 테이블 만큼의 데이터가 출력된다.
-- 이렇게 인출 된 데이터를 "카티션곱" 이라고 한다.
SELECT COUNT(*)
FROM tbl_score, tbl_student;

-- 학생데이터에 없는 학생이 추가 되어있는지 여부를 알아보고 싶을때
-- 참조 무결성에 오류가 있는지 알고 싶을때
SELECT COUNT(*)
FROM tbl_score
    LEFT JOIN tbl_student
        ON sc_num = st_num;
        
-- 학생데이터를 모두 나열하고 학생데이터와 일치하는 성적데이터만 보여라
-- 학생데이터와 성적데이터간의 참조 무결성에 오류가 있기 때문에
-- 실제 학생데이터에 존재하는 성적정보만 보고 싶을때
SELECT COUNT(*)
FROM tbl_student
    LEFT JOIN tbl_score
        ON st_num = sc_num;
        
-- ROUND() DBMS 시스템함수, 소수점이하 자리수 제한
-- ROUND(값, 자리수) : 자리수 이하 에서 반올림
-- ROUND(값, 0)  : 소수점이하 반올림하고 정수형으로
-- TRUNC(값, 자리수) : 자리수 이하값은 무조건 절사


SELECT SC.sc_num AS 학번,
        ST.st_num AS 이름,
        ST.st_dept AS 학과,
        ST.st_grade AS 학년,
        ST.st_tel AS 전화번호,
        SC.sc_kor AS 국어,
        SC.sc_eng AS 영어,
        sc.sc_math AS 수학,
        (SC.sc_kor + SC.sc_eng + SC.sc_math) AS 총점,
        ROUND((SC.sc_kor + SC.sc_eng + SC.sc_math)/3,2) AS 평균,
        ROUND((SC.sc_kor + SC.sc_eng + SC.sc_math)/3,0) AS 평균
FROM tbl_score SC
    LEFT JOIN tbl_student ST
        ON sc_num = st_num;