-- SELF JOIN IS A JOIN IN WHICH A TABLE IS JOINED TO ITSELF

-- we use self join when rows within the same table have a relationship with each other same table is given diffrent aliases so that sql can treat it as two logical copies
--  eg:- employees --> manager i.e in emp table , i e in column employees an employe can be somebody else manager

-- Employees
--    ↓
-- Employee ↔ Manager

-- SYNATX: 
-- 			   SELECT COLUMNS
--             FROM TABLE_NAME 1.1 SELF JOIN TABLE_1.2
--			   ON <JOIN CONDITION>; 
---------------------------------------------------------------------------------------------------------------------------------
USE COMPANY_DB;

-- DISPLAY EMPLOYEES AND THEIR MANAGER
SELECT E.NAME AS EMPLOYEE, M.EMPID AS MID , M.NAME AS MANAGER
FROM Employees E JOIN Employees M
ON E.ManagerID = M.EmpID;
---------------------------------------------------------------------------------------------------------------------------------
-- 🔗 SELF JOIN — COMPLETE PRACTICE SET
-- PART A — IQ / INTERVIEW QUESTIONS  Answer these theoretically in your own words.

-- Q1. Definition What is a SELF JOIN?
-- SELF JOIN IS A TYPE OF JOIN , IN WHICH A TABLEIS JOINED TO ITSELF
 
-- Q2. Is SELF JOIN a separate JOIN type in MySQL?
-- In MYSQL , THERE NO SQL KEYWORD CALLED "SELF JOIN". INSTEAD A SELF JOIN IS A TECHNIQUE OR CONCEPT WHERE YOU JOIN A TABLE TO ITSELF USING STANDARD JOIN TYPES (I.E INNER JOIN , LEFT JOIN, OUTER JOIN),
--  ALONG WITH ALIASES TO DISTINGUISH BETWEEN THE TWO LOGICAL COPIES

-- Q3. Does MySQL support the keyword: SELF JOIN Explain.
-- In MYSQL , THERE NO SQL KEYWORD CALLED "SELF JOIN". INSTEAD A SELF JOIN IS A TECHNIQUE OR CONCEPT WHERE YOU JOIN A TABLE TO ITSELF USING STANDARD JOIN TYPES (I.E INNER JOIN , LEFT JOIN, OUTER JOIN),
--  ALONG WITH ALIASES TO DISTINGUISH BETWEEN THE TWO LOGICAL COPIES

-- Q4. Why do we use aliases in a SELF JOIN?
-- WE USE ALIASES IN SELF JOIN TO DISTINGUISH BTWEEN THE TWO LOGICAL COPIES FROM SAME TABLE

-- Q5. What is the difference between: JOIN and INNER JOIN in MySQL?
-- In MySQL, there is no functional difference between JOIN and INNER JOIN.
-- JOIN is simply a shorthand syntax for INNER JOIN.
-- INNER JOIN is the explicit syntax.
-- When you execute a query using JOIN, MySQL automatically interprets and executes it as an INNER JOIN

SELECT e.EMPID, e.NAME AS EmployeeName, m.EMPID AS ManagerID, m.Name AS ManagerName
FROM Employees e INNER JOIN Employees m
ON e.ManagerID = m.EmpID
group by empid
order by E.empid asc;

-- Q6. Can a SELF JOIN use LEFT JOIN? Explain with an example.
-- SELF JOIN is not a separate JOIN type. It is a technique where a table is joined with itself using aliases, 
-- We can use left, inner join or  even other join types depending on the requirement.

-- Q7. What is the difference between a normal JOIN and a SELF JOIN?
-- Normal JOIN: joins two different tables, SELF JOIN: joins a table to itself.
SELECT e.Name as EmployeeName, m.Name AS ManagerName
FROM Employees e LEFT JOIN Employees m
ON e.ManagerID = m.EmpID;

-- Q8. Give two real-world situations where SELF JOIN is useful.
-- Hierarchical Relationships (Employee & Manager Mapping):
--  When a single table contains both an entity and its supervisor (e.g., an Employees table where ManagerID references EmployeeID in the same table). 
--  A self join links an employee's row to their manager's row to display names side-by-side

