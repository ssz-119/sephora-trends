-- Business Question 2: 
-- How does customer engagement (loves per review) relate to ratings and review volume?
-- Purpose: Determine whether highly rated products are also the most loved by customers of do engagement patterns actually differ from ratings showcaesd?

-- Query 1: Engagement vs review volume
-- Groups products by review volume bins to show average engagement (loves_per_review) and average rating, reflecting how engagement varies with review count
SELECT
    CASE 
        WHEN reviews BETWEEN 0 AND 50 THEN '0-50'
        WHEN reviews BETWEEN 51 AND 199 THEN '51-199'
        WHEN reviews BETWEEN 200 AND 499 THEN '200-499'
        WHEN reviews BETWEEN 500 AND 999 THEN '500-999'
        ELSE '1000+' 
    END AS review_bin,
    COUNT(*) AS num_products,
    AVG(loves_per_review) AS avg_loves_per_review,
    AVG(rating) AS avg_rating
FROM products
WHERE reviews IS NOT NULL AND loves_per_review IS NOT NULL
GROUP BY review_bin
ORDER BY review_bin;

-- Query 2: Engagement vs rating
-- Summarizes product count, average reviews, and average engagement (loves per review) for each integer rating level
SELECT 
	FLOOR(rating) AS rating_lv,
    COUNT(*) AS product_count,
    AVG(reviews) AS avg_reviews,
    AVG(loves_per_review) AS avg_loves_per_review
FROM products
WHERE reviews > 0
GROUP BY rating_lv
ORDER BY rating_lv DESC;

-- Query 3: Review volume + rating vs Engagement
-- Query 3: View trends in customer engagement (loves per review) across product review volume and rating bins.
-- This shows how engagement varies by both product popularity (number of reviews) and product rating to identify which products drive the most meaningful customer interaction.
    rating,
    CASE 
        WHEN reviews BETWEEN 0 AND 100 THEN '0-100'
        WHEN reviews BETWEEN 101 AND 400 THEN '101-400'
        WHEN reviews BETWEEN 401 AND 1000 THEN '401-1000'
        ELSE '1001+' 
    END AS review_volume_bin,
    COUNT(*) AS num_products,
    ROUND(AVG(loves_per_review), 2) AS avg_loves_per_review
FROM products
WHERE reviews > 0
GROUP BY rating, review_volume_bin
ORDER BY rating,
         CASE review_volume_bin
             WHEN '0-100' THEN 1
             WHEN '101-400' THEN 2
             WHEN '401-1000' THEN 3
             WHEN '1001+' THEN 4
         END;
