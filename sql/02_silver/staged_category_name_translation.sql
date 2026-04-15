/* 
Logic Overview:
  - Header Correction: Utilizes a CTE and WHERE clause to filter out the raw CSV header row 
    mistakenly imported as data (string_field_0/1)
  - String Normalization: Standardizes category names by removing underscores and 
    applying Title Case (INITCAP) for schema-wide consistency
  - Schema Enforcement: Explicitly casts generic string fields into structured STRING columns
  - Data Integrity: Ensures no null records are included in the translation mapping
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
  -- Filters out the redundant header row and any invalid empty records
  product_category_name_english <> 'Product Category Name English';