-- Finding Duplicate or Matching Data within the Same Entity (Finding Shared Attributes):
--  Finding pairs of records that share a common attribute, such as identifying customers living in the same city, products priced identically, or detecting duplicate accounts created with the same email address

-- Q9.Why can a SELF JOIN return more rows than the original table?
-- A SELF JOIN can produce more rows than the original table because it evaluates all combinations of rows that satisfy the ON condition between the two alias copies of the table.

-- Q10.  What is the purpose of this condition when comparing rows? i.e -  e1.EmployeeID < e2.EmployeeID
-- e1.EmployeeID < e2.EmployeeID, This is VERY important for interviews. 
-- Think about this:
-- Alice | Bob
-- Bob   | Alice

-- These are actually the same pair. e1.EmployeeID < e2.EmployeeID keeps only one direction.
-- For eg: Alice ID = 1 , Bob ID   = 2
-- Then:
-- 		1 < 2  → TRUE
-- 		2 < 1  → FALSE
-- So we keep: Alice | Bob  and eliminate: Bob | Alice

-- PART B — BASIC SQL PRACTICE
-- Q11. Display each employee along with their manager. EmployeeName | ManagerName Include employees who don't have a manager.
SELECT E.NAME AS EMPLOYEENAME , M.NAME AS MANAGERNAME
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID;

-- Q12. Display only employees who have a manager.
SELECT E.NAME AS EMPLOYEENAME , M.NAME AS MANAGERNAME
FROM EMPLOYEES E INNER JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID;

-- Q13.Display employee ID, employee name, manager ID and manager name.
SELECT E.EMPID AS EMPLOYEEID, E.NAME AS EMPLOYEENAME , M.MANAGERID AS MANAGERID , M.NAME AS MANAGERNAME
FROM EMPLOYEES E LEFT JOIN  EMPLOYEES M 
ON E.MANAGERID = M.EMPID;

-- Q14. Find all employees who do not have a manager.
SELECT E.*
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
WHERE E.MANAGERID IS NULL;

-- Q15. Find all employees whose manager is ANITA KAPOOR
SELECT E.NAME , m.name
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
WHERE M.NAME = "ANITA KAPOOR";
-- Q16. Find the number of employees reporting to each manager. ManagerName | EmployeeCount
Select M.NAME AS MANAGER_NAME, COUNT(*)
FROM EMPLOYEES E INNER JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
GROUP BY M.NAME;

-- PART C — INTERMEDIATE SELF JOIN

-- Q17.  Find employees whose salary is greater than their manager's salary. EmployeeName | EmployeeSalary | ManagerName | ManagerSalary
SELECT E.NAME AS EmployeeName, E.SALARY AS EmployeeSalary, M.NAME AS MANAGER_NAME , M.SALARY AS ManagerSalary
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
WHERE E.SALARY > M.SALARY;

-- Q18.Find employees whose salary is less than their manager's salary.
SELECT E.NAME AS EmployeeName, E.SALARY AS EmployeeSalary, M.NAME AS MANAGER_NAME , M.SALARY AS ManagerSalary
FROM EMPLOYEES E LEFT JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
WHERE E.SALARY < M.SALARY;

-- Q19.Find employees who have the same manager  Employee1 | Employee2 | Manager
-- Do not show: duplicate pairs such as:
-- Alice | Bob
-- Bob | Alice
SELECT E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2, E1.MANAGERID AS MANAGER
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.MANAGERID = E2.EMPID
AND E1.EMPID < E2.EMPID;

-- Q20.Find employees who work in the same department as another employee. Employee1 | Employee2 | DepartmentID, Avoid duplicate pairs.
SELECT E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2, E1.DEPTID AS DEPARTMENTID
FROM EMPLOYEES E1 INNER JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
AND E1.EMPID < E2.EMPID;

