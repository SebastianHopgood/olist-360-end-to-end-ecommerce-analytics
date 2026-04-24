-- Identify the top 5 product categories by total revenue to focus the analysis
SELECT
  dp.product_category_name,
  
  -- Sum of item price represents the core product revenue
  ROUND(SUM(ofact.price),2) AS total_product_revenue
FROM `olist-360-e-commerce.analytical_data.orders_fact` AS ofact
INNER JOIN `olist-360-e-commerce.analytical_data.dim_products` AS dp
  ON ofact.product_id = dp.product_id
GROUP BY dp.product_category_name

-- Order by highest revenue and limit to the top 5 for dashboard focus
ORDER BY total_product_revenue DESC
LIMIT 5;
