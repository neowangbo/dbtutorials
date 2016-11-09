-- INNER JOIN (1) ANSI SQL
SELECT O.ORDERID,C.CUSTOMERNAME,O.ORDERDATE
FROM orders O
INNER JOIN customers C
ON O.CUSTOMERID=C.CUSTOMERID;
-- INNER JOIN (2)
SELECT O.ORDERID,C.CUSTOMERNAME,O.ORDERDATE
FROM orders O,customers C
WHERE O.CUSTOMERID=C.CUSTOMERID;

-- INNER JOIN multiple table (1) ANSI SQL, combine string with function concat
SELECT O.ORDERID,
       C.CUSTOMERNAME,
       O.ORDERDATE,
       concat(concat(E.FIRSTNAME,'.'),E.LASTNAME) as "EMPLOYEE NAME",
       S.SHIPPERNAME
FROM orders O
INNER JOIN customers C
ON O.CUSTOMERID=C.CUSTOMERID
INNER JOIN employees E
ON O.EMPLOYEEID=E.EMPLOYEEID
INNER JOIN shippers S
ON O.SHIPPERID=S.SHIPPERID;--916

-- INNER JOIN multiple table (2)
SELECT O.ORDERID,
       C.CUSTOMERNAME,
       O.ORDERDATE,
       concat(concat(E.FIRSTNAME,'.'),E.LASTNAME) as "EMPLOYEE NAME",
       S.SHIPPERNAME
FROM orders O,customers C,employees E,shippers S
WHERE O.CUSTOMERID=C.CUSTOMERID AND 
      O.EMPLOYEEID=E.EMPLOYEEID AND 
      O.SHIPPERID=S.SHIPPERID;--916

-- INNER JOIN multiple table (3) ANSI SQL, combine string with ||
SELECT O.ORDERID,
       C.CUSTOMERNAME,
       O.ORDERDATE,
       E.FIRSTNAME || '.' || E.LASTNAME as "EMPLOYEE NAME",
       S.SHIPPERNAME
FROM orders O
INNER JOIN customers C
ON O.CUSTOMERID=C.CUSTOMERID
INNER JOIN employees E
ON O.EMPLOYEEID=E.EMPLOYEEID
INNER JOIN shippers S
ON O.SHIPPERID=S.SHIPPERID;

-- LEFT JOIN (1) ANSI SQL
SELECT C.CUSTOMERNAME,O.ORDERID
FROM customers C
LEFT JOIN orders O
ON C.CUSTOMERID=O.CUSTOMERID;--213

-- LEFT JOIN (2)
SELECT C.CUSTOMERNAME,O.ORDERID
FROM customers C,orders O
WHERE C.CUSTOMERID=O.CUSTOMERID(+);

-- RIGHT JOIN (1) ANSI SQL
SELECT O.ORDERID,E.FIRSTNAME || E.LASTNAME as "Employee Name"
FROM orders O
RIGHT JOIN employees E
ON O.CUSTOMERID=E.EMPLOYEEID
ORDER BY O.ORDERID;--21

-- RIGHT JOIN (2)
SELECT O.ORDERID,E.FIRSTNAME || E.LASTNAME as "Employee Name"
FROM orders O,employees E
WHERE O.CUSTOMERID(+)=E.EMPLOYEEID
ORDER BY O.ORDERID;

-- FULL JOIN (1) ANSI SQL
SELECT C.CUSTOMERNAME,O.ORDERID
FROM customers C
FULL OUTER JOIN orders O
ON C.CUSTOMERID=O.CUSTOMERID
ORDER BY C.CUSTOMERNAME;--213

-- FULL JOIN (2) NO THIS WAY *** with error: ORA-01468: a predicate may reference only one outer-joined table
SELECT C.CUSTOMERNAME,O.ORDERID
FROM customers C,orders O
WHERE C.CUSTOMERID(+) = O.CUSTOMERID(+)
ORDER BY C.CUSTOMERNAME;

-- UNION. distinct values
SELECT (SELECT COUNT(city) FROM customers) "Consumers' cities",
       (SELECT COUNT(DISTINCT city) FROM customers) "Consumers' cities no-repeated",
       (SELECT COUNT(city) FROM suppliers) "Suppliers' cities",
       (SELECT COUNT(DISTINCT city) FROM suppliers) "Suppliers' cities no-repeated"
FROM DUAL;
SELECT city FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city;
-- UNION ALL, duplicated values
SELECT city FROM customers
UNION ALL
SELECT city FROM suppliers
ORDER BY city;

-- DATE, to_char, to_date
SELECT to_char(sysdate, 'YYYY-MM-DD HH:MI:SS AM') FROM dual;
SELECT to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS') FROM dual;
SELECT to_char(to_date('1979-8-8','YYYY-MM-DD'), 'YYYY/MM/DD-HH24:MI:SS-AM') FROM dual;

-- IS NULL and IS NOT NULL
CREATE TABLE persons(
personName     VARCHAR2(500),
personBirthday Date
);

INSERT INTO persons (personName,personBirthday) VALUES('Tom',null);
INSERT INTO persons (personName,personBirthday) VALUES('Marry',null);
INSERT INTO persons (personName,personBirthday) VALUES('Rose',to_date('1986-10-26','YYYY-MM-DD'));
INSERT INTO persons (personName,personBirthday) VALUES('Stephen',to_date('1986-10-26','YYYY-MM-DD'));
INSERT INTO persons (personName,personBirthday) VALUES('Wang Bo',to_date('1979-8-8','YYYY-MM-DD'));
INSERT INTO persons (personName,personBirthday) VALUES('Shufeng.Yan',to_date('1980-4-16','YYYY-MM-DD'));
INSERT INTO persons (personName,personBirthday) VALUES('Wang Siyan',to_date('2008-12-16','YYYY-MM-DD'));
COMMIT;

