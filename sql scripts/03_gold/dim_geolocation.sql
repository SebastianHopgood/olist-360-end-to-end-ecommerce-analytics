/*
SCRIPT: Create Geolocation Dimension Table
PURPOSE: Deduplicates spatial data to provide unique coordinates per zip prefix
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.analytical_data.dim_geolocation` AS

SELECT
  -- Grouping by prefix to represent neighborhood-level centers
  -- This approach protects PII (Personally Identifiable Information) while 
  -- maintaining geographic accuracy for strategic mapping
  geolocation_zip_code_prefix,

  -- DATA AGGREGATION: 
  -- Uses AVG to find the central Latitude and Longitude for each zip prefix.
  -- This resolves the "One-to-Many" issue where a single prefix has multiple 
  -- recorded coordinates, ensuring a clean 1:1 join with customer/seller dims.
  AVG(geolocation_lat) AS geolocation_lat,
  AVG(geolocation_lng) AS geolocation_lng
FROM `olist-360-e-commerce.staged_data.staged_geolocation`
GROUP BY geolocation_zip_code_prefix

/* 
NOTE ON DATA CLEANING & OPTIMIZATION: 
The raw geolocation table contains over 1M rows with significant redundancy
By aggregating to the zip_code_prefix level:
1. Row count is reduced by ~98%, significantly improving map rendering speed
2. "Ghost" row multiplication is prevented when joining to customer/seller tables
3. City and State columns were removed to avoid redundancy, as these attributes 
   are already managed in the primary Customer and Seller dimensions
*/