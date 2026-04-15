/* Logic:
    - Create a new clean data table to help with data cleanliness, table modeling, joins, and analysis 
    - Standardize IDs for join compatibility
    - Uses LOWER, UPPER, INITCAP to format STRING data
    - Uses TRIM to remove unnecessary spacing
    - Uses SAFE_CAST to convert data types
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_customers` AS

SELECT
  -- IDs are are converted to STRING, stripped of unnecessary spacing, and forced-lowered to prevent case-sensitivity issues during joins
  SAFE_CAST(LOWER(TRIM(customer_id)) AS STRING) AS customer_id,

  -- Customer duplicate IDs are converted to STRING, stripped of unnecessary spacing, and forced-lowered to prevent case-sensitivity issues during joins
  SAFE_CAST(LOWER(TRIM(customer_unique_id)) AS STRING) AS customer_unique_id,

  -- Zip codes are converted to INT64; note that leading zeros will be dropped
  SAFE_CAST(customer_zip_code_prefix AS INT64) AS customer_zip_code_prefix,

  -- Customer cities are converted to STRING, stripped of unnecessary spacing, and formatted as title case (INITCAP)
  SAFE_CAST(INITCAP(TRIM(customer_city)) AS STRING) AS customer_city,

  -- Customer states are converted to STRING, stripped of unnecessary spacing, and formatted as uppercase (e.g. NY)
  SAFE_CAST(UPPER(TRIM(customer_state)) AS STRING) AS customer_state
FROM `olist-360-e-commerce.raw_data.raw_olist_customers`

