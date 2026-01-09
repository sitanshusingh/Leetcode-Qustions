# Write your MySQL query statement below
WITH cte AS (
  SELECT *,
         id - ROW_NUMBER() OVER (ORDER BY id) AS grp
  FROM Stadium
  WHERE people >= 100
)
SELECT id, visit_date, people
FROM (
  SELECT *,
         COUNT(*) OVER (PARTITION BY grp) AS cnt
  FROM cte
) t
WHERE cnt >= 3
ORDER BY visit_date;
