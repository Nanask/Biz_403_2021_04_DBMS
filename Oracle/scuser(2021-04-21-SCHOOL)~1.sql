-- scuser 접속
SELECT * FROM tbl_student;

--projection
--데이터 중에 필요한 칼럼만 나열하여 데이터를 보여라
SELECT st_num, st_name, st_dept
FROM tbl_student;

--보여지는 칼럼의 순서도 바꿀수 있다.
--select는 실행 및 오류가 나도 원래 데이터에는 문제가 없다. 보여지는 화면이기 때문
SELECT st_name, st_tel, st_dept
FROM tbl_student;

-- 이름이 '기은성'인 사람의 데이터를 조회
-- 비록 한개의 데이터만 보여지지만 이 데이터는 2개 이상 보여진다는 것을 항상 전제하자
-- 여기에서 보여지는 데이터는 모두가 LIST이다 

--  List<VO> VOList에 담아야 한다.
SELECT st_name, st_dept
FROM tbl_student
WHERE st_name = '기은성';

-- 학번이 's0090'인 학생의 정보를 조회하라
-- 학번(st_num)은 PK로 설정(선언)이 되어있기 때문에 1개의 학번만 조회하면
-- 이 데이터는 무조건 1개이거나 없다
-- 여기에서 출력되는 데이터는 VO이다.
--      VO vo = new VO()에 담아야 한다.
-- 프라이머리 키에 담겨있기 때문에 vo에 담고 나머지 칼럼들은 전부 리스트에 담는다
SELECT st_num, st_name, st_dept
FROM tbl_student
WHERE st_num = 'S0090';

-- 학번이 S0090이거나 S0091인 학생을 보여라
SELECT
    *
FROM tbl_student
WHERE st_num = 'S0090' OR st_num = 'S0091';

SELECT * FROM tbl_student
WHERE st_num = 'S0090' OR st_num = 'S0091' OR st_num = 'S0092';

-- 조건문 연산자 in
SELECT
    *
FROM tbl_student
WHERE st_num IN('S0090','S0091','S0040','S0050');

-- DBMS에서는 char, varchar 타입의 문자열도 범위검색이 가능하다
-- 단, 모든 데이터의 길이가 같을때
SELECT
    *
FROM tbl_student
WHERE st_num > 'S0090' AND st_num < 'S0099';

SELECT
    *
FROM tbl_student
WHERE st_name >= '김가가' AND st_name <= '기힣힣';

--0010학번부터 0019학번까지 보여달라
--st_num >= 'S0010' AND st_num <= 'S0019'
SELECT
    *
FROM tbl_student
WHERE st_num BETWEEN 'S0010' AND 'S0019';

-- 이름이 '기'로 시작되는 모든 데이터를 조회
-- Like 조회 연산자는 가장 느리다.
SELECT
    *
FROM tbl_student
WHERE st_name LIKE '기%';

-- Full Scan 검색
-- Index등의 검색 최적화 기능을 모두 사용하지 않는다.
-- 이름에 '기'라는 글자가 포함된 모든 데이터를 조회
SELECT
    *
FROM tbl_student
WHERE st_name Like '%기%';

SELECT
    *
FROM tbl_student
WHERE st_addr LIKE '%북%';

-- 주소에 북 문자열이 포함된 모든 데이터를 조회하고
-- 조회된 데이터에서 주소 칼럼을 기준으로 오름차순 정렬하라
SELECT
    *
FROM tbl_student
WHERE st_addr LIKE '%북%'
ORDER BY st_addr; -- Asc(오름차순) 가나다 순, ABC순, 12345순

--DESC로 표기하지않는다면 오름차순으로 정렬한다.
SELECT
    *
FROM tbl_student
WHERE st_addr LIKE '%북%'
ORDER BY st_addr DESC; -- Descending(내림차순)

