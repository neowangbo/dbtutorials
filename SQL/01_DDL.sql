-- SQL> @C:\DevHome\projects\demos\databasetutorials\SQL\01_create_db.sql
-- Create tablespace and user
CREATE TABLESPACE LEARNING DATAFILE 'C:\DevHome\servers\oracle11g\oradata\orcl\LEARNING.DBF' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;  
CREATE USER learner IDENTIFIED BY oracle DEFAULT TABLESPACE LEARNING QUOTA UNLIMITED ON LEARNING;  
GRANT ALL PRIVILEGES TO learner;

-- Table creation and constraints operations
DROP TABLE books;
DROP TABLE authors;

-- Create table AUTHORS
CREATE TABLE authors (
id number(6),
name varchar2(100) NOT NULL,
birthday date NOT NULL,
gender VARCHAR2(1) NOT NULL,
CONSTRAINT authors_pk PRIMARY KEY (id) USING INDEX (CREATE UNIQUE INDEX authors_pk_index ON authors(id)),
CONSTRAINT authors_chk_1 CHECK (gender='F' or gender='M'),
CONSTRAINT authors_un_1 UNIQUE (name,birthday,gender) USING INDEX (CREATE UNIQUE INDEX authors_un_1_index ON authors(name,birthday,gender))
);

-- Create table BOOKS
CREATE TABLE books (
id number(6),
title varchar2(500) NOT NULL,
published_date date NOT NULL,
author_id number(6) NOT NULL,
CONSTRAINT books_pk PRIMARY KEY (id) USING INDEX (CREATE UNIQUE INDEX books_pk_index ON books(id)),
CONSTRAINT books_fk FOREIGN KEY (author_id) REFERENCES authors(id),
CONSTRAINT books_un_1 UNIQUE (title,published_date,author_id) USING INDEX (CREATE UNIQUE INDEX books_un_1_index ON books(title,published_date,author_id))
);
CREATE INDEX books_fk_index ON books(author_id);

-- Insert some data
INSERT INTO authors VALUES (1,'Liu Cixin',TIMESTAMP'1963-06-23 00:00:00','M');
INSERT INTO authors VALUES (2,'Liu Ken',TIMESTAMP'1976-01-01 00:00:00','M');

INSERT INTO books VALUES (1, 'The Three-Body Problem', TIMESTAMP'2007-01-01 00:00:00',1);
INSERT INTO books VALUES (2, 'The Dark Forest', TIMESTAMP'2008-01-01 00:00:00',1);
INSERT INTO books VALUES (3, 'Death''s End', TIMESTAMP'2010-01-01 00:00:00',1);

--DELETE FROM books WHERE id=3;

SELECT * FROM authors;
SELECT * FROM books;


