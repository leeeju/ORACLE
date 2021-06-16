

select count(*) AS "TOTAL",

count(case when to_char(hire_date, 'YYYY') = '2002' then 1 end ) AS "2002",
count(case when to_char(hire_date, 'YYYY') = '2003' then 1 end ) AS "2003",
count(case when to_char(hire_date, 'YYYY') = '2004' then 1 end ) AS "2004",
count(case when to_char(hire_date, 'YYYY') = '2005' then 1 end ) AS "2005"

from emp ;

create table dept
as
select * from HR.DEPT;

create table LOCATIONS
as
select * from HR.LOCATIONS;

create table JOB_GRADES
as
select * from HR.JOB_GRADES;

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp, dept
where emp.DEPARTMENT_ID = dept.DEPARTMENT_ID ;

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp join dept on (emp.DEPARTMENT_ID = dept.DEPARTMENT_ID);

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp join dept using (DEPARTMENT_ID);

select E.EMPLOYEE_ID, E. LAST_NAME, D.DEPARTMENT_NAME
from emp E join dept D 
        on (E. DEPARTMENT_ID = D. DEPARTMENT_ID);
        
select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp, dept
where emp.DEPARTMENT_ID = dept.DEPARTMENT_ID(+) ;   
        
select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp, dept
where emp.DEPARTMENT_ID(+) = dept.DEPARTMENT_ID ;         
        
        
select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp LEFT OUTER JOIN  dept USING (DEPARTMENT_ID);    

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp FULL OUTER JOIN  dept using (DEPARTMENT_ID);
     
     
  

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp join dept on (emp.DEPARTMENT_ID = dept.DEPARTMENT_ID);

select LOCATION_ID, LAST_NAME, DEPARTMENT_NAME, JOB_ID
from emp, dept
where emp.DEPARTMENT_ID = dept.DEPARTMENT_ID and dept.LOCATION_ID =1700;

select last_name AS "Employee",
         EMPLOYEE_ID AS "Emp#",
         MANAGER_ID AS "Manager"
from emp, dept
where emp.MANAGER_ID = dept.MANAGER_ID ;

select EMPLOYEE_ID, LAST_NAME, DEPARTMENT_NAME
from emp, dept
where emp.DEPARTMENT_ID = dept.DEPARTMENT_ID ;

select last_name AS "Employee", 
         EMPLOYEE_ID AS "Emp", 
         MANAGER_name AS "Manager",
         MANAGER_ID AS "Mgr"
from emp join dept using(MANAGER_ID) ;

create table SALGRADE
as
select * from HR.SALGRADE;

select LAST_NAME, DEPARTMENT_NAME
from emp join dept on (emp.DEPARTMENT_ID = dept.DEPARTMENT_ID)
where LAST_NAME like '%A%' ;

select LAST_NAME, DEPARTMENT_NAME
from emp join dept on (emp.DEPARTMENT_ID = dept.DEPARTMENT_ID)
where upper(LAST_NAME) like '%A%' ;

select LAST_NAME, DEPARTMENT_NAME
from emp join dept on (emp.DEPARTMENT_ID = dept.DEPARTMENT_ID)
where COMMISSION_PCT is not null;

select LOCATION_ID, LAST_NAME, DEPARTMENT_NAME, JOB_ID
from emp, dept
where emp.DEPARTMENT_ID = dept.DEPARTMENT_ID and dept.LOCATION_ID =1700;

create table JOB_GRADES
as
select * from HR.JOB_GRADES;

select M.last_name, M.hire_date
from emp E join emp M on (E.hire_date < M.hire_date)
where E.last_name in ('Chen');

select last_name, hire_date
from emp
where hire_date > (select hire_date from emp where last_name like '%Chen%');

select E.LAST_NAME AS Employee, 
         E.EMPLOYEE_ID AS Emp#,       
         M.MANAGER_ID AS Manager,
         M.MANAGER_ID AS Mgr#
from emp E, emp M
where E.MANAGER_ID = M.EMPLOYEE_ID(+) ;




SELECT LAST_NAME, SALARY
FROM EMP
WHERE SALARY > (SELECT AVG(SALARY) FROM EMP );
ORDER 2 DESC ;


SELECT LAST_NAME, SALARY
FROM EMP
WHERE SALARY = (SELECT MIN(SALARY) FROM EMP );
ORDER 2 DESC ;

SELECT LAST_NAME, DEPARTMENT_ID
FROM EMP
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
			FROM EMP
			WHERE LAST_NAME = 'Chen');


SELECT *
FROM EMP
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
			FROM DEPT
			WHERE DEPARTMENT_NAME = 'IT');
            
            
SELECT *
FROM EMP
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
			FROM DEPT
			WHERE LOCATION_ID = 
				(SELECT LOCATION_ID
				FROM LOCATIONS
				WHERE CITY LIKE '%Seattle%'	));
                
                
SELECT SALARY
FROM EMP
WHERE JOB_ID LIKE 'IT%'; 

SELECT *
FROM EMP
WHERE SALARY >= ANY	
(SELECT SALARY
FROM EMP
WHERE JOB_ID LIKE 'IT%'); 

SELECT *
FROM EMP
WHERE SALARY >= 20000;

SELECT ROWNUM AS 순위, LAST_NAME, SALARY 
FROM (SELECT LAST_NAME, SALARY 
	FROM EMP
	ORDER BY SALARY DESC)
WHERE ROWNUM <= 10;


SELECT LAST_NAME, EMPLOYEE_ID, JOB_ID
FROM EMP
WHERE DEPARTMENT_ID IN ( SELECT DEPARTMENT_ID
			FROM DEPT
			WHERE LOCATION_ID = 
				(SELECT LOCATION_ID
				FROM LOCATIONS
				WHERE CITY LIKE '%Seattle%'));
                
SELECT LAST_NAME, HIRE_DATE
FROM EMP
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
			FROM EMP
			WHERE LAST_NAME = 'Chen');
            
SELECT LAST_NAME, DEPARTMENT_ID
FROM EMP
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
			FROM EMP
			WHERE LAST_NAME = 'Chen') AND != 'Chen';
            
SELECT EMPLOYEE_ID, LAST_NAME, SALARY
FROM EMP
WHERE SALARY > (SELECT AVG(SALARY) FROM EMP );

SELECT LAST_NAME, DEPARTMENT_ID
FROM EMP
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
			FROM EMP
			WHERE LAST_NAME = 'Chen');
            
            

SELECT EMPLOYEE_ID, JOB_ID
FROM EMP
WHERE DEPARTMENT_ID = ( SELECT DEPARTMENT_ID
			FROM DEPT
			WHERE DEPARTMENT_NAME = 'Sales');    
            
SELECT DEPARTMENT_ID, LAST_NAME, SALARY
FROM EMP
WHERE SALARY >= (SELECT AVG(SALARY) 
        FROM DEPT
      WHERE LAST_NAME LIKE '%T%') ;

SELECT LAST_NAME, HIRE_DATE, SALARY
FROM EMP
WHERE COMMISSION_PCT IN ( SELECT COMMISSION_PCT
			    FROM DEPT
			    WHERE COMMISSION_PCT > 
                (SELECT SALARY
                 FROM DEPT
                 WHERE LAST_NAME LIKE '%Fox%'));
                 
                 
                 
