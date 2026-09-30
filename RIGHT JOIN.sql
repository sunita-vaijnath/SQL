-- RIGHT OUTER JOIN: RIGHT OUTER JOIN  returns all the rows from right table and matching rows from left table
-- If no matching rows exist in the left table , left table column will be null
-- syntax:
-- 			SELECT COL_NAME
--          FROM TABLE_NAME.1 RIGHT JOIN TABLE_NAME.2
--          ON <JOIN CONDITION>;
-- LEFT JOIN
-- Employees  ← Keep Everything
-- Keep every employee.

-- RIGHT JOIN
-- Departments ← Keep Everything
-- Keep every department.

SELECT E.* , D.*
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

INSERT INTO DEPARTMENTS
VALUES (108 , 'LEGAL');
SELECT * FROM DEPARTMENTS;

-- Find departments that have no employees.
SELECT D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID 
WHERE E.DEPTID IS NULL;

use company_db;

 -- 1. LEFT JOIN RETURNS THE ALL THE ROWS FROM LEFT TABLE ANF MATCHING ROWS FROM RIGHT TABLE WHERE AS RIGHT JOIN RETURNS ALL ROWS FROM RIGHT TABLE AND MATCHING ROWS FROM LEFT TABLE
 -- 2.DEPARTMENTS
 -- 3.EMPLOYEES
 -- 4. YES EVERYRIGHT JOIN CAN BE WRITTEN AS LEFT JOIN BY KEEPING THE TABLE ON LEFT SIDE
 -- 5.  many developers prefer LEFT JOIN and rarely use RIGHT JOIN—it's often easier to read by simply swapping the table order.
 -- PPractice (Using Your Database)
-- Q1 Display:
-- Employee Name
-- Department Name using RIGHT JOIN.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- Q2 Display:
-- Employee Name
-- Salary
-- Department Name using RIGHT JOIN.
SELECT E.NAME , E.SALARY , D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- Q3 Display all departments, even if they have no employees.
SELECT D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.DEPTID IS NULL;
-- Q4 Display departments whose names start with 'F' using RIGHT JOIN.
SELECT D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME LIKE 'F%';
-- Q5 Display departments that currently have no employees.
SELECT D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.DEPTID IS NULL;
-- Q6 Without executing the query:

-- SELECT E.Name, D.DName
-- FROM Employees E
-- RIGHT JOIN Departments D
-- ON E.DeptID = D.DeptID;

-- If a new department LEGAL (108) is added without any employees:
-- Will LEGAL appear?  - YES
-- What will the Name column contain? NULL
-------------------------------------------
-- Query A
-- SELECT *
-- FROM Employees E
-- RIGHT JOIN Departments D
-- ON E.DeptID = D.DeptID;
-- Query B
-- SELECT *
-- FROM Departments D
-- LEFT JOIN Employees E
-- ON D.DeptID = E.DeptID;
-- A) Different results B) Same results,  And explain why.
-- B. SAME RESULT, Both queries preserve the Departments table.The only difference is the order in which the tables are written.
	-- Think of it like this:
	-- RIGHT JOIN
	-- Employees  ----->  Departments (Preserved)
	-- is exactly the same as
	-- LEFT JOIN
	-- Departments (Preserved)  <----- Employees
	-- The preserved table is Departments in both cases.






















