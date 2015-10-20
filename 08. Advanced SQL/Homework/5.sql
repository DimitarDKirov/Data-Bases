--5. Write a SQL query to find the average salary in the "Sales" department.

USE TelerikAcademy

SELECT AVG(Salary) AS 'Average Salary'
FROM Employees empl
INNER JOIN Departments dep
ON dep.DepartmentID = empl.DepartmentID
WHERE dep.Name = 'Sales'