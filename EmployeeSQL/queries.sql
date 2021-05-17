--1. List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

SELECT employees_info.emp_no, employees_info.last_name, employees_info.first_name, employees_info.sex,salaries.salary
FROM salaries
INNER JOIN employees_info ON
employees_info.emp_no=salaries.emp_no;


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, first_name, hire_date
from employees_info
WHERE hire_date LIKE '%1986'

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
SELECT manager.dept_no, departments.dept_name, manager.emp_no,  employees_info.last_name, employees_info.first_name
FROM manager
INNER JOIN departments ON
manager.dept_no=departments.dept_no
LEFT JOIN employees_info
ON manager.emp_no=employees_info.emp_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees_info.emp_no, employees_info.last_name, employees_info.first_name, departments.dept_name
FROM employees_info
INNER JOIN employees ON
employees_info.emp_no=employees.emp_no
LEFT JOIN departments
ON employees.dept_no=departments.dept_no;

--5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name,last_name, sex
from employees_info
WHERE first_name LIKE 'Hercules' and last_name LIKE 'B%';

--6.List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.
SELECT employees_info.emp_no, employees_info.last_name, employees_info.first_name, departments.dept_name
FROM employees_info
INNER JOIN employees ON
employees_info.emp_no=employees.emp_no
LEFT JOIN departments
ON employees.dept_no=departments.dept_no
WHERE dept_name IN
(
  SELECT dept_name
  FROM departments
  WHERE dept_name = 'Sales'
 );

--7 List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT employees_info.emp_no, employees_info.last_name, employees_info.first_name, departments.dept_name
FROM employees_info
INNER JOIN employees ON
employees_info.emp_no=employees.emp_no
LEFT JOIN departments
ON employees.dept_no=departments.dept_no
WHERE dept_name  IN
	(
 		 SELECT dept_name
 	 	FROM departments
 	 	WHERE dept_name = 'Sales' or dept_name = 'Development'
 	);

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT employees_info.last_name, COUNT(employees_info.last_name) AS "last_name count"
FROM employees_info
GROUP BY employees_info.last_name
ORDER BY "last_name count" DESC;