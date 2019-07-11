----with parameter----
alter PROCEDURE spqq @id int,@name nvarchar(40),@dest nvarchar(40),@did int,@mid int
AS
begin

/*create table dry
(
empid int,
empname nvarchar(40),
destination nvarchar(40),
departId int,
mgr_id int
)*/
Insert into dry
SELECT @id ,@name,@dest,@did,@mid  
end
SELECT * FROM dry

exec spqq 1005,'bob','tester',105,5

----without parameter----
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




create PROCEDURE spdd @id int
AS
begin

create table wet
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
end

SELECT *, ROW_NUMBER() OVER(ORDER BY EmpName) AS num  
FROM wet

exec spdd @id 