-- Q21.Find employees who have the same salary as another employee. Employee1 | Employee2 | Salary Avoid duplicate pairs.
SELECT  E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2, E1.SALARY AS SALARY
FROM EMPLOYEES E1 INNER JOIN EMPLOYEES E2
ON E1.SALARY = E2.SALARY
AND E1.EMPID < E2.EMPID;

-- Q22.Find employees who have the same salary and same department as another employee.
SELECT  E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2, E1.SALARY AS SALARY, E1.DEPTID AS DEPARTMENTID
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
AND E1.SALARY = E2.SALARY
AND E1.EMPID < E2.EMPID;

-- Q23.Find employees who have a manager working in the same department.
SELECT E.NAME AS EMPLOYEE_NAME , M.NAME AS MANAGER_NAME, E.DEPTID AS DEPARTMENTID
FROM  EMPLOYEES E INNER JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
AND E.DEPTID = M.DEPTID;

-- Q24. Find employees whose salary is greater than their manager's salaryand who belong to the same department as their manager.
SELECT E.NAME AS EMPLOYEE_NAME, E.SALARY AS EMP_SALARY , M.NAME AS MANAGER_NAME, M.SALARY AS MANAGER_SALARY
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
AND E.SALARY > M.SALARY
AND E.DEPTID = M.DEPTID;
-- PART D — DUPLICATE / PAIR PROBLEMS These are very common interview-style SELF JOIN questions.

-- Q25. Find duplicate email addresses in an Employees table. EmployeeID, EmployeeName, Email EXPECTED AS Email | Employee1 | Employee2
SELECT E1.EMAIL , E1.EMPID AS EMPID1 ,E1.NAME AS EMPLOYEE1, E2.EMPID AS EMPID2, E2.NAME AS EMPLOYEE2
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.EMAIL = E2.EMAIL
AND E1.EMPID < E2.EMPID;

-- Q26. Find employees who have the same phone number.- EmployeeID, EmployeeName, Phone
SELECT E1.EMAIL , E1.EMPID AS EMPID1 ,E1.NAME AS EMPLOYEE1, E2.EMPID AS EMPID2, E2.NAME AS EMPLOYEE2
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.EMAIL = E2.EMAIL
AND E1.EMPID < E2.EMPID;

-- Q29. Find employees whose names are duplicated.
SELECT E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2, SUBSTRING_INDEX(E1.NAME, ' ', 1) AS FIRST_NAME
FROM Employees E1 JOIN Employees E2 
ON SUBSTRING_INDEX(E1.NAME, ' ', 1) = SUBSTRING_INDEX(E2.NAME, ' ', 1)
AND E1.EMPID < E2.EMPID;

-- Q30. Find all pairs of employees whose salaries differ by less than 5000.
SELECT E1.NAME AS EMPLOYEE1, E2.NAME AS EMPLOYEE2, E1.SALARY AS E1_SAL , E2.SALARY AS E2_SAL
FROM EMPLOYEES E1 INNER JOIN EMPLOYEES E2
ON ABS(E1.SALARY - E2.SALARY )< 5000
AND E1.EMPID < E2.EMPID;


-- PART E — ADVANCED SELF JOIN
-- Q31. Find employees whose salary is greater than at least one employee in their department.
SELECT DISTINCT e1.NAME AS EMP_NAME, E1.SALARY, E1.DEPTID AS DEPARTMENT
FROM EMPLOYEES E1
INNER JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
AND E1.SALARY > E2.SALARY
AND E1.EMPID <> E2.EMPID;

-- Q32. Find employees whose salary is lower than at least one employee in their department.
select distinct e1.name, e1.salary, e1.deptid
from employees e1 join employees e2
on e1.deptid = e2.deptid
and e1.salary < e2.salary;

-- Q33. Find the employee(s) with the highest salary in each department using SELF JOIN.
select distinct e1.name, e1.salary, e1.deptid
from employees e1 left join employees e2
on e1.deptid = e2.deptid
and e1.salary < e2.salary
where e2.empid is null;

