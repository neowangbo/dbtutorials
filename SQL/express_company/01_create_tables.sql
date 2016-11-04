/* Total 8 tables */
-- Customers
CREATE TABLE Customers(
CustomerID   NUMBER(9) PRIMARY KEY,
CustomerName VARCHAR2(500),
ContactName  VARCHAR2(500),
Address      VARCHAR2(500),
City         VARCHAR2(500),
PostalCode   VARCHAR2(500)
);
-- Employees
CREATE TABLE Employees(
EmployeeID NUMBER(9) PRIMARY KEY,
LastName   VARCHAR2(500),
FirstName  VARCHAR2(500),
BirthDate  DATE,
Photo      VARCHAR2(500),
Notes      VARCHAR2(1000)
);
-- Shippers
CREATE TABLE Shippers(
ShipperID   NUMBER(9) PRIMARY KEY,
ShipperName VARCHAR2(500),
Phone       VARCHAR2(500)
);
-- Suppliers
CREATE TABLE Suppliers(
SupplierID   NUMBER(9) PRIMARY KEY,
SupplierName VARCHAR2(500),
ContactName  VARCHAR2(500),
Address      VARCHAR2(500),
City         VARCHAR2(500),
PostalCode   VARCHAR2(500)
);
-- Categories
CREATE TABLE Categories(
CategoryID   NUMBER(9) PRIMARY KEY,
CategoryName VARCHAR2(500),
Description  VARCHAR2(1000)
);
-- Products
CREATE TABLE Products(
ProductID   NUMBER(9) PRIMARY KEY,
ProductName VARCHAR2(500),
SupplierID  NUMBER(9),
CategoryID  NUMBER(9),
Unit        VARCHAR(500),
Price       NUMBER(9,2),
CONSTRAINT Products_fk_1 FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
CONSTRAINT Products_fk_2 FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);
-- Orders
CREATE TABLE Orders(
OrderID    NUMBER(9) PRIMARY KEY,
CustomerID NUMBER(9),
EmployeeID NUMBER(9),
ShipperID  NUMBER(9),
OrderDate  DATE,
CONSTRAINT Orders_fk_1 FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
CONSTRAINT Orders_fk_2 FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
CONSTRAINT Orders_fk_3 FOREIGN KEY (ShipperID) REFERENCES Shippers(ShipperID)
);
-- OrderDetails
CREATE TABLE OrderDetails(
OrderDetailID NUMBER(9) PRIMARY KEY,
OrderID       NUMBER(9),
ProductID     NUMBER(9),
Quantity      NUMBER(10,2),  
CONSTRAINT OrderDetails_fk_1 FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
CONSTRAINT OrderDetails_fk_2 FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

/* DROP all tables
DROP TABLE Customers;
DROP TABLE Employees;
DROP TABLE Shippers;
DROP TABLE Suppliers;
DROP TABLE Categories;
DROP TABLE Products;
DROP TABLE Orders;
DROP TABLE OrderDetails;
*/
