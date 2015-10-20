--26.  Write a SQL query to display the minimal employee salary by department and job title
-- along with the name of some of the employees that take it.

USE TelerikAcademy
GO

SELECT empl.FirstName + ' ' + empl.LastName AS 'Employee Name',
		empl.Salary,
		dep.Name AS 'Department',
		empl.JobTitle
FROM Employees empl
INNER JOIN Departments dep
ON empl.DepartmentID = dep.DepartmentID
WHERE empl.Salary IN
	(SELECT MIN(e.Salary)
	FROM Employees e
	WHERE e.DepartmentID = empl.DepartmentID
	GROUP BY e.DepartmentID, e.JobTitle
	)

