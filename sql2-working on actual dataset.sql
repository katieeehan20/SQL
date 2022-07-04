use employees;

SELECT 
    first_name, last_name
FROM
    employees;

select*from employees
where gender='F' and first_name='Mary';

select*from employees
where first_name='Elvis';

select*from employees
where first_name='Elvis' or first_name='Kellie';

select*from employees
where first_name = "Kellie" or first_name="aruna";

select*from employees
where first_name='Denis' and (gender='m' or gender='f');

select*from employees
where gender='f' and (first_name='Kellie' or first_name='aruna');

select*from employees
where first_name in ('cathy', 'kellie','aruna');

select*from employees
where gender not in ('M');

select*from employees
where first_name in ('denis','elvis');

select*from employees
where first_name not in ('john', 'mark', 'jacob');

select*from employees
where first_name like '%mar%';

select*from employees
where first_name like 'mar___' and gender='F';

select*from employees
where first_name not like '%mar%';

select*from employees
where first_name like 'mark%';

select*from employees
where hire_date like '%2000%';

select*from employees
where emp_no like '1____';

select*from employees
where first_name like '%jack%';

select*from employees
where first_name not like '%jack%'; 

select*from employees
where hire_date between '1999-01-01' and '2000-01-01';

select*from employees
where hire_date not between '1990-01-01' and '2000-01-01';

select*from employees;

select*from salaries;

select*from salaries
where salary between 66000 and 70000;

select*from salaries
where emp_no not between 10004 and 10012;

select*from departments
where dept_no between 'd003' and 'd006';

select*from employees
where first_name is not null;

select*from employees
where first_name is null;

select*from departments
where dept_no is not null;

select*from employees
where first_name <> '%mark%';

select*from employees
where first_name != "mark";

select*from employees
where hire_date = '2000-01-01';

select*from employees
where hire_Date < '1985-02-01';

select*from employees
where gender='f' and hire_date>= '2000-01-01';

select*from salaries
where salary >150000;

select gender from employees;

select distinct gender from employees;

select distinct hire_date from employees;

select count(emp_no) from employees;

select count(first_name) from employees;

select count(distinct first_name) from employees;

select count(salary) from salaries
where salary >= 100000;

select count(*) from salaries
where salary >= 100000; 

select count(title) from titles
where title='manager';

select count(*) from dept_manager;

select * from employees
order by hire_date desc;

select * from employees
order by birth_date asc;

select*from employees
order by first_name, last_name asc;

select*from employees
order by hire_date desc;

select first_name
from employees;

select first_name
from employees
group by first_name;

select distinct first_name
from employees;

select count(first_name)
from employees
group by (first_name);

select first_name, count(first_name)
from employees
group by first_name
order by first_name DESC;

select hire_date
from employees
group by hire_date
order by hire_date DESC;

select salary 
from salaries
group by salary
order by salary DESC;

select first_name, count(first_name) as number_of_times_the_name_appears
from employees
group by first_name
order by first_name DESC;

select*from salaries;

select salary, count(emp_no) as emp_with_same_salary
from salaries
where salary>80000
group by salary
order by salary DESC;

select salary
from salaries
having salary>100000;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
having count(first_name) >250
order by first_name;

select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary)>120000;

select *, avg(salary)
from salaries
where salary>120000
group by emp_no
order by emp_no;

select *, avg(salary)
from salaries
group by emp_no
having avg(salary)>120000;

select first_name, count(first_name) as names_count
from employees
where hire_date > '1999-01-01'
group by first_name
having count(first_name)<200
order by count(first_name) Desc;

select*from dept_emp;

select emp_no 
from dept_emp
where from_date>'2000-01-01'
group by emp_no
having count(from_date)>1
order by emp_no;
select*from salaries
having salary>150000
order by salary desc
limit 10;

select *from employees;

select first_name, last_name, count(last_name)
from employees
where hire_date>'2000-01-01'
group by last_name
having count(first_name)<100
order by last_name
limit 100;

select *
from dept_emp
limit 100;

select *
from titles
limit 10;

alter table titles
drop foreign key titles_ibfk_1;

alter table titles
drop primary key;

insert into titles (emp_no, title, from_date)
values (999903, 'Senior Engineer', '1997-10-01');

select*from titles
order by emp_no desc;

