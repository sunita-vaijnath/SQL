-- FULL OUTER JOIN : RETURNS ALL ROWS FROM LEFT TABLE , ALL ROWS FROM RIGHT TABLE , MATCHING ROWS ARE MERGED; IF NO MATCHING ROWS EXISTS, THE MISSING VALUE BECOMES NULL
-- LEFT JOIN + RIGHT JOIN = FULL OUTER JOIN
-- MYSQL DEOSNT SUPPORT FULL OUTER JOIN 
-- BECOZ MY SQL DOESNT HACE FULL OUTER JOIN, SO WE COMBINE LEFT JOIN AND RIGHT JOIN USING UNION

-- SYNTAX:
-- 			SELECT COLUMNS
-- 			FROM TABLE_1 LEFT JOIN TABLE_2
-- 			ON <JOIN CONDITION>;
-- 			UNION
-- 			SELECT COLUMNS
-- 			FROM TABLE_1 RIGHT JOIN TABLE_2
-- 			ON <JOIN CONDITION>;

-- UNION removes duplicate rows automatically

 SELECT E.NAME , D.DNAME
FROM Employees E
LEFT JOIN Departments D
ON E.DeptID = D.DeptID
UNION
SELECT E.NAME , D.DNAME
FROM Employees E
RIGHT JOIN Departments D
ON E.DeptID = D.DeptID;
------------------------------------------------------------------------------------------------------------
-- Interview Questions
-- Q1 What is a FULL OUTER JOIN?
-- FULL OUTER JOIN : RETURNS ALL ROWS FROM LEFT TABLE , ALL ROWS FROM RIGHT TABLE , MATCHING ROWS ARE MERGED; IF NO MATCHING ROWS EXISTS, THE MISSING VALUE BECOMES NULL
-- LEFT JOIN + RIGHT JOIN = FULL OUTER JOIN
-- Q2 Does MySQL support FULL OUTER JOIN directly?
--  NO MYSQL DOESNO SUPPORT FULL OUTER JOIN

-- Q3 How do we simulate a FULL OUTER JOIN in MySQL?
-- BY USING UNION WE CAN SIMULATE FULL OUTER JOIN
-- Q4 Why do we use UNION instead of UNION ALL?
-- UNION WILL RETURN UNIQUE VALUES WHERE AS UNION ALL WILL RETURN DUPLICATE VALUE ALSO
-- Q5 If every employee has a matching department and every department has at least one employee,
-- what will be the difference between:
-- INNER JOIN
-- FULL OUTER JOIN
-- Practice (Using Your Database)

-- Q1 Write the MySQL query to simulate a FULL OUTER JOIN between Employees and Departments.

-- Q2 Suppose Department 108 = LEGAL is added with no employees. Will it appear in the FULL OUTER JOIN?

-- Q3 Suppose an employee:
-- Name = Sunita
-- DeptID = 999 is inserted.
-- Will Sunita appear? If yes, what will DName contain?

-- Q4 True or False FULL OUTER JOIN returns all matching rows plus all unmatched rows from both tables.

-- Q5 ⭐⭐⭐ (Interview) Complete this table:
-- JOIN	            Keeps Left Table	Keeps Right Table
-- INNER JOIN	            ?                	?
-- LEFT JOIN	            ?                  	?
-- RIGHT JOIN	            ?               	?
-- FULL OUTER JOIN	        ?  	                ?

----------------------------------------------------------------------------------------------------------------------------
-- FULL OUTER JOIN Practice — Easy
-- Q1 Display all employee names and department names, including employees without a department and departments without employees.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
UNION
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID ; 

-- Q2Display:Employee Name, Employee DeptID, Department Name, Department DeptID, --- Include all records from both tables.
SELECT E.NAME , E.DEPTID , D.DNAME , D.DEPTID
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
UNION
SELECT E.NAME , E.DEPTID , D.DNAME , D.DEPTID
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID ;


-- Q3Display only the employees whose department does not exist. Hint: We need the FULL OUTER JOIN result, then filter for the missing department.
SELECT E.NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D 
ON E.DEPTID = D.DEPTID
WHERE D.DEPTID IS NULL;

