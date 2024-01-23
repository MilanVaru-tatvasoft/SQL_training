select * from products;
/* Assignment 1*/

/* 1. Write a query to get a Product list (id, name, unit price) where current products cost less than $20. */

select ProductID, ProductName, UnitPrice from products where UnitPrice <20.0000;

/* 2. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25 
	a)Write a query to get Product list (name, unit hg) of above average price.
	b)Write a query to get Product list (name, unit price) of ten most expensive products  */

select ProductID, ProductName, UnitPrice from products where UnitPrice between 15.0000 and 25.0000;
select ProductName, UnitPrice from products where UnitPrice > (select avg(UnitPrice) from Products );
select top 10 ProductName, UnitPrice from products order by UnitPrice desc;

/* 3. Write a query to count current and discontinued products */
select Discontinued, Count(Discontinued) as Counts from Products group by Discontinued;

/* 4. Write a query to get Product list (name, units on order, units in stock) of stock is less	 than the quantity on order */

select ProductName, UnitsOnOrder, UnitsInStock from Products where UnitsInStock < UnitsOnOrder;




