-- Business Question 2: 
-- Which products and brands perform best for different skin types?
-- Find the top 5 highest rated product for each skin type (dry, combination, normal, oily, no type), 
-- considering only products with at least 100 reviews.
-- Purpose: Utilize information for targeted marketing, promoting personalized top products to each segmentation of skin type.

SELECT skin_type, product_id, product_name, avg_rating
FROM (
	SELECT
		r.product_id,
        p.product_name,
        r.skin_type,
        AVG(r.rating) AS avg_rating,
        ROW_NUMBER() OVER (
			PARTITION BY r.skin_type
				ORDER BY AVG(r.rating) DESC
			) AS rated_per_type
	FROM reviews r
    JOIN products p ON r.product_id = p.product_id
	WHERE p.reviews >= 100
    GROUP BY r.product_id, p.product_name, r.skin_type
) t
WHERE rated_per_type <= 5
ORDER BY skin_type, avg_rating DESC;
