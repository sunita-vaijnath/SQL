-- AGGREGATE FUNCTION
 -- COUNT IS USED TO OBTAIN THE NO OF VALUES PRESENT IN COLUMN
 
 SELECT COUNT(*) FROM EMPLOYEES;
 
 SELECT COUNT(*)
 FROM EMPLOYEES 
 WHERE DEPTID = 101;

SELECT COUNT(DISTINCT DEPTID) FROM EMPLOYEES;

SELECT COUNT(*) FROM EMPLOYEES ;

SELECT COUNT(*) AS TOTAL_EMPLOYEES FROM EMPLOYEES WHERE DEPTID = 101;

SELECT COUNT(MANAGERID) AS Employees_With_Manager FROM EMPLOYEES WHERE MANAGERID IS NOT NULL;
-- OR
SELECT COUNT(ManagerID)
FROM Employees;

SELECT COUNT(DISTINCT DEPTID) Total_Departments FROM EMPLOYEES;

-- SUM() FUNCTION IS USED TO OBTAIN SUMMATION OF VALUE PRESENT IN COLUMN
 
 SELECT SUM(SALARY) FROM EMPLOYEES;

select sum(SALARY) AS IT_TOTAL_SALARY FROM EMPLOYEES WHERE DEPTID = 101;

SELECT SUM(SALARY) AS TOTAL_SALARY FROM EMPLOYEES;

SELECT SUM(Salary)
FROM Employees WHERE DeptID = 101;

SELECT sum(SALARY) AS Total_Salary_101_103
FROM EMPLOYEES WHERE DEPTID IN (101 , 103);

-- AVG() FUNCTION IS USED TO CALCULATE THE AVERAGE OF VALUES PRESENT IN COLUMN

select AVG(SALARY) FROM EMPLOYEES;

SELECT AVG(SALARY) AS FINANCE_Average_Salary FROM EMPLOYEES WHERE DEPTID = 103;

-- MIN() FUNC IS USED TO TO OBTAIN THE MINIMUM VALUE IN THE COLUMN
SELECT MIN(SALARY) AS Lowest_Salary FROM EMPLOYEES;

SELECT MIN(SALARY) AS FINANCE_Lowest_Salary FROM EMPLOYEES WHERE DEPTID = 103;

SELECT MIN(HIREDATE) FROM EMPLOYEES;

-- max() func is used to calculate the maximum value in the column

select max(salary) from employees; 

select max(salary) as highest_it_salary from employees where deptid = 101; 

select max(hiredate) from employees; 

select max(salary) as highest_salary from employees; 

select max(salary) as sales_highest_salary from employees where deptid = 105; 

-- group by clause is used to group the records that has similar value in one or more column 

-- how many employees in each department 
select deptid , count(*) as total_employees
from employees 
group by deptid;

-- avg salary of each department
select deptid , avg(salary) as average_salary
from employees
group by deptid; 

-- which dept has highest payroll
select deptid , max(salary)
from employees 
group by deptid; 

-- how many emp works in each city
select location , count(*) as total_emp
from employees
group by location;

-- what is total project budget by project type
select * from projects;

select deptid , sum(salary) as total_salary
from employees
group by deptid;

select deptid , min(salary) as lowest_salary
from employees
group by deptid; 

select deptid , max(salary) as highest_salary
from employees
group by deptid; 

-- having clause is used to filter the groups after applying group by clause
-- basically it filters the groups 

select deptid , count(*)
from employees
group by deptid
having count(*)>3;

select deptid , count(*)
from employees 
where salary>50000
group by deptid
having count(*)>2
order by deptid;

select deptid, avg(salary)
from employees
group by deptid
having avg(salary)>70000;

select deptid , count(*)
from employees 
group by deptid
having count(*)>5;

select location , avg(salary)
from employees
group by location
having avg(salary)>75000;

select managerid , count(*)
from employees
group by managerid
having count(*)>5;

select deptid , max(salary)
from employees
group by deptid
having max(salary)>100000;

select deptid , sum(salary) as total_salary 
from employees
group by deptid
having sum(salary) > 300000;

select deptid , count(*)
from employees
where salary > 50000
group by deptid
having count(*) > 3;

select  deptid , avg(salary) as average_salary
from employees
where salary>60000
group by deptid
having avg(salary) > 80000;












