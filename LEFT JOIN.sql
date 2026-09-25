-- LEFT JOIN  RETURN ALL ROWS FROM THE LEFT TABLE (TABLE 1) AND ONLT THE MATCHING ROWS FROM THE RIGHT TABLE (TABLE 2)
-- SYNTAX: 
-- SELECT column_name(s)
-- FROM table1 LEFT JOIN table2
-- ON table1.column_name = table2.column_name;
-- If there is no match, SQL returns NULL for the columns of the right table.
		-- Note: The syntax combines two tables based on a related column, ------
	    --  and the ON keyword is used to specify the matching condition -------
--------------------------------------------------------------------------------------------------------------------
-- 										Memory Trick
-- 										LEFT TABLE
-- 										     ↓
-- 										Keep Everyone
-- 										     ↓
-- 										Match Right Table
-- 										     ↓
-- 										 No Match?
-- 								             ↓
-- 										    NULL
--------------------------------------------------------------------------------------------------------------------
SELECT E.DEPTID, E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;
--------------------------------------------------------------------------------------------------------------------
-- Interview Questions
-- Q1 Difference between INNER JOIN and LEFT JOIN?
-- INNER JOIN IS USED TO OBTAIN THE MATCHING RECORDE FROM BOTH TABLE
-- LEFT JOIN RETURNS ALL THE ROWS FROM LEFT TABLE (TABLE 1) AND MATCHING RECORDS FROM RIGHT TABLE (TABLE 2)
-- Q2N What happens when no matching record exists?
-- WHEN THERE IS NO MATCHING RECORD , NULL VALUES ARE RETURNED FROM THE RIGHT TABLE (TABLE 2)
-- Q3 Can LEFT JOIN return NULL values?
-- YES , WHEN WHEN NO MATCHING RECORDS EXIST
-- Q4 Can LEFT JOIN return more rows than INNER JOIN?
-- YES , BECOZ IT RETURN S ALL THE ROWS FROM TABLE AND MATCHING RECORDS FROM RIGHT TABLE
-- Q5 ⭐ (Very Common) Can a LEFT JOIN behave like an INNER JOIN?
-- Yes, a LEFT JOIN can behave exactly like an INNER JOIN. 
-- This commonly happens in two distinct scenarios:
--  by accident due to the structure of your WHERE clause, or
--  naturally when every record in your left table possesses a matching record in your right table.
------------------------------------------------------------------------------------------------------------

-- Q1 Why do INNER JOIN and LEFT JOIN return the same result on your database?
-- INNER JOIN AND LEFT JOIN RETRUN SAME RESULT WHEN EVERY RECORD IN LEFT TABLE POSSES MATCHING RECORD IN RIGHT TABLE
-- Q2 Will they always return the same result? If not, when will they differ?
-- NO THEY WON'T POSSES ALWAYS SAME RESULT , IT WILL DIFFER WHEN THERE IS NULL VALUE IN THE RECORD
-- Q3 What is the purpose of WHERE d.DeptID IS NULL ,  after a LEFT JOIN?
-- THIS IS USED TO CHECK WHOSE DEPTID DOESNT EXIST
-- Q4 Which table is called the left table? In this query: FROM Employees e LEFT JOIN Departments d
-- EMPLOYEES
-- Q5 Suppose every employee has a valid department. Which JOIN would you use? INNER JOIN LEFT JOIN
-- Explain your choice.
-- INNER JOIN BECOZ EVERY EMPLOYEE HAS ITS OWN DEPT , THERE EXIST A MATCHING RECORDS FROM BOTH THE TABLE

-- Practice (Using YOUR Database)-------------------

-- Q1 Display: Employee Name Department Name using LEFT JOIN.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E 
LEFT JOIN Departments d
ON e.DeptID=d.DeptID
AND d.DName='IT';

SELECT E.NAME, D.DNAME
FROM EMPLOYEES E 
LEFT JOIN Departments d
ON e.DeptID=d.DeptID
WHERE d.DName='IT';

