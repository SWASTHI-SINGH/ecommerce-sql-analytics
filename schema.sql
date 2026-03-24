-- =====================================================
-- E-commerce SQL Project - Database Schema
-- =====================================================
-- 1. Customers Table
-- Stores customer location and identity details
-- =====================================================

CREATE TABLE olist_customers (
    customer_id TEXT PRIMARY KEY,
    customer_unique_id TEXT,
    customer_zip_code_prefix INT,
    customer_city TEXT,
    customer_state TEXT
);

-- =====================================================
-- 2. Orders Table
-- Stores order lifecycle timestamps and status
-- =====================================================

CREATE TABLE olist_orders (
    order_id TEXT PRIMARY KEY,
    customer_id TEXT,
    order_status TEXT,
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP
);

-- =====================================================
-- 3. Order Items Table
-- Stores product-level details for each order
-- =====================================================

CREATE TABLE olist_order_items (
    order_id TEXT,
    order_item_id INT,
    product_id TEXT,
    seller_id TEXT,
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2)
);

-- =====================================================
-- 4. Payments Table
-- Stores payment information per order
-- =====================================================

CREATE TABLE olist_order_payments (
    order_id TEXT,
    payment_sequential INT,
    payment_type TEXT,
    payment_installments INT,
    payment_value NUMERIC(10,2)
);

-- =====================================================
-- 5. Products Table
-- Stores product and category details
-- =====================================================

CREATE TABLE olist_products (
    product_id TEXT PRIMARY KEY,
    product_category_name TEXT,
    product_name_lenght INT,
    product_description_lenght INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT
);

-- NOTE: Foreign keys not enforced for simplicity