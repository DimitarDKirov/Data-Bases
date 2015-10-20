--16. Write a SQL statement to create a view that displays the users from the Users table that have been in the system today.
--    Test if the view works correctly.

USE TelerikAcademy

CREATE VIEW [Users Logged Today] AS
SELECT Username
FROM Users
WHERE DATEDIFF(dd, LastLoginTime, GETDATE()) = 0
