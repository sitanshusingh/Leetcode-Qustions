# Write your MySQL query statement below
select w2.id as id from weather w1 cross join weather w2 where datediff(w2.recordDate,w1.recordDate) = 1 AND w2.temperature > w1.temperature; 