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