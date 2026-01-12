# Write your MySQL query statement below
WITH sample AS (
    SELECT
        sg.user_id,
        COUNT(*) AS total_confirmation,
        SUM(
            CASE
                WHEN cf.action = 'confirmed' THEN 1
                ELSE 0
            END
        ) AS confirmed
    FROM Signups sg
    LEFT JOIN Confirmations cf
        ON sg.user_id = cf.user_id
    GROUP BY sg.user_id
)
SELECT
    user_id,
    ROUND(confirmed / total_confirmation,2) AS confirmation_rate
FROM sample;

  