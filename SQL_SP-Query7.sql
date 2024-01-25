CREATE PROCEDURE UpdateCustomerOrderDetails
    @OrderID int,
    @ProductID int,
	@UnitPrice money,
    @Quantity smallint,
    @Discount real
AS
BEGIN
    UPDATE [Order Details]
    SET Quantity = @Quantity,
        Discount = @Discount,
		UnitPrice= @UnitPrice
    WHERE OrderID = @OrderID AND ProductID = @ProductID
END;

-- Example 
DECLARE @OrderID int = 10248; 
DECLARE @ProductID int = 11; 
DECLARE @UnitPrice money = 60.00;
DECLARE @Quantity smallint = 18; 
DECLARE @Discount real = 0.15; 

-- Call the stored procedure to update the row
EXEC UpdateCustomerOrderDetails
    @OrderID,
    @ProductID,
    @UnitPrice,
    @Quantity,
    @Discount;



	select * from "Order Details" where OrderID = 10248;