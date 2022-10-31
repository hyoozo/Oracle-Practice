--[1. 테이블 구조 정의]
--사원 번호, 사원명, 급여 3개의 칼럼으로 구성된 EMP01 테이블
CREATE TABLE EMP01(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(20),
 SAL NUMBER(7,2)
 );
 
 SELECT * FROM TAB;
 
 SELECT * FROM EMP01;
 
 --테이블 구조확인
 DESC EMP01;
 
 --[2. 기존 테이블 복사]
 --기존 테이블과 동일한 구조와 내용을 갖는 테이블을 생성한다.
 CREATE TABLE EMPLOYEES02
 AS
 SELECT * FROM EMPLOYEES;
 --SELECT 문을 위와 같이 AS 다음에 기술하여 출력방향이 화면이 아닌 새로운 테이블로 하면 테이블 생성. 
 --즉, EMPLOYEE02 는 EMPLOYEES 테이블이 그대로 복사되어 내용과 구조가 동일한 테이블이 생성된다.
 SELECT * FROM TAB;
 
 SELECT * FROM EMPLOYEES02;
 
 --[3. ALTER TABLE 로 테이블 구조 변경]
 --테이블에서 칼럼의 추가, 삭제, 칼럼의 타입이나 길이를 변경할 때 사용한다.
 
   --1.새로운 칼럼 추가
 ALTER TABLE EMP01
 ADD(JOB VARCHAR2(9));
 
 DESC EMP01;
 
   --2.기존 칼럼 수정
 ALTER TABLE EMP01
 MODIFY(JOB VARCHAR2(30)); --직급을 최대 30자까지 입력할 수 있도록 크기 수정

 --<문제> 이미 존재하는 EMP01 테이블에 입사일 칼럼(CREDATE)을 날짜형으로 추가하라. 
 DESC EMP01;
  ALTER TABLE EMP01
 ADD(CREDATE DATE);
 DESC EMP01;
 
   --3.기존 칼럼명 변경 ( CREDATE 을 REGDATE 로 변경)
 ALTER TABLE EMP01
 RENAME COLUMN CREDATE TO REGDATE;
 DESC EMP01;
   --4.기존 칼럼 삭제
ALTER TABLE EMP01
DROP COLUMN JOB;
DESC EMP01;

--[4. DROP TABLE로 테이블 구조 삭제]
--기존 테이블을 삭제한다. 테이블을 제거하면 테이블에 저장되어 있는 데이터도 함께 제거된다.
--제거된 데이터는 다시 복구하기 힘들기 때문에 명령어 사용시 유의한다.
DROP TABLE EMP01;
--삭제 확인
SELECT * FROM TAB;
--recyclebin 구조 확인
DESC RECYCLEBIN;
--휴지통 보기
SELECT * FROM RECYCLEBIN;
--실수로 지운 테이블이라 삭제를 취소하려면 다음과 같이 복귀하자
FLASHBACK TABLE EMP01 TO BEFORE DROP;
--휴지통 비우기
PURGE RECYCLEBIN;

SELECT * FROM TAB;
 
--새로운 이름으로 복원하는 방법
FLASHBACK TABLE EMP01 TO BEFORE DROP
RENAME TO EMP02;

--휴지통에 넣지 않고 바로 삭제하려면 (완전삭제)
DROP TABLE EMP01 PURGE;

--[5. 테이블 명을 변경하는 RENAME 문]
RENAME EMPLOYEES02 TO EMPLOYEES01;
SELECT * FROM TAB;
--관계형데이터베이스라서 테이블을 반드시 만들어야한다.

--[6. 테이블의 모든 로우를 제거해 TRUNCATE문]
--모든 레코드를 삭제하는건데, 삭제하면 복원이 불가하다! 중요!
SELECT * FROM EMPLOYEES01;
TRUNCATE TABLE EMPLOYEES01;

SELECT * FROM EMPLOYEES01;
