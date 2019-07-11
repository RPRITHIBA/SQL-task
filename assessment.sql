------1 Query-------
--Select*from Products
--Select*from Suppliers

select P.ProductName,S.CompanyName
from Products P
inner join Suppliers S
on P.SupplierID=S.SupplierID


--------2 Query---
select P.ProductName,S.CompanyName,P.CategoryID
from Products P
inner join Suppliers S
on P.SupplierID=S.SupplierID


------3 Query------------
select P.ProductID,S.ContactName,P.ProductName,S.CompanyName,P.CategoryID
from Products P
inner join Suppliers S
on P.SupplierID=S.SupplierID


-----------4 Query------------------
--Select*from [dbo].[Orders]
--Select*from [dbo].[Suppliers]
select O.OrderID,S.ContactName, O.ShipCountry ,S.CompanyName
from Orders O
inner join Suppliers S
on O.ShipCountry=S.Country where ShipCountry='Brazil'



--------5 Query--------

CREATE TABLE dbo.datas
(statues VARCHAR (30),
orderid int,
)
SELECT * FROM [dbo].[datas]
SELECT OrderID, OrderDate, RequiredDate, ShippedDate from Invoices
--from Invoices i
--INNER JOIN datas d
--on d.orderid = i.OrderID 
SELECT dateadd(DD,7,GETdate()) 

select * from [dbo].[Order Details]

select * from [dbo].[Invoices]

select * from [dbo].[Alphabetical list of products]

Select *from [dbo].[Territories]
select * from [dbo].[Employees]
SELECT LEFT(city,1)+ LEFT(country,1) from Suppliers

SELECT Datediff(yy,orderdate,getdate()) from Invoices
SELECT 
------------------------------------------------------------------------------------
-----1st Query-----
--SELECT * FROM [dbo].[Products]
--SELECT * FROM [dbo].[Suppliers]

SELECT P.ProductName,S.CompanyName
FROM Products P
INNER JOIN Suppliers S
ON P.SupplierID = S.SupplierID


-----2nd Query-----
--SELECT * FROM [dbo].[Products]
--SELECT * FROM [dbo].[Suppliers]

SELECT P.ProductName,S.CompanyName,P.CategoryID
FROM Products P
INNER JOIN Suppliers S
ON P.SupplierID = S.SupplierID

-----3rd Query ------------
--SELECT * FROM [dbo].[Products]
--SELECT * FROM [dbo].[Shippers]

--SELECT P.ProductID,S.ContactName,P.ProductName,S.CompanyName,P.CategoryID
--FROM Products P
--INNER JOIN Suppliers S
--ON P.SupplierID = S.SupplierID

DECLARE @A VARCHAR(1000)
SELECT @A=COUNT(PRODUCTID) FROM [Order Details Extended]
GROUP BY OrderID  
SELECT O.OrderID,C.ContactName,@A AS PRODUCTS
FROM Customers C
JOIN Orders O  
ON O.CustomerID = C.CustomerID  JOIN [Order Details Extended] E
ON O.OrderID = E.OrderID 


-----4th Query----------
--SELECT * FROM [dbo].[Orders]
--SELECT * FROM [dbo].[Suppliers]

SELECT O.OrderID,S.ContactName, O.ShipCountry ,S.CompanyName
FROM Orders O
INNER JOIN Suppliers S
ON O.ShipCountry=S.Country where ShipCountry='Brazil'

------5th Query-------
--SELECT * FROM [dbo].[Suppliers]
--SELECT * FROM [dbo].[Invoices]
--SELECT * FROM [dbo].[Sales Totals by Amount]

SELECT I.OrderID,I.salesperson ,S.ContactName,T.saleamount
FROM Invoices I
INNER JOIN Suppliers S
ON S.Country=I.Country 
INNER JOIN [Sales Totals by Amount] T 
ON I.OrderID=T.OrderID

-------6th Query--------
--SELECT * FROM [dbo].[Invoices]

SELECT ProductName,Salesperson 
FROM Invoices

------7th Query-------
--SELECT * FROM [dbo].[Suppliers]
--SELECT * FROM [dbo].[Products]

SELECT p.ProductID,P.ProductName,s.*,CASE WHEN Region IS NULL 
                                          THEN LEFT(Country,1) + LEFT(City,1)
                                          ELSE Reg	                                      
									  END AS Reg
FROM Suppliers s
JOIN Products p
ON P.SupplierID = S.SupplierID

------8th Query-------
--SELECT * FROM [dbo].[Products]
--SELECT * FROM [dbo].[Suppliers]

SELECT S.CompanyName,S.ContactName,S.City,P.UnitPrice
FROM Products P
INNER JOIN Suppliers S
ON P.supplierId=S.supplierId

-----9th Query------
--Select * from [dbo].Customers
--Select * from [dbo].[Invoices]
--Select * from [dbo].[Territories]
--Select * from [dbo].[EmployeeTerritories]
--Select * from [dbo].[Employees]
--Select * from [dbo].[Orders]

