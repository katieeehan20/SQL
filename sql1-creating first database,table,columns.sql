create database if not exists sales;
drop database sales;
create database if not exists sales;
use sales;

create table sales
(
	purchase_number int not null primary key auto_increment,
    date_of_purchase date not null,
    customer_id int, 
    item_code varchar(10) not null
);

create table customers
(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_constraints int
);

select*from sales;
select*from sales.sales;

drop table sales;

create table sales
(
	purchase_number int not null auto_increment,
    date_of_purchase date not null,
    customer_id int, 
    item_code varchar(10) not null,
primary key (purchase_number),
foreign key (customer_id) references customers(customer_id) on delete cascade
);

drop table customers;

create table customers
(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int, 
primary key (customer_id)
);

create table items
(
	item_code varchar(255),
    item varchar(255),
    unit_price numeric(10,2),
    company_id varchar(255),
primary key (item_code)
);

create table companies
(
	company_id varchar(255),
    company_name varchar(255),
    headquarters_phone_number int(12),
primary key (company_id)
);

create table sales
(
	purchase_number int not null auto_increment,
    date_of_purchase date not null,
    customer_id int, 
    item_code varchar(10) not null,
primary key (purchase_number)
);
drop table sales;
create table sales
(
	purchase_number int not null auto_increment,
    date_of_purchase date not null,
    customer_id int, 
    item_code varchar(10) not null,
primary key (purchase_number)
);
alter table sales
add foreign key (customer_id) references customers (customer_id) on delete cascade;

alter table sales
drop foreign key sales_ibfk_1;

drop table sales;
drop table customers;
drop table items;
drop table companies;

create table customers
(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
primary key (customer_id),
unique key (email_address)
);

drop table customers;

create table customers(
	customer_id int,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
primary key (customer_id)
);

alter table customers
add unique key (email_address);

alter table customers
drop index email_address;

drop table customers;

create table customers(
	customer_id int auto_increment,
    first_name varchar(255),
    last_name varchar(255),
    email_address varchar(255),
    number_of_complaints int,
primary key (customer_id)
);

alter table customers
add column gender enum ('M','F') after last_name;

insert into customers
(first_name, last_name, gender, email_address, number_of_complaints)
values ('jane', 'Mackinly', 'F' , 'jane.m@gmail.com', 3);

alter table customers
change column number_of_complaints number_of_complaints int default 0;

insert into customers (first_name, last_name, gender)
values ('james', 'Morrow', 'M');

select*from customers;

alter table customers 
alter column number_of_complaints drop default;

create table companies
(
	company_id varchar(255),
    company_name varchar(255) default 'X',
    headquarters_phone_number varchar(255),
unique key (headquarters_phone_number)
);
select*from companies;

insert into companies
(company_id, headquarters_phone_number)
values (34343,345-454-6545);
    
select*from companies;

drop table companies;

create table companies
(
	company_id int auto_increment,
    headquarters_phone_number varchar(255),
    company_name varchar(255) not null,
primary key (company_id)
);

alter table companies
modify company_name varchar(255) null;

alter table companies
change column company_name company_name varchar(255) not null;

insert into companies (headquarters_phone_number, company_name)
values ('1-3445-5634-342334', 'ABCD')
;

select*from companies;

alter table companies
modify headquarters_phone_number varchar(255) null;

alter table companies
change column headquarters_phone_number headquarters_phone_number varchar(255) not null;
