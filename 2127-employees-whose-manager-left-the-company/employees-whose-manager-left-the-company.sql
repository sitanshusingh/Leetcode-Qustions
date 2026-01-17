# Write your MySQL query statement below
SELECT Ep.employee_id
FROM Employees Ep Left Join Employees Mg ON Ep.manager_id = Mg.Employee_id
WHERE Ep.SALARY < 30000 AND EP.manager_id IS NOT NULL and Mg.Employee_id is null Order by Ep.employee_id;