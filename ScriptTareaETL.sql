USE BaseETLTarea2

CREATE TABLE Employee
(
	EmployeeKey			INT PRIMARY KEY,
	NationalIDNumber	NVARCHAR(15),
	FirstName			NVARCHAR(50),
	MiddleName			NVARCHAR(50),
	LastName			NVARCHAR(50),
	MaritalStatus		NCHAR(1),
	Salaried			BIT,
	Gender				NCHAR(1)
)

CREATE TABLE Territory
(
	TerritoryKey	 			INT PRIMARY KEY,
	ProvinceStateName			NVARCHAR(50),
	ContryName					NVARCHAR(50)
)

CREATE TABLE Date
(
	DateKey			INT			 PRIMARY KEY,
	Date			DATE		 NOT NULL,
	DayOfWeek		NVARCHAR(10) NOT NULL,
	FiscalYear		INT			 NOT NULL,	
	FiscalQuarter	INT,
	Event			VARCHAR(50)	 NOT NULL,		
	Season			VARCHAR(15)	 NOT NULL,
	Month			VARCHAR(15)	 NOT NULL,
	Quarter			INT			 NOT NULL,
	Year			INT			 NOT NULL,
	WeekdayFlag		BIT			 NOT NULL
)


CREATE TABLE Product
(
	ProductKey				INT	NOT NULL,
	Name					NVARCHAR(50),	
	Size					NVARCHAR(5),
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


CREATE TABLE FactSalesPerfomance
(	
	FactSalesPerfomanceKey 	INT PRIMARY KEY,
	Quantity				INT,
	Price					INT,
	Amount					INT,
 	Employee_FKey			INT,
	Territory_FKey			INT,
	Date_FKey				INT,
	Product_FKey			INT,
 	CONSTRAINT FK_Fact_Employee			FOREIGN KEY (Employee_FKey)			REFERENCES Employee(EmployeeKey),
	CONSTRAINT FK_Fact_Territory		FOREIGN KEY (Territory_FKey)		REFERENCES Territory(TerritoryKey),
	CONSTRAINT FK_Fact_Date				FOREIGN KEY (Date_FKey)				REFERENCES Date(DateKey),
	CONSTRAINT FK_Fact_Product			FOREIGN KEY (Product_FKey)			REFERENCES Product(ProductKey)
); 


--Datos de prueba 


INSERT INTO Employee(EmployeeKey, NationalIDNumber)
VALUES(0, '901090640');

INSERT INTO [Date]
VALUES (0, '2020-05-05', 'monday', 1, 1, 'spring', 'spring', 'may', 1, 2020, 1);

INSERT INTO Product(ProductKey, Name, Color)
VALUES(0, 'Coca', 'rojo');

INSERT INTO Territory(TerritoryKey, ProvinceStateName, ContryName)
VALUES(0, 'Alajuela', 'CR');

INSERT INTO FactSalesPerfomance(FactSalesPerfomanceKey, Employee_FKey, Territory_FKey, Date_FKey, Product_FKey)
VALUES(0, 0, 0, 0, 0);


--SELECT PRUEBAS
use BaseETLTarea2;
SELECT * FROM dbo.Date;
SELECT * FROM Product;
SELECT * FROM Territory;
SELECT * FROM Employee;
SELECT * FROM FactSalesPerfomance;

-- Haciendo consultas a AdventureWorksElka
use AdventureWorks_Elka;

select * from Production.Product;