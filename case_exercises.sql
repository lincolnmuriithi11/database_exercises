-- Write a query that returns all employees, their department number, 
-- their start date, their end date, and a new column 'is_current_employee' 
-- that is a 1 if the employee is still with the company and 0 if not
USE employees;
SELECT DISTINCT emp_no,dept_no,hire_date,to_date,

CASE WHEN to_date > CURDATE() THEN 1 

ELSE 0 

END AS is_current_employee

FROM dept_emp

JOIN employees as e

USING(emp_no);


-- Write a query that returns all employee names (previous and current), 
-- and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
-- depending on the first letter of their last name. 



-- How many employees (current or previous) were born in each decade?
SELECT CASE WHEN birth_date LIKE '195%' THEN 'Year_of_birth 50s'
	   		WHEN birth_date LIKE '196%-%-%' THEN 'Year_of_birth 60s'
	   		ELSE null
	   		END AS Seniors 
	   		, COUNT(emp_no) AS senior_employees
FROM employees
GROUP BY Seniors;


