--[10/27] 기본 SELECT문 연습 예제
--1 EMPLOYEES 테이블에서 급여가 3000이상인 사원의 정보를 사원번호, 이름, 담당업무, 급여를 출력하라
SELECT EMPLOYEE_ID 사원번호, FIRST_NAME 이름, JOB_ID 담당업무, SALARY 급여
FROM EMPLOYEES
WHERE SALARY >= 3000;

--2 EMPLOYEES 테이블에서 담당 업무가 ST_MAN인 사원의 정보를 사원번호, 이름, 담당업무, 급여, 부서번호를 출력하라.
SELECT EMPLOYEE_ID 사원번호, FIRST_NAME 이름, JOB_ID 담당업무, SALARY 급여, DEPARTMENT_ID 부서번호
FROM EMPLOYEES
WHERE JOB_ID = 'ST_MAN';

--3 EMPLOYEES 테이블에서 입사일자가 2006년 1월 1일 이후에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
SELECT EMPLOYEE_ID 사원번호, FIRST_NAME 이름, JOB_ID 담당업무, SALARY 급여, HIRE_DATE 입사일자, DEPARTMENT_ID 부서번호
from employees
where hire_date > '2006/01/01';

--4 EMPLOYEES 테이블에서 급여가 3000에서 5000사이의 정보를 이름, 담당업무, 급여, 부서번호를 출력하라
select FIRST_NAME 이름, JOB_ID 담당업무, SALARY 급여, department_id 부서번호
from employees
where salary > 3000 and salary < 5000;

--5 EMPLOYEES 테이블에서 입사일자가 05년도에 입사한 사원의 정보를 사원번호, 이름, 담당업무, 급여, 입사일자, 부서번호를 출력하라.
select employee_id 사원번호, first_name 이름, job_id 담당업무, salary 급여, hire_date 입사일자, department_id 부서번호
from employees
where hire_date >= '2005/01/05' and hire_date <= '2005/12/31';

--6 EMPLOYEES 테이블에서 사원번호, 이름, 급여, 업무번호, 입사일, 상사의 사원번호를 출력하라.
--  이때 이름은 성과 이름을 연결하여 NAME이라는 별칭으로 출력하라.
select employee_id 사원번호, FIRST_NAME || ' ' || LAST_NAME 이름, salary 급여, hire_date 입사일, manager_id 상사번호
from employees;

--7 EMLPYEES 테이블에서 사원의 성과 이름은 Name, 업무번호는 Job, 급여는 Salary, 연봉에 $100보너스를 추가하여 계산한 값은 
--  increased Ann_Salary, 급여에 $100 보너스를 추가하여 계산한 연봉은 Increased Salary라는 별칭으로 출력하라
select first_name || ' ' || last_name Name, job_id JOB, salary Salary, (salary*12)+100 "increased Ann_Salary", salary+100 "increased Salary"
from employees;

--8 EMPLOYEES 테이블에서 모든 사원의 이름(FIRST_NAME)과 연봉을 
--  "이름: 1 Year Salary = $연봉" 형식으로 출력하고, 1Year Salary라는 별칭을 붙여 출력하라
--  EX) King: 1 Year Salary = $288000
select first_name || ' : 1 Year Salary = $'|| salary*12 "1Year Salary"
from employees;

--9 부서별로 담당하는 업무ID를 한번씩만 출력하라
select distinct job_id 업무ID
from employees;

--10 부서에서 예산 편성 문제로 급여 정보 보고서를 작성하려고 한다. 
--   EMPLOYEES 테이블에서 급여가 $7,000~$10,000범위 이외인 사람의 성과 이름(NAME으로 별칭) 및 급여를 급여가 작은 순서로 출력하라.
select first_name || ' ' ||last_name "NAME", salary "SALARY"
from employees
where salary between 7000 and 10000 
order by salary asc;

