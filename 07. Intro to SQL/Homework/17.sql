-- 17.  Write a SQL query to find the top 5 best paid employees.

USE TelerikAcademy

SELECT TOP 5 FirstName + ' ' + LastName AS [Full Name], Salary
FROM Employees
ORDER BY Salary DESC