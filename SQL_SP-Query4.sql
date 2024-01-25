CREATE PROCEDURE GetSalesByCategory
AS
BEGIN
    SELECT c.CategoryName,
           SUM(od.Quantity * p.UnitPrice) AS TotalSales
    FROM [Order Details] od
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories c ON p.CategoryID = c.CategoryID
    GROUP BY c.CategoryName
END;

