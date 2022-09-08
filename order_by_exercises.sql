Create a file named where_exercises.sql. Make sure to use the employees database.

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?

Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.

Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.

Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
2  709
USE employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')

3 709
USE employees;

SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya'

4 441
USE employees;

SELECT *
FROM employees
WHERE gender = 'M' AND (first_name = 'Irena' OR first_name = 'Vidya' OR first_name = 'Maya')

5 7330
USE employees;

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%'

6 a 30723
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%e'
6 b 23393 
SELECT *
FROM employees
WHERE last_name not LIKE 'E%' AND last_name LIKE '%e'

7 a 899
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
we changed the limit of rows in drop down
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
7 b 24292
SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%e'

8 135214
SELECT count(hire_date)
FROM employees
WHERE hire_date LIKE '199%';

9 842
SELECT count(birth_date)
FROM employees
WHERE birth_date LIKE '%-12-25';

10 362
USE employees;

SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%';

11 1873

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%';

12 547

SELECT COUNT(last_name)
FROM employees
WHERE last_name LIKE '%q%'AND last_name not LIKE '%qu%';

Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.

2 SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name
  Irena Reutenauer and Vidya Simmen

3 
 SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')

ORDER BY first_name, last_name;
    Irena Acton and Vidya Zweizig

4 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')

ORDER BY last_name, first_name;
    Irena Acton and Maya Zyda

5
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
ORDER BY emp_no
899 10021 Ramzi Erde
499648 Tadahiro Erde

6
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%e'
ORDER BY hire_date desc
899 Teiji Eldrige and Sergi Erde

7
SELECT *
FROM employees
WHERE birth_date LIKE '%-12-25' AND hire_date LIKE '199%'
ORDER BY birth_date ASC, hire_date desc;
362 Khun Bernini
Doudi Petitis