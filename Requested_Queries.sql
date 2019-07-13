-- 1.a List the following details of each employee: employee number, last name, first name, gender, and salary.
-- Note: The correct query takes into account that the salary can change overtime (needed to create an index on emp_no and from_dt on the salaries table)

select emp_no, last_name, first_name, gender, 
to_char (
(select salary from salaries s where s.emp_no = e.emp_no
and from_date = (select max(from_date) from salaries h where h.emp_no = s.emp_no)),'999,999.99') salary
from employees e order by last_name, first_name;

-- 1.b Simple query for above question. Assuming one employee/one salary

select e.emp_no, e.last_name, e.first_name, e.gender, to_char (s.salary,'999,999.99') salary
from employees e, salaries s where e.emp_no = s.emp_no order by last_name, first_name;

-- 2. List employees who were hired in 1986.

select emp_no, first_name, last_name from employees where hire_date between '1986-01-01' and '1986-12-31' order by hire_date;

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

select m.dept_no, d.dept_name, m.emp_no, e.last_name, e.first_name, m.from_date, m.to_date
from departments d, dept_manager m, employees e
where d.dept_no = m.dept_no and e.emp_no = m.emp_no

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select m.emp_no, e.last_name, e.first_name, d.dept_name
from departments d, dept_emp m, employees e
where d.dept_no = m.dept_no and e.emp_no = m.emp_no

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."

select e.emp_no, e.last_name, e.first_name from employees e
where first_name = 'Hercules' and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

select m.emp_no, e.last_name, e.first_name, d.dept_name
from departments d, dept_emp m, employees e
where d.dept_no = m.dept_no and e.emp_no = m.emp_no and d.dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select m.emp_no, e.last_name, e.first_name, d.dept_name
from departments d, dept_emp m, employees e
where d.dept_no = m.dept_no and e.emp_no = m.emp_no and d.dept_name in ( 'Sales', 'Development')

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name..

select e.last_name, count(e.emp_no) from employees e
group by e.last_name order by 2 desc

-- 9. Create a view to bring to Python with the average salaries by title

create view average_salaries as 
select t.title title, avg (s.salary) average_salary from
salaries s, titles t where s.emp_no = t.emp_no group by t.title;
