--11. Write a SQL query to find all managers that have exactly 5 employees. Display their first name and last name.

USE TelerikAcademy

SELECT man.FirstName, man.LastName
FROM Employees man
WHERE 5 =
	(SELECT COUNT(empl.ManagerID)
	FROM Employees empl
	WHERE empl.ManagerID = man.EmployeeID)