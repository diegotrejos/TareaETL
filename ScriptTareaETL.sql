USE BaseETLTarea2

CREATE TABLE Employee
(
	EmployeeKey			INT IDENTITY (1,1) PRIMARY KEY,
	NationalIDNumber	NVARCHAR(15),
	FirstName			NVARCHAR(50),
	LastName			NVARCHAR(50),
	MaritalStatus		NCHAR(1),
	Salaried			BIT,
	Gender				NCHAR(1)
)

CREATE TABLE Territory
(
	TerritoryKey	 			INT IDENTITY (1,1) PRIMARY KEY,
	TerritoryID					INT,
	ProvinceStateName			NVARCHAR(50),
	ContryName					NVARCHAR(50)
)

CREATE TABLE Date
(
	DateKey			INT IDENTITY (1,1) PRIMARY KEY,
	Date			DATE		 NOT NULL,
	DayOfWeek		NVARCHAR(15),
	Season			NVARCHAR(6),
	Month			NVARCHAR(15)	,
	Quarter			NVARCHAR(2)	,
	Year			INT	
)


CREATE TABLE Product
(
	ProductKey				INT IDENTITY (1,1),
	ProductID				INT NOT NULL,
	Name					NVARCHAR(50),	
	Size					NVARCHAR(10),
	Weight					DECIMAL(8,2),
	ListPrice				MONEY,
	StandarCost				MONEY,
	Color					NVARCHAR(15),
	Class					NCHAR(10),
	Style					NCHAR(10),
	Line					NCHAR(10),
	Category				NVARCHAR(50),
	Subcategory				NVARCHAR(50),
	Model					NVARCHAR(50),
	PRIMARY KEY(Productkey)
)


CREATE TABLE FactSalesPerfomance
(	
	FactSalesPerfomanceKey 	INT IDENTITY (1,1) PRIMARY KEY,
	Quantity				INT,
	Price					INT,
	Amount					INT,
 	Employee_FKey			INT,
	Territory_FKey			INT,
	Date_FKey				INT,
	Product_FKey			INT,
); 


-- ****************************************************
-- ****************************************************
-- ****************************************************

USE BaseETLTarea2Helper

CREATE TABLE ProductHelper
(
	ProductKey				INT IDENTITY (1,1),
	ProductID				INT NOT NULL,
	Name					NVARCHAR(50),	
	Size					NVARCHAR(10),
	Weight					DECIMAL(8,2),
	ListPrice				MONEY,
	StandarCost				MONEY,
	Color					NVARCHAR(15),
	Class					NCHAR(2),
	Style					NCHAR(2),
	Line					NCHAR(2),
	Category				NVARCHAR(50),
	Subcategory				NVARCHAR(50),
	Model					NVARCHAR(50),
	PRIMARY KEY(Productkey)
)

CREATE TABLE NoEmployee
(
	ProductKey		INT IDENTITY (1,1) PRIMARY KEY,
	SalesOrderID	int NULL,
	OrderDate		datetime NULL,
	SalesPersonID	int NULL,
	TerritoryID		int NULL,
	UnitPrice		money NULL,
	ProductID		int NULL,
	OrderQty		smallint NULL
)


-- ****************************************************
-- ****************************************************
-- ****************************************************
-- ****************************************************
-- ****************************************************
-- ****************************************************

--Datos de prueba 


INSERT INTO Employee(NationalIDNumber) 
VALUES('901090640');  

INSERT INTO [Date] 
VALUES ('2020-05-05', 'monday', 1, 1, 'spring', 'spring', 'may', 1, 2020, 1);  

INSERT INTO Product(Name, Color) 
VALUES('Coca', 'rojo');  

INSERT INTO Territory(ProvinceStateName, ContryName) 
VALUES('Alajuela', 'CR');  

INSERT INTO FactSalesPerfomance(Employee_FKey, Territory_FKey, Date_FKey, Product_FKey) 
VALUES(1, 1, 1, 1);


--Tuplas para poblar date
INSERT INTO [DatesTest] 
VALUES ('2020-05-05', 'monday', 2020, 1, 'spring', 'spring', 'may', 1, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('1997-05-05', 'tuesday', 1997, 1, 'summer', 'spring', 'may', 3, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('1999-11-05', 'monday', 1999, 1, 'spring', 'spring', 'may', 1, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('1998-03-11', 'wednesday', 1998, 1, 'spring', 'spring', 'may', 2, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('2010-11-01', 'friday', 2010, 1, 'spring', 'spring', 'may', 2, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('2000-11-11', 'monday', 2000, 1, 'spring', 'spring', 'may', 1, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('1998-01-05', 'monday', 1998, 1, 'spring', 'spring', 'may', 1, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('1995-09-05', 'saturday', 1995, 1, 'spring', 'spring', 'may', 1, 2020, 1); 

INSERT INTO [DatesTest] 
VALUES ('2000-05-07', 'monday', 2000, 1, 'spring', 'spring', 'may', 1, 2020, 1); 



--SELECT PRUEBAS
USE AdventureWorks2016
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.SalesOrderDetail


USE BaseETLTarea2
SELECT * FROM Product


use BaseETLTarea2Helper;
select * from NoEmployee;
select * from ProductHelper;


SELECT *
FROM Date

SELECT *
FROM Territory

SELECT *
FROM Employee

SELECT *
FROM FactSalesPerfomance


--Eliminar Tuplas

DELETE FROM Employee

DELETE FROM Date

DELETE FROM Territory

DELETE FROM FactSalesPerfomance

DELETE FROM Product


USE AdventureWorks2017

SELECT MIN(OrderDate)
FROM Sales.SalesOrderHeader


--Para guardar los productos sin precio 


CREATE TABLE [dbo].[NoEmployee](
	[SalesOrderID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[SalesPersonID] [int] NULL,
	[TerritoryID] [int] NULL,
	[UnitPrice] [money] NULL,
	[ProductID] [int] NULL,
	[OrderQty] [smallint] NULL
)

USE BaseETLTarea2Helper;


SELECT *
FROM ProductHelp

USE AdventureWorks2017

SELECT S.OrderDate, S.SalesOrderID
FROM Sales.SalesOrderHeader S

USE AdventureWorksDW2017

SELECT *
FROM FactFinance



