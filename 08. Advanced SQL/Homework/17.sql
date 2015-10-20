--17. Write a SQL statement to create a table Groups. Groups should have unique name (use unique constraint).
--    Define primary key and identity column.


USE TelerikAcademy
GO

CREATE TABLE Groups (
GroupID int IDENTITY,
Name nvarchar(50) NOT NULL
CONSTRAINT UC_Name UNIQUE,
CONSTRAINT PK_Groups PRIMARY KEY(GroupID)
)
GO