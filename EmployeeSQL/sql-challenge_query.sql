--employee details
SELECT employees.emp_no, 
        employees.last_name, 
        employees.first_name, 
        employees.gender, 
        salaries.salary
FROM employees INNER JOIN salaries ON employees.emp_no = salaries.emp_no;

--employees hired in 1986
SELECT first_name, 
        last_name,
        EXTRACT (YEAR FROM hire_date) As YEAR
FROM employees
WHERE hire_date > '12/31/1985'
AND hire_date < '1/1/1987';

--manager of each department
SELECT dmgr.dept_no,
        d.dept_name,
        e.emp_no,
        e.last_name,
        e.first_name,
        dmgr.from_date,
        dmgr.to_date
FROM dept_manager AS dmgr JOIN employees AS e
ON dmgr.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = dmgr.dept_no;

--department of each employee
SELECT e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no;

--employees named "Hercules" with last name beginning with "B"
SELECT first_name,
        last_name
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--sales department employees
SELECT e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';

--sales and development department employees
SELECT e.emp_no,
        e.last_name,
        e.first_name,
        d.dept_name
FROM employees AS e JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments as d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales' OR WHERE d.dept_name = 'Development';

--frequency count of employee last names
SELECT last_name,
        COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) DESC;