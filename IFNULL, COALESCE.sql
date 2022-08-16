select count(dept_name)
from departments;

select count(dept_no) 
from dept_emp;

select count(*)
from dept_emp;

select sum(salary)
from salaries;

select*from salaries;

select sum(salary)
from salaries
where from_date>'1997-01-01';

select*from salaries
where from_date>'1997-01-01';

select min(salary)
from salaries;

select max(emp_no)
from employees;

select avg(salary)
from salaries
where from_date>'1997-01-01';

select round(avg(salary),2)
from salaries
where from_date>'1997-01-01';

select*from departments_dup;

select dept_no,
	IFNULL(dept_name, 'Department name not provided')
FROM departments_dup;

select dept_no,
	COALESCE (dept_name, 'Department name not provided') as dept_name
FROM departments_dup;

select*from dept_manager;

SELECT dept_no, dept_name,
	COALESCE (dept_no,'N/A') AS dept_manager
FROM departments_dup
ORDER BY dept_no ASC;

select dept_no, dept_name,
	COALESCE ('department manager name') AS fake_col
FROM departments_dup;

select*from departments_dup;

select dept_no, dept_name,
	COALESCE (dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

select 
	IFNULL (dept_no, 'N/A') AS dept_no,
    IFNULL (dept_name, 'Department Name not provided') AS dept_name,
    COALESCE (dept_no, dept_name) AS dept_info
FROM departments_dup
ORDER BY dept_no ASC;

SELECT COALESCE (NULL, 'Second', null) AS coalesce_test;

select*from departments_dup;

ALTER TABLE departments_dup
CHANGE COLUMN
	dept_no dept_no CHAR(4) NULL;
    
ALTER TABLE departments_dup
CHANGE COLUMN
    dept_name dept_name VARCHAR(40) NULL;

DROP TABLE IF EXISTS departments_dup;
CREATE TABLE departments_dup
(dept_no CHAR(4) NULL,
dept_name VARCHAR(40) NULL);

INSERT INTO departments_dup
(dept_no, dept_name)
SELECT*FROM departments;

INSERT INTO departments_dup(dept_name)
VALUES ('Public Relations');

select*from departments_dup;

SET SQL_SAFE_UPDATES=0;

DELETE FROM departments_dup 
WHERE
    dept_no = 'd002';

DROP TABLE IF EXISTS dept_manager_dup;

CREATE TABLE dept_manager_dup
(emp_no int(11) NOT NULL,
dept_no char(4) NULL,
from_date date NOT NULL,
to_date date NULL);

INSERT INTO dept_manager_dup
select*from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES (999904, '2017-01-01'),
	(999905, '2017-01-01'),
    (999906, '2017-01-01'),
    (999907, '2017-01-01');
    
DELETE FROM dept_manager_dup
WHERE dept_no='d001';

INSERT INTO departments_dup (dept_name)
VALUES ('Public Relations');

DELETE FROM departments_dup
WHERE dept_no='d002';

SELECT*FROM dept_manager_dup;
SELECT*FROM departments_dup;
select*from employees;

select dm.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
from dept_manager_dup dm
join employees e on dm.emp_no=e.emp_no;

select dm.emp_no, e.first_name, e.last_name, dm.dept_no, dm.from_date
from employees e
left join dept_manager dm on e.emp_no=dm.emp_no
where e.last_name='Markovitch'
order by dm.dept_no DESC, e.emp_no;

select e.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date
from employees e
join dept_manager dm on e.emp_no=dm.emp_no;

set @@global.sql_mode := replace(@@global.sql_mode, 'ONLY_FULL_GROUP_BY', '');


select e.first_name, e.last_name, e.hire_date, t.title
from employees e
join titles t on e.emp_no=t.emp_no
where e.first_name='Margareta' AND e.last_name='Markovitch'
order by e.emp_no;

select dm.emp_no, d.dept_no
from  departments d
cross join dept_manager dm
where d.dept_no='d009'
order by d.dept_no;

select dm.*, d.*
from dept_manager dm
cross join departments d
where d.dept_no='d009'
order by d.dept_no;

select e.*, d.*
from employees e 
cross join departments d
order by e.emp_no, d.dept_name 
limit 10;
