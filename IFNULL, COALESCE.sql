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

select*from departments;

select e.first_name, e.last_name, e.hire_date, t.title, t.from_date, d.dept_no
from employees e 
join titles t on e.emp_no=t.emp_no
join dept_emp d on e.emp_no=d.emp_no;

select e.first_name, e.last_name, e.hire_date, t.title, m.from_date, d.dept_name
from employees e
join dept_manager m on e.emp_no=m.emp_no
join departments d on m.dept_no=d.dept_no
join titles t on e.emp_no=t.emp_no
WHERE t.title='Manager'
ORDER BY e.emp_no;

select*from employees;
select*from dept_manager;
select*from titles
where titles.title='manager';

select count(e.gender)
from employees e
join dept_manager dm on e.emp_no=dm.emp_no
join titles t on dm.emp_no=t.emp_no
where e.gender='F' AND t.title='manager'
order by e.emp_no;

select e.gender, count(dm.emp_no)
from employees e
join dept_manager dm on e.emp_no=dm.emp_no
group by gender;

select*from
(Select e.emp_no, e.first_name, e.last_name, null as dept_no, null as from_date
FROM employees e
WHERE last_name='Denis' UNION SELECT
NULL AS emp_no,
	Null as first_name,
    NULL AS last_name,
    dm.dept_no,
    dm.from_date
FROM dept_manager dm) as a
ORDER BY -a.emp_no DESC;

select*from dept_manager;
select*from employees;

select e.first_name, e.last_name
from employees e
where e.emp_no IN( 
SELECT dm.emp_no
FROM dept_manager dm); 

select dm.emp_no
from dept_manager dm;

select e.hire_date
from employees e
where e.emp_no in(
select dm.emp_no
from dept_manager dm
where e.hire_date>'1990-01-01' AND e.hire_date<'1995-01-01');

select*from dept_manager
where emp_no in (
select emp_no 
from employees e
where hire_date >'1990-01-01' AND e.hire_date<'1995-01-01');

select*from employees e
where emp_no in (
select emp_no 
from titles t
where e.emp_no=t.emp_no AND title="Assistant Engineer");

select*from employees e
where exists(
select *from titles t
where e.emp_no=t.emp_no AND t.title='Assistant Engineer');

select emp_no
from dept_manager 
where emp_no =110022;

SELECT 
    A.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_id
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS A 
UNION SELECT 
    B.*
FROM
    (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B;
    
DROP table if exists emp_manager;
CREATE table emp_manager
(emp_no int(11) not null,
dept_no char(4) null,
manager_no int(11) not null);

INSERT INTO emp_manager 
SELECT U.* FROM
(SELECT A.* 
FROM
(SELECT e.emp_no as employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no 
FROM dept_manager
WHERE emp_no=110022) AS manager_ID
FROM employees e
JOIN dept_emp de on e.emp_no=de.emp_no
WHERE e.emp_no<=10020
GROUP BY e.emp_no
ORDER BY e.emp_no) AS A
UNION
SELECT B.*
FROM
(SELECT e.emp_no as employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM dept_manager
WHERE emp_no=110039) AS manager_ID
FROM employees e
JOIN dept_emp de ON e.emp_no=de.emp_no
WHERE e.emp_no >10020
GROUP BY e.emp_no
ORDER BY e.emp_no
LIMIT 20) AS B
UNION
SELECT C.* FROM
(SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM dept_manager
WHERE emp_no=110039) AS manager_ID
FROM employees e
JOIN dept_emp de on e.emp_no=de.emp_no
WHERE e.emp_no=110022
GROUP BY e.emp_no
ORDER BY e.emp_no) AS C
UNION
SELECT D.* FROM
(SELECT e.emp_no AS employee_ID,
MIN(de.dept_no) AS department_code,
(SELECT emp_no
FROM dept_manager
WHERE emp_no=110022) AS manager_ID
FROM employees e
JOIN dept_emp de on e.emp_no=de.emp_no
WHERE e.emp_no=110039
GROUP BY e.emp_no
ORDER BY e.emp_no) AS D) AS U;

select*from emp_manager;

select emp_no
from dept_manager
where emp_no=110022;

select A.* from
(select e.emp_no as employee_ID,
MIN(de.dept_no) as department_code,
(SELECT emp_no
FROM dept_manager
WHERE emp_no=110022) as manager_ID
FROM employees e
JOIN dept_emp de on e.emp_no=de.emp_no
WHERE e.emp_no<10020
GROUP BY e.emp_no
ORDER BY e.emp_no) as A;

///views///

select DISTINCT e1.*
from emp_manager e1
join emp_manager e2 on e1.emp_no=e2.manager_no;

select*from dept_emp;
select emp_no, from_date, to_date, count(emp_no) as Num
FROM dept_emp
GROUP BY emp_no
HAVING Num >1;

CREATE OR REPLACE VIEW v_dept_emp_latest_date AS
SELECT emp_no, MAX(from_date) AS from_date, MAX(to_date) AS to_date
FROM dept_emp
GROUP BY emp_no;

select*from employees.v_dept_emp_latest_date;

CREATE OR REPLACE VIEW v_salaries_avg AS
SELECT round(avg(salary),2) as avg_salary
from salaries s
join dept_manager dm on s.emp_no=dm.emp_no;

select*from employees.v_salaries_avg;

use employees;

DROP Procedure if exists select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT * FROM employees
LIMIT 1000;
END $$

call employees.select_employees();
call select_employees();


DELIMITER $$
CREATE PROCEDURE avg_salary_employee()
BEGIN
SELECT avg(salary)
FROM salaries;
END $$

call avg_salary_employee();

drop procedure avg_salary_employees;