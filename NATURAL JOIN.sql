-- NATURAL JOIN AUTOMATICALLY JOIN TWO TABLES USEING SAME COLUMNS THAT HAVE SAME NAME IN THE TABLE
-- SYNTAX:
-- 			   SELECT COL_NAME
--             FROM TABLE NAME 1 NATURAL JOIN TABLE_NAME 2
--             ON <JOIN CONDITION>;
USE COMPANY_DB;
-- FOR EX:
SELECT * 
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D;

-- Compare INNER JOIN vs NATURAL JOIN
-- INNER JOIN :
SELECT E.Name, D.DName
FROM Employees E
INNER JOIN Departments D
ON E.DeptID = D.DeptID;

-- NATURAL JOIN 
SELECT Name, DName
FROM Employees
NATURAL JOIN Departments;
-- ---   So the biggest difference is:
-- INNER JOIN → you specify the join condition.
-- NATURAL JOIN → SQL automatically uses columns having the same name.
---------------------------------------------------------------------------------------------------------------------
-- Suppose both tables have: DeptID Then SQL uses DeptID.
-- But imagine later someone adds another column with the same name to both tables: Location
-- Now NATURAL JOIN may automatically use:
-- DeptID AND Location

-- That can completely change the result. That's why NATURAL JOIN can be risky in real projects 
--------------------------------------------------------------------------------------------------------------------------------------
-- NATURAL JOIN - Answer these before we practice.
-- Got it. From now on, for each JOIN topic I'll give you **the complete IQ set + complete practice set together**, and you can solve them in order. I won't interrupt after every single question.

-- NATURAL JOIN — COMPLETE SET
-- PART A — IQ / INTERVIEW QUESTIONS

-- Q1What is a NATURAL JOIN?
-- NATURAL JOIN AUTOMATICALLY JOIN TWO TABLES USEING SMAE COLUMNS THAT HAVE SAME NAME IN THE TABLE

-- Q2 What is the main difference between `INNER JOIN` and `NATURAL JOIN`?
-- INNER JOIN RETURNS MATCHING ROWS FROM BOTH TABLES AND ALSO U NEED TO SPECIFY JOIN CONDITION WHERE AS IN NATURAL JOIN AUTOMATICALLY JOIN BOTH TABLES USING SAME COLUMNS WITH SAME NAME
 
-- Q3 Does NATURAL JOIN require an `ON` clause? - NO

-- Q4 If both tables contain a column named `DeptID`, which column will NATURAL JOIN use?
-- A NATURAL JOIN will automatically use the DeptID column because it is the only column with the exact same name in both the Employees and Departments tables

-- Q5 Employees has: DeptID,  Departments has: DepartmentID. Can NATURAL JOIN automatically recognize these as the same relationship? Explain.
-- NO , NATURAL JOIN will not recognize them as the relationship you want unless they have the exact same column name

--  Q6 Why can NATURAL JOIN be risky in a real-world database?
-- A NATURAL JOIN is risky in production databases because it implicitly determines join conditions by automatically matching all columns with identical names across both tables, 
-- rather than using explicit keys. This lack of transparency makes queries fragile when database schemas change over time

-- Q7 If two tables have **no columns with the same name**, can NATURAL JOIN automatically identify the relationship?
-- NO 
-- Q8 What happens if two tables have **multiple columns with the same names**?
--  NATURAL JOIN WILL AUTOMATICALLY COMBINE THE COLUMNS IN ONE COLUMN INT RESULT SET

-- Q9 Why is an explicit `ON` condition generally safer than NATURAL JOIN?

-- ### Q10 Is NATURAL JOIN an INNER JOIN or an OUTER JOIN? NO ITS NEITHER INNER NOR OUTER JOIN

-- Q11 Does NATURAL JOIN return unmatched rows from the left table? NO 

-- ### Q12 Does NATURAL JOIN return unmatched rows from the right table? NO 

-- ### Q13  What is the difference between:

