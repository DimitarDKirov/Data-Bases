--20. Write a SQL query to find all employees along with their manager.

USE TelerikAcademy

SELECT e.*, m.FirstName + ' ' + m.LastName AS 'Manager'
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID