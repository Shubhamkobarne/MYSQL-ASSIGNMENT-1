CREATE DATABASE mysqlassignment1;
USE mysqlassignment1;
CREATE TABLE salespeople(
snum INT NOT NULL PRIMARY KEY,
sname VARCHAR(50),
city VARCHAR(50),
comm INT,
UNIQUE(sname)
);
INSERT INTO salespeople(snum,sname,city,comm)
VALUES
(1001,'PEEL','LONDON',12),
(1002,'SERRES','SANJOSE',13),
(1004,'MOTIKA','LONDON',11),
(1007,'RIFKIN','BARCELONA',15),
(1003,'AXELROD','NEWYORK',10);

USE mysqlassignment1;
CREATE TABLE customers(
cnum INT NOT NULL PRIMARY KEY,
cname VARCHAR(50),
city VARCHAR(50),
snum INT,
FOREIGN KEY (snum) REFERENCES salespeople(snum)
);
INSERT INTO customers(cnum,cname,city,snum)
VALUES
(2001,'HOFFMAN','LONDON',1001),
(2002,'GIOVANNI','ROME',1003),
(2003,'LIU','SANJOSE',1002),
(2004,'GRASS','BERLIN',1002),
(2006,'CLEMENS','LONDON',1001),
(2008,'CISNEROS','SANJOSE',1007),
(2007,'PEREIRA','ROME',1004);

USE mysqlassignment1;
CREATE TABLE orders(
onum INT NOT NULL PRIMARY KEY,
amt VARCHAR(50),
odate VARCHAR(50),
cnum INT,
snum INT,
FOREIGN KEY (cnum) REFERENCES customers(cnum),
FOREIGN KEY (snum) REFERENCES salespeople(snum)
);
INSERT INTO orders(onum,amt,odate,cnum,snum)
VALUES
(3001,'18.69','3-10-1990',2008,1007),
(3003,'767.19','3-10-1990',2001,1001),
(3002,'1900.10','3-10-1990',2007,1004),
(3005,'5160.45','3-10-1990',2003,1002),
(3006,'1098.16','3-10-1990',2008,1007),
(3009,'1713.23','4-10-1990',2002,1003),
(3007,'75.75','4-10-1990',2004,1002),
(3008,'4273.00','5-10-1990',2006,1001),
(3010,'1309.95','6-10-1990',2004,1002),
(3011,'9891.88','6-10-1990',2006,1001);

# Q1 Count the number of Salesperson whose name begin with ‘a’/’A’.
SELECT COUNT(*) FROM salespeople WHERE sname LIKE 'A%' OR 'a%';
# Q2  Display all the Salesperson whose all orders worth is more than Rs. 2000.
SELECT snum FROM orders WHERE amt>2000;
# Q3  Count the number of Salesperson belonging to Newyork.
SELECT COUNT(*) FROM salespeople WHERE city='NEWYORK';
# Q4 Display the number of Salespeople belonging to London and belonging to Paris.
SELECT sname,city,COUNT(*) FROM salespeople WHERE city='LONDON'OR'PARIS' GROUP BY sname,city;
#Q5 Display the number of orders taken by each Salesperson and their date of orders.
SELECT odate,snum,COUNT(*) FROM orders GROUP BY odate,snum;