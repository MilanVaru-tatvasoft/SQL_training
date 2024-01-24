
CREATE PROCEDURE spGetEmployeeSalesByCountry
AS
BEGIN
    SELECT e.EmployeeID,
           e.FirstName + ' ' + e.LastName AS EmployeeName,
           c.Country,
           SUM(o.Freight) AS TotalSales
    FROM Employees e
    JOIN [Orders] o ON e.EmployeeID = o.EmployeeID
    JOIN Customers c ON o.CustomerID = c.CustomerID
    GROUP BY e.EmployeeID, e.FirstName, e.LastName, c.Country
END;

