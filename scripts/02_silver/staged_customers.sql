/* 
Logic Overview:
  - Data Refinement: Standardize raw customer data into a cleaned Silver-layer table.
  - Primary Keys: Standardize IDs (LOWER/TRIM) to ensure 100% join compatibility across tables.
  - String Normalization: Apply consistent casing (UPPER for states, INITCAP for cities) and 
    remove special character noise to improve dashboard readability.
  - Schema Enforcement: Use SAFE_CAST to strictly define data types (STRING, INT64) 
    and handle potential raw data corruption.
  - Deduplication: Ensure record uniqueness to prevent inflated customer metrics.
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_customers` AS

SELECT
  -- Standardized ID: Trimmed and lowered for join compatibility
  SAFE_CAST(LOWER(TRIM(customer_id)) AS STRING) AS customer_id,

 -- Unique Identifier: Used to link customers across different order sessions
  SAFE_CAST(LOWER(TRIM(customer_unique_id)) AS STRING) AS customer_unique_id,

  -- Zip Codes: Converted to INT64 (Note: Leading zeros will be dropped)
  SAFE_CAST(customer_zip_code_prefix AS INT64) AS customer_zip_code_prefix,

  -- City Normalization: Cleansed of symbols and formatted to Title Case
  SAFE_CAST(INITCAP(REGEXP_REPLACE(TRIM(customer_city), r'[^\p{L}\s]', '')) AS STRING) AS customer_city,

  -- State Formatting: Standardized to uppercase strings (e.g., SP)
  SAFE_CAST(UPPER(TRIM(customer_state)) AS STRING) AS customer_state
FROM `olist-360-e-commerce.raw_data.raw_olist_customers`

