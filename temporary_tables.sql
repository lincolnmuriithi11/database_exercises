-- 1 Using the example from the lesson, create a temporary table called employees_with_departments that contains 
-- first_name, last_name, and dept_name for employees currently with that department. Be absolutely sure to create 
-- this table on your own database. If you see "Access denied for user ...", it means that the query was attempting 
-- to write a new table to a database that you can only read.
USE jemison_1758;
CREATE TEMPORARY TABLE employees_with_departments AS SELECT
    first_name,
    last_name,
    dept_name
    FROM
    employees.employees
        JOIN
    employees.dept_emp de USING (emp_no)
        JOIN
    employees.departments d USING (dept_no)
    LIMIT 100;
-- a   Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(31);
-- b Update the table so that full name column contains the correct data

UPDATE employees_with_departments 
SET 
    full_name = CONCAT(first_name, ' ', last_name);
-- c Remove the first_name and last_name columns from the table.

ALTER TABLE employees_with_departments DROP first_name;
ALTER TABLE employees_with_departments DROP last_name ;
DESCRIBE employees_with_departments;
SELECT 
    *
FROM
    employees_with_departments;
-- d
SELECT 
    d.dept_name,
    CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM
    employees e
        JOIN
    dept_emp de ON e.emp_no = de.emp_no
        JOIN
    departments d ON de.dept_no = d.dept_no;
 USE jemison_1758;
-- 2 Create a temporary table based on the payment table from the sakila database. Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199. 
use jemison_1758;
CREATE TEMPORARY TABLE sakila_payment (payment_id smallint unsigned, customer_id smallint unsigned, staff_id tinyint unsigned, rental_id int, amount DECIMAL (5,2), payment_date datetime, last_update timestamp);

ALTER TABLE sakila_payment MODIFY COLUMN amount int;

-- 3.Find out how the current average pay in each department 
-- compares to the overall, 
-- historical average pay. In order to make the comparison easier, you should use the Z-score 
-- for salaries. 
-- In terms of salary, what is the best department right now to work for? The worst? 
SELECT 
    AVG(salary), STDDEV(salary)
FROM
    employees.salaries;
CREATE TEMPORARY TABLE historic_aggregates as (
    SELECT AVG(salary) as avg_salary, stddev(salary) as std_salary
    FROM employees.salaries 
);

SELECT 
    dept_name, AVG(salary) AS department_current_average
FROM
    employees.salaries
        JOIN
    employees.dept_emp USING (emp_no)
        JOIN
    employees.departments USING (dept_no)
WHERE
    employees.salaries.to_date > CURDATE()
        AND employees.dept_emp.to_date > CURDATE()
GROUP BY dept_name;

CREATE TEMPORARY TABLE z_score_table AS SELECT dept_name, AVG (salary) AS department_current_average 
FROM employees.salaries
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE employees.salaries.to_date > CURDATE()
AND employees.dept_emp.to_date > CURDATE()
GROUP BY dept_name;
SELECT 
    *
FROM
    z_score_table;

ALTER TABLE z_score_table ADD historic_avg float(10,2);
ALTER TABLE z_score_table ADD historic_stddv float (10,2);
ALTER TABLE z_score_table ADD z_score float (10,2);
UPDATE z_score_table 
SET 
    historic_avg = (SELECT 
            avg_salary
        FROM
            historic_aggregates);
UPDATE z_score_table 
SET 
    historic_stddv = (SELECT 
            std_salary
        FROM
            historic_aggregates);
UPDATE z_score_table 
SET 
    z_score = (department_current_average - historic_avg) / historic_stddv
ORDER BY department_current_average;
SELECT 
    *
FROM
    z_score_table;


