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

-- FUNCTIONS
-- avg(COLUMN)
SELECT AVG(quantity) FROM orderdetails;
SELECT * FROM orderdetails WHERE quantity > (SELECT AVG(quantity) FROM orderdetails) ORDER BY quantity;
-- count(COLUMN) to count the values of specific column except NULL values
SELECT COUNT(*),COUNT(personname),COUNT(personbirthday) FROM persons;
-- first(COLUMN)
SELECT * FROM persons WHERE ROWNUM<=1;
SELECT * FROM persons WHERE ROWNUM<=1;








