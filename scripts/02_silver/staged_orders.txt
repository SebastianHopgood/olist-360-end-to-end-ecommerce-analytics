/* 
Logic Overview:
  - Time-Series Analysis: Casts 5 lifecycle timestamps to TIMESTAMP format to enable 
    shipping performance and lead-time calculations in the Gold layer.
  - Join Compatibility: Standardizes Order and Customer IDs (LOWER/TRIM) for schema consistency.
  - Status Normalization: Applies Title Case (INITCAP) to order statuses for clean reporting.
  - Deduplication: Uses DISTINCT to ensure every order record is unique.
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_orders` AS

SELECT DISTINCT
  -- Standardized IDs for consistent joins
  SAFE_CAST(LOWER(TRIM(order_id)) AS STRING) AS order_id,
  SAFE_CAST(LOWER(TRIM(customer_id)) AS STRING) AS customer_id,

  -- Formatted for dashboard readability (e.g. 'Delivered')
  SAFE_CAST(INITCAP(TRIM(order_status)) AS STRING) AS order_status,

  -- Lifecycle Timestamps normalized to UTC
  SAFE_CAST(order_purchase_timestamp AS TIMESTAMP) AS order_purchase_timestamp,
  SAFE_CAST(order_approved_at AS TIMESTAMP) AS order_approved_at,
  SAFE_CAST(order_delivered_carrier_date AS TIMESTAMP) AS order_delivered_carrier_date,
  SAFE_CAST(order_delivered_customer_date AS TIMESTAMP) AS order_delivered_customer_date,
  SAFE_CAST(order_estimated_delivery_date AS TIMESTAMP) AS order_estimated_delivery_date
FROM `olist-360-e-commerce.raw_data.raw_olist_orders`;