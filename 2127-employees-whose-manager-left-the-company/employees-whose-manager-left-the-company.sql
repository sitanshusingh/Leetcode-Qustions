# Write your MySQL query statement below

# First Using Joining.
-- SELECT Ep.employee_id
-- FROM Employees Ep Left Join Employees Mg ON Ep.manager_id = Mg.Employee_id
-- WHERE Ep.SALARY < 30000 AND EP.manager_id IS NOT NULL and Mg.Employee_id is null Order by Ep.employee_id;

# Second Using Subqueries.
Select employee_id FROM 
Employees 
Where Salary < 30000 and 
Manager_id is not null 
and manager_id not In (Select Employee_id from Employees) order by employee_id;