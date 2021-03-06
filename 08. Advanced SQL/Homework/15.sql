--15. Write a SQL statement to create a table Users. Users should have username, password, full name and last login time.
--    Choose appropriate data types for the table fields. Define a primary key column with a primary key constraint.
--    Define the primary key column as identity to facilitate inserting records.
--    Define unique constraint to avoid repeating usernames.
--    Define a check constraint to ensure the password is at least 5 characters long.


USE TelerikAcademy

CREATE TABLE dbo.Users 
(	UserID int IDENTITY,
	Username nvarchar(50) NOT NULL CONSTRAINT UK_Username UNIQUE,
	Password nvarchar(50),
	FullName nvarchar(100) NOT NULL,
	LastLoginTime datetime,
	CONSTRAINT PK_Users PRIMARY KEY(UserID),
	CONSTRAINT CK_Password CHECK(LEN(Password)>=5),
)
GO
