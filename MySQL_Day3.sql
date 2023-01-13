use custdb;

SELECT * FROM employee;

SELECT empid, empname, age, gender, city FROM employee;

SELECT empname, city FROM employee;

SELECT * FROM employee WHERE city='Hyderabad';

SELECT * FROM employee WHERE city='Hyderabad' AND age>50;

SELECT * FROM employee WHERE city='Hyderabad' or city='Trichy';

SELECT * FROM employee WHERE gender='M';
SELECT * FROM employee WHERE gender!='M';

SELECT * FROM employee WHERE city='Hyderabad' AND age<50 and gender='M';

SELECT * FROM company;

SELECT company, age, salary, place FROM company WHERE age < 30 AND Place != 'Chennai'; 
