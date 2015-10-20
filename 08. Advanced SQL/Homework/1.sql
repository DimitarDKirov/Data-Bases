--1. Write a SQL query to find the names and salaries of the employees that take the minimal salary in the company.
	 --Use a nested SELECT statement.


USE TelerikAcademy

SELECT emp.FirstName, emp.LastName, emp.Salary
FROM Employees emp
WHERE emp.Salary = 
	(SELECT MIN(E.Salary) FROM Employees e)