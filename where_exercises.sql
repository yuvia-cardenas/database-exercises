
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