-- Q2 Display: Employee Name Department Name Salary
-- using LEFT JOIN.
SELECT E.NAME, D.DNAME, SALARY
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;
-- Q3 Display employees working in the IT department using LEFT JOIN.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME = 'IT';
-- Q4 Display employees whose salary is greater than ₹80,000 along with department names.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE SALARY > 80000 ;
-- Q5  Write a query to find employees whose department does not exist. (Your output will probably be empty, but the query is what matters.)
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DEPTID IS NULL;
-- Q6 ⭐⭐ (Interview) Without changing your database, answer this: If an employee with DeptID = 999 is inserted, what will be the output of
-- DNAME ISNULL 

--  Practice Set (Interview Level) Answer without executing.

-- Q1 Write a query to display departments that have no employees.
SELECT E.NAME, D.DNAME
FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E 
ON E.DEPTID = D.DEPTID
WHERE E.DEPTID IS NULL;
USE COMPANY_DB;

-- Q2 Suppose Department 108 = Legal is added, but no employee belongs to it. What will Q1 return?
-- DName - LEGAL
-- Q3 Which query is correct?
-- A
-- WHERE d.DeptID IS NULL
-- B
-- WHERE e.EmpID IS NULL
-- For: FROM Departments d LEFT JOIN Employees e      
-- Explain why. B BECOZ IN LEFT JOIN LEFT TABLE RECORDS WILL RETURN SO WE NEED TO WRITE E.EMPID IS NULL TO CHECK MATVHING RECORDS FROM RIGHT TABLE

-- Q4 Complete the query:
-- SELECT d.DName
-- FROM Departments d
-- LEFT JOIN Employees e
-- ON E.DEPTID = D.DEPTID
-- WHERE E.DEPTID IS NULL;

-- Q5 ⭐⭐⭐ (Interview) Without writing SQL:
-- Explain the logic behind using LEFT JOIN with IS NULL to find missing records. Try to explain it as if an interviewer asked: "Why does this pattern work?"
-- Always check IS NULL on a column from the right table. Checking a left table column for NULL will break the logic
--------------------------------------------------------------------------------------------------------------------

-- Display: Employee Name Department Name using LEFT JOIN.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- Find employees whose department does not exist.
SELECT E.EMPID, E.NAME, D.DNAME, E.DEPTID
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DEPTID IS NULL; 

-- Find departments having no employees. 
SELECT D.DNAME
FROM DEPARTMENTS D LEFT JOIN EMPLOYEES E
ON D.DEPTID = E.DEPTID
WHERE E.DEPTID IS NULL;
--------------------------------------------------------------------------------------------------------------------------------------------
-- LEFT JOIN Practice Set
-- 🟢 Easy (Q1–Q10)

-- Q1. Display all employee names and their department names using LEFT JOIN.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- Q2. Display all employee names, salaries, and department names.
SELECT E.NAME , E.SALARY, D.DNAME 
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- Q3. Display employee names and department names, sorted by employee name.
SELECT E.NAME , D.DNAME 
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
ORDER BY E.NAME ASC;

-- Q4. Display all employees working in the HR department.
SELECT E.NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME = 'HR';

-- Q5. Display all employees whose salary is greater than ₹75,000 along with their department names.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.SALARY > 75000;
-- Q6. Display employee names hired after '2023-01-01' along with department names.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE HIREDATE > '2023-01-01';
-- Q7. Display employee names and department names where the employee's location is 'Mumbai'.
SELECT E.NAME , D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.LOCATION = 'MUMBAI';
-- Q8. Display employee names and department names for employees aged above 30.
SELECT E.NAME , D.DNAME 
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.AGE > 30;
-- Q9. Display all employees whose job is 'Analyst' along with department names.
SELECT E.NAME 
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE JOB = 'ANALYST';
-- Q10. Display employee name, department name, and manager ID.
SELECT E.NAME , D.DNAME, MANAGERID
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;

