SELECT FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE
FROM EMPLOYEES;

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



