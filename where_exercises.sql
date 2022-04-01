-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
	-- 709 rows returned 
USE employees;

SELECT 
    first_name
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya');
    
-- 3. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records
-- 709 rows returned 
SELECT 
    first_name
FROM
    employees
WHERE
    first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya';

-- 4. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned
-- 612 rows returned 
SELECT 
    first_name
FROM
    employees
WHERE
    gender = 'M' AND first_name = 'Irena'
        OR first_name = 'Vidya'
        OR first_name = 'Maya';

-- 5. Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
-- 7330 rows returned
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%';

-- 6. Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?
-- 30723 rows returned
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE 'E%'
        OR last_name LIKE '%E';
-- 7. Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?
--  employees without 'E' as the first letter on their name are 23393
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%E'
        AND NOT last_name LIKE 'E%';



-- 8. Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
-- 135214 rows
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%';

-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
-- 842 rows
SELECT 
    *
FROM
    employees
WHERE
    birth_date LIKE '%-12-25';
    

-- 10. Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.    
-- 362 rows
SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE '199%'
        AND birth_date LIKE '%-12-25';

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
-- 1873 rows 
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%q%';

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
-- 547 rows
SELECT 
    *
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND NOT last_name LIKE '%qu%';



