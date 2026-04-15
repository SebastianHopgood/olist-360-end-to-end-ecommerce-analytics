/* 
Logic Overview:
  - Data Refinement: Standardizes raw geolocation data for spatial modeling and analysis
  - Precision Mapping: Casts coordinates to FLOAT64 to ensure high precision in Power BI visuals
  - String Normalization: Applies consistent casing (UPPER/INITCAP) and uses REGEXP_REPLACE 
    to remove symbols while preserving accented Brazilian characters
  - Optimization: Uses DISTINCT to remove redundant coordinate entries and reduce table size
  - Data Integrity: Filters for valid global coordinate ranges and ensures every record has a valid Zip Code
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_geolocation` AS

SELECT DISTINCT
  -- Standardize zip codes as INT64; note that leading zeros will be dropped
  SAFE_CAST(geolocation_zip_code_prefix AS INT64) AS geolocation_zip_code_prefix,

  -- Maintain decimal precision for geographic mapping
  SAFE_CAST(geolocation_lat AS FLOAT64) AS geolocation_lat,
  SAFE_CAST(geolocation_lng AS FLOAT64) AS geolocation_lng,

   -- Clean city names: Remove symbols, trim whitespace, and apply Title Case
  SAFE_CAST(INITCAP(REGEXP_REPLACE(TRIM(geolocation_city), r'[^\p{L}\s]', '')) AS STRING) AS geolocation_city,

  -- Standardize state codes as uppercase (e.g., SP)
  SAFE_CAST(UPPER(TRIM(geolocation_state)) AS STRING) AS geolocation_state
FROM `olist-360-e-commerce.raw_data.raw_olist_geolocation`

WHERE
    -- Geographic Validation: Excludes "garbage" coordinates outside valid global bounds
    (geolocation_lat BETWEEN -90 AND 90) AND
    (geolocation_lng BETWEEN -180 AND 180) AND
    
    -- Integrity Check: Ensures every geographic point is linked to a valid Zip Code
    geolocation_zip_code_prefix IS NOT NULL;
