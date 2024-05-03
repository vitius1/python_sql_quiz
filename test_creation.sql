CREATE DATABASE test_database;
USE test_database;

CREATE TABLE sql_test(
	quest_id INT IDENTITY (1, 1) PRIMARY KEY,
	question VARCHAR (1000) NOT NULL,
	answer VARCHAR (1000) NOT NULL
);

ALTER TABLE sql_test
ADD category VARCHAR(255) NOT NULL;

INSERT INTO sql_test VALUES('Select all invoices from table Invoice with a price between 10 and 20.', 'SELECT * FROM Invoice WHERE Total BETWEEN 1 AND 10;', 'BETWEEN OPERATOR');
INSERT INTO sql_test VALUES('Select all invoices from table Invoice with a price THAT ARE NOT between 10 and 20.', 'SELECT* FROM Invoice WHERE Total NOT BETWEEN 1 AND 10;', 'BETWEEN OPERATOR');
INSERT INTO sql_test VALUES('Select all invoices from table Invoice with a price between 10 and 20. In addition, the CustomerId must be either 1, 10 or 52.', 'SELECT * FROM Invoice WHERE Total BETWEEN 10 AND 20 AND CustomerId IN (1, 10, 52);', 'BETWEEN OPERATOR');
INSERT INTO sql_test VALUES('Select all invoices from table Invoice with a BillingCity alphabetically between Oslo and Warsaw.', 'SELECT * FROM Invoice WHERE BillingCity BETWEEN "Oslo" AND "Warsaw" ORDER BY BillingCity;', 'BETWEEN OPERATOR');
INSERT INTO sql_test VALUES('Select all invoices from table Invoice with a BillingCountry not between Germany and United Kingdom.', 'SELECT * FROM Invoice WHERE BillingCountry NOT BETWEEN "Germany" AND "United Kingdom" ORDER BY BillingCountry;', 'BETWEEN OPERATOR');
INSERT INTO sql_test VALUES('Select all invoices from table Invoice with an InvoiceDate between "01-January-2010" and "31-December-2012".', 'SELECT * FROM Invoice WHERE InvoiceDate BETWEEN "2010-01-01" AND "2012-12-31" ORDER BY InvoiceDate;', 'BETWEEN OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that have "r" in the second position.', 'SELECT * FROM Customer WHERE FirstName LIKE "_r%";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that ends with the pattern "es".', 'SELECT * FROM Customer WHERE LastName LIKE "%es";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that contains the pattern "mer".', 'SELECT * FROM Customer WHERE LastName LIKE "%mer%";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer with a City starting with any character, followed by "ondon"', 'SELECT FirstName, LastName, CityFROM CustomerWHERE City Like "_ondon";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer with a City starting with "L", followed by any 3 characters, ending with "on"', 'SELECT FirstName, LastName, City FROM Customer WHERE City LIKE "L___on";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer starting with either "b", "s", or "p".', 'SELECT * FROM Customer WHERE FirstName LIKE "[bsp]%";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer starting with "a", "b", "c", "d", "e" or "f".', 'SELECT * FROM Customer WHERE FirstName LIKE "[a-f]%" ORDER BY FirstName;', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that starts with "a" and are at least 3 characters in length.', 'SELECT *FROM Customer WHERE FirstName LIKE "a__%";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that are from "London", "Paris", or "Berlin".', 'SELECT * FROM Customer WHERE City IN ("London", "Paris", "Berlin");', 'IN OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that are NOT from "London", "Paris", or "Berlin".', 'SELECT * FROM Customer WHERE City NOT IN ("London", "Paris", "Berlin");', 'IN OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that have an order in the Invoice table.', 'SELECT * FROM Customer WHERE CustomerId IN(SELECT CustomerId FROM Invoice);', 'IN OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that dont have ay order in the Invoice table.', 'SELECT * FROM Customer WHERE CustomerId NOT IN(SELECT CustomerId FROM Invoice);', 'IN OPERATOR');
INSERT INTO sql_test VALUES('Select all customers from table Customer that dont start with a or b.', 'SELECT * FROM Customer WHERE FirstName LIKE "[^ab]%";', 'LIKE OPERATOR');
INSERT INTO sql_test VALUES('Create two aliases in the table Customer, one for the City column and one for the Country column.', 'SELECT City AS Mesto, Country AS Stat FROM Customer;', 'ALIAS');
INSERT INTO sql_test VALUES('In the table Customer create alias telefonni cislo instead of "Phone".', 'SELECT Phone AS [Telefonni cislo] FROM Customer;', 'ALIAS');
INSERT INTO sql_test VALUES('In the table Customer create one column for FirstName, LastName, City and Country with an alias Customer.', 'SELECT FirstName + " " + LastName + ", " + City + ", " + Country AS Customer FROM Customer;', 'ALIAS');
INSERT INTO sql_test VALUES('Refer to the Customers table as Person instead.', 'SELECT * FROM Customer AS Person;', 'ALIAS');
INSERT INTO sql_test VALUES('Join Products (table Product) and Suppliers(table Supplier).', 'SELECT * FROM Product JOIN Supplier ON Product.SupplierId = Supplier.Id;', 'JOIN');
INSERT INTO sql_test VALUES('Match customers in table Customer that are from the same country.', 'SELECT * FROM Customer AS c1, Customer AS c2 WHERE c1.Country = c2.Country AND c1.Id != c2.Id;', 'JOIN');
INSERT INTO sql_test VALUES('Select all (only distinct values) from both the "test1" and the "test2" table.', 'SELECT * FROM test1 UNION SELECT * FROM test2;', 'UNION');
INSERT INTO sql_test VALUES('Select all (duplicate values also) from both the "test1" and the "test2" table.', 'SELECT * FROM test1 UNION ALL SELECT * FROM test2;', 'UNION');
INSERT INTO sql_test VALUES('Select only usernames that start with "P" (only distinct values) from both the "test1" and the "test2" table.', 'SELECT test1.username FROM test1 WHERE test1.username LIKE "P%" UNION SELECT test2.username FROM test2 WHERE test2.username LIKE "P%";', 'UNION');
INSERT INTO sql_test VALUES('Select only usernames that start with "P" (duplicate values also) from both the "test1" and the "test2" table.', 'SELECT test1.username FROM test1 WHERE test1.username LIKE "P%" UNION ALL SELECT test2.username FROM test2 WHERE test2.username LIKE "P%"', 'UNION');
INSERT INTO sql_test VALUES('Select Id, FirstName, LastName from "Customer" table, add new column named TYPE in which you type "Customer and Id, CompanyName, ContactName from "Supplier" table, add new column in which you type "Customer.', 'SELECT "Customer" AS TYPE, Customer.Id, FirstName, LastName FROM Customer UNION SELECT "Supplier", Supplier.Id, CompanyName, ContactName FROM Supplier;', 'UNION');
INSERT INTO sql_test VALUES('List the number of customers (table Customer) in each country.', 'SELECT Country, COUNT(*) FROM Customer GROUP BY Country;', 'GROUP BY');
INSERT INTO sql_test VALUES('List the number of customers (table Customer) in each country, sorted high to low.', 'SELECT Country, COUNT(*) AS [Number of customers] FROM Customer GROUP BY Country ORDER BY [Number of customers] DESC;', 'GROUP BY');
INSERT INTO sql_test VALUES('List the number of orders (table Order) ordered by each customer.', 'SELECT CustomerId, COUNT(Id) FROM [Order] GROUP BY CustomerId ORDER BY CustomerId;', 'GROUP BY');
INSERT INTO sql_test VALUES('List the number of orders producted by each supplier. (few of tables: Product, Supplier, Order, Invoice, OrderItem...)', 'SELECT Supplier.CompanyName AS dodavatel, COUNT(OrderId) AS [pocet objednavek] FROM OrderItem JOIN Product ON Product.Id = OrderItem.ProductId JOIN Supplier ON Supplier.Id = Product.SupplierId GROUP BY Supplier.CompanyName ORDER BY dodavatel;', 'JOIN, GROUP BY');
INSERT INTO sql_test VALUES('List the number of items shipped by each supplier. (Few of tables: Product, Supplier, Order, Invoice, OrderItem...)', 'SELECT Supplier.CompanyName AS [Spolecnost], SUM(OrderItem.Quantity) AS [Pocet prodanych kusu] FROM OrderItem JOIN Product ON Product.Id = OrderItem.ProductId JOIN Supplier ON Supplier.Id = Product.SupplierId GROUP BY Supplier.CompanyName ORDER BY Supplier.CompanyName;', 'JOIN, GROUP BY');
INSERT INTO sql_test VALUES('List the number of customers (table Customer) in each country. Only include countries with more than 5 customers.', 'SELECT Country, COUNT(Id) AS [number of customers] FROM Customer GROUP BY Country HAVING COUNT(Id) > 5; ', 'HAVING');
INSERT INTO sql_test VALUES('List the number of customers (table Customer) in each country, sorted high to low (Only include countries with more than 5 customers).', 'SELECT Country, Count(Id) AS [number of customers] FROM Customer GROUP BY Country HAVING COUNT(Id) > 5 ORDER BY [number of customers] DESC;', 'HAVING');
INSERT INTO sql_test VALUES('List the suppliers (table Supplier) that have registered more than 60 orders.', 'SELECT Supplier.Id, Supplier.CompanyName, COUNT(OrderItem.Id) FROM OrderItem JOIN Product ON Product.Id = OrderItem.ProductId JOIN Supplier ON Supplier.Id = Product.SupplierId GROUP BY Supplier.Id, Supplier.CompanyName HAVING COUNT(OrderItem.OrderId) > 60 ORDER BY Supplier.Id;', 'HAVING');
INSERT INTO sql_test VALUES('List if the Suppliers "Leka Trading" or "Refrescos Americanas LTDA" have registered more than 60 orders.', 'SELECT Supplier.Id, Supplier.CompanyName, COUNT(OrderItem.Id) FROM OrderItem JOIN Product ON Product.Id = OrderItem.ProductId JOIN Supplier ON Supplier.Id = Product.SupplierId WHERE Supplier.CompanyName IN("Leka Trading", "Refrescos Americanas LTDA") GROUP BY Supplier.Id, Supplier.CompanyName HAVING COUNT(OrderItem.OrderId) > 60 ORDER BY Supplier.Id;', 'HAVING');
INSERT INTO sql_test VALUES('List the suppliers with a product price less than 20, using EXISTS operator.', 'SELECT Id, CompanyName FROM Supplier WHERE EXISTS (SELECT ProductName  FROM Product WHERE Product.SupplierId = Supplier.Id AND UnitPrice < 20);', 'EXISTS');
INSERT INTO sql_test VALUES('List the suppliers with a product price equal to 22, using EXISTS operator.', 'SELECT Id, CompanyName FROM Supplier WHERE EXISTS (SELECT * FROM Product WHERE Product.SupplierId = Supplier.Id AND UnitPrice = 22);', 'EXISTS');
INSERT INTO sql_test VALUES('List the ProductName(table Product) if it finds ANY records in the OrderItem table has Quantity equal to 10.', 'SELECT ProductName FROM Product WHERE Id = ANY(SELECT ProductId FROM OrderItem WHERE Quantity = 10);', 'ANY, ALL');
INSERT INTO sql_test VALUES('List the ProductName(table Product) if it finds ANY records in the OrderItem table has Quantity larger than 99.', 'SELECT ProductName FROM Product WHERE Id = ANY(SELECT ProductId FROM OrderItem WHERE Quantity > 99);', 'ANY, ALL');
INSERT INTO sql_test VALUES('List the ProductName(table Product) if it finds ANY records in the OrderItem table has Quantity larger than 1000.', 'SELECT ProductName FROM Product WHERE Id = ANY(SELECT ProductId FROM OrderItem WHERE Quantity > 1000);', 'ANY, ALL');
INSERT INTO sql_test VALUES('List ALL the product names(table Product).', 'SELECT ALL ProductName FROM Product;', 'ANY, ALL');
INSERT INTO sql_test VALUES('List the ProductName(table Product) if ALL the records in the OrderItem table has Quantity equal to 10.', 'SELECT ProductName FROM Product WHERE id = ALL(SELECT ProductId FROM OrderItem WHERE Quantity = 10);', 'ANY, ALL');
INSERT INTO sql_test VALUES('Create a backup copy of Customer.', 'SELECT * INTO new_table FROM Customer;', 'SELECT INTO');
INSERT INTO sql_test VALUES('Create a backup copy of Customer into a new table in another database.', 'SELECT * INTO joining.dbo.new_table FROM Customer;', 'SELECT INTO');
INSERT INTO sql_test VALUES('Create a backup copy of only few columns Customer.', 'SELECT FirstName, LastName INTO new_table FROM Customer;', 'SELECT INTO');
INSERT INTO sql_test VALUES('Copy only the German customers into a new table.', 'SELECT * INTO new_table FROM Customer WHERE Country = "Germany";', 'SELECT INTO');
INSERT INTO sql_test VALUES('Copy * from table Customer and the total (table Invoice) that they have spent into a new table.', 'SELECT c.Id, c.FirstName, c.LastName, c.City, c.Country, c.Phone, SUM(Total) as Total INTO new_table FROM Customer as c JOIN Invoice as i ON c.Id = i.CustomerId GROUP BY c.Id, c.FirstName, c.LastName, c.City, c.Country, c.Phone;', 'SELECT INTO');
INSERT INTO sql_test VALUES('Create a new, empty table using the schema of another.', 'SELECT * INTO new_table FROM Customer WHERE 1 = 0;', 'SELECT INTO');
INSERT INTO sql_test VALUES('COPY Customers into an already existing new_table.', 'INSERT INTO new_table SELECT FirstName, LastName, City, Country, Phone FROM Customer;', 'INSERT INTO');
INSERT INTO sql_test VALUES('Select Id, Quantity, Quantity text from OrderItem table. When Quantity > 30, type "The Quantity is greater than 30". When Quantity = 30, type "The Quantity is 30". When Quantity < 30, type "The Quantity is under 30".', 'SELECT Id, Quantity, QuantityText = (CASE WHEN Quantity > 30 THEN "The Quantity is greater than 30" WHEN Quantity = 30 THEN "The Quantity is 30" ELSE "The Quantity is under 30" END) FROM OrderItem ORDER BY Quantity;', 'CASE');
INSERT INTO sql_test VALUES('Order the customers by City. However, if City is NULL, then order by Country.', 'SELECT * FROM Customer ORDER BY (CASE WHEN City IS NULL THEN Country ELSE City END);', 'CASE');
INSERT INTO sql_test VALUES('Select Id, Unitprice * (Quantity + ProductId) from OrderItem table. If ProductId is NULL, then substitute it with 0.', 'SELECT Id, UnitPrice * (Quantity + COALESCE(ProductId, 0))FROM OrderItem;', 'COALESCE or ISNULL');
INSERT INTO sql_test VALUES('Select * from Customer table and then select a new column named Language. If Country is Germany, the language will be "German", if not, the language will be "Other language".', 'SELECT *, Language = IIF(Country = "Germany", "German", "Other language") FROM Customer;', 'IIF');
INSERT INTO sql_test VALUES('Create a stored procedure named "SelectAllCustomers" that selects all records from the "Customer" table, then use this procedure in a select query.', 'CREATE PROCEDURE SelectAllCustomers AS SELECT * FROM Customer; GO EXEC SelectAllCustomers; GO', 'CREATE PROCEDURE');
INSERT INTO sql_test VALUES('Create a stored procedure that selects Customers from a particular City from the "Customer" table, then use this procedure in a select query.', 'CREATE PROCEDURE SelectAllCustomersB @city nvarchar(60) AS SELECT * FROM Customer WHERE City = @city; GO EXEC SelectAllCustomersB @city = "Berlin";', 'CREATE PROCEDURE');
INSERT INTO sql_test VALUES('Delete a procedure.', 'DROP PROCEDURE SelectAllCustomersB;', 'DROP');
INSERT INTO sql_test VALUES('Create a backup for a database test_backup.', 'BACKUP DATABASE test_backup TO DISK = "C:\aaa\test.bak" WITH FORMAT, NAME = "back up of test_backup", MEDIANAME = "test_backup1", DESCRIPTION = "This is a backup file of test_backup database" GO DROP DATABASE test_backup; RESTORE DATABASE testDB FROM DISK = "C:\aaa\test.bak" GO', 'BACKUP DATABASE, DROP DATABASE, RESTORE DATABASE');
INSERT INTO sql_test VALUES('Create a backup for a database that will backup only the changes.', 'BACKUP DATABASE test_database TO DISK = "C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\test_database.bak" WITH DIFFERENTIAL;', 'BACKUP DATABASE');
INSERT INTO sql_test VALUES('Create a new table with the schema of another table.', 'SELECT * INTO new_table FROM sql_test_backup WHERE 1 = 0;', 'SELECT INTO');
INSERT INTO sql_test VALUES('Add new column to an already existing table.', 'ALTER TABLE new_table ADD test_column VARCHAR(50);', 'ADD');
INSERT INTO sql_test VALUES('Drop one column of an already existing table.', 'ALTER TABLE new_table DROP COLUMN test_column;', 'DROP COLUMN');
INSERT INTO sql_test VALUES('Rename a column of an already existing table.', 'SP_RENAME "new_table.quest_id", "id", "COLUMN";', 'SP_RENAME');
INSERT INTO sql_test VALUES('Rename an already existing table.', 'EXEC SP_RENAME "new_table", "table_table"', 'EXEC SP_RENAME');
INSERT INTO sql_test VALUES('Change column datatype of an already existing table.', 'ALTER TABLE table_table ALTER COLUMN category NVARCHAR(50) NOT NULL;', 'ALTER COLUMN');
INSERT INTO sql_test VALUES('Create a table with some value that cant be null.', 'CREATE TABLE constraint_table(Id INT NOT NULL, LastName VARCHAR NOT NULL, FirstName VARCHAR NOT NULL, age INT);', 'NOT NULL');
INSERT INTO sql_test VALUES('Add the not null constraint to an already existing column in a table.', 'ALTER TABLE constraint_table ALTER COLUMN age INT NOT NULL;', 'ALTER COLUMN');
INSERT INTO sql_test VALUES('Create a table with a unique column.', 'CREATE TABLE constraint_table(Id INT NOT NULL UNIQUE, LastName VARCHAR NOT NULL, FirstName VARCHAR NOT NULL, age INT);', 'UNIQUE');
INSERT INTO sql_test VALUES('Create a table with multiple unique columns.', 'CREATE TABLE constraint_table(Id INT NOT NULL, LastName VARCHAR(255) NOT NULL, FirstName VARCHAR(255) NOT NULL, age INT, CONSTRAINT UC_Person UNIQUE(Id, LastName));', 'CONSTRAINT');
INSERT INTO sql_test VALUES('Add an unique constraint to an already existing column and give the constraint a name.', 'ALTER TABLE constraint_table ADD CONSTRAINT UC_Person2 UNIQUE(age);', 'ADD CONSTRAINT');
INSERT INTO sql_test VALUES('Delete an unique constraint from one column.', 'ALTER TABLE constraint_table DROP CONSTRAINT UC_Person2;', 'DROP CONSTRAINT');
INSERT INTO sql_test VALUES('Create a table with a primary key.', 'CREATE TABLE constraint_table(Id INT PRIMARY KEY, LastName VARCHAR(255) NOT NULL, FirstName VARCHAR(255) NOT NULL, age INT NOT NULL);', 'PRIMARY KEY');
INSERT INTO sql_test VALUES('Create a table with two primary keys.', 'CREATE TABLE constraint_table(Id INT, LastName VARCHAR(255) NOT NULL, FirstName VARCHAR(255) NOT NULL, age INT NOT NULL, CONSTRAINT PK_Constraint PRIMARY KEY(Id, LastName));', 'CONSTRAINT');
INSERT INTO sql_test VALUES('Add primary key to an already existing table.', 'ALTER TABLE constraint_table ADD CONSTRAINT PK_Constraint PRIMARY KEY(Id, LastName);', 'ADD CONSTRAINT');
INSERT INTO sql_test VALUES('Delete a primary key from a table.', 'ALTER TABLE constraint_table DROP CONSTRAINT PK_Constraint;', 'DROP CONSTRAINT');
INSERT INTO sql_test VALUES('Create a table with constraint foreign key.', 'CREATE TABLE [Order](OrderId INT PRIMARY KEY, OrderNumber INT NOT NULL, PersonId INT, CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonId) REFERENCES Person(PersonId));', 'FOREIGN KEY');
INSERT INTO sql_test VALUES('Add foreign key to an existing table.', 'ALTER TABLE [Order] ADD CONSTRAINT FK_PersonOrder FOREIGN KEY(PersonId) REFERENCES Person(PersonId);', 'ADD CONSTRAINT');
INSERT INTO sql_test VALUES('Delete a foreign key from a table.', 'ALTER TABLE [Order] DROP CONSTRAINT FK_PersonOrder;', 'DROP CONSTRAINT');
INSERT INTO sql_test VALUES('Create a table Person with column named age, ensure that age will be greater than 18.', 'CREATE TABLE Person(PersonId INT IDENTITY (1, 1) PRIMARY KEY, LastName VARCHAR(255) NOT NULL, FirstName VARCHAR(255) NOT NULL, Age INT NOT NULL CHECK(Age >= 18));', 'CHECK');
INSERT INTO sql_test VALUES('Create a table Person with column named age, another column named city ensure that age will be greater than 18 and city will be only "Cardano".', 'CREATE TABLE Person(PersonId INT IDENTITY (1, 1) PRIMARY KEY, LastName VARCHAR(255) NOT NULL, FirstName VARCHAR(255) NOT NULL, Age INT NOT NULL, City VARCHAR(255) NOT NULL, CONSTRAINT CHK_Person CHECK(Age >= 18 AND City = "Cardano"));', 'CHECK');
INSERT INTO sql_test VALUES('Add check constraint to an existing table.', 'ALTER TABLE Person ADD CONSTRAINT CHK_Person CHECK(Age >= 18 AND CITY IN("Cardano", "Ostrava"));', 'ADD CONSTRAINT');
INSERT INTO sql_test VALUES('Delete a check constraint from an existing table.', 'ALTER TABLE Person DROP CONSTRAINT CHK_Person;', 'DROP CONSTRAINT');
INSERT INTO sql_test VALUES('Create a table Person with one default value for a city column.', 'CREATE TABLE Person(PersonId INT IDENTITY(1, 1) PRIMARY KEY, LastName VARCHAR(255) NOT NULL, FirstName VARCHAR(255) NOT NULL, age INT, city VARCHAR(255) DEFAULT("Cardano"));', 'DEFAULT');
INSERT INTO sql_test VALUES('Create a table Order with a default value for order date - the exact date of the moment.', 'CREATE TABLE [Order](OrderId INT IDENTITY(1, 1) PRIMARY KEY, OrderNumber INT NOT NULL, OrderDate DATE DEFAULT GETDATE());', 'GETDATE');
INSERT INTO sql_test VALUES('Insert a default value for order date - the exact date of the moment to an already existing table.', 'ALTER TABLE [Order] ADD CONSTRAINT DF_OrderDate DEFAULT GETDATE() FOR OrderDate;', 'ADD CONSTRAINT');
INSERT INTO sql_test VALUES('Delete a default constraint from a table.', 'ALTER TABLE[Order] DROP CONSTRAINT DF_OrderDate;', 'DROP CONSTRAINT');
INSERT INTO sql_test VALUES('Create and index on a column.', 'CREATE INDEX idx_annual_salary ON employee(annual_salary);', 'CREATE INDEX');
INSERT INTO sql_test VALUES('Create a clustered index on a column.', 'CREATE CLUSTERED INDEX idx_emp_id ON employee(emp_id);', 'CREATE CLUSTERED INDEX');
INSERT INTO sql_test VALUES('Delete an index.', 'DROP INDEX idx_annual_salary ON employee;', 'DROP INDEX');


CREATE TABLE player(
	player_id INT IDENTITY (1, 1) PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	surname VARCHAR(255) NOT NULL,
	points INT
);
ALTER TABLE player
ADD answered_questions INT;

CREATE TABLE answer(
	id INT IDENTITY(1, 1) PRIMARY KEY,
	player_id INT NOT NULL,
	quest_id INT NOT NULL,
	answer CHAR(1) NOT NULL,
	CONSTRAINT FK_player_answer FOREIGN KEY(player_id) REFERENCES player(player_id) ON DELETE CASCADE,
	CONSTRAINT FK_question_answer FOREIGN KEY(quest_id) REFERENCES sql_test(quest_id) ON DELETE CASCADE
);

-- BACKUP
USE test_database;
BACKUP DATABASE test_database
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\test_database.bak'
	WITH FORMAT,
	NAME = 'backup of test_database',
	MEDIANAME = 'test_database_backup'
GO

BACKUP DATABASE test_database
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\Backup\test_database.bak'
WITH DIFFERENTIAL;