--9. Write a SQL query to find all departments and the average salary for each of them.

USE TelerikAcademy

SELECT dep.Name, AVG(empl.Salary) AS 'Average Salary'
FROM Employees empl
INNER JOIN Departments dep
ON empl.DepartmentID = dep.DepartmentID
GROUP BY dep.Name
