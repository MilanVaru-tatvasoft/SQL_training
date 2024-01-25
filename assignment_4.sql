
select * from customers;
select * from Categories;
select * from Employees;
select * from "Order Details";
select * from Orders;
select * from Products;
select * from Suppliers;


--------------ASSIGNMENT 4---------
	  

----1. Create a stored procedure in the Northwind database that will calculate the average value of Freight for a specified customer.Then, a business 
---		rule will be added that will be triggered before every Update and Insert command in the Orders controller,and will use the stored procedure to
---		verify that the Freight does not exceed the average freight. If it does, a message will be displayed and the command will be cancelled.
--->	
			


--CREATE PROC spAvgFreight		ALTER PROC spAvgFreight		@customer_id nchar(5)		AS		BEGIN			DECLARE @AVG_FREIGHT MONEY;			SELECT 				@AVG_FREIGHT = AVG(Freight)			FROM 				[Orders]			WHERE 				CustomerID = @customer_id			GROUP BY				CustomerID;			PRINT @AVG_FREIGHT;			RETURN @AVG_FREIGHT;		END;		--run--		execute spAvgFreight "VINET"		--trigger--		CREATE TRIGGER FreightTrigger		--ALTER TRIGGER FreightTrigger		ON [Orders]			FOR INSERT ,UPDATE		AS		BEGIN			DECLARE @AVG_Freight MONEY;			DECLARE @Current_Freight MONEY;			DECLARE @Customer_id nchar(5);				SELECT @Current_Freight = Freight FROM inserted;			SELECT @Customer_id = CustomerID FROM inserted;			Execute @AVG_Freight = spAvgFreight @Customer_id;			IF @AVG_Freight < @Current_Freight			BEGIN				RAISERROR('above value.', 16, 1);				ROLLBACK TRANSACTION;			END		END	--	run--		UPDATE [Orders] SET Freight = 9 where OrderID = 10248;




----2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Employee Sales by Country
--->
		
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


		
		execute spGetEmployeeSalesByCountry;
		
----3. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Sales by Year
--->
		
		
		CREATE PROCEDURE GetSalesByYear
		AS
		BEGIN
			SELECT YEAR(OrderDate) AS SalesYear,
				   SUM(Freight) AS TotalSales
			FROM [Orders]
			GROUP BY YEAR(OrderDate)
		END;


		
		execute GetSalesByYear;

		
----4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Sales By Cate ry
--->
		
			CREATE PROCEDURE spGetSalesByCategory
			AS
			BEGIN
				SELECT c.CategoryName,
					   SUM(od.Quantity * p.UnitPrice) AS TotalSales
				FROM [Order Details] od
				JOIN Products p ON od.ProductID = p.ProductID
				JOIN Categories c ON p.CategoryID = c.CategoryID
				GROUP BY c.CategoryName
			END;


		
		execute spGetSalesByCategory;

----5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Ten Most Expensive Products
--->
		 
		 
		 ---stored procedure---

		create procedure "Ten Most Expensive Products" AS
		SET ROWCOUNT 10
		SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
		FROM Products
		ORDER BY Products.UnitPrice DESC

		 execute "Ten Most Expensive Products"

----6. write a SQL query to Create Stored procedure in the Northwind database to insert 
---		Customer Order Details 
--->
		DECLARE @OrderID int = 102675;
		DECLARE @ProductID int = 999999; -- Replace with an existing ProductID
		DECLARE @UnitPrice money = 75.00;
		DECLARE @Quantity smallint = 15;
		DECLARE @Discount real = 0.2;

		-- Call the stored procedure to insert the row
		EXEC InsertCustomerOrderDetails
 
			@OrderID,
			@ProductID,
			@UnitPrice,
			@Quantity,
			@Discount;

			
		--to show output
		select * from "Order Details" where OrderID = 102675;

----7. write a SQL query to Create Stored procedure in the Northwind database to update 
---		Customer Order Details
--->
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

				--to show output
			select * from "Order Details" where OrderID = 10248;