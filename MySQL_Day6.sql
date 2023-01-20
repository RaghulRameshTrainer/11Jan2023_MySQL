use custdb;

-- AUTO_INCREMENT

CREATE TABLE mytable(
custid INT UNIQUE auto_increment,
custname VARCHAR(100)  NOT NULL,
age INT,
city VARCHAR(100)
);

INSERT INTO mytable(custname,age,city) VALUES('Ramamoorthy',33,'Chennai');
SELECT * FROM mytable;
INSERT INTO mytable(custname,age,city) VALUES('Venkatsh',31,'Hyderabad');
SELECT * FROM mytable;
INSERT INTO mytable(custname,age,city) VALUES('Ranjitha',25,'Bangalore');
SELECT * FROM mytable;
INSERT INTO mytable VALUES(100,'Divya',25,'Bangalore');
SELECT * FROM mytable;
INSERT INTO mytable(custname,age,city) VALUES('Mani',27,'Delhi');
SELECT * FROM mytable;

-- ALTER TABLE STATEMENT

DESC customer;
SELECT * FROM customer;

ALTER TABLE customer ADD COLUMN gender CHAR(1) DEFAULT 'M';
SELECT * FROM customer;
UPDATE customer SET gender='F' WHERE custid=1001;
SELECT * FROM customer;

DESC CUSTOMER;


ALTER TABLE customer DROP COLUMN age;
DESC CUSTOMER;
SELECT * FROM customer;

DESC CUSTOMER;
ALTER TABLE customer MODIFY COLUMN city varchar(20);
DESC CUSTOMER;


ALTER TABLE customer RENAME column city TO location;
DESC CUSTOMER;
SELECT * FROM customer;

ALTER TABLE customer RENAME to cust_table;
DESC cust_table;

DESC check_table;
ALTER TABLE check_table ADD CONSTRAINT pkey PRIMARY KEY(custid);
DESC check_table;

ALTER TABLE check_table MODIFY COLUMN custname varchar(50) NOT NULL;
DESC check_table;
