use cust;

create table products (
prod_id int primary key,
prod_name varchar(50) not null,
quantity int not null
);

insert into products values(1001,'TV',100),(1002,'AC',200),(1003,'Washing m/c',150),(1004,'desktop',120),(1005,'laptop',75),(1006,'mobile',20);

select * from products;

select * from products where quantity>100;

SELECT * FROM products ORDER BY quantity DESC;

-- AGGREGATE FUNCTION

SELECT COUNT(*) FROM PRODUCTS; 

SELECT MAX(quantity) FROM PRODUCTS;

SELECT MIN(quantity) FROM PRODUCTS;

SELECT SUM(quantity) FROM PRODUCTS;

SELECT AVG(quantity) FROM PRODUCTS;

SELECT * FROM PRODUCTS;

SELECT upper(prod_name) FROM PRODUCTS;
SELECT lower(prod_name) FROM PRODUCTS;

SELECT concat(prod_id,"_",prod_name, "_", quantity) FROM products;
SELECT concat_ws("_",prod_id,prod_name, quantity) FROM products;

SELECT substr(prod_name,1,2) FROM products;

SELECT * FROM products;

SELECT replace(prod_name,'desktop','computer') FROM products;

-- DATE FUNCTIONS:

SELECT NOW();
SELECT current_timestamp();

SELECT curdate();
SELECT current_time();

-- %a -> days short name -> sun,mon,tue...
-- %W -> weeday in fullname -> Sunday, Monday...
-- %b -> months short name -> jan, feb, mar
-- %M -> months full name -> January, February...
-- %d -> day of the month (1..31)  %e
-- %c -> month in numeric(1..12)   %m
-- %y -> year in 2 digit (23, 24...)
-- %Y -> year in 4 digit ( 2023, 2024...)
-- %H -> hours in 24 hrs format (00..23)
-- %h -> hours in 12hrs format(1..12)
-- %p -> AM | PM
-- %i -> minute

SELECT DATE_FORMAT(NOW(),"%d-%c-%Y %H:%i ");

SELECT DATE_FORMAT(NOW(),"%W %M %d %Y ");


SELECT * FROM company;

-- CASE 
-- WHEN condition THEN ops
-- WHEN cond2 THEN ops2
-- WHEN cond3 THEN ops3
-- ELSE ops4
-- END as column_name

SELECT company, age, salary, place,case
when place IN ('Chennai','Podicherry') THEN 'Tamil'
WHEN place='Mumbai' THEN 'Marthi'
WHEN place='Calcutta' THEN 'Bengali'
WHEN place='Delhi' THEN 'Hindi'
WHEN place='Cochin' THEN 'Malayalam'
WHEN place='Hyderabad' THEN 'Telangana'
ELSE 'ENGLISH' 
END as language
FROM company;

-- 0-3000 => "Less Paid"
-- 3001-6000 => "Medium Paid"
-- 6000+ => "High paid"

SELECT company, age, salary, case 
WHEN salary BETWEEN 0 and 3000 THEN "Less Paid"
WHEN salary BETWEEN 3001 AND 6000 THEN "Medium Paid"
ELSE "High Paid"
END as category,
Place
FROM company





