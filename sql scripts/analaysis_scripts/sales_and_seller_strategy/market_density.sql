CREATE OR REPLACE VIEW `olist-360-e-commerce.data_views.market_density` AS

SELECT 
  c.customer_state,
  
  -- Compare customer demand vs. local seller supply by state
  COUNT(DISTINCT c.customer_id) AS customer_count,

  -- Measure supply: Total unique sellers located in the region
  COUNT(DISTINCT s.seller_id) AS seller_count
FROM `olist-360-e-commerce.analytical_data.dim_customers` AS c

-- LEFT JOIN ensures we see states with customers even if they have zero sellers
LEFT JOIN `olist-360-e-commerce.analytical_data.dim_sellers` AS s ON c.customer_state = s.seller_state
GROUP BY 1;
