/* 
Logic Overview:
  - Financial Accuracy: Casts payment values to FLOAT64 and rounds to 2 decimals for precise revenue tracking
  - String Normalization: Standardizes payment types by replacing underscores with spaces and applying 
    Title Case (INITCAP) for professional reporting
  - Join Compatibility: Trims and force-lowers Order IDs to ensure a 100% match with the staged_orders table
  - Data Validation: Enforces business rules by filtering out negative payments and ensures 
    every record has a valid ID
  - Deduplication: Uses DISTINCT to remove redundant transaction records and prevent inflated revenue metrics
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.staged_data.staged_order_payments` AS

SELECT DISTINCT
  -- Standardized ID: Trimmed and lowered for consistent joins across the schema
  SAFE_CAST(LOWER(TRIM(order_id)) AS STRING) AS order_id,

  -- Payment Metadata: Ensures sequence and installment counts are stored as integer
  SAFE_CAST(payment_sequential AS INT64) AS payment_sequential,

  -- Category Cleaning: Replaces underscores and applies Title Case (e.g., 'credit_card' -> 'Credit Card')
  SAFE_CAST(INITCAP(REPLACE(TRIM(payment_type), '_', ' ')) AS STRING) AS payment_type,

  -- Installment Data: Cast to INT64 for numeric analysis in Power BI
  SAFE_CAST(payment_installments AS INT64) AS payment_installments,

  -- Revenue Metric: Rounded to 2 decimal places for financial consistency
  ROUND(SAFE_CAST(payment_value AS FLOAT64),2) AS payment_value
FROM `olist-360-e-commerce.raw_data.raw_olist_order_payments`

WHERE 
  -- Ensure payment sequence and installments are logically non-negative
  payment_sequential >= 0 AND
  payment_installments >= 0 AND

  -- Exclude records with negative payment values to maintain accounting integrity
  payment_value >= 0.00 AND

  -- Data Integrity: Ensures every payment record is linked to a valid order
  order_id IS NOT NULL;
