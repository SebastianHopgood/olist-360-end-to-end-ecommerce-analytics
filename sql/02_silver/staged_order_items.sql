/* 
Logic Overview:
  - Financial Accuracy: Casts price and freight to FLOAT64 and rounds to 2 decimals for accurate reporting
  - Join Compatibility: Standardizes Order, Product, and Seller IDs (LOWER/TRIM) for schema consistency
  - Schema Enforcement: Converts shipping limit dates to TIMESTAMPS to enable time-series analysis
  - Data Integrity: Filters out invalid prices and ensures every record has a valid Order ID
  - Deduplication: Uses DISTINCT to remove redundant item entries and protect order totals
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

WHERE
  -- Data Validation: Removes zero/negative prices while allowing free shipping (0.00 freight)
  price > 0.00 AND 
  freight_value >= 0.00 AND

  -- Integrity Check: Ensures every item is linked to a valid order
  order_id IS NOT NULL;
