--8. Write a SQL query to find the number of all employees that have no manager.

USE TelerikAcademy

SELECT COUNT(*)
FROM Employees
WHERE ManagerID IS NULL

GO

SELECT COUNT(empl.EmployeeID)
FROM Employees empl
WHERE NOT EXISTS(
	SELECT EmployeeID
	FROM Employees man
	WHERE empl.ManagerID = man.EmployeeID
	)