-- Q34. Find the employee(s) with the lowest salary in each department using SELF JOIN.
select distinct e1.name, e1.salary, e1.deptid
from employees e1 left join employees e2
on e1.deptid = e2.deptid
and e1.salary > e2.salary 
where e2.empid is null;

-- Q35.  Find employees who earn more than all employees reporting to the same manager.
select e1.name, e1.salary, e1.managerid
from employees e1 left join employees e2
on e1.managerid = e2.managerid
and e1.salary < e2.salary
where e2.empid is null;
-- Q36. Find managers who have more than one employee reporting to them.
select m.name as manager_name, count(*) as employee_count
from employees e inner join employees m
on e.managerid= m.empid
group by m.empid 
having count(*)>1;

-- Q37. Find managers who have exactly two employees reporting to them.
select m.name as manager_name , count(*) as emp_count
from employees e inner join employees m
on e.managerid = m.empid
group by m.empid
having count(*) = 2;

-- Q38. Find employees who have the same manager but different salaries.
select e1.name, e1.salary, e2.name, e2.salary, e1.managerid
from employees e1 inner join employees e2
on e1.managerid = e2.managerid
and e1.salary <> e2.salary
and e1.empid < e2.empid;

-- Q39. Find employees who have the same department but different managers.
select e1.name, e2.name,e1.deptid, e1.managerid, e2.managerid
from employees e1 inner join employees e2
on e1.deptid = e2.deptid
and e1.managerid<>e2.managerid
and e1.empid < e2.empid;

-- Q40. Find pairs of employees where:
-- They belong to the same department, Their salaries are different, They are different employees
select  e1.deptid as deptid, e1.name as name_e1, e1.salary as salary_e1, e2.name as name_e2, e2.salary as salary_e2
from employees e1 inner join employees e2
on e1.deptid = e2.deptid
and e1.salary <> e2.salary
and e1.empid < e2.empid;

-- PART F — INTERVIEW CODING QUESTIONS

-- Q41.Write a query to display every employee and their manager.
select e.name as employee_name , m.name as manager_name
from employees e inner join employees m
on e.managerid = m.empid;

-- Q42. Find employees who earn more than their managers.
select e.name , e.salary, m.name, m.salary
from employees e inner join employees m
on e.managerid = m.empid
where e.salary > m.salary;

-- Q43. Find employees who earn less than their managers.
select e.name , e.salary, m.name, m.salary
from employees e inner join employees m
on e.managerid = m.empid
where e.salary < m.salary;

-- Q44. Find employees who have the same manager.
select e1.name , e2.name, e1.	managerid
from employees e1 inner join employees e2
on e1.managerid = e2.managerid
and e1.empid < e2.empid;
-- Q45. Find employees who have the same salary.
select e1.name , e2.name, e1.salary
from employees e1 inner join employees e2
on e1.salary = e2.salary
and e1.empid < e2.empid;

-- Q46. Find employees with the same Job using SELF JOIN, without duplicate pairs. Explain why you use: e1.EmployeeID < e2.EmployeeID
 select e1.name , e2.name , e1.job
 from employees e1 inner join employees e2
 on e1.job = e2.job
 and e1.empid < e2.empid;

-- Q47. Find the second-highest salary using SELF JOIN.
SELECT E1.NAME, E1.SALARY
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.SALARY < E2.SALARY
GROUP BY E1.EMPID, E1.NAME, E1.SALARY
HAVING COUNT(DISTINCT E2.SALARY) = 1;

-- Q48. Find the highest-paid employee in each department using SELF JOIN.
SELECT E1.NAME, E1.SALARY, E1.DEPTID
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
AND E1.SALARY < E2.SALARY
WHERE E2.EMPID IS NULL;

-- Q49. Find employees who earn more than their department's average salary without using a subquery.
SELECT E1.NAME , E1.SALARY, E1.DEPTID
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
GROUP BY E1.EMPID, E1.SALARY, E1.DEPTID
HAVING E1.SALARY > AVG(E2.SALARY)
ORDER BY DEPTID ASC;

