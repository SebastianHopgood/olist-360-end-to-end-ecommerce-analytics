/* 
Logic Overview:
  - Data Quality: Filters review scores to ensure they fall within the valid 1-5 range and removes records with missing IDs
  - Time-Series Analysis: Casts creation and answer dates to TIMESTAMPS for response-time tracking
  - Join Compatibility: Standardizes Review and Order IDs (LOWER/TRIM) for schema consistency
  - Optimization: Removed text-heavy comment columns to improve query performance and reduce storage costs
  - Deduplication: Uses DISTINCT to handle potential duplicate review submissions
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_order_reviews` AS

SELECT DISTINCT
  -- Standardized IDs for internal and cross-table joins
  SAFE_CAST(LOWER(TRIM(review_id)) AS STRING) AS review_id,
  SAFE_CAST(LOWER(TRIM(order_id)) AS STRING) AS order_id,

  -- Numeric Score: Verified to be between 1 and 5
  SAFE_CAST(review_score AS INT64) AS review_score,

  -- Timestamps for lifecycle analysis (normalized to UTC)
  SAFE_CAST(review_creation_date AS TIMESTAMP) AS review_creation_date,
  SAFE_CAST(review_answer_timestamp AS TIMESTAMP) AS review_answer_timestamp
FROM `olist-360-e-commerce.raw_data.raw_olist_order_reviews`

WHERE
  -- Ensure only valid business metrics are included
  (review_score BETWEEN 1 AND 5) AND
  (review_id IS NOT NULL);
