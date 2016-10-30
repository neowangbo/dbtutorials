CREATE TABLE employees (
id NUMBER(8) PRIMARY KEY,
name VARCHAR2(100),
gender VARCHAR2(1),
country VARCHAR2(50)
);

INSERT INTO employees(id,name,gender,country) VALUES(1,'Tom','m','U.S.A');
INSERT INTO employees(id,name,gender,country) VALUES(2,'Steven','m','U.S.A');
INSERT INTO employees(id,name,gender,country) VALUES(3,'Jimmy','m','U.S.A');
INSERT INTO employees(id,name,gender,country) VALUES(4,'John','m','U.S.A');
INSERT INTO employees(id,name,gender,country) VALUES(5,'Annie','f','U.S.A');
INSERT INTO employees(id,name,gender,country) VALUES(6,'Tony','m','U.S.A');
INSERT INTO employees(id,name,gender,country) VALUES(7,'Rose','f','British');
INSERT INTO employees(id,name,gender,country) VALUES(8,'Tim','f','Singapore');
INSERT INTO employees(id,name,gender,country) VALUES(9,'Wang Qiang','f','China');
INSERT INTO employees(id,name,gender,country) VALUES(10,'Wen Baobao','f','China');
INSERT INTO employees(id,name,gender,country) VALUES(11,'William','f','India');
COMMIT;

--1. Update all values in gender column to uppercase
UPDATE employees
SET    gender=upper(gender);
COMMIT;

--2. Optimize 1, only update not upper ones
UPDATE employees
SET    gender=upper(gender)
WHERE  gender<>upper(gender);
COMMIT;