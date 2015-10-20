--25. Write a SQL query to display the average employee salary by department and job title.

USE TelerikAcademy
GO

SELECT	AVG(empl.Salary) AS 'Average Salary',
		dep.Name AS 'Department name',
		empl.JobTitle
FROM Employees empl
INNER JOIN Departments dep
ON empl.DepartmentID = dep.DepartmentID
GROUP BY dep.Name, empl.JobTitle
