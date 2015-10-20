--12. Write a SQL query to find all employees along with their managers. For employees that do not have manager display the value "(no manager)".

USE TelerikAcademy

SELECT empl.FirstName + ' '+ empl.LastName AS 'Employee name',
		ISNULL(man.FirstName + ' ' + man.LastName, 'no manager') AS 'Manager Name'
FROM Employees empl
LEFT JOIN Employees man
ON empl.ManagerID=man.EmployeeID
