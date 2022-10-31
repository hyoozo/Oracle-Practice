--10/31 수업
create table emp01(
empno number(4) ,
ename varchar2(10),
job varchar2(9),
deptno number(4)
);
-- 테이블 삭제
drop table emp01 purge;

--테이블 생성
create table emp01(
empno number(4) not null,
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);

--테이블 데이터 삽입 *문자표현시 ' ~' 작은 따옴표로 묶어주기.
insert into emp01  
values(7499,'allen','salesman',30);
insert into emp01
values (7499,'jones','salesman',20);

--테이블 조회
select * from emp01;

create table emp02(
empno number(4) unique,
ename varchar2(10) not null,  --varchar2 : 가변길이 문자형 테이터 타입.
job varchar2(9),              --varchar2(byte) : 영문 1byte / 한글 3byte
deprno number(4)
);

insert into emp02
values(7499,'allen', 'salesman',30);
insert into emp02
values(7499,'allen', 'salesman',30); --ORA-00001: 무결성 제약 조건(HR.SYS_C007428)에 위배됩니다 (unique로 중복을 허용하지않아서 오류남)

insert into emp02(empno, ename, job, deprno)
values(null, 'jones', 'manager',20);
insert into emp02(empno, ename, job, deprno)
values(null, 'jones', 'salesman',10); --UNIQUE 는 NULL 값을 예외로 간주한다. 그래서 입력이 된다.
                                      --null값도 제외하려면 EMPNO NUMBER(4) NOT NULL UNIQUE 라고 기술해야된다. --'UK'라고도 한다.
select * from emp02;

--HR 사용자가 생성한 모든 테이블 이름을 조회한다
select table_name from user_tables
order by table_name desc;

--제약조건 확인하기 (user_constraints)
select constraint_name, constraint_type, table_name
from user_constraints
where table_name='EMP02'; --'emp02' 소문자 안됨, 대문자로 꼭 기입해야됨.

--제약조건이 지정된 칼럼명 저장 (user_cons_columns)
select owner, constraint_name, table_name, column_name
from user_cons_columns
where table_name ='EMP02';

drop table emp03;
create table emp03(
empno number(4) primary key, --'PK'라고도 한다.
ename varchar2(10) not null,
job varchar2(9),
deptno number(4)
);
insert into emp03
values(7499,'allen','salesman',30);

select*from emp03;

insert into emp03
values(7499,'jones','manager',20); --ORA-00001: 무결성 제약 조건(HR.SYS_C007446)에 위배됩니다 (동일한 7499 사원번호로 오류)

insert into emp03
values(null,'jones','manager',20); --ORA-01400: NULL을 ("HR"."EMP03"."EMPNO") 안에 삽입할 수 없습니다 (null을 저장해서 오류)

select constraint_name, constraint_type, table_name
from user_constraints
where table_name='EMP03';

--부서테이블(부모테이블)
create table dept01(
deptno number(2) primary key, --부서번호
dname varchar2(14) not null, --부서명
loc varchar2(13) --지역명
);
insert into dept01 (deptno,dname,loc) values(10,'accounting','new york');
insert into dept01 (deptno,dname,loc) values(20,'research','dallas');
insert into dept01 (deptno,dname,loc) values(30,'sales','chicago');
insert into dept01 (deptno,dname,loc) values(40,'operations','boston');

insert into emp03
values(7566,'jones','manager',50);

create table emp04(
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(9),
deptno number(2) references dept01(deptno)
);

insert into emp04
values(7499,'allen','salesman',30);

select*from emp04;

insert into emp04
values(7566,'jones','manager',50); --ORA-02291: 무결성 제약조건(HR.SYS_C007487)이 위배되었습니다- 부모 키가 없습니다 (50번이 존재하지 않기 때문에)

--오류메시지에 제약 조건명 위배 되었다고 나타나므로 확인하기 위해 USER_CONSTRAINTS데이터 딕셔너리로 살펴보자.
select constraint_name, constraint_type, table_name, r_constraint_name
from user_constraints
where table_name='EMP04';

--CHECK 제약조건 사용 : 설정된 값 이외의 값이 들어오면 오류 메시지와 함께 명령이 수행되지 못한다.
CREATE TABLE EMP05(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
GENDER VARCHAR2(1) CHECK (GENDER IN('M','F'))
);

INSERT INTO EMP05(EMPNO, ENAME, GENDER)
VALUES(7566,'JONES','M');

SELECT *FROM EMP05;

INSERT INTO EMP05(EMPNO,ENAME, GENDER)
VALUES(7566,'JONES','A');  --ORA-02290: 체크 제약조건(HR.SYS_C007509)이 위배되었습니다 (GENDER값을 잘못주어서 오류)

--SEARCH_CONDITION 으로 제약 조건 알아보기
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP05';

