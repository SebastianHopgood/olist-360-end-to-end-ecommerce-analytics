/*
STEP 1: SHIPPING STATUS CLASSIFICATION
*/

-- Create a new column to store shipping performance status
ALTER TABLE `olist-360-e-commerce.analytical_data.orders_fact`
ADD COLUMN shipping_delays STRING;

-- Classify orders based on actual delivery date vs. the date promised to the customer
UPDATE `olist-360-e-commerce.analytical_data.orders_fact`
SET shipping_delays = CASE
  -- Handle missing dates to avoid inaccurate calculations
  WHEN order_delivered_customer_date IS NULL 
       OR order_estimated_delivery_date IS NULL THEN 'unknown'
  -- If delivery occurred after the estimated date, mark as Delayed
  WHEN order_estimated_delivery_date < order_delivered_customer_date THEN 'Delayed'
  -- Otherwise, mark as On-Time
  ELSE 'On-Time'
END
WHERE shipping_delays IS NULL;

/*
STEP 2: SELLER EFFICIENCY (PROCESSING TIME)
*/

-- Create column for seller processing duration
ALTER TABLE `olist-360-e-commerce.analytical_data.orders_fact`
ADD COLUMN seller_processing_days INT64;

-- Calculate days between payment approval and handover to logistics provider
UPDATE `olist-360-e-commerce.analytical_data.orders_fact`
SET seller_processing_days = TIMESTAMP_DIFF(order_delivered_carrier_date, order_approved_at, DAY)
-- Only calculate for valid shipping stages with non-null timestamps
WHERE order_status IN ('Delivered', 'Shipped')
  AND order_approved_at IS NOT NULL 
  AND order_delivered_carrier_date IS NOT NULL;

/*
STEP 3: DELIVERY PROMISE ANALYSIS (EXPECTED LEAD TIME)
*/


 
 
  -- Create column for the total expected delivery duration
ALTER TABLE `olist-360-e-commerce.analytical_data.orders_fact`
ADD COLUMN estimated_delivery_days INT64;

-- Calculate the total window of time between purchase and the estimated delivery date
UPDATE `olist-360-e-commerce.analytical_data.orders_fact`
SET estimated_delivery_days = TIMESTAMP_DIFF(
    order_estimated_delivery_date, 
    order_purchase_timestamp,     
    DAY
)
WHERE order_estimated_delivery_date IS NOT NULL 
  AND order_purchase_timestamp IS NOT NULL;