--List the employee number, last name, first name, sex, and salary of each employee.


select distinct e.emp_no,last_name,first_name, sex,s.salary
from public.employees e
inner join salaries s on e.emp_no =s.emp_no
order by emp_no 


-- List the first name, last name, and hire date for the employees who were hired in 1986


select first_name,last_name,hire_date --extract ('year' from hire_date)
from public.employees
where extract( year from hire_date) = 1986 


-- List the manager of each department along with their department number, department name, employee number, last name, and first name.


select distinct mgr.emp_no as manager ,mgr.dept_no as department_number , dept.dept_name,
emp.emp_no as employee_number ,emp.last_name ,emp.first_name
from public.dept_manager mgr
inner join public.departments dept on mgr.dept_no = dept.dept_no
inner join public.dept_emp dept_emp on dept_emp.dept_no =dept.dept_no
inner join public.employees emp on emp.emp_no = dept_emp.emp_no


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

select distinct emp.emp_no,dept.dept_no as department_number ,emp.last_name ,emp.first_name,dept.dept_name
from public.departments dept
inner join public.dept_emp dept_emp on dept_emp.dept_no = dept.dept_no
inner join public.employees emp on dept_emp.emp_no =emp.emp_no
order by emp.emp_no


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

select first_name, last_name,sex
from public.employees
where last_name like 'B%' and first_name ='Hercules'


-- List each employee in the Sales department, including their employee number, last name, and first name.


select distinct emp.emp_no,emp.last_name ,emp.first_name,dept.dept_name
from public.departments dept
inner join public.dept_emp dept_emp on dept_emp.dept_no = dept.dept_no
inner join public.employees emp on dept_emp.emp_no =emp.emp_no
where dept.dept_no = 'd007'
order by emp.emp_no

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.


select distinct emp.emp_no,emp.last_name ,emp.first_name,dept.dept_name
from public.departments dept
inner join public.dept_emp dept_emp on dept_emp.dept_no = dept.dept_no
inner join public.employees emp on dept_emp.emp_no =emp.emp_no
where dept.dept_no in ( 'd007' ,'d005')
order by emp.emp_no


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

select last_name, count(*)
from public.employees
group by last_name
order by count(*) desc