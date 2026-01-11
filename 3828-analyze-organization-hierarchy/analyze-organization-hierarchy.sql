# Write your MySQL query statement below
-- WITH RECURSIVE
-- EmpHierarchy AS (
--     SELECT 
--         employee_id,
--         employee_name,
--         manager_id,
--         salary,
--         1 AS Level
--     FROM Employees
--     WHERE manager_id IS NULL

--     UNION ALL

--     SELECT 
--         e.employee_id,
--         e.employee_name,
--         e.manager_id,
--         e.salary,
--         eh.Level + 1 AS Level
--     FROM Employees e
--     INNER JOIN EmpHierarchy eh
--         ON e.manager_id = eh.employee_id
-- ),
-- Item_size_budget AS (
--     WITH RECURSIVE sample AS (
--         SELECT 
--             employee_id,
--             manager_id,
--             salary
--         FROM Employees
--         WHERE manager_id IS NOT NULL

--         UNION ALL

--         SELECT
--             e.employee_id,
--             e.manager_id,
--             e.salary
--         FROM Employees e
--         INNER JOIN sample s
--             ON e.manager_id = s.employee_id
--     )
--     SELECT 
--         e.employee_id,
--         COUNT(DISTINCT s.employee_id) AS team_size,
--         IFNULL(SUM(s.salary),0) + e.salary AS total_budget
--     FROM Employees e
--     LEFT JOIN sample s
--         ON e.employee_id = s.manager_id
--     GROUP BY e.employee_id, e.salary
-- )
-- SELECT 
--     eh.employee_id AS employee_id,
--     eh.employee_name AS employee_name,
--     eh.Level AS level,
--     IFNULL(ib.team_size, 0) AS team_size,
--     IFNULL(ib.total_budget, eh.salary) AS budget
-- FROM EmpHierarchy eh
-- LEFT JOIN Item_size_budget ib
--     USING (employee_id)
-- ORDER BY  
--     eh.Level,
--     ib.total_budget DESC,
--     eh.employee_name;

WITH RECURSIVE
EmpHierarchy AS (
    SELECT
        employee_id,
        employee_name,
        manager_id,
        salary,
        1 AS level
    FROM Employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT
        e.employee_id,
        e.employee_name,
        e.manager_id,
        e.salary,
        eh.level + 1
    FROM Employees e
    JOIN EmpHierarchy eh
        ON e.manager_id = eh.employee_id
),
sample AS (
    SELECT
        manager_id,
        employee_id,
        salary
    FROM Employees
    WHERE manager_id IS NOT NULL

    UNION ALL

    SELECT
        s.manager_id,
        e.employee_id,
        e.salary
    FROM Employees e
    JOIN sample s
        ON e.manager_id = s.employee_id
),
Item_size_budget AS (
    SELECT
        e.employee_id,
        COUNT(DISTINCT s.employee_id) AS team_size,
        IFNULL(SUM(s.salary),0) + e.salary AS total_budget
    FROM Employees e
    LEFT JOIN sample s
        ON e.employee_id = s.manager_id
    GROUP BY e.employee_id, e.salary
)
SELECT
    eh.employee_id,
    eh.employee_name,
    eh.level,
    IFNULL(ib.team_size,0) AS team_size,
    IFNULL(ib.total_budget, eh.salary) AS budget
FROM EmpHierarchy eh
LEFT JOIN Item_size_budget ib
    ON eh.employee_id = ib.employee_id
ORDER BY
    eh.level,
    budget DESC,
    eh.employee_name;



   