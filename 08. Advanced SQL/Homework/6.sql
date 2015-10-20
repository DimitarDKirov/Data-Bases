--6. Write a SQL query to find the number of employees in the "Sales" department.

USE TelerikAcademy

SELECT COUNT(*)
FROM Employees empl
INNER JOIN Departments dep
ON dep.DepartmentID = empl.DepartmentID
WHERE dep.Name = 'Sales'