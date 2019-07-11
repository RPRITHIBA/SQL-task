CREATE TABLE Employ_prithi
(
Empid INT,
EmpName VARCHAR(150),
);
--add columns
SELECT * FROM Employ_prithi
ALTER TABLE Employ_prithi ADD EmpDep VARCHAR(50)
ALTER TABLE Employ_prithi ADD EmpSalary MONEY
ALTER TABLE Employ_prithi ADD Managerid VARCHAR(50)
ALTER TABLE Employ_prithi ADD Deptid INT
---dept table formation
CREATE TABLE Dept_prithi
(
Deptid INT,
Deptname VARCHAR(150),
);
--insert the details for dept
SELECT * FROM Dept_prithi
INSERT INTO Dept_prithi VALUES(501,'developer')
SELECT * FROM Dept_prithi
INSERT INTO Dept_prithi
SELECT 502,'marketing' UNION ALL
SELECT 503,'trainer' 
--update the length of string
ALTER TABLE Employ_prithi ALTER COLUMN EmpName VARCHAR(200) 
---insert the details for employ
SELECT * FROM Employ_prithi 
INSERT INTO Employ_prithi VALUES(101,'ABI','developer',80000,1001,501)
SELECT * FROM Employ_prithi
INSERT INTO Employ_prithi
SELECT 102,'BOB','marketing',90000,1002,502 UNION ALL
SELECT 103,'CHARU','trainer',85000,1003,503 UNION ALL
SELECT 104,'DEV','hr',100000,1004,504 UNION ALL
SELECT 105,'GIRI','testing',95000,1005
--update the salary
SELECT * FROM Employ_prithi
UPDATE Employ_prithi SET EmpSalary=96000 WHERE Empid=105
--delete 2 employ
SELECT * FROM Employ_prithi
DELETE FROM Employ_prithi WHERE Empid BETWEEN 102 AND 103
INSERT INTO Employ_prithi 
SELECT 104,'Joy','tester',81000,1005,505
--inner join
SELECT  *
FROM Employ_prithi A
RIGHT JOIN Dept_prithi B
ON A.EmpDep = B.Deptname


SELECT * FROM Employ_prithi WHERE Managerid= ' ' 
SELECT * FROM Dept_prithi WHERE Deptname is NOT NULL

-----------------------------------------------------------------------------
CREATE TABLE dbo.Emp_prith
(
Empid INT,
EmpName VARCHAR(150),
)
SELECT * FROM Emp_prith 
INSERT INTO Emp_prith VALUES(101,'ABI,developer,trainer')
SELECT * FROM Emp_prith
INSERT INTO Emp_prith
SELECT 102,'BOB,marketing,trainer'UNION ALL
SELECT 103,'CHARU,analyser,trainer' UNION ALL
SELECT 104,'DEV,hr,trainer' UNION ALL
SELECT 105,'GIRI,testing,trainer'

-- length of the string
SELECT DATALENGTH (' softcrylic')
DECLARE @str VARCHAR (100)
SET @str = 'softcrylic'
SELECT SUBSTRING (@str,2,5)
SELECT SUBSTRING(EmpName,2,6) FROM Emp_prith
SELECT LEFT(EmpName,7) FROM Emp_prith
SELECT RIGHT(EmpName,10) FROM Emp_prith
SELECT * FROM Emp_prith
-------------------------------------------------------------------------------
CREATE TABLE dbo.q1_prithiba
(
prod_name VARCHAR(150),
supp_name VARCHAR(150),
)
SELECT * FROM q1_prithiba
INSERT INTO  q1_prithiba
SELECT '5star','AMMU' UNION ALL
SELECT 'munch','BOB' UNION ALL
SELECT 'dairy','CHARU' UNION ALL
SELECT 'milkybar','DEV' UNION ALL
SELECT 'cofeebite','GIRI'
SELECT * FROM q1_prithiba
---------------------------------------------------------------------------------

Create procedure de
as 
begin
create table #tem1
(
empid int,
empname nvarchar(40),
destination nvarchar(40),
departId int,
mgr_id int,
)
create table #tem2
(
deptid int,
deptname nvarchar(40),
)
INSERT INTO  #tem1
SELECT 1001,'AMMU','developer',101,4 UNION ALL
SELECT 1002,'BOB','testing',102,5 UNION ALL
SELECT 1003,'CHARU','hr',103,3 UNION ALL
SELECT 1004,'DEV','manager',104,2 UNION ALL
SELECT 1005,'GIRI','ceo',105,1
SELECT * FROM #tem1

