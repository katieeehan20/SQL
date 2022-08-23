DELIMITER $$
CREATE FUNCTION f_emp_avg_salary (p_emp_no INTEGER) RETURNS DECIMAL (10,2)
DETERMINISTIC NO SQL READS SQL DATA
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);

SELECT
	AVG(s.salary)
INTO v_avg_salary FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no
WHERE e.emp_no=p_emp_no;
RETURN v_avg_salary;
END $$

DROP FUNCTION IF EXISTS f_emp_avg_salary;
SELECT employees.f_emp_avg_salary(11300);

DELIMITER$$
CREATE FUNCTION f_emp_info (p_first_name varchar(16), p_last_name varchar(16)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
DECLARE v_max_salary DECIMAL (10,2);

SELECT MAX(s.salary)
INTO v_max_salary FROM employees e
JOIN salaries s ON e.emp_no=s.emp_no
WHERE e.first_name=p_first_name AND e.last_name=p_last_name;
RETURN v_max_salary;
END $$

SELECT employees.f_emp_info('Parto', 'Bamford');
DROP FUNCTION IF EXISTS f_emp_info;

DELIMITER $$
CREATE FUNCTION f_emp_info2(p_first_name varchar(16), p_last_name varchar(16) RETURNS decimal(10,2)
DETERMINISTIC
BEGIN
DECLARE v_max_from_date date;
DECLARE v_salary decimal(10,2);
SELECT 
    MAX(from_date)
INTO v_max_from_date FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
SELECT 
    s.salary
INTO v_salary FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name
        AND s.from_date = v_max_from_date;
RETURN v_salary;
END$$

drop function if exists f_emp_info2;

SELECT f_emp_info2('Aruna', 'Journel');