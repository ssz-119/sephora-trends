# Business Question 2
## What are the highest rated products for each skin type segmentation?

**Goal:**  
Identify the top 5 highest-rated products for each skin type (dry, combination, normal, oily), adjusting for low review products.

**SQL Logic Summary:**
- Aggregate product ratings by skin type using AVG() and GROUP BY
- Compute Bayesian weighted ratings to adjust for low review products
- Join products and reviews tables for in depth analysis
- Rank products within each skin type using ROW_NUMBER() and PARITION BY
- Select top N products per skin type with a WHERE rn <= 5 clause
- Focus only on makeup and skincare category

**Key Insights:**
- Top common performers across all skin types are Black Tea Anti-Aging Moisturizer and Facial Cotton
- Treatment specific products such as Niacinamide, Squalane, Retinol-Alternative dominate combination and dry skin
- For oily skin, lightweight, protective, and non-clogging products are top performers.
- Normal skin types tend to be more experimental, emphasizing versatility and gentle exfoliation

**Recommendations:**
1. For general marketing campaigns, identify cross skin type top performers like Black Tea Anti-Aging Moisturizer.
2. Tailor product promotions by skin type
    - Dry/combination: target hydrating, anti-aging, and barrier repairing products
    - Normal: target multi-functional, gentle maintenance products
    - Oily: target lightweight, protective, and non-greasy products
3. Highlight ingredient benefits in messaging to target skin concerns.
5. Bundle everyday essentials like facial cottons to maximize appeal and inclusion in starter kits.
6. Optimize product recommendations on-sites

**View SQL Query:** [Q2 SQL File](https://github.com/ssz-119/sephora-trends/blob/main/sql/q2_skin_type.sql)
