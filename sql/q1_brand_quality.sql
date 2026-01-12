-- Business Question 1:
-- Identify the top 10 brands by weighted product rating (weighted by number of reviews),
-- considering only brands with at least 100 total reviews.
-- Purpose: Highlight high-quality and popular brands to guide marketing, promotions, and inventory decisions.

SELECT
    brand_id,
    brand_name,
    SUM(rating * reviews) / SUM(reviews) AS weighted_brand_rating,
    SUM(reviews) AS total_reviews,
    SUM(loves_count) AS total_loves
FROM products
WHERE reviews > 0
GROUP BY brand_id, brand_name
HAVING SUM(reviews) >= 100
ORDER BY weighted_brand_rating DESC, total_loves DESC
LIMIT 10;
