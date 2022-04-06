-- 1
SELECT * FROM employees e
WHERE e.hire_date = (
	SELECT e.hire_date FROM employees e
	WHERE e.emp_no = '101010'
);

-- 2 
SELECT 
    t.title
FROM
    titles t
        JOIN
    employees e ON t.emp_no = e.emp_no
WHERE
    e.first_name IN (SELECT 
            e.first_name
        FROM
            employees e
        WHERE
            e.first_name = 'Aamod'
);

-- 3 
-- 59900
SELECT 
    COUNT(*)
FROM
    employees e
WHERE
    emp_no NOT IN (SELECT 
            emp_no
        FROM
            salaries
        WHERE
            to_date > NOW()
);

-- 4 
-- 'Isamu','Legleitner'
-- 'Karsten','Sigstam'
-- 'Leon','DasSarma'
-- 'Hilary','Kambil'

SELECT 
    e.first_name, e.last_name
FROM
    employees e
WHERE
    emp_no IN 
			(SELECT 
            emp_no
        FROM
            dept_manager dm
        WHERE
            dm.to_date > NOW()
)
        AND e.gender = 'F';

-- 5  
SELECT 
    e.first_name,
    e.last_name,
    s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > (SELECT 
            AVG(s.salary)
        FROM
            salaries s
)
        AND s.to_date > NOW();

-- 6
SELECT 
    e.first_name,
    e.last_name,
    s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.salary > (SELECT 
            AVG(s.salary)
        FROM
            salaries s
)
        AND s.to_date > NOW();
-- 6
SELECT 
    COUNT(*)
FROM
    salaries s
WHERE
    s.salary >= (SELECT 
            MAX(s.salary) - STDDEV(s.salary)
        FROM
            salaries s
)
        AND s.to_date > NOW();
        
        
/*
Bonus 1 - Find all the department names that currently have female managers.
*/

SELECT 
    d.dept_name
FROM
    departments d
        JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
WHERE
    dm.emp_no IN (SELECT 
            e.emp_no
        FROM
            employees e
        WHERE
            e.gender = 'F'
)
        AND dm.to_date > NOW();
        
/*
Bonus 2 - Find the first and last name of the employee with the highest salary.
*/

SELECT 
    e.first_name, e.last_name
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    s.emp_no = (SELECT 
            s.emp_no
        FROM
            salaries s
        ORDER BY s.salary DESC
        LIMIT 1
)
        AND s.to_date > NOW();
        
/*
Bonus 3 - Find the department name that the employee with the highest salary works in.
*/

-- SELECT d.dept_name FROM departments d
-- JOIN dept_emp de ON d.dept_no = de.dept_no
-- JOIN employees e ON de.emp_no = e.emp_no
-- WHERE 'Tokuyasu Pesch' = (SELECT 
--     CONCAT(e.first_name, ' ', e.last_name)
-- FROM
--     employees e
--         JOIN
--     salaries s ON e.emp_no = s.emp_no
-- WHERE
--     s.emp_no = (SELECT 
--             s.emp_no
--         FROM
--             salaries s
--         ORDER BY s.salary DESC
--         LIMIT 1
-- )
--         AND s.to_date > NOW())
--         AND de.to_date > NOW();