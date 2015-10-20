--27.  Write a SQL query to display the town where maximal number of employees work.

USE TelerikAcademy
GO

SELECT Name
FROM Towns
WHERE TownID = 
	(SELECT TOP(1) addr.TownID
	FROM Employees empl
	INNER JOIN Addresses addr
	ON empl.AddressID = addr.AddressID
	GROUP BY addr.TownID
	ORDER BY COUNT(addr.TownID) DESC
	)