--10. Write a SQL query to find the count of all employees in each department and for each town.

USE TelerikAcademy

SELECT dept.Name AS 'Department', town.Name AS 'Town',COUNT(empl.EmployeeID) AS 'Employee count'
FROM Employees empl
INNER JOIN Departments dept
ON dept.DepartmentID = empl.DepartmentID
INNER JOIN Addresses adr
ON empl.AddressID = adr.AddressID
INNER JOIN Towns town
ON town.TownID = adr.TownID
GROUP BY dept.Name, town.Name