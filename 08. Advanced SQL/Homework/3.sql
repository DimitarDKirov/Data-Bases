-- 3.Write a SQL query to find the full name, salary and department of the employees that take the minimal salary in their department.
--Use a nested SELECT statement.



USE TelerikAcademy

SELECT emp.FirstName +' '+ emp.LastName AS 'Full Name', emp.Salary,  dep.Name
FROM Employees emp
INNER JOIN Departments dep
ON emp.DepartmentID = dep.DepartmentID
WHERE emp.Salary = 
	(SELECT MIN(e.Salary) FROM Employees e
	WHERE e.DepartmentID = emp.DepartmentID)
