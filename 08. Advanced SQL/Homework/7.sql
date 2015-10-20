--7. Write a SQL query to find the number of all employees that have manager.

USE TelerikAcademy

SELECT COUNT(*)
FROM Employees
WHERE ManagerID IS NOT NULL

GO

SELECT COUNT(empl.EmployeeID)
FROM Employees empl
WHERE EXISTS(
	SELECT EmployeeID
	FROM Employees man
	WHERE empl.ManagerID = man.EmployeeID
	)