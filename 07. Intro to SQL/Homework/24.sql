-- 24. Write a SQL query to find the names of all employees from the departments "Sales" and "Finance" whose hire year is between 1995 and 2005.

USE TelerikAcademy

SELECT e.FirstName + ' ' + e.LastName AS 'Employee'
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.Name IN('Sales', 'Finance')