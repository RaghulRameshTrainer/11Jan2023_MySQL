CREATE DATABASE custdb;
-- DROP DATABASE custdb;

use custdb;

-- DDL (Data Definition Language) --> CREATE, ALTER, DROP, TRUNCATE
-- DML (Data Manuplation Statement) --> INSERT, UPDATE, DELETE
-- DCL (Data Control Language)  --> Grant, Revoke
-- TCL (Transaction Control Language) --> commit, rollback, savepoint
-- DQL ( Data Query Language) --> SELECT


CREATE TABLE employee(
empid INT,
empname VARCHAR(50),
age INT,
gender CHAR(1),
city VARCHAR(50)
);


-- DATA TYPE
-- INT  -> For storing numbers
-- CHAR  --> Fixed length of character
-- VARCHAR --> Variable length of character
-- DATE --> Date
-- DECIMAL --> To store the float values(ex: 45.67)
-- Boolean -> True or False or None

INSERT INTO employee VALUES(1000,'Bala',40,'M','Bangalore');

SELECT * FROM employee;
INSERT INTO employee VALUES(1001,'Malini',30,'F','Chennai');
INSERT INTO employee VALUES(1002,'Priya',35,'F','Hyderabad');
INSERT INTO employee(empid, empname,gender,city) VALUES(1003,'Aveek','M','Pune');
INSERT INTO employee(city,age,empname,empid,gender) VALUES('Hyderabad',100,'Rajesh',1004,'M');

-- UPDATE The data
SET sql_safe_updates=0;
UPDATE employee SET city='Chennai' WHERE empid=1002;
SELECT * FROM employee;
UPDATE employee SET age=31,city='Trichy' WHERE empid=1001;
UPDATE employee SET city='Hyderabad' WHERE gender='M';
UPDATE employee SET age=50 WHERE age IS NULL;

