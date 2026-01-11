# Write your MySQL query statement below
WITH sample AS 
(SELECT de.name AS Department,ey.name AS Employee,ey.salary AS Salary,
DENSE_RANK() OVER(PARTITION BY de.name ORDER BY ey.salary DESC) 
AS Rank_ 
FROM employee ey INNER JOIN department de ON de.id = ey.departmentid)
SELECT Department,Employee,Salary 
FROM sample 
WHERE Rank_ IN (1,2,3) ORDER BY department;