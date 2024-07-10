SELECT * FROM departments;
SELECT * FROM titles; 
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
JOIN salaries s ON 
e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Create view from query
CREATE VIEW Employee_info_salary AS
SELECT e.emp_no, e.last_name, e.first_name, e.gender, s.salary
FROM employees as e
JOIN salaries s ON 
e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- Query the table view created
SELECT *
FROM Employee_info_salary;

-- Drop view
DROP VIEW Employee_info_salary;

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

--verify results
SELECT first_name, last_name, hire_date
FROM employees
WHERE first_name = 'Eran' And last_name = 'Cusworth'

--3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager as dm
JOIN departments d ON 
dm.dept_no = d.dept_no
JOIN employees as e ON 
dm.emp_no = e.emp_no;

--Verify results
Select *
From employees 
where emp_no = '110022';


--4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees as e ON 
de.emp_no = e.emp_no
JOIN departments as d ON 
de.dept_no = d.dept_no
ORDER BY e.emp_no;

--5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, gender
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM dept_emp as de
JOIN employees as e ON 
de.emp_no = e.emp_no
JOIN departments as d ON 
de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.emp_no;


--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp as de
JOIN employees as e ON 
de.emp_no = e.emp_no
JOIN departments as d ON 
de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY e.emp_no;

--8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

--verify results 
Select *
From employees 
where last_name = 'Baba';