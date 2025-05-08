-- Optimized indexes for JSONB queries
CREATE INDEX idx_tweets_jsonb_hashtags ON tweets_jsonb USING GIN (
    (data -> 'entities' -> 'hashtags' -> 'text')
);

CREATE INDEX idx_tweets_jsonb_extended_hashtags ON tweets_jsonb USING GIN (
    (data -> 'extended_tweet' -> 'entities' -> 'hashtags' -> 'text')
);

CREATE INDEX idx_tweets_jsonb_lang ON tweets_jsonb ((data ->> 'lang'));

CREATE INDEX idx_tweets_jsonb_text_gin ON tweets_jsonb USING GIN (
    to_tsvector('english', COALESCE(data -> 'extended_tweet' ->> 'full_text', data ->> 'text'))
);

CREATE INDEX idx_tweets_jsonb_id ON tweets_jsonb ((data ->> 'id'));