-- Q4 Display only the departments that have no employees.
SELECT DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.DEPTID IS NULL;



-- Q5 Display all unmatched records from both tables.
-- Your result should include:
-- employees without departments
-- departments without employees
SELECT E.NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DEPTID IS NULL 
UNION
SELECT D.DNAME
FROM EMPLOYEES E RIGHT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.DEPTID IS NULL;


-- Q6Suppose: Employees

-- EmpID | DeptID
-- 1     | 101
-- 2     | 102
-- 3     | 999

-- Departments
-- DeptID | DName
-- 101    | IT
-- 102    | HR
-- 103    | FINANACE

-- What records should Q5 return? Don't write SQL for Q6 — just give me the expected unmatched records.

-- EmpID | DeptID  DeptID | DName
-- 1     | 101     101    | IT
-- 2     | 102     102    | HR
-- 3     | 999     NULL   | NULL
-- NULL  | NULL    103    | FINANACE

-- Q7What is the difference between:
-- INNER JOIN and FULL OUTER JOIN?
-- INNER JOIN IS USED TO OBTAIN MATCHING RECORDS FROM BOTH TABLE , FULL OUTER JOIN RETURNS ALL ROWS AS WELL AS MATCHED AND UNMATCHED RECORDS FROM BOTH TABLE 

-- Q8 Why does MySQL not allow this?
-- SELECT *
-- FROM Employees E
-- FULL OUTER JOIN Departments D
-- ON E.DeptID = D.DeptID;    
-- MySQL does not support FULL OUTER JOIN natively primarily because of its internal join execution strategy and historical architectur

-- What do we use instead?
-- TO SIMULATE FULL OUTER JOIN IN MY SQL WE USE LEFT JOIN QUERY ALNONG UNION AND RIGHT JOIN QUERY

-- Q9 Consider:

-- SELECT E.Name, D.DName
-- FROM Employees E
-- LEFT JOIN Departments D
-- ON E.DeptID = D.DeptID
-- UNION 
-- SELECT E.Name, D.DName
-- FROM Employees E
-- RIGHT JOIN Departments D
-- ON E.DeptID = D.DeptID;

-- What does UNION do here?
-- B. Removes duplicate matching rows
 -- AND ALSO COMBINES LEFT JOIN AND RIGHT JOIN INTO SINGLE RESULT SET

-- Q10 Suppose:

-- Employees
-- EmpID	DeptID
-- 1	101
-- 2	102
-- 3	999

-- Departments
-- DeptID	DName
-- 101	IT
-- 102	HR
-- 103	FINANACE
-- After simulating FULL OUTER JOIN, how many total rows will the result contain?
-- 4

-- Q11  How would you find only employees whose department doesn't exist?Which condition is correct?
-- B.WHERE D.DeptID IS NULL

-- Q12 How would you find only departments that don't have employees?
-- A.WHERE E.DeptID IS NULL

-- Q13 🔥 Interview
-- You want all unmatched records from both tables.
-- Which condition is correct?
-- B.
--  WHERE E.DeptID IS NULL
-- OR D.DeptID IS NULL
-- Explain why.

-- Q14 — Final Challenge
-- Explain FULL OUTER JOIN to an interviewer in 2–3 sentences, including:
-- What it returns
-- MySQL limitation
-- How we simulate it in MySQL 
-- FULL OUTER JOIN IS A SUBTYPE OF OUTER JOINS , IN FULL OUTER JOIN IT RETURNS ALL ROWS, MATCHING AND UMATCHED RECORDS FROM BOTH TABLE.
-- IN MYSQL FULL OUTER JOIN IS NOT SUPPORTED BECOZE OF INTERNAL JOIN EXECUTION STARTEGY AND HISTORIC ARCHITECTURE, TO SIMULATE FULL OUTER JOIN IN MYSQL WE USE UNION , UNION RETURNS THE UNIQUE VALUES.
-- THE ORDER OF WRITING FULL OUTER JOIN IN MY SQL IS SELECT FROM LEFT JOIN ON CONDITION UNION SELECT FROM RIGHT JOIN ON CONDITION; 




