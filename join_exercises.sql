Use the employees database.

2. Using the example in the Associative Table Joins section as a guide, 
write a query that shows each department along with the name of the current manager for that department.

USE employees;
SELECT CONCAT(employees.first_name, " ", employees.last_name) AS Department Manager, departments.dept_name AS 
Depaertment Name
FROM departments
JOIN dept_manager
  ON dept_manager.dept_no = departments.dept_no
JOIN employees 
  ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01';

3. Find the name of all departments currently managed by women.

USE employees;
SELECT CONCAT(employees.first_name, " ", employees.last_name), departments.dept_name
FROM departments
JOIN dept_manager
  ON dept_manager.dept_no = departments.dept_no
JOIN employees 
  ON employees.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01' 
AND employees.gender = 'F';

4. Find the current titles of employees currently working in the Customer Service department.

USE employees;
SELECT COUNT(dept_emp.emp_no), titles.title
FROM departments
JOIN dept_emp
  ON departments.dept_no = dept_emp.dept_no
JOIN titles 
  ON dept_emp.emp_no = titles.emp_no
WHERE dept_emp.to_date = '9999-01-01' 
AND dept_name = 'Customer Service'
AND titles.to_date = '9999-01-01'
GROUP BY titles.title;

5. Find the current salary of all current managers

USE employees;
SELECT CONCAT(employees.first_name, " ", employees.last_name) AS 'Name', 
	departments.dept_name AS 'Department Name', 
	salaries.salary AS 'Salary'
FROM departments
JOIN dept_manager
  ON departments.dept_no = dept_manager.dept_no
JOIN employees 
  ON dept_manager.emp_no = employees.emp_no
JOIN salaries
  ON dept_manager.emp_no = salaries.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01';

6. Find the number of current employees in each department

USE employees;
SELECT COUNT(employees.emp_no) AS num_employees, departments.dept_name, dept_emp.dept_no
FROM departments
JOIN dept_emp
  ON dept_emp.dept_no = departments.dept_no
JOIN employees
	ON employees.emp_no = dept_emp.emp_no

WHERE dept_emp.to_date = '9999-01-01'
GROUP BY dept_name;

7. Which department has the highest average salary? Hint: Use current not historic information.

USE employees;
SELECT
	departments.dept_name, 
	AVG(salaries.salary) AS average_salary
FROM departments
JOIN dept_emp 
  ON dept_emp.dept_no = departments.dept_no
JOIN salaries
  ON salaries.emp_no = dept_emp.emp_no
WHERE salaries.to_date = '9999-01-01'
GROUP BY departments.dept_name
ORDER BY average_salary desc
LIMIT 1;

8. Who is the highest paid employee in the Marketing department?

USE employees;
SELECT employees.first_name, employees.last_name
FROM departments
JOIN dept_emp
  ON dept_emp.dept_no = departments.dept_no
JOIN employees 
  ON employees.emp_no = dept_emp.emp_no
JOIN salaries
  ON salaries.emp_no = employees.emp_no
WHERE salaries.to_date = '9999-01-01' 
AND departments.dept_name = 'Marketing'
ORDER BY salary desc
LIMIT 1;


9. Which current department manager has the highest salary?

USE employees;
SELECT employees.first_name, employees.last_name, 
	departments.dept_name, 
	salaries.salary
FROM departments
JOIN dept_manager
  ON dept_manager.dept_no = departments.dept_no
JOIN employees 
  ON employees.emp_no = dept_manager.emp_no
JOIN salaries
  ON salaries.emp_no = dept_manager.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
ORDER BY salary desc
LIMIT 1;

10. Determine the average salary for each department. Use all salary information and round your results.
USE employees;
SELECT
	departments.dept_name, 
	ROUND(AVG(salaries.salary), 0) AS average_salary
FROM departments
JOIN dept_emp 
  ON dept_emp.dept_no = departments.dept_no
JOIN salaries
  ON salaries.emp_no = dept_emp.emp_no
GROUP BY departments.dept_name
ORDER BY average_salary desc;