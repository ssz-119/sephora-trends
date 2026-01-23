# Business Question 3
## How does customer engagement (loves per review) relate to ratings and review volume?

**Goal:** 
Analyze how customer engagement (measured by loves per review) varies with product ratings and review volume to understand which products drive higher user interaction.

**SQL Logic Summary:**
- Aggregate

**Key Insights:**
- Bin numeric data with CASE statements to group products by review volume or rating ranges
- Aggregate metrics using COUNT() and AVG() to summarize engagement and ratings per bin.
- Filter out invalid or missing values (WHERE reviews > 0 AND loves_per_review IS NOT NULL)
- Group data with GROUP BY for categorical bins and rounded ratings
- Sort results logically to visualize trends 

**Recommendations:**
1. 

**View SQL Query:** [Q3 SQL File](https://github.com/ssz-119/sephora-trends/blob/main/sql/q3_engagement.sql)