SELECT * FROM persons WHERE PERSONBIRTHDAY IS NULL;
SELECT * FROM persons WHERE PERSONBIRTHDAY IS NOT NULL;

/* FUNCTIONS */
-- AVG()
SELECT AVG(quantity) FROM orderdetails;
SELECT * FROM orderdetails WHERE quantity > (SELECT AVG(quantity) FROM orderdetails) ORDER BY quantity;
-- Count() to count the values of specific column except NULL values
SELECT COUNT(*),COUNT(personname),COUNT(personbirthday) FROM persons;
-- First
SELECT * FROM persons WHERE ROWNUM<=1;
SELECT * FROM persons WHERE ROWNUM<=1;
-- natural order
SELECT personbirthday FROM persons ORDER BY personbirthday;
-- First value of one column
SELECT personbirthday FROM persons WHERE ROWNUM<=1 ORDER BY personbirthday ASC;
SELECT personbirthday FROM (SELECT personbirthday FROM persons ORDER BY personbirthday ASC) WHERE ROWNUM<=1;
SELECT personbirthday FROM persons ORDER BY personbirthday ASC;
-- Last value of one column
SELECT personbirthday FROM persons WHERE ROWNUM<=1 ORDER BY personbirthday DESC;

-- MAX
SELECT MAX(personbirthday) FROM persons;
-- MIN
SELECT MIN(personbirthday) FROM persons;
-- SUM
SELECT SUM(quantity) FROM orderDetails;
-- GROUP BY - 1, orders sent by each shipper
SELECT Shippers.ShipperName,COUNT(Orders.OrderID) AS NumberOfOrders FROM Orders
LEFT JOIN Shippers
ON Orders.ShipperID=Shippers.ShipperID
GROUP BY ShipperName, Shippers.ShipperName;

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM orderDetails;

-- GROUP BY - 2, How many orders of each product
SELECT productid,SUM(quantity) FROM orderDetails GROUP BY productid ORDER BY productid;--simple
SELECT O.PRODUCTID,P.PRODUCTNAME,SUM(O.QUANTITY) AS QUANTITY 
FROM orderDetails O,products P 
WHERE O.PRODUCTID=P.PRODUCTID 
GROUP BY O.PRODUCTID,P.PRODUCTNAME ORDER BY O.PRODUCTID;--with product name

-- GROUP BY - 3, How many orders of each customer
SELECT O.CUSTOMERID,COUNT(O.ORDERID) FROM orders O GROUP BY O.CUSTOMERID ORDER BY O.CUSTOMERID;

SELECT O.CUSTOMERID,C.CUSTOMERNAME,COUNT(O.ORDERID) AS Orders,C.CITY
FROM orders O,customers C
WHERE O.CUSTOMERID=C.CUSTOMERID
GROUP BY O.CUSTOMERID,C.CUSTOMERNAME,C.CITY
ORDER BY O.CUSTOMERID;

-- HAVING (1)
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders 
FROM Orders
INNER JOIN Employees
ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Employees.LastName
HAVING COUNT(Orders.OrderID) > 10
ORDER BY NumberOfOrders DESC;

SELECT O.PRODUCTID,P.PRODUCTNAME,SUM(O.QUANTITY) AS QUANTITY 
FROM orderDetails O,products P 
WHERE O.PRODUCTID=P.PRODUCTID 
GROUP BY O.PRODUCTID,P.PRODUCTNAME
HAVING SUM(O.QUANTITY)>100
ORDER BY QUANTITY DESC;

-- ||
SELECT e.EMPLOYEEID,e.FIRSTNAME||'.'||e.LASTNAME AS NAME FROM EMPLOYEES e;
-- CONCAT
SELECT e.EMPLOYEEID,CONCAT(CONCAT(e.FIRSTNAME,'.'),e.LASTNAME) AS NAME FROM EMPLOYEES e;
-- UPPER
SELECT e.EMPLOYEEID,UPPER(e.FIRSTNAME||'.'||e.LASTNAME) AS NAME FROM EMPLOYEES e;
-- LOWER
SELECT e.EMPLOYEEID,LOWER(e.FIRSTNAME||'.'||e.LASTNAME) AS NAME FROM EMPLOYEES e;
-- NVL
SELECT * FROM PERSONS;
SELECT NVL(PERSONBIRTHDAY,TO_DATE('1990/08/09','YYYY/MM/DD')) FROM PERSONS;
-- INSTR
SELECT PERSONNAME,INSTR(PERSONNAME,'a') FROM PERSONS;
-- SUBSTR
SELECT PERSONNAME,
       SUBSTR(PERSONNAME,1,1) AS First_Character,
       SUBSTR(PERSONNAME,LENGTH(PERSONNAME),1) AS Last_Character 
FROM PERSONS;
--First character and last character
-- LENGTH
SELECT PERSONNAME,LENGTH(PERSONNAME) FROM PERSONS;
-- RPAD and LPAD
SELECT PERSONNAME,RPAD(PERSONNAME,10,'.') AS RPAD,LPAD(PERSONNAME,10,'.') AS LPAD FROM PERSONS;
















































