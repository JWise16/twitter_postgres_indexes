/* sql.denormalized/05.sql */
SELECT
    tag,
    COUNT(*) AS count
FROM (
    SELECT DISTINCT
        tweets.id_tweets,
        tweet_tags.tag
    FROM tweets
    JOIN tweet_tags USING (id_tweets)
    WHERE to_tsvector('english', text) @@ to_tsquery('english', 'coronavirus')
      AND lang = 'en'
) t
GROUP BY tag
ORDER BY count DESC, tag
LIMIT 1000;

