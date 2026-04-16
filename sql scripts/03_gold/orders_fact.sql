/*
SCRIPT: Create Orders Fact Table
PURPOSE: Consolidates core transaction data into a normalized Star Schema format
*/

CREATE OR REPLACE TABLE `olist-360-e-commerce.analytical_data.orders_fact` AS

SELECT
 -- Primary and Foreign Keys for Star Schema linking
  o.order_id,
  o.customer_id,
  oi.product_id,
  oi.seller_id,
 
 -- Order Status for filtering (e.g., only analyzing 'delivered' orders)
  o.order_status,
 
 -- Timestamps for Time-Series and Logistics analysis
  o.order_purchase_timestamp,
  o.order_approved_at,
  o.order_delivered_carrier_date,
  o.order_delivered_customer_date,
  o.order_estimated_delivery_date,

 -- Line-item details (Grain: One row per item)
  oi.order_item_id,
  oi.price,
  oi.freight_value,
 
 -- Consolidated payment and satisfaction metrics
  op.total_order_payment,
  orv.review_score   

FROM `olist-360-e-commerce.staged_data.staged_orders` AS o

-- Joining items to get product-level pricing
LEFT JOIN `olist-360-e-commerce.staged_data.staged_order_items` AS oi 
  ON o.order_id = oi.order_id

-- DATA CLEANING: Pre-aggregating payments to prevent row duplication
-- This subquery "squashes" multiple payment methods into a single total per order
LEFT JOIN (
    SELECT order_id, SUM(payment_value) AS total_order_payment 
    FROM `olist-360-e-commerce.staged_data.staged_order_payments` 
    GROUP BY order_id
) AS op ON o.order_id = op.order_id

-- Joining reviews to correlate satisfaction with delivery performance
LEFT JOIN `olist-360-e-commerce.staged_data.staged_order_reviews` AS orv 
  ON o.order_id = orv.order_id