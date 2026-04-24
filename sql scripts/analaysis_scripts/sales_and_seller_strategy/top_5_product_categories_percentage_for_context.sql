/*
Query Descriptions:
Query 1 = Revenue Breakdown and Percentage Share
Query 2 = Category Count Verification

Results (out of 74 product categories): 
Top 5 Categories = 39.8% revenue share
Top 10 Categories = 62.4% revenue share
*/

SELECT
  -- Total revenue per category
  dp.product_category_name,

  -- Total category revenue, rounded for currency formatting
  ROUND(SUM(ofact.price),2) AS category_revenue,
  
  -- Window function: (Category Sum / Grand Total Sum) * 100
  ROUND(100 * SUM(ofact.price) / SUM(SUM(ofact.price)) OVER(),2)
  AS revenue_percentage
FROM `olist-360-e-commerce.analytical_data.orders_fact` AS ofact
INNER JOIN `olist-360-e-commerce.analytical_data.dim_products` AS dp
  ON ofact.product_id = dp.product_id

-- Sorts data by product categort and ranks all categores from highest to lowest revenue percent share
GROUP BY dp.product_category_name
ORDER BY revenue_percentage DESC;

-- Used to confirm the denominator of 74 categories mentioned in insights
SELECT
COUNT(DISTINCT product_category_name) AS num_product_categories
FROM `olist-360-e-commerce.analytical_data.dim_products`;
