use custdb;

SELECT * FROM company;

-- DELETE DATA
SET sql_safe_updates=0;
SELECT * FROM company WHERE Place='Chennai';
DELETE FROM company WHERE Place='Chennai';

SELECT * FROM company WHERE Place='';
DELETE FROM company WHERE Place='';

-- CONSTRAINTS
-- UNIQUE
-- NOT NULL
-- CHECK
-- DEFAULT
-- PRIMARY KEY
-- FOREIGN KEY

CREATE TABLE unique_table(
custid INT UNIQUE,
custname VARCHAR(50),
age INT,
city VARCHAR(20)
);

INSERT INTO unique_table VALUES(1000,'Raja',35,'Chennai');
SELECT * FROM unique_table;
INSERT INTO unique_table VALUES(1000,'Bala',40,'Hyderabad');  -- ERROR because 1000 is duplciate
INSERT INTO unique_table VALUES(1001,'Bala',40,'Hyderabad');
INSERT INTO unique_table(custname, age, city) VALUES('Priya',30,'Pune');
INSERT INTO unique_table(custname, age, city) VALUES('Sakshi',33,'Kolkatta');

-- -------------------------------------------------------------------------

CREATE TABLE notnull_table(
custid INT NOT NULL,
custname VARCHAR(50),
age INT,
city VARCHAR(20)
);

INSERT INTO notnull_table VALUES(1000,'Raja',35,'Chennai');
SELECT * FROM notnull_table;
INSERT INTO notnull_table VALUES(1000,'Bala',40,'Hyderabad');
INSERT INTO notnull_table(custname, age, city) VALUES('Priya',30,'Pune');  -- ERROR SINCE custid column is NULL
INSERT INTO notnull_table(custname, age, city) VALUES('Sakshi',33,'Kolkatta'); -- ERROR SINCE custid column is NULL

-- -------------------------------------------------------------------------
CREATE TABLE unique_notnull_table(
custid INT UNIQUE NOT NULL,
custname VARCHAR(50),
age INT,
city VARCHAR(20)
);

INSERT INTO unique_notnull_table VALUES(1000,'Raja',35,'Chennai');
SELECT * FROM unique_notnull_table;
INSERT INTO unique_notnull_table VALUES(1000,'Bala',40,'Hyderabad');  -- ERROR since 1000 is duplicate value
INSERT INTO unique_notnull_table(custname, age, city) VALUES('Priya',30,'Pune');  -- ERROR SINCE custid column is NULL
INSERT INTO unique_notnull_table(custname, age, city) VALUES('Sakshi',33,'Kolkatta'); -- ERROR SINCE custid column is NULL


-- -------------------------------------------------------------------------

CREATE TABLE check_table(
custid INT ,
custname VARCHAR(50),
age INT CHECK(age > 1 AND age <= 100),
city VARCHAR(20)
);

INSERT INTO check_table VALUES(1000,'Prakash',35, 'Hyderabad');
SELECT * FROM check_table;
INSERT INTO check_table VALUES(1001,'Abirami',-1, 'Ahmadabad'); -- ERROR since age is < 1
INSERT INTO check_table VALUES(1001,'Karthik',120, 'Ahmadabad');  -- ERROR since age is > 100
INSERT INTO check_table VALUES(1001,'Karthik',50, 'Ahmadabad'); 
SELECT * FROM check_table;


CREATE TABLE check_table_2(
custid INT ,
custname VARCHAR(50),
age INT ,
city VARCHAR(20) CHECK(city IN ('Chennai','Bangalore','Hyderabad','Pune'))
);

INSERT INTO check_table_2 VALUES(1000,'Prakash',35, 'Hyderabad');
SELECT * FROM check_table_2;
INSERT INTO check_table_2 VALUES(1001,'Abirami',-1, 'Pune'); 
SELECT * FROM check_table_2;

INSERT INTO check_table_2 VALUES(1001,'Karthik',120, 'Ahmadabad');  -- ERROR since city is not in ('Chennai','Bangalore','Hyderabad','Pune')
INSERT INTO check_table_2 VALUES(1001,'Karthik',50, 'Bangalore'); 
SELECT * FROM check_table_2;
