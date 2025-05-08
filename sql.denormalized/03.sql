/* sql.denormalized/03.sql */
SELECT
    lang,
    COUNT(DISTINCT id_tweets) AS count
FROM tweet_tags
JOIN tweets USING (id_tweets)
WHERE tag = '#coronavirus'
GROUP BY lang
ORDER BY count DESC, lang;

