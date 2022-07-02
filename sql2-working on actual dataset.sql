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