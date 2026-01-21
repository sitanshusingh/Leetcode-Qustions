# Write your MySQL query statement below
SELECT      
            Mg.employee_id, 
            Mg.name,COUNT(*) AS reports_count,
            ROUND(AVG(Ep.age),0) AS average_age
FROM 
            Employees Ep 
INNER JOIN 
            Employees Mg 
            ON
            Ep.reports_to = Mg.employee_id 
GROUP BY Mg.employee_id, 
            Mg.name ORDER BY Mg.employee_id;