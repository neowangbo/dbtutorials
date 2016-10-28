
CREATE TABLE authors_bak (
id number(6) PRIMARY KEY,
name varchar2(100) NOT NULL,
birthday date NOT NULL,
gender VARCHAR2(1) NOT NULL
);

--Case 1.Copy all rows of authors table to authors_bak table
INSERT INTO authors_bak (id,name,birthday,gender) SELECT id,name,birthday,gender FROM authors;
COMMIT;

--Case 2.Insert a record
INSERT INTO authors (id,name,birthday,gender)
SELECT 4,'Dang Nian Ming Yue',to_date('19791127','YYYYMMDD'),'M' FROM dual;
COMMIT;

--Case 3.
INSERT INTO authors_bak (id,name,birthday,gender) 
SELECT id,
       name,
       birthday,
       gender 
FROM authors A
WHERE NOT EXISTS ( 
SELECT B.id,
       B.name,
       B.birthday,
       B.gender 
FROM authors_bak B 
WHERE B.id=A.id );
COMMIT;