SELECT I.customerID,I.ShipName,I.ShipCity,r.TerritoryDescription,I.UnitPrice,I.Discount,o.shipvia, LEFT(T.territoryId,4)
FROM Invoices I
INNER JOIN Employees e
ON I.city = e.City
INNER JOIN EmployeeTerritories T
ON e.EmployeeID=T.EmployeeID
INNER JOIN Territories r
ON LEFT(T.TerritoryID,4) = LEFT(r.TerritoryID,4)
INNER JOIN orders o
ON E.EmployeeId=o.shipvia

------10th Query-----
--SELECT * FROM[dbo].[Invoices]

SELECT Orderid, customerid, UnitPrice,Quantity,Discount 
FROM Invoices WHERE Discount>0

------11th Query-----
--SELECT * FROM [dbo].[Categories]
--SELECT * FROM [dbo].[Products]

--SELECT c.categoryid,c.categoryName,c.Description,p.ProductName,p.SupplierID,p.UnitPrice
--FROM Categories c
--INNER JOIN Products p
--ON p.CategoryID = c.CategoryID


;WITH CTE
AS
(
SELECT categoryid,CAST(description as varchar(100)) AS newdescription 
FROM Categories
),
CTE2
AS
(
SELECT categoryid,REPLACE(newdescription,' and ',',') AS des2
FROM cte
),
CTE3
AS
(
SELECT *,LEN(des2)-LEN(REPLACE(des2,',','')) AS count 
FROM CTE2
)

SELECT c.categoryid,categoryname,productname,s.SupplierID,unitprice,Description
FROM Products p  
INNER JOIN suppliers s 
ON p.SupplierID = s.SupplierID 
INNER JOIN Categories c 
ON c.CategoryID = p.CategoryID
INNER JOIN cte3 ct 
ON ct.CategoryID = c.CategoryID
 where count<2

-----12th Query-----
--SELECT * FROM [dbo].[Suppliers] 

SELECT contactname FROM Suppliers
SELECT SUBSTRING (LEFT(contactname,CHARINDEX(' ',contactname)-1),1,1)+ SUBSTRING (RIGHT(contactname,CHARINDEX(' ',REVERSE(contactname))-1),1,1)chname
FROM Suppliers



------13th Query -----
--SELECT * FROM [dbo].[Orders]

SELECT DATEDIFF(DD,orderDate,shippedDate)AS DeliveryDay 
FROM orders

------14th Query------
--SELECT * FROM [dbo].[Orders] 

SELECT orderid ,CASE
                     WHEN DateDiff(DD,orderDate,shippedDate)<4 THEN 'Delivered Early'
                     WHEN DateDiff(DD,orderDate,shippedDate)>=7 THEN 'Delayed'
                     WHEN DateDiff(DD,orderDate,shippedDate)<7 THEN 'On-time'
                END Deliverystatus 
FROM orders

-------15th Query-------
--SELECT * FROM [dbo].[Employees]

SELECT CONCAT(firstName,Lastname)AS Employeename,DATEADD(mm,6,HireDate) AS Appraisaldate 
FROM employees
----------------------------------------------------------------------------------------------

------1st Query-----

--SELECT * FROM [dbo].EMP
SELECT MGR,sal 
FROM EMP WHERE MGR IS NOT NULL AND sal>6000 
ORDER BY sal DESC 

-----2nd Query------

--SELECT * FROM [dbo].[DEPT]
--SELECT * FROM [dbo].EMP
SELECT d.DNAME,loc,COUNT(ENAME) AS No_of_employee,round (AVG (SAL),2) AS AVGSAL 
FROM Emp e join Dept d 
ON e.Dept=d.Deptno GROUP BY D.DNAME,LOC

-----3rd Query-----

--SELECT * FROM [dbo].[DEPT]
--SELECT * FROM [dbo].EMP
SELECT d.DEPTNO, d.DNAME,AVG(e.SAL) OVER(partition by d.DEPTNO)avgsalary, COUNT(*)
OVER (partition by DEPTNO ORDER BY DEPTNO)AS emp_count ,e.ENAME,e.SAL, e.JOB
FROM emp e join dept d 
ON e.DEPT=d.DEPTNO
GROUP BY d.DEPTNO,d.DNAME,e.ENAME,e.JOB,e.EMPNO,SAL 
ORDER BY d.DEPTNO;

-----4th Query-----

--SELECT * FROM [dbo].[DEPT]
--SELECT * FROM [dbo].EMP
SELECT MIN(lowest) lowest,MAX(avgsal) highestavg 
FROM (
SELECT MIN(sal) lowest,AVG(sal) AS avgsal 
FROM emp 
GROUP BY dept
) AS query1
SELECT dept,MIN(sal) lowest ,AVG(sal) avgsalary 
FROM emp GROUP BY DEPT

