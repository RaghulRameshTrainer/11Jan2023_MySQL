use custdb;

-- OUTER JOIN
-- 	LEFT JOIN
--     RIGHT JOIN
--     FULL JOIN

SELECT * FROM CUSTOMER_TBL;

SELECT * FROM TRANSACTION_TBL;

-- LEFT JOIN / LEFT OUTER JOIN

SELECT * FROM CUSTOMER_TBL c LEFT JOIN TRANSACTION_TBL t ON c.custid=t.custid;


-- RIGHT JOIN / RIGHT OUTER JOIN

SELECT * FROM CUSTOMER_TBL c RIGHT JOIN TRANSACTION_TBL t ON c.custid=t.custid;

-- Please write a query to know the customers details who have not done any transaction?

SELECT c.* FROM CUSTOMER_TBL c LEFT JOIN TRANSACTION_TBL t ON c.custid=t.custid WHERE tranid IS NULL;


-- FULL JOIN / CONDITIONLESS JOIN 

SELECT * FROM CUSTOMER_TBL c JOIN TRANSACTION_TBL t;

-- SUB QUERY:
	-- A query within an another query is called sub query
    
SELECT * FROM CUSTOMER_TBL WHERE custid NOT IN (
SELECT DISTINCT custid FROM TRANSACTION_TBL);


SELECT * FROM CUSTOMER_TBL WHERE custid IN (
SELECT DISTINCT custid FROM TRANSACTION_TBL);

-- VIEW:( Virtual Table)
-- ========
CREATE VIEW cust_trans_details AS
SELECT c.custname,t.prod_name FROM CUSTOMER_TBL AS c INNER JOIN TRANSACTION_TBL AS  t ON c.custid=t.custid;

SELECT * FROM cust_trans_details;   -- ( VIEW is a read only table)


SELECT * FROM company;

CREATE VIEW tcs_data AS 
SELECT * FROM COMPANY WHERE company='TCS' AND Place != 'Cochin';

SELECT * FROM tcs_data WHERE salary>5000;

-- INDEX
-- ========

SELECT * FROM TRANSACTION_TBL;

CREATE INDEX trans_idx ON TRANSACTION_TBL(tranid);

UPDATE TRANSACTION_TBL SET prod_name='LAPTOP' WHERE tranid=9;

SHOW INDEXES FROM TRANSACTION_TBL;

SELECT * FROM TRANSACTION_TBL WHERE tranid=6;
CREATE INDEX prod_idx ON TRANSACTION_TBL(prod_name);

SHOW INDEXES FROM TRANSACTION_TBL;