-- 🟡 Medium (Q11–Q20)

-- Q11. Display employees whose department name starts with 'F'.
SELECT E.NAME 
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME LIKE 'F%';
-- Q12. Display employees whose department is either HR or IT.
SELECT E.NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE JOB = 'HR' OR JOB = 'IT';
-- Q13. Display employees belonging to departments 101, 103, and 107.
SELECT E.NAME , E.DEPTID
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE E.DEPTID IN (101,103,107);
-- Q14. Display employee names whose email contains 'gmail.com'.
SELECT NAME
FROM EMPLOYEES
WHERE EMAIL LIKE '%GMAIL.COM';
-- Q15. Display employee names whose salary is between ₹60,000 and ₹90,000.
SELECT NAME 
FROM EMPLOYEES
WHERE SALARY BETWEEN 60000 AND 90000;
-- Q16. Display employee name, annual salary (Salary × 12), and department name.
SELECT E.NAME, SALARY*12 AS ANNUAL_SALARY, D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID;
-- Q17. Display employees hired before 2022 along with department names.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE HIREDATE < '2022-01-01';
-- Q18. Display employee name and department name in descending order of salary.
SELECT E.NAME, D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID 
ORDER BY SALARY DESC;
-- Q19. Display all employees from the FINANACE department earning more than ₹80,000.
SELECT E.*, DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DNAME = 'FINANACE' AND SALARY >80000;
-- Q20. Display all employees whose names start with 'A' along with department names.
SELECT E.*,D.DNAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE NAME LIKE'A%';

-- 🔴 LEFT JOIN Special (Q21–Q30) These are the questions that actually test LEFT JOIN.

-- Q21. Write a query to find employees whose department does not exist.
SELECT E.NAME
FROM EMPLOYEES E LEFT JOIN DEPARTMENTS D
ON E.DEPTID = D.DEPTID
WHERE D.DEPTID IS NULL;
-- Q22. Explain why Q21 returns an empty result in your database.
-- it returns an empty result in my database becoz there is no employees whose departments doesnt exist

-- Q23. Suppose an employee is inserted with DeptID = 999. What would Q21 return?
-- empty set
-- Q24. Write a query to display departments that have no employees.
select d.dname
from departments d left join employees e
on d.deptid = e.deptid
where e.deptid is null;
-- Q25. Suppose Department 108 = LEGAL is added with no employees. What would Q24 return?
dname - legal
-- Q26. Why do we write:

-- WHERE E.EmpID IS NULL instead of WHERE D.DeptID IS NULL when finding departments without employees?
-- becoz object which we need to find will beright table as left join returns all rows from left table and matching rows from right table

-- Q27. Explain the difference between these two queries:

-- LEFT JOIN Departments D
-- ON E.DeptID = D.DeptID
-- WHERE D.DName = 'IT';  ----  where clause is used to filter the rows , when we use where clause inleft join it acts as inner join hence this will return only rows which are filtered

-- and

-- LEFT JOIN Departments D
-- ON E.DeptID = D.DeptID
-- AND D.DName = 'IT'; --- and operator returns the all rows such tha filtered roes as well as rows which are not filtered indicating there filter condition column as null.

-- Q28. Which query behaves like an INNER JOIN? Explain why.
-- where clause is used to filter the rows , when we use where clause inleft join it acts as inner join hence this will return only rows which are filtered

-- Q29. Which query preserves all employees?
-- query with and preserves all employees becoz and operator returns the all rows such tha filtered roes as well as rows which are not filtered indicating there filter condition column as null.

-- Q30. ⭐ Interview Without writing SQL, explain how LEFT JOIN works to someone who has never learned SQL.
-- AS PER THE DEFINATION LEFT JOIN RETURNS ALL ROWS FROM LEFT TABLE AND MATCHING ROWS FROM RIGHT TABLE
-- BUT WHEN WHERE CLAUSE IS USED IN LEFT JOIN ACTS AS INNER JOIN 
































