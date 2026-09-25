-- 1. CARTESIAN JOINS  
-- THE RECORDS OF TABLE 1 WILL BE MERGED WITH RECORDS OF TABLE 2
-- A Cartesian Join returns every possible combination of rows from the first table with rows from the second table.
----------------------------------------------------------------------------------------------------------------------
-- SYNTAX: 
-- ANSI (AMERICAN NATIONAL STANDARD INSTITUTE)
-- 		select col_name
-- 		from table_name1 cross join table_name2;
------------------------------------------------------------------------------------------------------
-- ORACLE
-- 		SELECT COL_NANE
--      FROM TABLE_NAME1, TABLE_NAME2;
-------------------------------------------------------------------------------------------------------

select * 
from employees cross join departments
limit 6;

-- Real-World Uses:
-- Although many people think CROSS JOIN is useless, it has practical applications:

-- Example 1 — Product Variants
-- Colors:
-- Color
-- Black
-- White

-- Sizes:
-- Size
-- S
-- M
-- L

-- Result:

-- Color	Size
-- Black	S
-- Black	M
-- Black	L
-- White	S
-- White	M
-- White	L

-- Useful for generating all product combinations.


