CREATE DATABASE db_school;

use db_school;

CREATE Table tbl_student (
	st_num	CHAR(8)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_dept	VARCHAR(20)	NOT NULL,	
	st_grade	INT	NOT NULL,	
	st_tel	VARCHAR(15)	NOT NULL,	
	st_addr	VARCHAR(125)		
);

INSERT INTO tbl_student(st_num, st_name, st_dept, st_grade, st_tel) VALUES('20210001','홍길동','컴퓨터공학과',3,'010-111-1234');

commit;

CREATE TABLE tbl_score (
	sc_seq	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
	sc_stnum	CHAR(8)	NOT NULL,	
	sc_sbcode	CHAR(4)	NOT NULL,	
	sc_score	INT	NOT NULL
);

DROP TABLE tbl_score;

INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES('20210001','국어',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES('20210001','영어',90);
INSERT INTO tbl_score(sc_stnum, sc_sbcode, sc_score) VALUES('20210001','수학',90);

CREATE TABLE tbl_subject (
	sb_code	CHAR(4)	,
	sb_name	VARCHAR(20)	NOT NULL,
	sb_prof	VARCHAR(20)	
);

DROP TABLE tbl_subject;

INSERT INTO tbl_subject(sb_code, sb_name, sb_prof) VALUES('S001','영어','은결스크');
INSERT INTO tbl_subject(sb_code, sb_name) VALUES('S001','수학');
INSERT INTO tbl_subject(sb_code, sb_name) VALUES('S001','과학');
INSERT INTO tbl_subject(sb_code, sb_name) VALUES('S001','국어');
INSERT INTO tbl_subject(sb_code, sb_name) VALUES('S001','사회');


	SELECT sc_seq,
				sc_stnum,
				ST.st_name AS stname,
				sc_sbcode,
				SB.sb_name AS sbname,
				sc_score
		FROM tbl_score SC
			LEFT JOIN tbl_student ST
				ON SC.sc_stnum = ST.st_num
			LEFT JOIN tbl_subject SB
				ON SC.sc_sbcode = SB.sb_code
			ORDER BY sc_stnum, sc_sbcode;	
