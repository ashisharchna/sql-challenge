CREATE TABLE department (
  dept_no varchar(4),
  dept_name varchar,
  PRIMARY KEY (dept_no)
);
CREATE TABLE title (
  title_id varchar(5),
  title varchar,
  PRIMARY KEY (title_id)
);
CREATE TABLE employee (
  emp_no int,
  emp_title_id varchar(5),
  birth_date date,
  first_name varchar,
  last_name varchar,
  sex varchar(1),
  hire_date date,
  PRIMARY KEY (emp_no),
  FOREIGN KEY(emp_title_id) References title(title_id)
);
CREATE TABLE department_manager (
  dept_no varchar(4),
  emp_no int,
  FOREIGN KEY(dept_no) references department(dept_no)
);
CREATE TABLE salary (
  emp_no int,
  salary int,
  FOREIGN KEY(emp_no) references employee(emp_no)	
);
CREATE TABLE department_employee (
  emp_no int,
  dept_no varchar(4),
   FOREIGN KEY(emp_no) references employee(emp_no),
   FOREIGN KEY(dept_no) references department(dept_no)
);

DELETE from department;

Select * from department;

Select * from title;

Select * from employee;

Select * from department_manager;

Select * from salary;

Select * from department_employee;
--#1
SELECT emp.emp_no as "Employee Number", 
emp.last_name as "Last Name", 
emp.first_name as "First Name", 
emp.sex as "Gender",
sal.salary as "Salary"
FROM 
	employee as emp
LEFT JOIN  
	salary as sal
ON
	emp.emp_no = sal.emp_no
	
SELECT count(*) from employee;
--#2
SELECT first_name, last_name, hire_date 
FROM employee
WHERE DATE_PART('year', hire_date)=1986

--use employee, department, and department_manager table
--SELECT * FROM department_manager;
--#3
SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_no as "Department Number", 
	dept.dept_name as " Department Name"
FROM
	employee as emp
RIGHT JOIN
	department_manager as dept_mgr
ON
	dept_mgr.emp_no = emp.emp_no 
RIGHT JOIN
	department as dept
ON 
	dept_mgr.dept_no = dept.dept_no

SELECT Count(*) from department_manager;

--#4
SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
LEFT JOIN
	department_employee 
ON
	emp.emp_no=department_employee.emp_no
LEFT JOIN
	department as dept
ON
	department_employee.dept_no=dept.dept_no 
	
--#5
SELECT
	first_name, last_name, sex
From
	employee
WHERE
	first_name= 'Hercules' AND last_name like ('B%')
	
--#6
SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
Right JOIN
	department_employee 
ON
	emp.emp_no=department_employee.emp_no
Right JOIN
	department as dept
ON
	department_employee.dept_no=dept.dept_no 
AND
	dept.dept_name in ('Sales')
	
--#7
SELECT 
	emp.emp_no as "Employee Number", 
	emp.last_name as "Last Name", 
	emp.first_name as "First Name",
	dept.dept_name as " Department Name"
FROM
	employee as emp
Right JOIN
	department_employee 
ON
	emp.emp_no=department_employee.emp_no
Right JOIN
	department as dept
ON
	department_employee.dept_no=dept.dept_no 
AND
	dept.dept_name in ('Sales','Development')

--8
SELECT last_name, Count(last_name) as "Frequency"
FROM employee
GROUP BY last_name
ORDER BY Count(last_name) DESC;