select*from dept_emp
order by emp_no desc;

alter table dept_emp
drop foreign key dept_emp_ibfk_1;

alter table dept_emp
drop foreign key  dept_emp_ibfk_2;

insert into dept_emp 
values (999903, 'd005', '1997-10-01',"9999-01-01");

select*from dept_emp
order by emp_no desc;

select*from departments;

insert into departments 
values ('d010', 'Business Analysis');

select*from departments
order by dept_name asc;

select*from employees
limit 10;

insert into employees
(
	emp_no, birth_date, first_name, last_name, gender, hire_date)
Values (999901, '1986-04-21', 'Mack', 'James', 'M', '2000-01-01');

select*from employees
order by emp_no DESC;

select*from titles
order by emp_no DESC
limit 10;

select*from dept_emp
order by emp_no DESC;

insert into dept_emp
values ('999904', 'd0001', '1980-01-01', '9999-01-01');  


insert into titles
(emp_no, title, from_date)
values (999903, 'Senior Engineer', '1997-10-01');

select*from departments
limit 10;

create table departments_dup
(
	dept_no char(4) not null,
    dept_name varchar(40) not null);
    
insert into departments_dup
(	dept_no, dept_name)
select* from departments;

select*from departments_dup
order by dept_no DESC;

insert into departments_dup
(	dept_name,
	dept_no)
values ('Business Analysis', 'd010');

select*from departments_dup
order by dept_no DESC;

use employees;
select*from employees
order by emp_no asc;

update employees
set first_name='Stella',
	last_name='Johns',
    birth_date='1992-11-07',
    gender='F'
where emp_no='10001';

select*from employees
where emp_no='10006';


select*from departments_dup
order by dept_no;
COMMIT;

update departments_dup
set dept_no='d011',
	dept_name='Electrical Engineering';

Rollback;
Commit;

update departments_dup
set dept_no='d011',
	dept_name='Electrical Engineering'
where dept_no='d001';

select*from departments;
commit;

update departments
set dept_name='Data Analysis'
where dept_name='Business Analysis';

select*from departments
where dept_name='data Analysis';

use employees;

select*from employees
order by emp_no DESC;
commit;

select*from titles
order by emp_no desc;

insert into titles
values ('999901', 'Senior Engineer', '1999-10-10', '9999-01-01');

select*from employees
where emp_no='999901';


delete from employees
where emp_no='999901';

select*from departments_dup
order by dept_no;

commit;

delete from departments_dup;

delete from departments_dup
where dept_no='d010';
rollback;

select*from salaries;

select count(distinct salary)
from salaries;

select count(distinct from_date)
from salaries;

select count(*)
from salaries;

select*from departments;

select count(distinct dept_name)
from departments;

select*from salaries;

select sum(salary)
from salaries;

select sum(*)
from salaries;

select sum(salary)
from salaries
where from_date> '1997-01-01';

select max(salary)
from salaries;

select min(salary) 
from salaries;

select max(emp_no)
from salaries;

select avg(salary)
from salaries
where from_date>'2000-01-01';

select round(avg(salary))
from salaries
where from_date>'1997-01-01';

select*from departments_dup;

alter table departments_dup
change column dept_name dept_name varchar(40) null;

insert into departments_dup
(dept_no)
values ('d010'),('d011');

alter table departments_dup
add column dept_manager varchar(255) null after dept_name;
commit;

select dept_no,
	ifnull (dept_name, "No values mentioned") as dept_name
from departments_dup;

select dept_no, dept_name,
	coalesce( dept_manager, dept_name, "No value mentioned")
from departments_dup;

select dept_no, dept_name,
	coalesce("department manager name") as fake_col
from departments_dup;

select dept_no, dept_name,
	coalesce(dept_no, dept_name) as dept_info
from departments_dup
order by dept_no ASC;

select 
	ifnull(dept_no, 'N/A') as dept_no,
    ifnull(dept_name, 'Dapartment name not provided') as dept_name,
    coalesce(dept_no, dept_name) as dept_info
from departments_dup;

select 
	coalesce (NULL, 'second', null) as coalesce_test;

select
	coalesce ('First', 'Second', 'Third') as coalesce_test;
    
select
	coalesce ('First', null, 'Third') as coalesce_Test;