
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
		execute CalculateAverageFreight;

		UPDATE Orders SET ShipCountry = 'Germany' where OrderID = 10259;

----2. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Employee Sales by Country
--->
		execute spGetEmployeeSalesByCountry;
		
----3. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Sales by Year
--->
		execute GetSalesByYear;

		
----4. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Sales By Cate ry
--->
		execute GetSalesByCategory;

----5. write a SQL query to Create Stored procedure in the Northwind database to retrieve 
---		Ten Most Expensive Products
--->
----6. write a SQL query to Create Stored procedure in the Northwind database to insert 
---		Customer Order Details 
--->
		
----7. write a SQL query to Create Stored procedure in the Northwind database to update 
---		Customer Order Details
--->	
		