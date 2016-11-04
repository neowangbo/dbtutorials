/*employees*/
SET DEFINE OFF

--Row 1
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (1,'Davolio','Nancy',to_date('12/8/1968','MM/DD/YYYY'),'EmpID1.pic','Education includes a BA in psychology from Colorado State University. She also completed (The Art of the Cold Call). Nancy is a member of ''Toastmasters International''.');
--Row 2
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (2,'Fuller','Andrew',to_date('2/19/1952','MM/DD/YYYY'),'EmpID2.pic','Andrew received his BTS commercial and a Ph.D. in international marketing from the University of Dallas. He is fluent in French and Italian and reads German. He joined the company as a sales representative, was promoted to sales manager and was then named vice president of sales. Andrew is a member of the Sales Management Roundtable, the Seattle Chamber of Commerce, and the Pacific Rim Importers Association.');
--Row 3
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (3,'Leverling','Janet',to_date('8/30/1963','MM/DD/YYYY'),'EmpID3.pic','Janet has a BS degree in chemistry from Boston College). She has also completed a certificate program in food retailing management. Janet was hired as a sales associate and was promoted to sales representative.');
--Row 4
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (4,'Peacock','Margaret',to_date('9/19/1958','MM/DD/YYYY'),'EmpID4.pic','Margaret holds a BA in English literature from Concordia College and an MA from the American Institute of Culinary Arts. She was temporarily assigned to the London office before returning to her permanent post in Seattle.');
--Row 5
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (5,'Buchanan','Steven',to_date('3/4/1955','MM/DD/YYYY'),'EmpID5.pic','Steven Buchanan graduated from St. Andrews University, Scotland, with a BSC degree. Upon joining the company as a sales representative, he spent 6 months in an orientation program at the Seattle office and then returned to his permanent post in London, where he was promoted to sales manager. Mr. Buchanan has completed the courses ''Successful Telemarketing'' and ''International Sales Management''. He is fluent in French.');
--Row 6
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (6,'Suyama','Michael',to_date('7/2/1963','MM/DD/YYYY'),'EmpID6.pic','Michael is a graduate of Sussex University (MA, economics) and the University of California at Los Angeles (MBA, marketing). He has also taken the courses ''Multi-Cultural Selling'' and ''Time Management for the Sales Professional''. He is fluent in Japanese and can read and write French, Portuguese, and Spanish.');
--Row 7
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (7,'King','Robert',to_date('5/29/1960','MM/DD/YYYY'),'EmpID7.pic','Robert King served in the Peace Corps and traveled extensively before completing his degree in English at the University of Michigan and then joining the company. After completing a course entitled ''Selling in Europe'', he was transferred to the London office.');
--Row 8
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (8,'Callahan','Laura',to_date('1/9/1958','MM/DD/YYYY'),'EmpID8.pic','Laura received a BA in psychology from the University of Washington. She has also completed a course in business French. She reads and writes French.');
--Row 9
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (9,'Dodsworth','Anne',to_date('7/2/1969','MM/DD/YYYY'),'EmpID9.pic','Anne has a BA degree in English from St. Lawrence College. She is fluent in French and German.');
--Row 10
INSERT INTO EMPLOYEES (EMPLOYEEID, LASTNAME, FIRSTNAME, BIRTHDATE, PHOTO, NOTES) VALUES (10,'West','Adam',to_date('9/19/1928','MM/DD/YYYY'),'EmpID10.pic','An old chum');

COMMIT;