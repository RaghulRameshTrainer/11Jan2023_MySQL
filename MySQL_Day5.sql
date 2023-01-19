use custdb;

CREATE TABLE default_table(
custid INT UNIQUE NOT NULL,
custname VARCHAR(100) NOT NULL,
age INT CHECK(age BETWEEN 1 AND 100),
city VARCHAR(100) DEFAULT 'Hyderabad'
);

INSERT INTO default_table VALUES(1000,'Piyush',35,'Pune');
SELECT * FROM default_table;
INSERT INTO default_table VALUES(1001,'Madan',30,'Chennai');
SELECT * FROM default_table;
INSERT INTO default_table(custid,custname,age) VALUES(1002,'Abhi',30);
SELECT * FROM default_table;

-- PRIMARY KEY

CREATE TABLE pkey_table(
custid INT PRIMARY KEY,     -- SINGLE PRIMARY KEY
custname VARCHAR(100) NOT NULL,
age INT CHECK(age BETWEEN 1 AND 100),
city VARCHAR(100) DEFAULT 'Hyderabad'
);


INSERT INTO pkey_table(custid,custname,age) VALUES(1003,'Piyush',35);
SELECT * FROM pkey_table;
INSERT INTO pkey_table VALUES(1000,'Madan',30,'Chennai');  -- ERROR suw to duplicate : 1000
INSERT INTO pkey_table VALUES(1001,'Madan',30,'Chennai'); 
SELECT * FROM pkey_table;
INSERT INTO pkey_table(custname,age) VALUES('Abhi',30);  -- ERROR since the null value cannot be inserted into primary keu column
INSERT INTO pkey_table(custid,custname,age) VALUES(1002,'Abhi',30); 
SELECT * FROM pkey_table;

CREATE TABLE comp_pkey_table(
custid INT,     
custname VARCHAR(100) ,
age INT CHECK(age BETWEEN 1 AND 100),
city VARCHAR(100) DEFAULT 'Hyderabad',
CONSTRAINT my_pk PRIMARY KEY (custid, custname)  -- COMPOSITE PKEY
);


INSERT INTO comp_pkey_table VALUES(1000,'Piyush',35,'Pune');
SELECT * FROM comp_pkey_table;
INSERT INTO comp_pkey_table VALUES(1000,'Madan',30,'Chennai'); 
INSERT INTO comp_pkey_table VALUES(1000,'Madan',30,'Chennai');  -- ERROR - Duplicate 1000-Madan
INSERT INTO comp_pkey_table VALUES(1001,'Madan',30,'Chennai');
SELECT * FROM comp_pkey_table;

-- FOREIGN KEY

CREATE TABLE customer(
custid INT PRIMARY KEY,
custname VARCHAR(100) NOT NULL,
age INT CHECK (age BETWEEN 1 AND 100),
city VARCHAR(100) DEFAULT 'Hyderabad'
);

INSERT INTO customer VALUES(1000,'Rajesh',30,'Chennai'),(1001,'Sankavi',25,'Bangalore'),(1002,'Kavin',3,'Hyderabad');

SELECT * FROM customer;

CREATE TABLE orders(
order_id INT PRIMARY KEY,
custid INT,
prodcuct_name VARCHAR(100),
amount INT,
FOREIGN KEY (custid) REFERENCES customer(custid)
);

INSERT INTO orders VALUES(1,1000,'TV',70000);
SELECT * FROM orders;
INSERT INTO orders VALUES(2,1001,'Mobile',50000);
SELECT * FROM orders;
INSERT INTO orders VALUES(3,1003,'Desktop',50000); -- ERROR since 1003 is not present in customer table
INSERT INTO orders VALUES(3,1002,'Desktop',50000);
SELECT * FROM orders;


DELETE FROM customer WHERE custid=1002;  -- ERROR due to child table has an entry for 1002
DELETE FROM orders WHERE custid=1002;
DELETE FROM customer WHERE custid=1002;
-- ------------------------------
DROP TABLE orders;

INSERT INTO customer VALUES(1002,'Kavin',3,'Hyderabad');

SELECT * FROM customer;

CREATE TABLE orders(
order_id INT PRIMARY KEY,
custid INT,
prodcuct_name VARCHAR(100),
amount INT,
FOREIGN KEY (custid) REFERENCES customer(custid) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO orders VALUES(1,1000,'TV',70000);
SELECT * FROM orders;
INSERT INTO orders VALUES(2,1001,'Mobile',50000);
SELECT * FROM orders;
INSERT INTO orders VALUES(3,1003,'Desktop',50000); -- ERROR since 1003 is not present in customer table
INSERT INTO orders VALUES(3,1002,'Desktop',50000);
SELECT * FROM orders;

DELETE FROM customer WHERE custid=1002;  
