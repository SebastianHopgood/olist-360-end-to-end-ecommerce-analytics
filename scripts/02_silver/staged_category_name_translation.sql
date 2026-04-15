/* 
Logic Overview:
  - Header Correction: Uses a CTE and WHERE clause to filter out the raw CSV header row 
    imported as data (string_field_0/1).
  - String Normalization: Standardizes category names by removing underscores and 
    applying Title Case (INITCAP) for consistency across the schema.
  - Schema Enforcement: Explicitly casts generic string fields into structured STRING columns.
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_category_name_translation` AS
WITH cleanned_data AS (
 SELECT
  -- Standardizing the English category names for Power BI report legends
  SAFE_CAST(REPLACE(INITCAP(TRIM(string_field_1)), '_', ' ') AS STRING) AS product_category_name_english,

  -- Standardizing the Portuguese category names to match the staged_products table
  SAFE_CAST(REPLACE(INITCAP(TRIM(string_field_0)), '_', ' ') AS STRING) AS product_category_name_portuguese
FROM `olist-360-e-commerce.raw_data.raw_olist_product_category_name_translation` 
)

SELECT
  product_category_name_english,
  product_category_name_portuguese
FROM cleanned_data
WHERE
  
  -- Filters out the redundant header row imported from the raw CSV file
  product_category_name_english <> 'Product Category Name English'