-- Q50.  Find employees who have the same manager and the same department but different salaries.
SELECT E1.DEPTID, E1.MANAGERID, E1.NAME , E1.SALARY, E2.NAME, E2.SALARY
FROM EMPLOYEES E1 JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
AND E1.MANAGERID = E2.MANAGERID
AND E1.SALARY <> E2.SALARY
AND E1.EMPID < E2.EMPID;

-------------------------------------------------------------------------------------------------------------------------
-- 🧠 PART G — CONCEPTUAL TRAPS
-- Q51.What happens if you write , What type of JOIN is this in MySQL?
SELECT *
FROM Employees e
JOIN Employees m          -- IN MYSQL JOIN MEANS INNER JOIN  
ON e.ManagerID = m.EmpID;  -- It returns employees who have a matching manager. 


-- Q52. Is this a SELF JOIN?
-- SELECT *
-- FROM Employees e
-- LEFT JOIN Employees m
-- ON e.ManagerID = m.EmployeeID;

-- YES, THIS IS A SELF JOIN. IN THE QUERY, THE SAME EMPLOYEE TABLE IS USED TWICE. E REPRESENTS EMPLOYEES , M REPRESENTS MANAGER

-- Q53. What is wrong with using: SELF JOIN in MySQL?
-- SELF JOIN WORD IS NOT VALID IN MY SQL KEYWORD

-- Q54.What happens if you forget the ON condition in a self-join?
-- IF ON CONDITION IS NOT USED , SQL WILL RETURN CROSS JOIN  

-- Q55.Why can this produce duplicate combinations? e1.DepartmentID = e2.DepartmentID
-- E1.DEPTI = E2.DEPTID WILL PRODUCE DUPLICATE COMBINATION BECAUSE, EVERY EMPLOYEE IN SAME DEPARTMENT CAN MATCH EVERY OTHER EMPLOYEE IN THAT DEPARTMENT

-- Q56. What's the difference between:e1.EmployeeID <> e2.EmployeeID and: e1.EmployeeID < e2.EmployeeID
-- when finding employee pairs?
-- USING EmployeeID <> e2.EmployeeID - <> :- PREVENTS EMPLOYEES FROM MATCHING THEMSELVES, STILL PRODUCE REVERSED DUPLICATES

-- 🎯 FINAL INTERVIEW CHALLENGE
-- Q57.  Write one query that returns:
-- EmployeeName, ManagerName, EmployeeSalary, ManagerSalary, SalaryDifference for employees whose salary is greater than their manager's salary.
SELECT
    e.name AS employee_name,
    m.name AS manager_name,
    e.salary AS employee_salary,
    m.salary AS manager_salary,
    e.salary - m.salary AS salary_difference
FROM employees e
INNER JOIN employees m
    ON e.managerid = m.empid
WHERE e.salary > m.salary; 

-- Q58. Find the manager who has the highest number of direct reports. ManagerName | NumberOfEmployees
SELECT M.NAME AS MANAGER_NAME, COUNT(*) AS NO_OF_EMP
FROM EMPLOYEES E JOIN EMPLOYEES M
ON E.MANAGERID = M.EMPID
GROUP BY M.EMPID, M.NAME
ORDER BY NO_OF_EMP DESC;

-- Q59. Find employees who earn more than every other employee in their department, using SELF JOIN and without a subquery.
SELECT E1.NAME , E1.SALARY , E1.DEPTID
FROM EMPLOYEES E1 LEFT JOIN EMPLOYEES E2
ON E1.DEPTID = E2.DEPTID
AND E1.SALARY < E2.SALARY
WHERE E2.EMPID IS NULL;

-- Q60. Find employees who: Have a manager, Earn more than their manager, Belong to the same department as their manager
--  EmployeeName, ManagerName, EmployeeSalary, ManagerSalary, DepartmentID
SELECT E.NAME , E.SALARY , M.NAME , M.SALARY, E.DEPTID
FROM EMPLOYEES E INNER JOIN EMPLOYEES M
ON E.DEPTID = M.DEPTID
AND E.MANAGERID = M.EMPID
WHERE E.SALARY > M.SALARY;
