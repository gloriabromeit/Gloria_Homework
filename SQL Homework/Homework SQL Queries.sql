-- List the following details of each employee: employee number, last name, first name, gender, and salary.


select e.emp_no, e.last_name, e.first_name, e.gender, s.salary
from employees as e
join salaries as s
on e.emp_no = s.emp_no

-- List employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where CAST(hire_date as TEXT) LIKE '%1986%'

-- List the manager of each department with the following information: department number, 
-- department name, the manager's employee number, last name, first name, and start and end employment dates.

with inputz as 
(select d.dept_name, dm.dept_no, dm.from_date, dm.to_date, dm.emp_no
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no)

select e.first_name, e.last_name, inputz.*
from inputz
join employees as e
on e.emp_no = inputz.emp_no

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

with emp_number as (select e.emp_no, e.last_name, e.first_name, dm.dept_no
from dept_manager as dm
join employees as e
on e.emp_no = dm.emp_no),

depart_name as (select d.dept_name, e.emp_no, e.first_name, e.last_name
from emp_number as e
join departments as d
on d.dept_no = e.dept_no)

select * from depart_name

-- List all employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name 
from employees
where first_name = 'Hercules' and last_name like 'B%'

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.

with inputz as 
(select d.dept_name, dm.dept_no, dm.from_date, dm.to_date, dm.emp_no
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no)

select e.first_name, e.last_name, i.emp_no, i.dept_name
from inputz as i
join employees as e
on e.emp_no = i.emp_no
where dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

with inputz as 
(select d.dept_name, dm.dept_no, dm.from_date, dm.to_date, dm.emp_no
from departments as d
join dept_manager as dm
on d.dept_no = dm.dept_no)

select e.first_name, e.last_name, i.emp_no, i.dept_name
from inputz as i
join employees as e
on e.emp_no = i.emp_no
where dept_name = 'Sales' or dept_name = 'Development'

select * from employees where emp_no = 499942
