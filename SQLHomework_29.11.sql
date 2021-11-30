



--CREATE DATABASE Homework;
USE Homework;
--CREATE TABLE nobel_win 
--(YEAR int,
-- SUBJECT nvarchar(200),
-- WINNER nvarchar(200),
-- COUNTRY nvarchar(200),
-- CATEGORY nvarchar(200)
-- );

--INSERT INTO nobel_win ([YEAR], [SUBJECT], WINNER, COUNTRY, CATEGORY)
--VALUES ( 1970, 'Physics', 'Hannes Alfen', 'Sweden', 'Scientist'),
--       ( 1970, 'Physics', 'Louis Neel', 'France', 'Scientist'),
--	   ( 1970, 'Chemistry', 'Luis Federico Leloir', 'France', 'Scientist'),
--	   ( 1970, 'Physiology', 'Ulf von Euler', 'Sweden', 'Scientist'),
--	   ( 1970, 'Physiology', 'Bernard Katz', 'Germany', 'Scientist'),
--	   ( 1970, 'Literature', 'Aleksandr Solzhenitsyn', 'Russia', 'Linguist'),
--	   ( 1970, 'Economics', 'Paul Samuelson', 'USA', 'Economist'),
--	   ( 1970, 'Physiology', 'Julius Axelrod', 'USA', 'Scientist'),
--	   ( 1971, 'Physics', 'Dennis Gabor', 'Hungary', 'Scientist'),
--	   ( 1971, 'Chemistry', 'Gerhard Herzberg', 'Germany', 'Scientist'),
--	   ( 1971, 'Peace', 'Willy Brandt', 'Germany', 'Chancellor'),
--	   ( 1971, 'Literature', 'Pablo Neruda', 'Chile', 'Linguist'),
--	   ( 1971, 'Economics', 'Simon Kuznets', 'Russia', 'Economist'),
--	   ( 1978, 'Peace', 'Anwar al-Sadat', 'Egypt', 'President'),
--	   ( 1978, 'Peace', 'Menachem Begin', 'Israel', 'Prime Minister'),
--	   ( 1987, 'Chemistry', 'Donald J.Cram', 'USA', 'Scientist'),
--	   ( 1987, 'Chemistry', 'Jean-Marie Lehn', 'France', 'Scientist'),
--	   ( 1987, 'Physiology', 'Susumu Tonegawa', 'Japan', 'Scientist'),
--	   ( 1994, 'Economics', 'Reinhard Selten', 'Germany', 'Economist'),
--	   ( 1994, 'Peace', 'Yitzakh Rabin', 'Israel', 'Prime Minister'),
--	   ( 1987, 'Physics', 'Johannes Georg Bednorz', 'Germany', 'Scientist'),
--	   ( 1987, 'Literature', 'Joseph Brodsky', 'Russia', 'Linguist'),
--	   ( 1987, 'Economics', 'Robert Solow', 'USA', 'Economist'),
--	   ( 1994, 'Literature', 'Kenzbora Oe', 'Japan', 'Linguist');


CREATE TABLE orders (
 ord_no int PRIMARY KEY,
 purch_amt decimal,
 ord_date Date,
 customer_id int,
 salesman_id int
)
drop table orders
INSERT INTO orders( ord_no, purch_amt, ord_date, customer_id, salesman_id)
VALUES (70001, 150.5, 2012-10-05, 3005, 5002),
       (70009, 270.65, 2012-09-10, 3001, 5005),
	   (70002, 65.26, 2012-10-05, 3002, 5001),
	   (70004, 110.5, 2012-08-17, 3009,5003),
	   (70007, 948.5, 2012-09-10, 3005,5002),
	   (70005, 2400.6, 2012-07-27, 3007,5001),
	   (70008, 5760, 2012-09-10, 3002, 5001),
	   (70010, 1983.43, 2012-10-10, 3009, 5003),
	   (70003, 2480.4, 2012-10-10, 3009, 5003),
	   (70012, 250.45, 2012-06-27, 3008, 5002),
	   (70011, 75.29, 2012-08-17, 3003, 5007),
	   (70013, 3045.6, 2012-04-25, 3002, 5001);



