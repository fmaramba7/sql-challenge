-- List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, last_name, first_name, sex, salary from employees
join salaries on  salaries.emp_no = employees.emp_no; 

-- List first name, last name, and hire date for employees who were hired in 1986.
select first_name, Last_name, hire_date  from employees
where 1986 = extract(year from hire_date)


--select extract(year from timestamp '1990-04-28') 
--select records where hire date is in 1990 
--select record where hire year is 1986 

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select  departments.dept_no, dept_name, employees.emp_no,last_name,  first_name
from employees
inner join dept_manager on employees.emp_no = dept_manager.emp_no
inner join departments on dept_manager.dept_no = departments.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex 
from employees
where first_name = 'Hercules'
and last_name like 'B%';


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, last_name, first_name, dept_name
from employees
inner join dept_emp on employees.emp_no = dept_emp.emp_no
inner join departments on dept_emp.dept_no = departments.dept_no
where dept_name = 'Sales'
or dept_name = 'Development';

-- List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.select * froem employes;
select count(last_name) as Frequency,last_name
from employees
group by last_name
order by Frequency desc;