CREATE TABLE EMP06(
EMPNO NUMBER(4) CONSTRAINT EMP06_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMP06_ENAME_IN NOT NULL,
JOB VARCHAR2(9) CONSTRAINT EMP06_JOB_UK UNIQUE,
DEPTNO NUMBER(2) CONSTRAINT EMP06_DEPTNO_FK REFERENCES DEPT01 (DEPTNO)
);
INSERT INTO EMP06
VALUES(7499,'ALLEN','SALESMAN',30);
SELECT *FROM EMP06;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME='EMP06';

--[ 테이블 레벨 방식으로 제약 조건 지정하기]
--1. 칼럼 레벨로 제약 조건 지정하는 방식
CREATE TABLE EMP07(
EMPNO NUMBER(4) PRIMARY KEY,
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9) UNIQUE,
DEPTNO NUMBER(2) REFERENCES DEPT01(DEPTNO)
);

--2. 테이블 레벨로 제약조건을 지정하는 방식 *CONSTRAINT 키워드 사용하기 ( 가장 좋은 코드라고 한다)
CREATE TABLE EMP08(
EMPNO NUMBER(4),
ENAME VARCHAR2(10) NOT NULL,
JOB VARCHAR2(9),
DEPTNO NUMBER(2),
CONSTRAINT EMP08_EMPNO_PK PRIMARY KEY(EMPNO),
CONSTRAINT EMP08_JOB_UK UNIQUE(JOB),
CONSTRAINT EMP08_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT01(DEPTNO)
);                                                    --'부모테이블'의 부서테이블(부서번호)
                                                --REFERENCES : 부모테이블의 칼럼을 참조하게 외래키 제약조건 설정

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP08';

-- CONSTRAINT_NAME : 제약조건명
-- CONSTRAINT_TYPE : 제약조건유형
-- TABLE_NAME      : 제약조건이 속한 테이블명
-- R_CONSTRAINT_NAME : 제약조건의 소유자와 이름
-- SEARCH_CONDITION : 칼럼값으로 제약조건알아보기

CREATE TABLE DEPT02(
DEPTNO NUMBER(2),
DNAME VARCHAR2(14) NOT NULL,
LOC VARCHAR2(13),
CONSTRAINT DEPT02_DEPTNO_PK PRIMARY KEY(DEPTNO)
);
INSERT INTO DEPT02 VALUES(10,'ACCOUNTING', 'NEW YORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH','DALLAS');
SELECT*FROM DEPT02;

DROP TABLE EMP02;
CREATE TABLE EMP02(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10) NOT NULL,
 JOB VARCHAR2(9),
 DEPTNO NUMBER(2),
 CONSTRAINT EMP02_EMPNO_PK PRIMARY KEY(EMPNO),
 CONSTRAINT EMP02_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT02(DEPTNO)
 );
 SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, SEARCH_CONDITION
FROM USER_CONSTRAINTS
WHERE TABLE_NAME='EMP02';

INSERT INTO EMP02 VALUES(7499,'ALLEN','SALESMAN',10);
INSERT INTO EMP02 VALUES(7369,'SMITH','CLERK',20);

SELECT*FROM EMP02;

DELETE FROM DEPT02 WHERE DEPTNO=10;
--ORA-02292: 무결성 제약조건(HR.EMP02_DEPTNO_FK)이 위배되었습니다- 자식 레코드가 발견되었습니다 
--DEPT02의 DEPTNO 10번을 지우려고 하니, 자식레코드에서 10을 사용하고있어서 오류

CREATE TABLE TREATMENT(
 T_NO NUMBER(4) NOT NULL,
 T_COURSE_ABBR VARCHAR2(3) NOT NULL,
 T_COUTSE VARCHAR2(30) NOT NULL,
 T_TEL VARCHAR2(15) NOT NULL,
 CONSTRAINT TREATMENT_NO_PK PRIMARY KEY(T_NO),
 CONSTRAINT TREATMENT_COUTSE_ABBR_UK UNIQUE(T_COURSE_ABBR)
 );
INSERT INTO TREATMENT VALUES(1001,'NS','신경외과','02-3452-1009');
INSERT INTO TREATMENT VALUES(1002,'OS','정형외과','02-3452-2009');
INSERT INTO TREATMENT VALUES(1003,'C','순환기내과','02-3452-3009');
SELECT*FROM TREATMENT;

CREATE TABLE DOCTOR(
 D_NO NUMBER(4) NOT NULL,      --닥터넘버
 D_NAME VARCHAR2(20) NOT NULL, --닥터이름
 D_SSN CHAR(14) NOT NULL,      --닥터주민번호
 D_EMAIL VARCHAR2(80) NOT NULL,--닥터이메일
 D_MAJOR VARCHAR2(50) NOT NULL,--닥터전문의이름
 T_NO NUMBER(4),               --진료번호
 CONSTRAINT DOCTOR_D_NO_PK PRIMARY KEY(D_NO)
 );
 
ALTER TABLE DOCTOR
ADD CONSTRAINT DOCTOR_T_NO FOREIGN KEY(T_NO) REFERENCES TREATMENT(T_NO)
ON DELETE CASCADE;
SELECT*FROM DOCTOR;