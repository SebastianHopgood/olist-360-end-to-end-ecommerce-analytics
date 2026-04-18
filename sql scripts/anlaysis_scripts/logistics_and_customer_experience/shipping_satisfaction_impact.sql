CREATE OR REPLACE VIEW `olist-360-e-commerce.data_views.shipping_satisfaction_impact` AS

SELECT 
    -- Groups data into two simple categories for dashboard comparison
    ofact.shipping_delays AS delivery_status,
    
    -- Metric: Average review score per group (1.0 to 5.0)
    ROUND(AVG(ofact.review_score), 2) AS avg_review_score,
    
    -- Volume check: Ensures sample sizes are significant for each group
    COUNT(ofact.order_id) AS total_orders

FROM `olist-360-e-commerce.analytical_data.orders_fact` AS ofact

-- Ensure we only analyze orders that actually have a customer rating
WHERE ofact.review_score IS NOT NULL

GROUP BY 1
ORDER BY avg_review_score DESC;
