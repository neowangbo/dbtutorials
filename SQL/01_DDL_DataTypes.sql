--DATE data type
CREATE TABLE date_example (
date_test DATE
);
INSERT INTO date_example(date_test) VALUES('20-OCT-2016');
INSERT INTO date_example(date_test) VALUES(TO_DATE('2016-10-30 22:13:00','yyyy-mm-dd hh24:mi:ss'));
COMMIT;
SELECT * FROM date_example;
SELECT TO_CHAR(date_test,'DD/mon/YYYY HH:MI;SS PM Q W') AS data_test FROM date_example;