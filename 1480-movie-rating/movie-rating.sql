(
WITH SAMPLE AS (
    SELECT US.name, COUNT(*) AS cnt
    FROM Users US
    JOIN MovieRating MR ON US.user_id = MR.user_id
    GROUP BY US.name
)
SELECT name AS results
FROM SAMPLE
WHERE cnt = (SELECT MAX(cnt) FROM SAMPLE)
ORDER BY name ASC
LIMIT 1
)

UNION ALL

(
WITH SAMPLE AS (
    SELECT MO.title, AVG(MR.rating) AS avg_rating
    FROM Movies MO
    JOIN MovieRating MR ON MO.movie_id = MR.movie_id
    WHERE DATE_FORMAT(MR.created_at, '%M %Y') = 'February 2020'
    GROUP BY MO.title
)
SELECT title AS results
FROM SAMPLE
WHERE avg_rating = (SELECT MAX(avg_rating) FROM SAMPLE)
ORDER BY title ASC
LIMIT 1
);
