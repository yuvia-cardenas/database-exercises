1. Find all the current employees with the same hire date as employee 101010 using a sub-query.
USE employees;

SELECT *
FROM employees
WHERE emp_no = '101010';

SELECT *
FROM employees
JOIN dept_emp USING(emp_no)
WHERE to_date > CURDATE()
    AND hire_date IN ( 
					SELECT hire_date
					FROM employees
					WHERE emp_no = 101010);
2. Find all the titles ever held by all current employees with the first name Aamod.
USE employees;

SELECT *
FROM employees
WHERE first_name = 'Aamod';

SELECT DISTINCT title
FROM titles
JOIN employees USING(emp_no)
WHERE to_date > CURDATE()
      AND emp_no IN (
					SELECT emp_no
                    FROM employees
                    WHERE first_name = 'Aamod');

3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.
USE employees;

SELECT COUNT(*)
FROM employees
WHERE emp_no IN 
                (SELECT emp_no
                 FROM dept_emp
                 WHERE to_date < CURDATE());




4. Find all the current department managers that are female. List their names in a comment in your code.
SELECT *
FROM employees
WHERE emp_no IN 
            (SELECT emp_no
            FROM dept_manager
            WHERE to_date > CURDATE())
AND gender = 'F';




5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.
SELECT *
FROM salaries
JOIN employees USING(emp_no)
WHERE to_date > CURDATE()
AND salary > (SELECT AVG(salary) 
              FROM salaries);



6. How many current salaries are within 1 standard deviation of the current highest salary? 
(Hint: you can use a built in function to calculate the standard deviation.) 
What percentage of all salaries is this?
Hint You will likely use multiple subqueries in a variety of ways
Hint Its a good practice to write out all of the small queries that you can. 
Add a comment above the query showing the number of rows returned. 
You will use this number (or the query that produced it) in other, larger queries.

SELECT MAX(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT STD(salary)
FROM salaries
WHERE to_date > CURDATE();

SELECT COUNT(*)
FROM salaries
WHERE to_date > CURDATE()
AND salary > (
                (SELECT MAX(salary) FROM salaries WHERE to_date > CURDATE()) -
                (SELECT STD(salary) FROM salaries WHERE to_date > CURDATE())
                
                
                )