# Business Question 1 
## Which brands deliver the highest customer-rated quality at scale?

**Goal:** Identify brands with strong customer satisfaction and a large customer base, reducing risk from small sample sizes.

**SQL Logic Summary:**
- Aggregate data by brand using SUM() and GROUP BY
- Calculate a weighted rating average (SUM(rating * reviews)/SUM(reviews))
- Filtered brands out with fewer than 100 total reviews
- Sort results with ORDER BY to prioritize top performing brands
- Limit to top 10 results

**Key Insights:**
- MACRENE Actives tops the weighted rating chart (4.89) with high satisfaction but fewer reviews.
- Bondiboost, slightly lower at 4.75, leads in total reviews and loves, showing strong popularity and customer engagement.

**Recommendations:**
1. For brands with high rating + lower reviews/loves (like MACRENE Actives): Invest in marketing and promotion to increase brand awareness and attract more customers, leveraging its excellent product satisfaction.
2. For brands with high popularity + high satisfaction (like BondiBoost): Use strong engagement to launch new products or upsell to existing customers. Highlight best-selling and top-loved items in campaigns to maintain momentum.
3. General insight: Weighted ratings help identify high-quality brands even with lower review counts. Combine ratings and engagement metrics (reviews, loves) to guide promotion directions, organize inventory, and make strategic decisions.

**View SQL Query:** [Q1 SQL File](https://github.com/ssz-119/sephora-trends/blob/main/sql/q1_brand_quality.sql)


