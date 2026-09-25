-- INNER JOIN IS USED TO OBTAIN THE MACTHING RECORDS FROM BOTH TABLE
-------------------------------------------------------------------------------------------------------------------------
-- SYNTAX --
-- ANSI (AMERICAN NATIONAL STANDARD INSTITUTE)
-- 		SELECT COL_NAME
--      FROM TABLE_NAME1 INNER JOIN TABLE_NAME2
--      ON  <JOIN_CONDITION>;
-------------------------------------------------------------------------------------------------------------------------
-- ORACLE:
-- 		SELECT COL_NAME
--      FROM TABLE_NAME1 , TABLE_NAME2
--      WHERE <JOIN CONDITION>;
-------------------------------------------------------------------------------------------------------------------------
-- -------- JOIN CONDITION -----------------
-- T1.COL_NAME = T2.COLNAME
-------------------------------------------------------------------------------------------------------------------------
-- When SQL performs an INNER JOIN, it doesn't magically jump to matching rows.
-- Conceptually, it first thinks like this:

-- Step 1
-- Create all possible combinations
--         ↓
-- (Cartesian Product)

-- Step 2
-- Apply the join condition

-- ON  T1.COL_NAME = T2.COLNAME (eg. Employees.DeptID = Departments.DeptID)

-- Step 3
-- Keep only the matching rows

-- So, in simple terms:
-- INNER JOIN = CROSS JOIN + Matching Condition
----------------------------------------------------------------------------------------------------------------------

-- select name , dname 
-- from employees inner join departments
-- on employees.deptid = departments.deptid;
-- ----------------------------------------------------------------------------------------------------------------------
select * from departments;
-- Q1 Display Employee Name and Department Name.
select name , dname
from employees inner join departments
on employees.deptid = departments.deptid;

-- Q2 Display Employee Name, Department Name, and Employee Salary.
select name , dname, salary
from employees inner join departments
on employees.deptid = departments.deptid;

-- Q3 Display all employees working in the Finance department.
SELECT e.*
FROM Employees e INNER JOIN Departments d
ON e.DeptID = d.DeptID
WHERE d.DName = 'FINANACE';

-- Q4 Display employees along with the department location.
SELECT e.* , d. location
from employees e inner join departments d
on e.deptid = d.deptid;

-- Q5 Display employees whose department is HR.
select e.* , d.dname
from employees e inner join departments d
on e.deptid = d.deptid
where d.dname = 'hr';
-- Q6 Display employee names and their department IDs from both tables.
-- (Use table names to avoid ambiguity.)
select e.DeptID AS EmployeeDeptID, d.DeptID AS DepartmentDeptID
from employees e inner join departments d
on e.deptid = d.deptid;

-- Q7 Display all columns from both tables using an INNER JOIN.
select e.* , d.*
from employees e inner join departments d
on e.deptid = d.deptid;
-- Q8 Display employee names hired after '2023-01-01' along with department names.
select e.name , d.dname
from employees e inner join departments d
on e.deptid = d.deptid
where e.hiredate > '2023-01-01';
-- 🟡 MEDIUM (Q9–Q18)
-- Q9 Display employees earning more than ₹70,000 along with department names.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE SALARY > 70000;
-- Q10 Display employees working in departments located in Mumbai.
SELECT E.NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.LOCATION = 'MUMBAI';
-- Q11 Display all Analysts along with their department names.
SELECT E.NAME ,D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE JOB = 'ANALYST';
-- Q12 Display employee name, department name, and manager ID.
SELECT E.NAME , D.DNAME , MANAGERID
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- Q13Display departments that have employees.
-- (No duplicates.)
SELECT DISTINCT D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;
-- Q14 Display employees whose department location is Delhi and salary is greater than ₹80,000.
SELECT E.*
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.SALARY > 80000 AND D.LOCATION = 'DELHI';
-- Q15 Display employees who joined before 2022 along with department names.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.HIREDATE < '2020-01-01';
-- Q16 Display employee name, department name, and annual salary (Salary × 12).
SELECT E.NAME, D.DNAME, SALARY*12 AS ANNUAL_SALARY
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;
-- Q17 Display employees from the IT department whose salary is greater than ₹90,000.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME = 'IT' AND E.SALARY > 90000;
-- Q18 Display employees and their department locations, sorted by employee name.
SELECT E.NAME , D.LOCATION
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
ORDER BY E.NAME;

