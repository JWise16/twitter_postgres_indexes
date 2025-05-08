-- Optimized indexes for normalized batch queries
CREATE INDEX idx_tweet_tags_tag_id ON tweet_tags (tag, id_tweets);
CREATE INDEX idx_tweet_tags_hashtag ON tweet_tags (tag text_pattern_ops);
CREATE INDEX idx_tweets_id_lang ON tweets (id_tweets, lang);
CREATE INDEX idx_tweets_text_gin_optimized ON tweets USING gin (to_tsvector('english', text));
CREATE INDEX idx_tweet_tags_hashtags ON tweet_tags (tag) WHERE tag LIKE '#%';
CREATE INDEX idx_tweets_covid_en ON tweets (id_tweets) WHERE lang = 'en' AND to_tsvector('english', text) @@ 'coronavirus';
CREATE INDEX idx_tweet_tags_id_tag ON tweet_tags (id_tweets, tag);
