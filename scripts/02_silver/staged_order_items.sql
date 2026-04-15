/* 
Logic Overview:
  - Financial Accuracy: Cast price and freight to FLOAT64 and ROUND to 2 decimals for reporting
  - Join Compatibility: IDs are trimmed and force-lowered to match the staged_orders and staged_products tables
  - Data Integrity: Filters out orders with zero or negative prices
  - Schema Enforcement: Converts shipping limit dates from strings to TIMESTAMPS for time-series analysis
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_order_items` AS

SELECT DISTINCT
  -- Standardizing IDs for join compatibility
  SAFE_CAST(LOWER(TRIM(order_id)) AS STRING) AS order_id,
  SAFE_CAST(order_item_id AS INT64) AS order_item_id,
  SAFE_CAST(LOWER(TRIM(product_id)) AS STRING) AS product_id,
  SAFE_CAST(LOWER(TRIM(seller_id)) AS STRING) AS seller_id,

  -- Formatting dates for time-series analysis
  SAFE_CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_date,
  
  -- Financial values rounded for accuracy
  ROUND(SAFE_CAST(price AS FLOAT64), 2) AS price,
  ROUND(SAFE_CAST(freight_value AS FLOAT64), 2) AS freight_value
FROM `olist-360-e-commerce.raw_data.raw_olist_order_items`

-- Ensure data quality by removing impossible prices; allowing 0 freight for free shipping
WHERE 
  price > 0.00 AND 
  freight_value >= 0.00
