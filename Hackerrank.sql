select * from emp
select max(sal) from emp
where sal < (select max(sal) from emp)

select job from emp
where job not like 'a%' or job not like 'e%' or job not like 'i%' or job not like 'o%' or job  not like 'u%'

SELECT * FROM emp where empno % 2 = 0

select round(sum(lat_n),2),round(sum(long_w),2)  from station
select (sum(sal)) from emp


DECLARE @var int               -- Declare 
SELECT @var = 5                -- Initialization 
WHILE @var > 0                 -- condition 
BEGIN                          -- Begin 
PRINT replicate('* ', @var)    -- Print 
SET @var = @var - 1            -- decrement 
END     

DECLARE @a int                    
SELECT @a = 1                     
WHILE @a <= 5                    
BEGIN                              
PRINT replicate('* ', @a)        
SET @a = @a + 1                
END 


select Name from students
where marks>75 
order by right(name,3),id

SELECT ROUND(Min(LAT_N), 4) FROM STATION WHERE LAT_N > 38.7780

 select ceiling(avg(salary)- AVG(REPLACE(Salary, '0', ''))) from employees


SELECT ROUND((Long_w), 4) FROM STATION 
WHERE LAT_N = (
    SELECT MAX(LAT_N) 
    FROM STATION 
    WHERE Lat_n < (137.2345))