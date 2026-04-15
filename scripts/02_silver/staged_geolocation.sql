/* Logic:
    - Create a clean geolocation data table to help with data cleanliness, table modeling, joins, and analysis 
    - Clean and standardize geolocation data for mapping
    - Coordinates (Lat/Lng) cast to FLOAT64 for high precision in Power BI
    - Standardize city and state strings for consistency with other tables
    - REGEXP_REPLACE used to remove symbols while keeping accented letters and TRIM to remove unnecessary spacing
    - DISTINCT used to remove redundant coordinate pings for the same area
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_geolocation` AS

SELECT
  -- Selects only unique zip codes, zip codes are converted to INT64; note that leading zeros will be dropped
  DISTINCT SAFE_CAST(geolocation_zip_code_prefix AS INT64) AS geolocation_zip_code_prefix,

  -- Coordinates must be FLOAT64 to keep decimal percision for maps
  SAFE_CAST(geolocation_lat AS FLOAT64) AS geolocation_lat,
  SAFE_CAST(geolocation_lng AS FLOAT64) AS geolocation_lng,

  -- Cities are converted to STRING, stripped of special charcters using REGEXP_REPLACE, stripped of unnecessary spacing, and formatted into tile casing (INTCAP)
  SAFE_CAST(INITCAP(REGEXP_REPLACE(TRIM(geolocation_city), r'[^\p{L}\s]', '')) AS STRING) AS geolocation_city,

  -- States are converted to STRING, stripped of unnecessary spacing, and formatted as uppercase (e.g CA)
  SAFE_CAST(UPPER(TRIM(geolocation_state)) AS STRING) AS geolocation_state
FROM `olist-360-e-commerce.raw_data.raw_olist_geolocation`

-- Make data rows only show if the location is within the normal latitude and longitude range
WHERE
  (geolocation_lat BETWEEN -90 AND 90) AND
  (geolocation_lng BETWEEN -180 AND 180)