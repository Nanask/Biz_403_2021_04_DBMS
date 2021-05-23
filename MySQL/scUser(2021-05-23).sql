create table tbl_student (
	st_num	CHAR(5)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL,	
	st_tel	VARCHAR(25)	NOT NULL,	
	st_addr	VARCHAR(125),		
	st_grade int	NOT NULL,
	st_dpcode	CHAR(3)	NOT NULL,	
	st_dname	VARCHAR(25)	NOT NULL,	
	st_dpro	VARCHAR(25)	NOT NULL	
);

create table tbl_dept (
	dp_code	CHAR(3)		PRIMARY KEY,
	dp_name	VARCHAR(25)	NOT NULL,	
	dp_pro	VARCHAR(25)	NOT NULL	
);

create table tbl_score (
	sc_seq	BIGINT	auto_increment	PRIMARY KEY,
	sc_stnum	CHAR(5)	NOT NULL,	
	sc_sbname	VARCHAR(25)	NOT NULL,
	sc_score	INT	NOT NULL	
);

select * from tbl_dept;
select * from tbl_score;
select * from tbl_student;

drop table tbl_student;

insert into tbl_student(st_num,st_name,st_tel,st_addr,
		st_grade,st_dpcode,st_dname,st_dpro) 
        values('S0001','김영진','010-111-1111','광주광역시 북구',
        3,'008','미술학','필리스');
        
  


