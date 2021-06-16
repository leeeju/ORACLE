SELECT  EMAIL, UPPER(EMAIL), LOWER(EMAIL), INITCAP(EMAIL)
FROM EMP;

SELECT  *
FROM EMP
WHERE EMAIL = UPPER('sking');

SELECT  *
FROM EMP
WHERE LOWER(EMAIL) ='sking';

select email, substr(email, 1, 3)
from emp;

select email, substr(email, 1, 3), substr(email, -3)
from emp;

select email, instr(email, 'S')
from emp;

select job_id, substr(job_id, 1, instr(job_id, '_') -1) as 앞문자
from emp;

select email, length(email)
from emp;

select trim('    aaaa  adasd    ')
from dual;

select email, lpad(email, 15 ,'*') , rpad(email, 15, '*')
from emp;

select email, replace(email, 'S', '****')
from EMP;

select COMMISSION_PCT, ROUND(COMMISSION_PCT, 1), TRUNC(COMMISSION_PCT, 1)
from emp;

select sysdate +50  from dual;

select trunc (sysdate - to_date('2020.01.31', 'YYYY-MM-DD'))
from dual;

select hire_date, add_months(hire_date, 5)
from emp;

select hire_date, add_months(hire_date, 5),
 	add_months(hire_date, -5)
from emp;

select  months_between(sysdate, to_date('2020.01.31', 'YYYY-MM-DD'))
from dual;

select  last_name, hire_date,
          trunc(months_between(sysdate,hire_date)) AS
from emp
order by 3 desc;

select  *
from emp
where extract(year from hire_date) = 2005;

select  *
from emp
where extract(month from hire_date) = 5;

select hire_date, last_day(hire_date)
from emp;

select hire_date, next_day(hire_date, 2)
from emp;

select LAST_NAME, SALARY, SALARY * NVL(COMMISSION_PCT) AS,
 	SALARY + ( SALARY * NVL(COMMISSION_PCT, 0 )) AS 
 from emp;

select last_name, department_id, nvl2(department_id, '부서 배정', '부서미배정')AS 부서배정
from emp;

select last_name, salary, salary *2 AS BONUS
from emp;

select last_name, salary, 
  	case department_id
	when 10  then salary *2
	when 20  then salary *3
	when 40  then salary *4
	else
	salary + 1
	end AS BONUS
from emp;


select last_name, salary, 
  	decode(department_id,
	10,  salary *2,
	20,  salary *3,
	40,  salary *4, salary * 1)
	AS BONUS
from emp;

select last_name, salary, 
  	case 
               when   JOB_ID LIKE '%CLERK%'  then salary *2
               when    JOB_ID LIKE '%MAN%' then salary *3
               when   JOB_ID LIKE '%REP%'  then salary *4
	else
	salary * 1
	end AS BONUS
from emp;

SELECT SALARY, TO_CHAR(SALARY, '$99,999')
FROM EMP;

SELECT SALARY, TO_CHAR(SALARY, '$000,000')
FROM EMP;


SELECT  TO_CHAR(0, '9'),TO_CHAR(0, '0')
FROM DUAL;

SELECT SALARY, TO_CHAR(SALARY, 'L999,999')
FROM EMP;

SELECT  SYSDATE, TO_CHAR(SYSDATE, 'MM-DD. YYYY')
FROM DUAL;

SELECT  TO_CHAR(SYSDATE, 'YY-MM-DD-HH-MI-SS')
FROM DUAL;


SELECT  TO_CHAR(SYSDATE, 'YY-MM-DD AM HH-MI-SS')
FROM DUAL; 

SELECT  TO_CHAR(SYSDATE, 'YY-MM-DD DY AM HH-MI-SS')
FROM DUAL; 

SELECT  TO_CHAR(SYSDATE, 'YY-MM-DD(DY) HH24:MI:SS')
FROM DUAL; 

select last_name, salary, salary *0.15 AS New_salary
from emp;

select  LAST_NAME,HIRE_DATE AS REVIEW
from emp
where extract(month from hire_date) = 5;

select LAST_NAME, HIRE_DATE AS MONTHS_WORKED
from emp;


select  last_name, hire_date,
          trunc(months_between(sysdate,hire_date)) AS MONTHS_WORKED
from emp
order by 3 desc;


SELECT last_name, TO_CHAR(SALARY, '$99,999') AS salary 
FROM EMP;

SELECT last_name, lpad(SALARY, 15 ,'$99,999') AS "salary" 
FROM EMP;

select last_name, length(last_name)
from emp
where substr(last_name, 1, 1) in ('J', 'A', 'M');

select last_name, hire_date, to_char(hire_date, 'DAY')  AS DAY
from emp;

select last_name, salary, 
	trunc(salary / 1000),
	rpad(' ',trunc(salary/1000) +1, '*') AS EMPLOYEE_GREAD
from emp
order by salary desc;


select last_name, job_id ,
  	case 
               when   JOB_ID LIKE '%CLERK%'  then '☆'
               when   JOB_ID LIKE '%REP%' then   '☆☆'
               when   JOB_ID LIKE '%MAN%'  then  '☆☆☆'
	else  '  '
	end AS GREAD
from emp;


select max(sselect max(salary), min(salary)
from emp;
alary), min(salary)
from emp;

select department_id, count(*) AS 인원수
from emp
group by department_id
order by 1;


select department_id, job_id, count(*) AS 인원수
from emp
group by department_id,job_id
order by 1;


select department_id , count(*) AS 인원수
from emp
group by department_id
having count(*) >= 10
order by 1;

select to_char(hire_date, 'YYYY') AS 입사년도, count(*) AS 인원수
from emp
group by to_char(hire_date, 'YYYY')
order by 1;

CREATE TABLE EMP1
AS
SELECT + FROM DA20.EMP1;

SELECT + FROM EMP1;

select max(salary), min(salary), sum(salary), average(sum)
from emp;

select count(*) AS 총사원수
from emp;


select job_id , count(*) AS 인원수
from emp
group by job_id
having count(*) >= 10
order by 1;

select department_id, job_id, count(*) AS 인원수
from emp
group by department_id,job_id
order by 1;

select max(salary), min(salary) ,
	max(salary) - min(salary) AS DIFFERENCE
from emp
order by '' desc;	

select count (MANAGER_ID), min(salary) AS 인원수
	min(salary) >= 5000
from emp;

select MANAGER_ID,salary, count AS 인원수
from emp;
group by salary
having count >= 5000
order by 1 ;

