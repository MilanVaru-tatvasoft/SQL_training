
CREATE PROCEDURE GetSalesByYear
AS
BEGIN
    SELECT YEAR(OrderDate) AS SalesYear,
           SUM(Freight) AS TotalSales
    FROM [Orders]
    GROUP BY YEAR(OrderDate)
END;

