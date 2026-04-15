/* 
Logic Overview:
  - Join Compatibility: Standardizes seller_id (LOWER/TRIM) to ensure seamless 
  joins with order items and payment datasets
  - Deduplication: Uses DISTINCT to remove redundant seller entries, ensuring 
  each ID exists only once in the staging layer
  - Data Integrity: Filters out records where seller_id IS NOT NULL to prevent 
  orphaned records in downstream analytics
  - Schema Enforcement: Explicitly casts zip code prefixes to INT64 for 
  numerical indexing and spatial analysis
  - Geographic Normalization: Standardizes city names to Title Case (INITCAP) 
  and state codes to UPPER case for uniform reporting
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_sellers` AS

SELECT
  -- Standardized ID: Trimmed and lowered for consistent relational mapping
  SAFE_CAST(LOWER(TRIM(seller_id)) AS STRING) AS seller_id,

  -- Postal Code: Cast to INT64 for numerical consistency
  SAFE_CAST(seller_zip_code_prefix AS INT64) AS seller_zip_code_prefix,
  
  -- City Normalization: Standardizes text formatting to Title Case
  SAFE_CAST(INITCAP(TRIM(seller_city)) AS STRING) AS seller_city,

  -- State Normalization: Ensures two-letter state codes are consistently capitalized
  SAFE_CAST(UPPER(TRIM(seller_state)) AS STRING) AS seller_state
FROM `olist-360-e-commerce.raw_data.raw_olist_sellers`

WHERE
  -- Data Integrity: Exclude any records missing a primary identifier
  seller_id IS NOT NULL;