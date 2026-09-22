-- DML DATA MANIPULATION LANGUAGE : IS USED TO MANIPULATE THE OBJECT BY INSERTING , UPDATING DELETE
-- i. INSERT
-- ii. UPDATE
-- iii. DELETE

-- 1. INSERT STATEMENT IS USED TO ADD NEW RECORDS INTO EXISTING TABLE
-- SYNTAX: INSERT INTO table_name (column1, column2, column3, ...)
-- 			VALUES (value1, value2, value3, ...);

-- inserting data

INSERT INTO Projects (ProjectID, PName, Budget, Start_Date, End_Date)
VALUES
(1, 'Website Development', 500000.00, '2025-01-10', '2025-06-30'),
(2, 'Mobile Banking App', 1200000.00, '2025-02-15', '2025-12-31'),
(3, 'CRM System', 850000.00, '2024-08-01', '2025-05-31'),
(4, 'HR Portal', 400000.00, '2025-03-01', '2025-08-31'),
(5, 'Sales Dashboard', 650000.00, '2024-10-15', '2025-04-30'),
(6, 'Inventory System', 950000.00, '2025-01-20', '2025-11-30'),
(7, 'Cloud Migration', 1800000.00, '2024-06-01', '2025-12-31'),
(8, 'AI Chatbot', 1500000.00, '2025-04-01', '2026-03-31'),
(9, 'Payroll Automation', 550000.00, '2024-09-10', '2025-03-31'),
(10, 'Data Warehouse', 2500000.00, '2025-05-15', '2026-06-30');

INSERT INTO DEPARTMENTS (DEPTID, DNAME  )
VALUES
(101, 'IT'),
(102,'HR'),
(103,'FINANACE'),
(104,'MARKETING'),
(105, 'SALES'),
(106, 'OPERATION'),
(107, 'ADMINISTRATION')
;

INSERT INTO Employees
(EmpID, Name, Gender, AGE, Salary, JOB, HIREDATE, Email, DeptID, MANAGERID, LOCATION)
VALUES
(1, 'Nita Rai', 'FEMALE', 22, 45000.00, 'Analyst', '2025-07-15', 'nita.raI@gmail.com', 101, 21, 'Mumbai'),
(2, 'Rahul Sharma', 'MALE', 28, 65000.00, 'Software Engineer', '2023-06-12', 'rahul.sharma@gmail.com', 101, 22, 'Pune'),
(3, 'Priya Patel', 'FEMALE', 26, 52000.00, 'HR', '2024-01-10', 'priya.patel@gmail.com', 102, 23, 'Mumbai'),
(4, 'Amit Verma', 'MALE', 30, 90000.00, 'MANAGER', '2022-03-20', 'amit.verma@gmail.com', 101, NULL, 'Delhi'),
(5, 'Neha Joshi', 'FEMALE', 27, 58000.00, 'Analyst', '2023-08-11', 'neha.joshi@gmail.com', 103, 24, 'Pune'),
(6, 'Karan Mehta', 'MALE', 29, 72000.00, 'Administrator', '2022-11-18', 'karan.mehta@gmail.com', 101, 22, 'Ahmedabad'),
(7, 'Sneha Kulkarni', 'FEMALE', 24, 48000.00, 'Engineer', '2025-02-14', 'sneha.k@gmail.com', 101, 22, 'Mumbai'),
(8, 'Rohan Singh', 'MALE', 31, 82000.00, 'CLERK', '2021-09-01', 'rohan.singh@gmail.com', 101, NULL, 'Bengaluru'),
(9, 'Anjali Desai', 'FEMALE', 25, 50000.00, 'Marketing Executive', '2024-04-16', 'anjali.desai@gmail.com', 104, 25, 'Surat'),
(10, 'Vikram Nair', 'MALE', 33, 95000.00, 'Analyst', '2021-12-22', 'vikram.nair@gmail.com', 103, 24, 'Chennai'),
(11, 'Pooja Shah', 'FEMALE', 27, 61000.00, 'ACCOUNTANT', '2023-07-05', 'pooja.shah@gmail.com', 103, 24, 'Ahmedabad'),
(12, 'Arjun Rao', 'MALE', 29, 68000.00, 'Engineer', '2022-10-08', 'arjun.rao@gmail.com', 101, 22, 'Hyderabad'),
(13, 'Meera Iyer', 'FEMALE', 28, 56000.00, 'HR', '2023-09-19', 'meera.iyer@gmail.com', 102, 23, 'Chennai'),
(14, 'Sahil Khan', 'MALE', 26, 47000.00, 'Sales', '2025-01-11', 'sahil.khan@gmail.com', 105, 26, 'Delhi'),
(15, 'Ritika Jain', 'FEMALE', 30, 87000.00, 'Data Scientist', '2022-05-30', 'ritika.jain@gmail.com', 101, 21, 'Bengaluru'),
(16, 'Deepak Yadav', 'MALE', 34, 98000.00, ' Manager', '2021-04-09', 'deepak.yadav@gmail.com', 106, NULL, 'Lucknow'),
(17, 'Komal Gupta', 'FEMALE', 25, 49000.00, 'Analyst', '2024-06-01', 'komal.gupta@gmail.com', 103, 24, 'Jaipur'),
(18, 'Aditya Kulkarni', 'MALE', 27, 63000.00, 'Engineer', '2023-11-23', 'aditya.k@gmail.com', 101, 22, 'Pune'),
(19, 'Nisha Reddy', 'FEMALE', 29, 74000.00, 'HR', '2022-07-14', 'nisha.reddy@gmail.com', 102, 23, 'Hyderabad'),
(20, 'Harsh Agarwal', 'MALE', 32, 88000.00, 'Sales', '2021-08-28', 'harsh.agarwal@gmail.com', 105, NULL, 'Kolkata'),
(21, 'Anita Kapoor', 'FEMALE', 40, 120000.00, 'Manager', '2019-06-10', 'anita.kapoor@gmail.com', 101, NULL, 'Mumbai'),
(22, 'Rajesh Kumar', 'MALE', 42, 130000.00, 'Engineer', '2018-09-15', 'rajesh.kumar@gmail.com', 101, NULL, 'Pune'),
(23, 'Seema Joshi', 'FEMALE', 39, 115000.00, 'HR', '2019-11-12', 'seema.joshi@gmail.com', 102, NULL, 'Delhi'),
(24, 'Manoj Patil', 'MALE', 41, 125000.00, 'Finance', '2018-03-18', 'manoj.patil@gmail.com', 103, NULL, 'Mumbai'),
(25, 'Kavita Rao', 'FEMALE', 38, 110000.00, 'CLERK', '2020-01-25', 'kavita.rao@gmail.com', 104, NULL, 'Hyderabad'),
(26, 'Suresh Menon', 'MALE', 43, 118000.00, 'Sales', '2019-08-14', 'suresh.menon@gmail.com', 105, NULL, 'Chennai'),
(27, 'Divya Sharma', 'FEMALE', 26, 51000.00, 'HR', '2024-09-01', 'divya.sharma@gmail.com', 106, 16, 'Jaipur'),
(28, 'Nitin Gupta', 'MALE', 31, 76000.00, 'Engineer', '2022-12-12', 'nitin.gupta@gmail.com', 101, 21, 'Noida'),
(29, 'Aisha Khan', 'FEMALE', 24, 46000.00, 'CLERK', '2025-03-10', 'aisha.khan@gmail.com', 104, 25, 'Mumbai'),
(30, 'Mohit Sinha', 'MALE', 28, 69000.00, 'Analyst', '2023-02-20', 'mohit.sinha@gmail.com', 103, 24, 'Patna')
;

