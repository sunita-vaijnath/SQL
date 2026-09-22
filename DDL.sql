-- DDL DATA DEFINATION LANGUAGE : IS USED TO CONSTRUCT MODIFY & REMOVE THE OBJECT.
-- i. create
-- ii. replace
-- iii. alter
-- iv. truncate
-- v. drop  
----------------------------------------------------------------------------------------------------------------------

-- 1.  CREATE IS USED TO CONSTRUCT THE OBJECT 
-- CREATE TABLE table_name (
--   column1 datatype constraint,
--   column2 datatype constraint,
--   column3 datatype constraint,
--   ....    ); 
create database company_db;
use company_db;

CREATE TABLE PROJECTS(
	PROJECTID INT PRIMARY KEY,
    PNAME VARCHAR(100),
    BUDGET DECIMAL (12,2),
    START_DATE date,
    END_DATE DATE
);


CREATE TABLE DEPARTMENTS(
DEPTID INT PRIMARY KEY, 
DNAME VARCHAR(50)
);
select * from employees;
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Gender enum('MALE','FEMALE'),
    AGE INT NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    JOB VARCHAR (50), 
    HIREDATE DATE,
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
     FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    MANAGERID  INT , 
    LOCATION  VARCHAR(50)
);


DROP TABLE EMPLOYEES;
    
SHOW TABLES ;
----------------------------------------------------------------------------------------------------------------------

-- ALTER TABLE IS DDL (DATA DEFINATION LANGUAGE) COMMAND USED TO MODIFY THE STRUCTURE ODF EXISTING TABLE WITHOUT DELETING IT.
-- ALTER TABLE can do many things.
-- Operation	   Purpose
-- 1. ADD	           Add a new column
-- 2. MODIFY	       Change a column's data type or size
-- 3. CHANGE	       Rename a column and/or change its definition (MySQL)
-- 4. DROP COLUMN	   Remove a column
-- 5. RENAME COLUMN   Rename a column (MySQL 8+)
-- RENAME TO	   Rename the table (or RENAME TABLE)


-- 1. ADD COLUMN
-- ALTER TABLE TEBALE_NAME
--  ADD COL_NAME DATATYPE;
 
ALTER TABLE EMPLOYEES
ADD BLOODGROUP VARCHAR(5); 

ALTER TABLE EMPLOYEES
ADD PAN_NUMBER VARCHAR(10);

ALTER TABLE EMPLOYEES
ADD EMERGENCY_CONTACT VARCHAR(15);

ALTER TABLE EMPLOYEES
ADD PAN_NUMBER VARCHAR(12);

-- Add both columns in a single ALTER TABLE statement. 
alter table employees
add emergency_contact varchar(10),
add blood_group varchar(5);

-- 2. MODIFY alter table modify 
--  ALTER TABLE TABLE_NAME
-- MODIFY COLUMN_NAME   NEW_DATATYPE ;

ALTER TABLE EMPLOYEES
MODIFY EMERGENCY_CONTACT VARCHAR(15);

ALTER TABLE EMPLOYEES
MODIFY EMAIL VARCHAR(100);

ALTER TABLE EMPLOYEES
MODIFY PAN_NUMBER VARCHAR(12);

-- 3. CHANGE ALTER TABLE
-- IS USED TO RENAME COLUMN , CHANGE DATATYPE
-- SYNTAX:
-- ALTER TABLE TABLE_NAME
-- CHANGE OLD_NAME NEW_NAME DATATYPE;

ALTER TABLE EMPLOYEES
CHANGE EMERGENCY_CONTACT MOBILE_NO VARCHAR(15);

ALTER TABLE EMPLOYEES
CHANGE PHONE MOBILE_NUMBER VARCHAR(15);

-- 4. RENAME ALTER TABLE
-- IS USED TO RENAME THE THE COLUMN NAME'
-- SYNTAX:  
-- ALTER TABLE TABLE_NAME
-- RENAME OLD_NAME TO NEW_NAME;

ALTER TABLE Employees
RENAME COLUMN Phone TO Mobile_Number;

ALTER TABLE EMPLOYEES
RENAME COLUMN EMAIL TO EMAILID ;

ALTER TABLE EMPLOYEES
RENAME COLUMN PAN_NUMBER TO Permanent_Account_Number;

-- 5. DROP COULMN ALETR TABLE
-- THIS IS USED TO DELETE THE COLUMN  , ALL THE DATA IN THE COLUMN IS DELETED

ALTER TABLE EMPLOYEES
DROP COLUMN  Passport_No;

ALTER TABLE Employees
DROP COLUMN Blood_Group;
----------------------------------------------------------------------------------------------------------------------
-- TRUNCATE emoves all rows from a table while keeping the table structure, columns, constraints, and indexes intact
-- SYNTAX:
-- TRUNCATE TABLE table_name;

TRUNCATE TABLE EMPLOYEES;

DESC EMPLOYEES; -- desc (describe)is used to describe the structure of table
----------------------------------------------------------------------------------------------------------------------
 -- 5. DROP TABLE : PERMANENTLY REMOVES THE TABLE AND EVERYTHING INSIDE THE TABLE
 -- SYNTAX:  DROP TABLE TABLE_NAME;
 

 
 DROP TABLE EMPLOYEE_TEST;
----------------------------------------------------------------------------------------------------------------------
-- DELETE REMOVES SPECIFIC ROWS FROM TABLE
-- TRUNCATE REMOVES ALL THE RECORDS FROM THE TABLE , BUT KEEPS THE STRUCTURE OF TABLE
-- DROP REMOVES THE ENTIRE TABLE (DELETES RECORDS AS WELL AS STRUCTURE)
----------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------

use company_db;


