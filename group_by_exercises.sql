
SELECT 
    title
FROM
    titles
GROUP BY title;

-- 3.Write a query to to find a list of all unique last names of all employees that start and end with 'E' using GROUP BY
SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE 'e%e'
GROUP BY last_name;

-- 4. Write a query to to find all unique combinations of first and last names of all employees whose last names start and end with 'E'.
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    last_name LIKE 'e%e'
GROUP BY first_name , last_name;
-- 5. Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code. 
-- Qiwen 168 times
SELECT 
    last_name
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;

-- 6. Add a COUNT() to your results (the query above) to find the number of employees with the same last name.
-- 168
SELECT 
    COUNT(last_name)
FROM
    employees
WHERE
    last_name LIKE '%q%'
        AND last_name NOT LIKE '%qu%'
GROUP BY last_name;        
-- 7. Find all all employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names
SELECT 
    COUNT(*) gender
FROM
    employees
WHERE
    first_name IN ('Irena' , 'Vidya', 'Maya')
GROUP BY gender;

-- 8. Using your query that generates a username for all of the employees, generate a count employees for each unique username. Are there any duplicate usernames? BONUS: How many duplicate usernames are there?

SELECT 
    LOWER(CONCAT(SUBSTR(first_name, 1, 1),
                    SUBSTR(last_name, 1, 4),
                    '_',
                    SUBSTR(birth_date, 6, 2),
                    SUBSTR(birth_date, 3, 2))) AS username,
    COUNT(*) AS Duplicate_user
FROM
    employees
GROUP BY username
HAVING (Duplicate_user > 1);


