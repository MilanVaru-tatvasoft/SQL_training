select * from employee;
select * from department;

--- ASSIGNMENT 3----

----1. write a SQL query to find Employees who have the biggest salary in their Department
--->
		select e.emp_id, e.emp_name, e.salary ,d.dept_name 
		from employee as e join department d on e.dept_id = d.dept_id
		where  e.salary 
		in (select max(salary) as max_salary from employee group by dept_id);

----2. write a SQL query to find Departments that have less than 3 people in it
--->
		select d.dept_id, d.dept_name, count(emp_id) as "no of emplyoyee" 
		from employee e join department d on e.dept_id = d.dept_id
		group by d.dept_id, d.dept_name
		having count(emp_id) < 3 
		order by d.dept_id;
	
----3. write a SQL query to find All Department along with the number of people there
--->
		select d.dept_id, d.dept_name, count(emp_id) as "no of emplyoyee" 
		from employee e join department d on e.dept_id = d.dept_id
		group by d.dept_id, d.dept_name
		order by d.dept_id;

----4. write a SQL query to find All Department along with the total salary there
--->
		
		select d.dept_id, d.dept_name, sum(e.salary) as "total salary", count(emp_id) as "no of emplyoyee" 
		from employee e join department d on e.dept_id = d.dept_id
		group by d.dept_id, d.dept_name
		order by d.dept_id;
		