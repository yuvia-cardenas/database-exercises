Copy the order by exercise and save it as functions_exercises.sql.


Write a query to to find all employees whose last name starts and ends with 'E'. Use concat() to combine their first and last name together as a single column named full_name.
SELECT CONCAT(first_name, " ", last_name) AS full_name 
FROM employees
WHERE last_name LIKE 'e%e';


Convert the names produced in your last query to all uppercase.

SELECT CONCAT(UPPER(first_name), " ", UPPER(last_name)) AS full_name 
FROM employees
WHERE last_name LIKE 'e%e';

Find all employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company (Hint: You will also need to use NOW() or CURDATE()),

SELECT DATEDIFF(CURDATE(), hire_date)
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
Find the smallest and largest current salary from the salaries table.
$38623
SELECT MIN(salary), MAX(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT MIN(salary), MAX(salary)
FROM salaries
WHERE to_date > CURDATE();

$158220

 ---SELECT MAX(salary)
----FROM salaries;  This is not specific enough

Use your knowledge of built in SQL functions to generate a 
username for all of the employees. 
A username should be all lowercase, and consist of the first character of the employees first name, 
the first 4 characters of the employees last name, an 
underscore, the month the employee was born, and the last two digits of the year that they were born.

SELECT LOWER(CONCAT(SUBSTR(first_name, 1, 1), SUBSTR(last_name, 1, 4), "_", SUBSTR(birth_date, 6, 2), SUBSTR(birth_date, 3, 2))) AS username
 FROM employees;                                    