--------5th Query------

--SELECT * FROM DEPT
SELECT * FROM DEPT WHERE DNAME!='sales' 


-------6th Query-----
--a
;with
cte
AS
(
SELECT Deptno,dname,count(*) AS no_of_emp
FROM DEPT d inner join emp e
ON d.DEPTNO = e.DEPT
GROUP BY DEPTNO,DNAME
)
SELECT * FROM cte WHERE no_of_emp <3
----b
SELECT TOP 1 Deptno,dname,count(*) AS no_of_emp
FROM DEPT d inner join emp e
ON d.DEPTNO=e.DEPT
GROUP BY DEPTNO,DNAME 
ORDER BY no_of_emp desc
---c
SELECT TOP 1 Deptno,dname,count(*) AS no_of_emp
FROM  DEPT d inner join emp e
ON d.DEPTNO=e.DEPT
GROUP BY Deptno,Dname
ORDER BY no_of_emp

------7th Query-----

--SELECT * from EMP
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB;

----8th Query----

--SELECT * FROM EMP
SELECT count (mgr)AS No_of_managers 
FROM EMP WHERE mgr=9 

-------9th Query----

--SELECT * FROM EMP
SELECT MAX(sal)-MIN(sal) AS Difference 
FROM EMP

------10th Query-----

--SELECT * FROM EMP
SELECT MAX(sal)AS Maximum,MIN(sal) AS Minimum,SUM(sal)AS Sum ,FLOOR(AVG(sal)) AS Average 
FROM EMP

--------------------------------------------------------------------------------------------

----1st Query-----

--SELECT * FROM [dbo].[EMP]
SELECT  ENAME,HIREDATE 
FROM EMP 
WHERE dept in (SELECT DEPT FROM emp WHERE ename = 'adams' ) AND NOT Ename = 'adams'

----2nd Query----

SELECT * FROM [dbo].[EMP]
SELECT empno,ename,sal,job
FROM emp
WHERE 
(
sal >
  (
    SELECT avg(sal) 
    FROM emp   
  ))
   ORDER BY sal 

----3rd Query----

--SELECT * FROM EMP
--SELECT * FROM EMPLOYEE
SELECT E.EmployeeID,E.FirstName,E.LastName 
FROM EMP  p
 INNER JOIN employees e 
 on p.EMPNO = E.EmployeeID WHERE exists
(SELECT empno FROM emp 
  INNER JOIN DEPT 
  ON Dept.DEPTNO=p.DEPT 
 GROUP BY dept.DEPTNO,empno) 
  AND e.LastName like '%a%' OR e.LastName like '%u%'

----4th QUery-----

--SELECT * FROM dept
SELECT ENAME,DEPT,JOB 
FROM EMP E 
INNER JOIN DEPT D
ON D.DEPTNO=E.DEPT WHERE
EXISTS(SELECT ENAME FROM EMP WHERE D.LOC='ATLANTA')

----5th Query----

--SELECT * FROM EMP
SELECT ename,sal
FROM emp
WHERE 
(
  MGR IN 
  (
    SELECT EMPNO
    FROM emp 
    where ENAME = 'JACKSON'
)
)

----6th Query----

--SELECT * FROM dept
--SELECT * FROM EMP
SELECT D.DEPTNO,D.DNAME,E.JOB 
FROM DEPT D
INNER JOIN EMP E 
ON E.DEPT=D.DEPTNO 
WHERE D.DNAME='ACCOUNTING'

----7th Query----

--SELECT * FROM emp
--SELECT * FROM employees
SELECT E.EmployeeID,E.FirstName,E.LastName,e.Salary 
FROM EMP  
INNER JOIN employees e 
ON EMP.EMPNO=E.EmployeeID WHERE exists
(SELECT empno FROM emp 
INNER JOIN DEPT 
ON Dept.DEPTNO=EMP.DEPT 
GROUP BY dept.DEPTNO,empno) 
AND e.LastName like '%u%' 
OR e.LastName like '%a%' 
AND e.Salary> ANY(SELECT AVG(Salary) 
FROM EMPLOYEES)


----8th Query----

--SELECT * FROM EMP
SELECT  ename,sal 
FROM emp 
WHERE sal in (SELECT distinct top 3 sal FROM emp ORDER BY sal DESC)

----9th Query----

--SELECT * FROM emp
SELECT  ename,empno,sal 
FROM emp 
WHERE comm in (SELECT  comm from emp where comm is not null)

----10th Query----

--SELECT * FROM Emp
--SELECT * FROM Employees
SELECT e.SAL,ems.LastName,e.HIREDATE FROM emp e
FULL JOIN employees ems 
ON ems.EmployeeID=e.EMPNO 
WHERE Sal IN (
    SELECT Sal
    FROM emp
    GROUP BY Sal,COMM
    HAVING COUNT(*) > 1
)

-------------------------------------------------------------------------------