-- ```sql
-- FROM Employees E
-- INNER JOIN Departments D
-- ON E.DeptID = D.DeptID
-- ```
-- and:
-- ```sql
-- FROM Employees
-- NATURAL JOIN Departments
-- INNER JOIN RETURNS MATCHING ROWS FROM BOTH TABLES AND ALSO U NEED TO SPECIFY JOIN CONDITION WHERE AS IN NATURAL JOIN AUTOMATICALLY JOIN BOTH TABLES USING SAME COLUMNS WITH SAME NAME


-- ### Q14 ⭐

-- If a new column having the same name is added to both tables, can it affect an existing NATURAL JOIN query? Explain.
-- YES, If a new column having the same name is added to both tables, it can affect an existing NATURAL JOIN query

-- # 💻 PART B — NATURAL JOIN PRACTICE

-- ### 🟢 EASY — Q1–Q8

-- ### Q1 Display employee name and department name using NATURAL JOIN.
SELECT Name, DName
FROM Employees
NATURAL JOIN Departments;

-- ### Q2 Display employee name, salary and department name using NATURAL JOIN.
SELECT Name, Salary, DName
FROM Employees
NATURAL JOIN Departments;

-- Q3- Display all columns returned by NATURAL JOIN.
SELECT *
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;

-- ### Q4Display employee names working in the HR department using NATURAL JOIN.
SELECT E.NAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE DNAME ='HR';

-- ### Q5Display employees earning more than ₹80,000 along with their department names using NATURAL JOIN.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE SALARY > 80000;
-- Q6Display employee names and department names sorted by employee name.
SELECT NAME, DNAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
ORDER BY NAME;
--  Q7 Display employees hired after `2023-01-01` along with their department names.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE HIREDATE > '2023-01-01';
--  Q8 Display employees belonging to departments `101`, `103`, and `107`.
SELECT E.NAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE DEPTID IN (101,103,107);
-- ---

-- # 🟡 MEDIUM — Q9–Q16

-- Q9 Display employee name, department name and salary for employees earning between ₹60,000 and ₹90,000.
SELECT E.NAME, D.DNAME, E.SALARY
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE SALARY BETWEEN 60000 AND 90000;

-- Q10 Display employees whose department name starts with `'F'`.
SELECT E.NAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE DNAME LIKE 'F%';

-- Q11 Display employees whose names start with `'A'` along with their department names.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
WHERE NAME LIKE 'A%';

--  Q12 Display the average salary of each department using NATURAL JOIN.
SELECT DEPTID , AVG(SALARY)
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
GROUP BY DEPTID;

-- Q13 Display the total salary paid by each department.
SELECT DEPTID, SUM(SALARY)
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
GROUP BY DEPTID;

--  Q14 Display departments having more than 3 employees.
SELECT DEPTID, COUNT(*)
FROM EMPLOYEES E NATURAL JOIN DEPARTMENTS D
GROUP BY DEPTID
HAVING COUNT(*) > 3;
-- Q15 Display departments where average salary is greater than ₹75,000.
SELECT DEPTID , AVG(SALARY)
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS 
GROUP BY DEPTID
HAVING AVG(SALARY)>75000;

-- Q16 Display: Department Name,  Number of Employees, Average Salary, Highest Salary, Lowest Salary, Total Salary using NATURAL JOIN.
SELECT DNAME, COUNT(*), AVG(SALARY), MAX(SALARY), MIN(SALARY), SUM(SALARY)
FROM EMPLOYEES NATURAL JOIN DEPARTMENTS;

-- Q17 Will NATURAL JOIN return employees whose `DeptID` does not exist in Departments?Explain.
-- NO , NATURAL BEHAVES LIKE INNER JOIN. NATURAL JOIN RETURNS ONLY ROWS WHERE COLUMN NAME ARE FROM BOTH TABLES

--  Q18 Will NATURAL JOIN return departments that have no employees? Explain.
-- NO , NATURAL BEHAVES LIKE INNER JOIN. NATURAL JOIN RETURNS ONLY ROWS WHERE COLUMN NAME ARE FROM BOTH TABLES
-- Q19  Suppose Employees has:  DeptID  Location and Departments has: DeptID Location. What columns will NATURAL JOIN use for joining?
-- NATURAL JOIN WILL USE ALL COLUMNS HAVING THE SAME NAMES IN BOTH TABLES
--  Q20 ⭐Why could adding `Location` to both tables unexpectedly change the result of an existing NATURAL JOIN?
-- SOME ROWS THAT ARE PREVIOUSLY MATCHED MAY STOP MATCHING IF THEIR LOCATION DIFFERS, HENCETHIS IS ONE IF THE BIGGEST RISK IN NATURAL JOIN

-- Q21- Rewrite this NATURAL JOIN using an explicit INNER JOIN:
-- SELECT *
-- FROM Employees
-- NATURAL JOIN Departments;

SELECT E.*
FROM Employees E JOIN Departments D
ON E.DEPTID =D.DEPTID;

-- Q22 ⭐ Interview: Would you prefer NATURAL JOIN or explicit `INNER JOIN ... ON` in a production Data Analyst project? Which one and why?
-- I prefer explicit INNER JOIN with an ON condition in production because it makes the join logic clear and predictable.
--  NATURAL JOIN depends on column names, so adding or renaming a common column can unexpectedly change the query results.

-- ### Q23

-- What's wrong with this?

-- ```sql
-- SELECT E.Name, D.DName
-- FROM Employees E
-- NATURAL JOIN Departments D
-- ON E.DeptID = D.DeptID;  -- ON CONDITION  IN NATURAL JOI WE DONT USE ON CONDITION

-- Q24 An employee has:DeptID = 999 and no department 999 exists.Will NATURAL JOIN display that employee? Why?
-- No. NATURAL JOIN is an inner join, so rows without a matching value in the other table are excluded
 
-- Q25 A department `108 = LEGAL` exists but no employee belongs to it. Will NATURAL JOIN display LEGAL? Why?
-- NO BECOZ THERE IS NO MATCHING EMPLOYEES

--  Q26  An interviewer asks: "Why don't you usually use NATURAL JOIN in production queries?"
-- I generally avoid NATURAL JOIN in production because the join condition is implicitly determined from columns with the same names.
-- If another column with the same name is added to both tables, the join condition can change automatically and potentially produce incorrect or unexpected results. 
-- Explicit JOIN ... ON is more readable, predictable, and maintainable.


-- Q27 An interviewer asks:"If two tables have three columns with identical names, what could happen with NATURAL JOIN?" Explain.
-- NATURAL JOIN uses all identically named columns, not just the column I intended to use

-- Q28 🔥 FINAL Explain NATURAL JOIN in **2–3 sentences**, covering:
-- 			1. How it determines the join columns
-- 			2. Whether `ON` is required
-- 			3. Why explicit JOIN conditions are generally safer
-- NATURAL JOIN automatically identifies columns with the same names in both tables and uses all of them as the join condition. 
-- It does not require an ON clause because the join condition is determined automatically.
-- It can be risky because changes to the table structure or column names can unexpectedly change the join behavior, so explicit JOIN ... ON is generally safer