-- Instead of typing values manually, you can copy data from another table.

INSERT INTO Employee_Backup 
	( 
		EmpID, Name, Salary
	)
		SELECT EmpID, Name, Salary
		FROM Employees
		WHERE DeptID = 101;
        
INSERT INTO EMPLOYEES (EMPID , NAME , GENDER, AGE , SALARY, JOB , HIREDATE, EMAIL, DEPTID, MANAGERID, LOCATION)
VALUES(
31, 'ROHIT JAI', 'MALE', 29, 72000, 'ANALYST', '2025-07-15', 'rohit@gmail.com', 107, 3 , 'Pune'
);

INSERT INTO EMPLOYEES(EmpID, Name, Salary, DeptID)
VALUES(22, Neha, 65000, 101,
23, Arjun, 70000, 102,
24, Kavya, 85000, 103);

-- ----------FOR CREATING A NEW TABLE THAT HAS OLD STRUCTURE---------------------- 
CREATE TABLE EMPLOYEE_BACKUP AS
SELECT *
FROM EMPLOYEES
WHERE 1= 0;
-- OR--
 CREATE TABLE Employee_Backup
LIKE Employees;

-- The HR department wants to copy all employees from Department 101 into the Employee_Backup table. ---- 
INSERT INTO  EMPLOYEE_BACK 
SELECT *
FROM EMPLOYEES
WHERE DEPTID = 101 ;
    
----------------------------------------------------------------------------------------------------------------------

--  SELECT IS USED TO RETRIVE THE DATA FROM THE TABLE 
SELECT * FROM EMPLOYEES;
SELECT * FROM PROJECTS;
SELECT * FROM DEPARTMENTS; 

----------------------------------------------------------------------------------------------------------------------

-- 2. UPDATE IS USED TO MODIFY THE EXISTING DATA IN ONE OR MORE ROS OF A TABLE
-- SYNTAX:
-- UPDATE TABLE_NAME
-- SET COL_NAME = value
-- WHERE CONDITION ; 

USE company_db;
-- update employees
-- set salary = 75000
-- where empid = 1;

-- select *
-- from employees
-- where empid = 1;

-- update employees
-- set deptid = 107
-- where empid = 8;

-- select * from employees where empid = 5;
-- update employees
-- set salary = salary + 5000
-- where empid = 5;

-- update employees
-- set salary = 950000 and job = 'Senior Analyst'
-- where empid = 18;

-- UPDATE Employees
-- SET Salary = Salary + 10000
-- WHERE DeptID = 103;

use company_db;

-- update employees
-- set salary = salary * 1.10
-- where deptid = 101 and hiredate <= '2023-01-01';


update employees
set deptid = 105 , job = 'team lead' , salary = salary *1.15
where empid = 12;

----------------------------------------------------------------------------------------------------------------------

-- 3. Delete is (data manipulation language)command used to remove one or more rows from the table
-- delete from table_name
-- where condition

DELETE FROM EMPLOYEES
WHERE EMPID = 20;

DELETE FROM EMPLOYEES
WHERE DEPTID = 101 AND SALARY > 50000;

DELETE FROM EMPLOYEES
WHERE DEPTID = 107 OR SALARY < 40000;







































