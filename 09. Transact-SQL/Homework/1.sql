--1. Create a database with two tables: Persons(Id(PK), FirstName, LastName, SSN) and Accounts(Id(PK), PersonId(FK), Balance).
--    Insert few records for testing.
--    Write a stored procedure that selects the full names of all persons.

CREATE DATABASE DatabseHWTSQL
GO

USE DatabseHWTSQL
GO

CREATE TABLE dbo.Persons
(PersonId int IDENTITY NOT NULL,
FirstName nvarchar(50),
LastName nvarchar(50) NOT NULL,
SSN int,
CONSTRAINT PK_PersonId PRIMARY KEY(PersonId)
)
GO

INSERT INTO dbo.Persons VALUES
('Peter', 'Dimitrov',11223344),
('Ivan', 'Kolev',9988745),
('Dimitar', 'Georgiev', 456789543)
GO

CREATE TABLE dbo.Accounts
(AccountId int IDENTITY NOT NULL,
PersonId int NOT NULL
CONSTRAINT FK_Accounts_Persons REFERENCES DatabseHWTSQL.dbo.Persons(PersonId),
Balance money,
CONSTRAINT PK_AccountId PRIMARY KEY(AccountId)
)
GO

INSERT INTO dbo.Accounts VALUES
(1, 100.20),
(1,205.30),
(2, 45000),
(3,4520.27)
GO

CREATE PROC dbo.usp_SelectFullNames
AS
SELECT FirstName+' '+LastName AS 'Full name'
FROM DatabseHWTSQL.dbo.Persons
GO

EXEC dbo.usp_SelectFullNames









