--1. Write down SQL order of execution.
   First FROM -choose to get the database, then WHERE -filter the database after that GROUP BY and HAVING keywords are 
aggregate the database, last SELECT - select the database and ORDERBY- for sort the data.Limit the data using TOP

--2.Create a query to Select all data from the Employees table.
select * from Employees

--3.Create a query to display unique job title codes from the EMPLOYEES table.
select distinct(title) from employees

--4.Create a query to display the employee Id, first name, job, Joining Date and Country of employees hired
--between February 20, 2017, and May 1, 2018. Order the query in ascending order by employee Id
--Note: Joining Date should in YYYY-MM-DD format. Ex: 2019-01-01
--select convert(date,getdate())
select employeeid,firstname,title,hiredate,country from employees
where hiredate between '2017-02-20' and '2018-05-01'

--5. Display the last name and hire date of every employee who was hired in 1994
select LastName,hiredate from Employees
where year(hiredate) = '1994' 
--(or)
select LastName,hiredate from Employees
where hiredate
like '%1994%'

--6. Create a query to display the Product id, Name separated by a comma named as Product-Details, 
--Price for Products with minimum In-stock of 10 and are in category 3, 5,6,8.
select cast(productid as varchar)+','+Productname as Product_Details from [Products]
where unitsinstock <10 and (CategoryID = 3 or CategoryID = 5 or CategoryID = 6 or CategoryID = 8) 
 --(or)
 select cast(productid as varchar)+','+Productname as Product_Details from [Products]
where unitsinstock <10 and CategoryID in(3,5,6,8)

--7. Display the Id, company & contact name of all suppliers whose title is Representative.
select * from suppliers
select suppliers.supplierId, suppliers.companyname, suppliers.contactname from suppliers
inner join employees
on employees.EmployeeID = suppliers.supplierId
where title = 'Sales Representative'

--8. Write a query to insert a new row in Shippers table using below value.
--Id: 5, CompanyName: Gurudavega, Phone:123-456-789
--Just write down the code don’t insert in DB.
select * from Shippers
insert into shippers values (5,'Gurudavega','123-456-789')

--9. Write a query to update the region field to YTU in Customers table where it doesn’t have any value.
select *,REGION,
case when region = null  then 'YTU' 
end as Region
from customers
   select * from customers

--10. Write a query to display all the customer details whose custid is 
--starting with A, C, D and city is Madrid or London
select * from customers
where ((customerid like('A%') or  customerid like('c%') or customerid like('d%')) and ((city = 'madrid') or (city ='london'))) 

--11. Write a query to display the current date. Label the column Date_today
select getdate () as date_today

--12. Display the total no of records in fact_sales table.
select count(customer_id) as total_no_of_records from fact_sales 

--13. Display the total sales amount in fact_sales table.
--select * from fact_sales
select round(sum(Total_Amount),4) as total from fact_sales

--14. Write a query to display the Product name, category number, and category name 
	--for all Products whose order unit is more than 10.
	select * from products
	select * from categories
	select products.productname , products.CategoryID,Categories.CategoryName from products
	inner join Categories
	on Categories.CategoryID = products.CategoryID
	where UnitsInStock >10 

--15. Display the below column for all employees
--Column Names: employee name, manager name, manager salary]
select * from emp
select e.ename as manager_name,m.ename,e.sal as manager_sal from emp e
join emp m 
on e.empno = m.mgr
order by e.sal

--16.Display the depart name, total_salary (Use EMP, DEPT table).
--select * from emp
--select * from dept
  select dept.dname,emp.sal
  from dept
  join emp
  on emp.empno= dept.deptid

--17. Display the department number, department name, and the number of employees in each department 
--(Use EMP, DEPT table).
select * from emp
select * from dept
select emp.dept,dept.dname,count(*)
from emp
left join dept
on emp.dept = dept.deptid
group by dept,dname
order by dept 


--19. Write a query to find duplicates in EMP table.
select  ename,job,count(dept) as count_of_duplicate
from emp
group by ename,job
having count(dept)>1 
order by job 

--21.Write a query to display the total sales along with order_id and order_date (Use FACT_SALES table)
  select * from fact_sales
  select count(customer_id),Order_ID,OrderDate_ID 
  from fact_sales
  group by order_id,OrderDate_ID

 --22.Write a query to display product name, category name which doesn’t make any sale on March 10, 2018.
  select ProductName,CategoryName from [dbo].[Alphabetical list of products]
  select * from [dbo].[Orders]
  select ProductName,CategoryName from [dbo].[Product Sales for 1997]

--23. Write a query to display customer name who contributed much in total sales. 
	select * from [dbo].[Invoices]
	select top 1 customername,extendedPrice as total_sales from Invoices
	order by ExtendedPrice desc

--18. Write a query to display the top three earners in the EMP table. Display their names and salaries
  --(without using top keyword)
  
	select Ename,max(sal)as SALARY from emp 
	group by ename,sal
	order by sal desc
	 set rowcount 3

--(or) for 3rd highest salary

	select max(sal) from emp 
	where sal <(select max(sal) from emp
	where sal < (select max(sal) from emp))

	