/* sql.denormalized/02.sql */
SELECT
    tag,
    COUNT(*) AS count
FROM (
    SELECT DISTINCT
        t1.id_tweets,
        t2.tag
    FROM tweet_tags t1
    JOIN tweet_tags t2 USING (id_tweets)
    WHERE t1.tag = '#coronavirus'
      AND t2.tag LIKE '#%'
) t
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;

