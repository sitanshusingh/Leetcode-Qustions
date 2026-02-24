# Write your MySQL query statement below
SELECT em.name as "name" FROM employee em INNER JOIN employee mr 
ON em.id = mr.managerid GROUP BY mr.managerid 
HAVING count(mr.managerid) >= 5; 
