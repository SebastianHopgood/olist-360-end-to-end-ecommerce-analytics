-- Identify the high-capacity sellers driving the top 10% of order volume
WITH sellervolume AS (
  SELECT
    seller_id,
    
     -- Aggregate total units sold per seller
    COUNT(order_id) AS order_count,

     -- Assign a percentile rank (0 to 1) based on order volume
    PERCENT_RANK() OVER(ORDER BY COUNT(order_id) DESC) AS ranking_seller_id
  FROM `olist-360-e-commerce.analytical_data.orders_fact`
  GROUP BY seller_id
)

SELECT 
  seller_id,
  order_count,
  ranking_seller_id
FROM sellervolume
WHERE
  -- Filter to isolate only the elite top 10% of the seller fleet
  ranking_seller_id <= 0.10 AND
  seller_id IS NOT NULL;