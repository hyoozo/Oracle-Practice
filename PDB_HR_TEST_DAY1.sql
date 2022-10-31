-- DEPARTMENTS 테이블의 모든 내용 출력
SELECT * FROM DEPARTMENTS;

-- <문제> EMPLOYEES 테이블의 모든 내용 출력
SELECT * FROM EMPLOYEES;

--<문제> 사원의 이름과 급여와 입사일자만을 출력하는 SQL 문을 작성하자.
SELECT FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES;

--칼럼 이름에 별칭 지정하기
--컬럼을 쓰고 AS 뒤에 별칭을 넣는다.(한글도 가능)
-- 공백문자나 $,_,# 등 특수문자는  ""을 사용한다.
SELECT DEPARTMENT_ID AS DepartmentNO, DEPARTMENT_NAME AS DepartmentName
FROM DEPARTMENTS;

SELECT DEPARTMENT_ID 부서번호, DEPARTMENT_NAME 부서명
FROM DEPARTMENTS;

SELECT FIRST_NAME || '의 직급은' || JOB_ID || '입니다' AS 직급
FROM EMPLOYEES;

SELECT DISTINCT JOB_ID
FROM EMPLOYEES;

SELECT FIRST_NAME || ' ' || LAST_NAME 이름, SALARY 급여, HIRE_DATE 입사일
FROM EMPLOYEES;

SELECT JOB_ID FROM EMPLOYEES;

SELECT DISTINCT FIRST_NAME, JOB_ID
FROM EMPLOYEES;

SELECT DEPARTMENT_ID
FROM EMPLOYEES;

--DISTINCT 중복제어
SELECT DISTINCT DEPARTMENT_ID
FROM EMPLOYEES;

--급여를 10000 이상 받는 직원을 대상
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM employees WHERE SALARY > 10000;

SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 5000;

--사원의 급여를 1000인상하여 사원번호, 사원명, 급여, 인상급여, 입사일을 출력하시오
SELECT EMPLOYEE_ID 사원번호, FIRST_NAME 사원명, SALARY 급여, SALARY+1000 인상급여, HIRE_DATE
FROM EMPLOYEES;

--<문제> 직원테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
SELECT *
FROM EMPLOYEES
WHERE department_id = 110;

--<문제> 직원테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번과 이름, 급여를 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY < 5000;

--문자 데이터 조회
--이름이 John인 사람의 사원번호와 직원명과 업무ID을 출력하라.
SELECT employee_id, first_name, job_id
FROM EMPLOYEES
WHERE first_name = 'John';

--<문제> 급여가 5000에서 10000이하 직원 정보 출력
SELECT *
FROM EMPLOYEES
WHERE salary > 5000 AND salary < 10000;

--<문제>사원번호가 134이거나 201이거나 107인 직원 정보 출력
SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 134 OR EMPLOYEE_ID = 201 OR EMPLOYEE_ID = 107;

--부서 번호가 100번이거나 직급이 FI_MGR인 직원
SELECT EMPLOYEE_ID, FIRST_NAME, PHONE_NUMBER, DEPARTMENT_ID, JOB_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 100 OR JOB_ID = 'FI_MGR';

--부서 번호가 100번이 아닌 직원
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
WHERE NOT DEPARTMENT_ID = 100;

--<문제> 부서번호가 10,20,30 중 하나에 소속된 직원의 직원번호, 이름, 급여를 출력
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(10,20,30);

--<문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE SALARY BETWEEN 2500 AND 4500;

--<문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라
SELECT EMPLOYEE_ID, LOFRIST_NAME
FROM EMPLOYEES
WHERE LOWER (FIRST_NAME) LIKE '%a%'; --???

--<문제> 자신의 직속상관이 없는 직원의 전체 이름과 직원번호, 업무ID를 출력하라
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, JOB_ID
FROM EMPLOYEES
WHERE MANAGER_ID IS NULL; --NULL인 데이터를 가져와라.

--<문제> 커미션을 받는 사원만 출력하되 사원번호, 이름, 급여, 수당율, 수당금액(계산식작성 - 급여*수당율)을 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, COMMISSION_PCT, SALARY*COMMISSION_PCT COMMISSION
FROM EMPLOYEES                                                           -- 1칸띄우고 별칭주기.
WHERE COMMISSION_PCT IS NOT NULL; --NULL이 아닌데이터를 가져와라.

--정렬을 위한 ORDER BY 절 (오름차순: ASC / 내림차순: DESC)
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
ORDER BY EMPLOYEE_ID DESC;

   --   컬럼 1     , 컬럼 2     , 컬럼3 . . . 
SELECT EMPLOYEE_ID, FIRST_NAME
FROM EMPLOYEES
ORDER BY 1 DESC;
--오라클은 인덱스가 1번부터 시작함.
--ORDER BY 컬럼명(또는 컬럼순번)

--NULL를 포함한 컬럼은 ASC: NULL 레코드를 제일 마지막에 / DESC: NULL 레코드를 제일 먼저 출력
SELECT EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY DEPARTMENT_ID DESC;

--<문제> 직원번호, 이름, 급여, 부서번호를 급여가 높은 순으로 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
ORDER BY SALARY DESC, EMPLOYEE_ID DESC;
-- 동시에 정렬X 급여로 먼저 정렬 후 급여가 같을때 아이디로도 정렬이 필요하다.

--<문제> 입사일이 가장 최근인 직원 순으로 직원 번호, 이름, 입사일을 출력하라.
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC; 
--만약 가장 오래된 입사일이 기준이라면 ASC(오름차순)를 사용하면 됨.

--<문제> 부서번호가 20, 50번 부서에서 근무하는 모든 사원들의 이름(FIRST_NAE), 부서번호, 급여를
-- 알파벳순으로 출력하라.
SELECT FIRST_NAME, DEPARTMENT_ID, SALARY
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN(20, 50) --WHERE DEPARTMENT_ID = 20 OR DEPARTMENT_ID = 50 같은 표현
ORDER BY FIRST_NAME ASC; --끝나는 명령어에 ; 붙이면 거기까지만 실행됨.