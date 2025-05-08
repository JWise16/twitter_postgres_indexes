/* sql.denormalized/01.sql */
SELECT COUNT(DISTINCT id_tweets)
FROM tweet_tags
WHERE tag = '#coronavirus';

