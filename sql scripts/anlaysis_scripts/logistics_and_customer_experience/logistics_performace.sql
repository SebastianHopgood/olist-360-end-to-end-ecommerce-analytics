CREATE OR REPLACE VIEW `olist-360-e-commerce.data_views.logistics_performance` AS

SELECT
  -- Dimension: Categorizing metrics by state to identify regional bottlenecks
  dc.customer_state, 

  -- Metric: Average Lead Time (Purchase to Delivery) rounded for dashboard readability
  ROUND(AVG(ofact.lead_time_days), 1) AS avg_lead_time_days,

  -- Metric: Absolute volume of orders failing the 'Estimated Delivery Date' threshold
  COUNTIF(ofact.shipping_delays = 'Delayed') AS total_late_orders,

  -- KPI: 'Late %' (Failure Rate), essential for normalizing performance across states with different order volumes
  ROUND(
      COUNTIF(ofact.shipping_delays = 'Delayed') * 100 / COUNT(ofact.order_id), 
      1
    ) AS pct_late_orders

FROM `olist-360-e-commerce.analytical_data.orders_fact` AS ofact

-- Links the Fact table to the Customer Dimension for geographic context
LEFT JOIN `olist-360-e-commerce.analytical_data.dim_customers` AS dc
  ON ofact.customer_id = dc.customer_id

-- Focused strictly on 'Delivered' orders to ensure lead time metrics are final
WHERE ofact.order_status = 'Delivered' 

GROUP BY 1 

-- Prioritizing/sorting problem areas (highest failure rates) at the top of the report
ORDER BY pct_late_orders DESC;
