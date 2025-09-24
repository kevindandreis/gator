-- name: CreateFeedFollow :one
WITH new_follow AS (
INSERT INTO feed_follows (id, user_id, feed_id)
VALUES ($1, $2, $3)
    RETURNING *
    )
SELECT
    nf.id,
    nf.created_at,
    nf.updated_at,
    nf.user_id,
    nf.feed_id,
    u.name AS user_name,
    f.name AS feed_name
FROM new_follow nf
         JOIN users u ON nf.user_id = u.id
         JOIN feeds f ON nf.feed_id = f.id;

-- name: DeleteFeedFollowByUserAndFeed :exec
DELETE FROM feed_follows
WHERE user_id = $1 AND feed_id = $2;

-- name: GetFeedFollowsByUser :many
SELECT
    ff.*,
    f.name AS feed_name,
    f.url AS feed_url
FROM feed_follows ff
         JOIN feeds f ON ff.feed_id = f.id
WHERE ff.user_id = $1
ORDER BY ff.created_at DESC;

-- name: GetFeedFollowsForUser :many
SELECT
    ff.*,
    f.name AS feed_name,
    f.url AS feed_url,
    u.name AS user_name
FROM feed_follows ff
         JOIN feeds f ON ff.feed_id = f.id
         JOIN users u ON ff.user_id = u.id
WHERE ff.user_id = $1
ORDER BY ff.created_at DESC;

-- name: DeleteFeedFollow :exec
DELETE FROM feed_follows
WHERE id = $1 AND user_id = $2;
