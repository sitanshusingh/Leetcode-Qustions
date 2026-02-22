# Write your MySQL query statement below
SELECT *,IF(x+y>z AND z+x>y AND y+z>x ,"Yes","No") AS "Triangle" FROM triangle;