-- 🔴 TRICKY (Q19–Q28)
-- Q19 Display employees whose department name starts with 'F'.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D 
ON E.DEPTID = D.DEPTID
WHERE D.DNAME LIKE 'F%';
-- Q20 Display employees whose department location is not Mumbai.
SELECT E.NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.LOCATION!='MUMBAI';
-- Q21 Display employees where employee location and department location are the same.
SELECT E.NAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.LOCATION = D.LOCATION;
-- Q22 Display employee name, department name, and department location.
SELECT E.NAME, D.DNAME, D.LOCATION
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;
-- Q23 Display employees whose salary is between ₹60,000 and ₹90,000 along with department names.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE SALARY BETWEEN 60000 AND 90000;
-- Q24 Display employees whose email contains gmail.com and department name.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE EMAIL LIKE '%GMAIL.COM';
-- Q25 Display employees working in HR or Finance.
SELECT E.NAME  ,D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME IN ('HR', 'FINANACE');
-- Q26 Display employees who belong to departments 101, 103, or 105, along with department names.
SELECT E.NAME, D.DNAME 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DEPTID IN (101,103,105);
-- Q27 Display employees whose names start with A and show department names.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID 
WHERE NAME LIKE 'A%';

-- Q28 Display employees whose department name ends with 'n'.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME = '%N';
-- ⭐ INTERVIEW LEVEL (Q29–Q38)
-- Q29 Display the number of employees in each department.
SELECT D.DNAME , COUNT(*) AS TOTALEMPLOYEES
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY D.DNAME;
-- Q30 Display the average salary of each department.
SELECT D.DNAME , AVG(E.SALARY) AS AVGSALARY
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY D.DNAME;

-- Q31 Display departments having more than 3 employees.
SELECT D.DNAME , COUNT(*) AS TOTAL_EMPLOYEES
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY D.DNAME
HAVING COUNT(*)>3;
-- Q32 Display departments where the average salary is greater than ₹75,000.
SELECT D.DNAME , AVG(E.SALARY)
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY D.DNAME
HAVING AVG(SALARY)>75000;
-- Q33 Display the highest-paid employee in each department. (Return department name, and salary.)
SELECT d.DName, MAX(e.Salary) AS HighestSalary
FROM Employees e INNER JOIN Departments d
ON e.DeptID=d.DeptID
GROUP BY d.DName;

-- Q34 Display the total salary paid by each department.
SELECT D.DNAME , SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY D.DNAME;
-- Q35 Display department names where at least one employee earns more than ₹100,000.
SELECT DISTINCT D.DNAME 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID 
WHERE E.SALARY > 100000;

-- Q36 Display employees and department names, ordered by department name and then salary (highest first).
SELECT E.NAME , E.SALARY, D.DNAME
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
ORDER BY D.DNAME ASC , SALARY DESC;

-- Q37 Display departments having at least two Analysts.
SELECT D.DNAME, COUNT(*) AS ANALYST
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE JOB = 'ANALYST'
GROUP BY D.DNAME
HAVING COUNT(*)>=2;

-- Q38  Display:
-- Department Name, Number of Employees, Average Salary, Highest Salary, Lowest Salary, Total Salary
-- Show only departments that:
-- have more than 3 employees,  average salary > ₹70,000
-- Sort by: Average Salary (DESC), Department Name (ASC)

SELECT D.DNAME , COUNT(*) AS NO_OF_EMPLOYEES, AVG(E.SALARY)AS  Average_Salary, MAX(E.SALARY) AS Highest_Salary, MIN(E.SALARY) AS Lowest_Salary, SUM(E.SALARY) AS TOTAL_SALARY
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY  D.DEPTID
HAVING COUNT(*)>3 AND AVG(SALARY) >70000
ORDER BY AVG(E.SALARY) DESC , D.DNAME ASC;

-- 🐞 DEBUG THE QUERY (Q39–Q43)

-- Find and correct the mistakes.

