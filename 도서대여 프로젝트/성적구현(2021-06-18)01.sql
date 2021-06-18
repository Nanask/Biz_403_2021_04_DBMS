use score;

CREATE TABLE tbl_student (
	st_num	CHAR(8) 	PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	INT	NOT NULL	,
	st_tel	VARCHAR(20)	NOT NULL,	
	st_addr	VARCHAR(125)		
);

CREATE TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,	
	sc_subject	VARCHAR(20)	NOT NULL,	
	sc_score	INT	NOT NULL	

);

ALTER TABLE tbl_score
ADD CONSTRAINT fk_student
FOREIGN KEY(sc_stnum)
REFERENCES tbl_student(st_num);


SELECT COUNT(sc_subject)
FROM tbl_score;

CREATE VIEW view_성적관리 AS (
SELECT st_num AS 학번, st_name AS 이름, st_dept AS 전공,
	st_grade AS 학년, COUNT(sc_subject) AS 응시과목, 
    SUM(sc_score) AS 총점,
    ROUND(SUM(sc_score)/COUNT(sc_subject),2) AS 평균
FROM tbl_student
	LEFT JOIN tbl_score
		ON st_num = sc_stnum
GROUP BY st_num       
);

DROP VIEW view_성적관리;

SELECT * FROM tbl_student;
SELECT * FROM tbl_score;
SELECT * FROM view_성적관리;

INSERT INTO tbl_student(st_num,st_name,st_dept,st_grade,st_tel) VALUES(20210001,'홍길동','컴퓨터공학',2,'010-111-1111');
INSERT INTO tbl_score(sc_stnum,sc_subject,sc_score) VALUES(20210001,'수학',70);
INSERT INTO tbl_score(sc_stnum,sc_subject,sc_score) VALUES(20210001,'영어',70);
INSERT INTO tbl_student(st_num,st_name,st_dept,st_grade,st_tel) VALUES(20210002,'성춘향','전자공학',1,'010-211-2111');
INSERT INTO tbl_score(sc_stnum,sc_subject,sc_score) VALUES(20210002,'국어',80);
INSERT INTO tbl_score(sc_stnum,sc_subject,sc_score) VALUES(20210002,'수학',50);