CREATE TABLE salesman
(salesman_id int PRIMARY KEY,
  [name] nvarchar(200),
  city nvarchar(200),
  comission float(2));

  drop table salesman
INSERT INTO salesman (salesman_id, [name], city, comission)
VALUES (5001, 'James Hoog', 'New York', 0.15),
       (5002, 'Nail Knite', 'Paris', 0.13),
       (5005, 'Pit Alex', 'London', 0.11),
       (5006, 'Mc Lyon', 'Paris', 0.14),
	   (5007, 'Paul Adam', 'Rome', 0.13),
	   (5003, 'Lauson Hen', 'San Jose', 0.12);

--Task 3.png // Find the salesperson(s) and the customer(s) he handle. Return Customer Name, city, Salesman, comission
	   --SELECT * FROM salesman
	   --SELECT * FROM customer

	   SELECT  customer.cust_name CustomerName, customer.city, salesman.[name] Salesman, salesman.city,salesman.comission
	   FROM customer
	   INNER JOIN salesman on customer.salesman_id = salesman.salesman_id

--Task 4.png find those salespersons who received a commission from the company more than 12%. Return Customer Name, customer city, Salemsan, comission.   
SELECT  customer.cust_name CustomerName, customer.city customercity, salesman.[name] Salesman, salesman.comission
FROM customer

INNER JOIN salesman on customer.salesman_id = salesman.salesman_id
WHERE comission>0.12

--Task 5.png // Find those salespersons do not live in the same city where their customers live and recieved a comission 
--from the company more than 12%. Return Customer Name, customer city, Salesman, salesman city, comission.

SELECT customer.cust_name 'Customer Name', customer.city 'customer city', salesman.name Salesman, salesman.city 'salesman city', comission
FROM customer
INNER JOin salesman on customer.salesman_id = salesman.salesman_id
WHERE comission > 0.12 AND customer.city!=salesman.city;


--Task 6.png // make a join on the tables salesman, customer and orders in such a form that the same column of 
             --each table will apear once and only the relational rows will come.




CREATE TABLE customer
( customer_id int PRIMARY KEY,
 cust_name nvarchar(200),
 city nvarchar(200),
 grade int,
 salesman_id int);

 INSERT INTO customer ( customer_id, cust_name, city, grade, salesman_id)
 VALUES ( 3002, 'Nick Rimando', 'New York', 100, 5001),
        ( 3007, 'Brad Davis', 'New York', 200, 5001),
		( 3005, 'Graham Zusi', 'California', 200, 5002),
		( 3008, 'Julian Green', 'London', 300, 5002 ),
		( 3004, 'Fabian Jhonson', 'Paris', 300, 5006 ),
		( 3009, 'Geoff Cameron', 'Berlin', 100, 5003),
		( 3003, 'Jozy Altidor', 'Moscow', 200, 5007),
		( 3001, 'Bard Guzan', 'London', null, 5005);

	

	




	


--TASK 2 emp_details

--CREATE TABLE emp_details ( EMP_IDNO int PRIMARY KEY, 
--                           EMP_FNAME nvarchar(25),
--						   EMP_LNAME nvarchar(30),
--						   EMP_DEPT int
--						   );

--INSERT INTO emp_details ( EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT)
--VALUES (127323, 'Michale', 'Robbin', 57),
--       (526689, 'Carlos', 'Snares', 63),
--	   (843795, 'Enric', 'Dosio', 57),
--	   (328717, 'Jhon', 'Snares', 63),
--	   (444527, 'Joseph', 'Dosni', 47),
--	   (659831, 'Zanifer', 'Emily', 47),
--	   (847674, 'Kuleswar', 'Sitaraman', 57),
--	   (748681, 'Henrey', 'Gabriel', 47),
--	   (555935, 'Alex', 'Manuel', 57);