INSERT INTO  #tem2
SELECT 101,'developer' UNION ALL
SELECT 102,'testing' UNION ALL
SELECT 103,'hr' UNION ALL
SELECT 104,'manager' UNION ALL
SELECT 105,'ceo'
SELECT * FROM #tem2

end

exec de
---------------------------------------------------------------------------
--with parameter--

CREATE PROCEDURE de1 @name nvarchar(40)
AS
SELECT * FROM tem3 WHERE empname = @name;


alter procedure spmname @mid int
as begin
/*create table nam(empid int,empname varchar(30),dept varchar(30),maid int)
insert into  nam 
select 1,'ammu','sales',2 union all
select 2,'bob','cpo',1 union all
select 3,'chandru','manager',5 union all
select 4,'dev','tester',3 union all
select 5,'illa','develop',4 */


SELECT m.empname,e.maid,e.empname as managername
FROM   nam e
JOIN   nam m on e.maid = m.empid where e.maid=@mid

select*from nam
end
select*from nam
exec spmname 2
exec spmname 4
-----------------------------------------------------------------------------
set rowcount 16
	select Ename,max(sal)as SALARY from emp 
	group by ename,sal
	order by sal desc
	-----------------------------------------------------------------------------
	----duplicate data

select customer_ID,Employee_id,freight,count(*) as count_of_duplicate
from fact_sales
group by customer_ID,Employee_id,freight
having count(*)>1 
order by freight desc


SELECT customer_ID,Employee_id,freight
FROM fact_sales
WHERE customer_id IN (
    SELECT customer_id
    FROM fact_sales
    GROUP BY customer_id
    HAVING COUNT(Employee_id) > 1 
)order by freight desc
------------------------------------------------------------------------------------

alter procedure spddd @mid int
as 
begin
create table beam
(
empid int,
empname nvarchar(40),
destination nvarchar(40),
departId int,
mgr_id int)

INSERT INTO  beam
SELECT 1001,'AMMU','developer',101,4 UNION ALL
SELECT 1002,'BOB','testing',102,5 UNION ALL
SELECT 1003,'CHARU','hr',103,3 UNION ALL
SELECT 1004,'DEV','manager',104,2 UNION ALL
SELECT 1005,'GIRI','ceo',105,1
SELECT * FROM beam

end

SELECT * FROM beam

SELECT * FROM te
SELECT e.ename as mgrname, m.ename ,e.mid,e.title
FROM   te e
left JOIN   te m on e.mid = m.eid where e.mid=@eid

select*from emp_s2
end

--create table team (mname nvarchar(40))
--create TABLE tea
--ADD Ename nvarchar(40)
/*select empid,empname,destination,mgr_id from team
          (case 
		       when mgr_id = row_number then empname 
          end as mname )
		  from team*/
		  --SELECT * FROM [dbo].[EMP]
--SELECT  empname,destination,departId,mgr_id,ename
--FROM team 
--WHERE mgr_id in (SELECT mgr_id FROM team WHere mgr_id = (SELECT *, ROW_NUMBER() OVER(ORDER BY EmpName) AS num  
--FROM team ) then empname 
--end as ename
select a.empid,a.empname ,a.destination,b.mgr_id
FROM tea a, tea b
LEFT JOIN empname ON  mname where b.mgr_id =@mid


SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.CustomerName*/
  --------------------
  
  alter PROCEDURE spdd @id int
AS
begin

/*create table wet
(
empid int,
empname nvarchar(40),
destination nvarchar(40),
salary int,
mgr_id int
)
Insert into wet

SELECT 1001,'AMMU','developer',12890,4 UNION ALL
SELECT 1002,'BOB','testing',16000,5 UNION ALL
SELECT 1003,'CHARU','hr',16758,3 UNION ALL
SELECT 1004,'DEV','manager',9896,2 UNION ALL
SELECT 1005,'GIRI','ceo',20000,1
SELECT * FROM wet
end*/
end
exec spdd(SELECT *, ROW_NUMBER() OVER(ORDER BY EmpName) AS num  
FROM wet) 

exec spdd 4