-- Q39
-- SELECT Name, DName
-- FROM Employees
-- INNER JOIN Departments;
SELECT Name, DName
FROM Employees
INNER JOIN Departments
ON EMPLOYEES.DEPTID = DEPARTMENTS.DEPTID;

-- Q40
-- SELECT Name, DName
-- FROM Employees
-- INNER JOIN Departments
-- ON DeptID = DeptID;
SELECT Name, DName
FROM Employees
INNER JOIN Departments
ON EMPLOYEES.DEPTID = DEPARTMENTS.DEPTID;

-- Q41
-- SELECT Name, DName
-- FROM Employees
-- JOIN Departments
-- WHERE Employees.DeptID = Departments.DeptID;
SELECT Name, DName
FROM Employees
INNER JOIN Departments
ON EMPLOYEES.DEPTID = DEPARTMENTS.DEPTID;

-- Q42
-- SELECT Name, DName
-- FROM Employees
-- INNER JOIN Departments
-- ON Employees.EmpID = Departments.DeptID;
SELECT Name, DName
FROM Employees
INNER JOIN Departments
ON Employees.DEPTID = Departments.DeptID;
-- Q43
-- SELECT *
-- FROM Employees
-- INNER JOIN Departments
-- ON Employees.Location = Departments.DeptID;
SELECT *
FROM Employees
INNER JOIN Departments
ON Employees.DEPTID = Departments.DeptID;

-- 📊 PREDICT THE OUTPUT (Q44–Q47)

-- Without executing the query, explain what the output will be.

-- Q44
-- SELECT Name, DName
-- FROM Employees
-- INNER JOIN Departments
-- ON Employees.DeptID = Departments.DeptID; - THIS QUERY WILL RETURN EMPLOYEES NAME ALONG WITH THEIR DEPARTMENT NAME

-- Q45
-- SELECT *
-- FROM Employees
-- INNER JOIN Departments
-- ON Employees.DeptID = Departments.DeptID
-- WHERE Salary > 80000; -- THIS QUERY WILL RETURN  DETAILS OF EMPLOYEES MATCHING WITH DEPARTMENT TABLE
-- Q46
-- SELECT Name, Salary
-- FROM Employees
-- INNER JOIN Departments
-- ON Employees.DeptID = Departments.DeptID
-- ORDER BY Salary DESC; -- THIS QUERY WILL RETURN NAME AND SALARY OF EMPLOYEES  AND SALARY IN DESC ORDER
-- Q47
-- SELECT DName, COUNT(*)
-- FROM Employees
-- INNER JOIN Departments
-- ON Employees.DeptID = Departments.DeptID
-- GROUP BY DName; -- THIS QUERY WILL RETURN TOTAL NO OF EMPLOYEES IN EACH DEPT
-- 💼 BUSINESS SCENARIOS (Q48–Q50)
-- Q48 The HR manager wants a report showing:
-- Employee Name, Department Name, Department Location, Salary
-- sorted by salary from highest to lowest.
 SELECT E.NAME ,E.SALARY, D.DNAME , D.LOACATION
 FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
 ON E.DEPTID = D.DEPTID
 ORDER BY E.SALARY DESC;

-- Q49The Finance team wants to know:
-- Which departments have employees earning more than ₹90,000? Display each department only once.
SELECT DISTINCT D.DNAME 
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.SALARY > 90000;

-- Q50 ⭐ Final Challenge: Prepare a management report showing:
-- Department Name, Number of Employees, Total Salary, Average Salary, Highest Salary, Lowest Salary
-- Include only departments: with more than 5 employees, whose total salary exceeds ₹500,000
-- Sort by: Total Salary (DESC), Department Name (ASC)

SELECT D.DNAME , COUNT(*) AS TOTAL_EMPLOYEES, SUM(E.SALARY) AS TOTAL_SAL, AVG(E.SALARY) AS AVG_SALARY, MAX(E.SALARY), MIN(E.SALARY)
FROM EMPLOYEES E INNER JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
GROUP BY D.DNAME
HAVING COUNT(*) > 5 AND SUM(E.SALARY)> 500000
ORDER BY SUM(E.SALARY) DESC , DNAME ASC;


