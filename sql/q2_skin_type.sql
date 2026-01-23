-- Business Question 2:
-- What are the highest rated products for each skin type segmentation?
-- Identify the top 5 highest-rated products for each skin type (dry, combination, normal, oily),
-- using a Bayesian weighted rating to adjust for low-review products.
-- Purpose: Support targeted marketing by highlighting personalized top products for each skin type segment.

WITH skin_type_avg AS (
    SELECT
        skin_type,
        AVG(rating) AS global_avg_rating
    FROM reviews
    WHERE skin_type IN ('dry', 'combination', 'normal', 'oily')
    GROUP BY skin_type
),
scored_products AS (
    SELECT
        r.skin_type,
        p.product_id,
        p.product_name,
        COUNT(*) AS review_count,
        AVG(r.rating) AS avg_rating,
        (
            (COUNT(*) / (COUNT(*) + 50)) * AVG(r.rating)
          + (50 / (COUNT(*) + 50)) * s.global_avg_rating
        ) AS weighted_rating
    FROM reviews r
    JOIN products p ON p.product_id = r.product_id
    JOIN skin_type_avg s ON s.skin_type = r.skin_type
    GROUP BY
        r.skin_type,
        p.product_id,
        p.product_name,
        s.global_avg_rating
),
ranked_products AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY skin_type
            ORDER BY weighted_rating DESC
        ) AS rn
    FROM scored_products
)
SELECT
    skin_type,
    product_id,
    product_name,
    weighted_rating
FROM ranked_products
WHERE rn <= 5;
