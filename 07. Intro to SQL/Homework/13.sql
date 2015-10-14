-- 13 Write a SQL query to find the salary of all employees whose salary is in the range [20000�30000].

USE TelerikAcademy

SELECT FirstName + ' ' + LastName AS [Full Name], Salary
FROM Employees
WHERE Salary BETWEEN 20000 AND 30000