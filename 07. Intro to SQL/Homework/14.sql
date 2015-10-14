-- 14. Write a SQL query to find the names of all employees whose salary is 25000, 14000, 12500 or 23600.

USE TelerikAcademy

SELECT FirstName + ' ' + LastName AS [Full Name], Salary
FROM Employees
WHERE Salary in(25000, 14000, 12500, 23600)