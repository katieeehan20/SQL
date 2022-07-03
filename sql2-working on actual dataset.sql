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
