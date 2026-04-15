/* 
Logic Overview:
  - Data Preservation: Utilizes COALESCE to replace NULL values with 'Unknown' for categories 
  and 0 for numeric dimensions, ensuring no products are lost during analysis
  - String Normalization: Standardizes product categories by removing underscores and 
  applying Title Case (INITCAP) to match the translation table
  - Join Compatibility: Standardizes Product IDs (LOWER/TRIM) to ensure 100% match 
  with order items and sales data
  - Schema Enforcement: Explicitly casts physical dimensions and weights to INT64 
  to enable numeric aggregations and distribution analysis
  - Deduplication: Uses DISTINCT to remove redundant product entries from the raw source
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_products` AS

SELECT DISTINCT
  -- Standardized ID: Trimmed and lowered for consistent joins
  SAFE_CAST(LOWER(TRIM(product_id)) AS STRING) AS product_id,
  
  -- Category Imputation: Standardizes text and handles missing values
  SAFE_CAST(COALESCE(INITCAP(REPLACE(TRIM(product_category_name), '_', ' ')), 'Unknown') AS STRING) AS product_category_name,

  -- Product Metadata: Cast to INT64; NULLs replaced with 0 to prevent calculation errors
  SAFE_CAST(COALESCE(product_name_length, 0) AS INT64) AS product_name_length,
  SAFE_CAST(COALESCE(product_description_length, 0) AS INT64) AS product_description_length,
  SAFE_CAST(COALESCE(product_photos_qty, 0) AS INT64) AS product_photos_qty,
  SAFE_CAST(COALESCE(product_weight_g, 0) AS INT64) AS product_weight_g,
  SAFE_CAST(COALESCE(product_length_cm, 0) AS INT64) AS product_length_cm,
  SAFE_CAST(COALESCE(product_height_cm, 0) AS INT64) AS product_height_cm,
  SAFE_CAST(COALESCE(product_width_cm, 0) AS INT64) AS product_width_cm
FROM `olist-360-e-commerce.raw_data.raw_olist_products`

WHERE
  -- Data Integrity: Ensures every product record has a valid identifier
  product_id IS NOT NULL;
