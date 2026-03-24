-- =====================================================
-- E-commerce SQL Project - Data Analysis Queries
-- Description: Business analysis using Olist dataset
-- =====================================================
-- 1. Revenue per Order
-- Objective: Find highest value orders
-- =====================================================

SELECT 
    order_id,
    SUM(price + freight_value) AS order_value
FROM olist_order_items
GROUP BY order_id
ORDER BY order_value DESC
LIMIT 10;

-- =====================================================
-- 2. Top Customers by Revenue
-- Objective: Identify highest spending customers
-- =====================================================

SELECT 
    c.customer_unique_id,
    SUM(oi.price + oi.freight_value) AS total_revenue
FROM olist_customers c
JOIN olist_orders o 
    ON c.customer_id = o.customer_id
JOIN olist_order_items oi 
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
ORDER BY total_revenue DESC
LIMIT 10;

-- =====================================================
-- 3. Monthly Revenue Trend
-- Objective: Analyze revenue growth over time
-- =====================================================

SELECT 
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(oi.price + oi.freight_value) AS revenue
FROM olist_orders o
JOIN olist_order_items oi 
    ON o.order_id = oi.order_id
GROUP BY month
ORDER BY month;

-- =====================================================
-- 4. Top Product Categories by Revenue
-- Objective: Identify best performing categories
-- =====================================================

SELECT 
    p.product_category_name,
    SUM(oi.price + oi.freight_value) AS revenue
FROM olist_order_items oi
JOIN olist_products p 
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY revenue DESC
LIMIT 10;

-- =====================================================
-- 5. Customer Behavior (Repeat vs One-time)
-- Objective: Understand customer retention
-- =====================================================

SELECT 
    CASE 
        WHEN total_orders = 1 THEN 'One-time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS num_customers
FROM (
    SELECT 
        customer_unique_id,
        COUNT(o.order_id) AS total_orders
    FROM olist_customers c
    JOIN olist_orders o 
        ON c.customer_id = o.customer_id
    GROUP BY customer_unique_id
) t
GROUP BY customer_type;

-- =====================================================
-- 6. Customer Ranking by Revenue
-- Objective: Rank customers based on spending
-- =====================================================

SELECT 
    c.customer_unique_id,
    SUM(oi.price + oi.freight_value) AS total_revenue,
    RANK() OVER (
        ORDER BY SUM(oi.price + oi.freight_value) DESC
    ) AS revenue_rank
FROM olist_customers c
JOIN olist_orders o 
    ON c.customer_id = o.customer_id
JOIN olist_order_items oi 
    ON o.order_id = oi.order_id
GROUP BY c.customer_unique_id
LIMIT 10;

-- =====================================================
-- 7. Average Order Value (AOV)
-- Objective: Measure average customer spend per order
-- =====================================================

SELECT 
    SUM(price + freight_value) / COUNT(DISTINCT order_id) AS avg_order_value
FROM olist_order_items;

-- =====================================================
-- 8. Delivery Time Analysis
-- Objective: Evaluate delivery performance
-- =====================================================

SELECT 
    AVG(order_delivered_customer_date - order_purchase_timestamp) AS avg_delivery_time
FROM olist_orders
WHERE order_delivered_customer_date IS NOT NULL;