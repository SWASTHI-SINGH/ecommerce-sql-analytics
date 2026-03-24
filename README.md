# E-commerce SQL Analytics Project

## Project Overview
This project analyzes an e-commerce dataset using SQL to understand business performance like revenue, customers, and products.

---

## Objectives
- Find revenue trends
- Identify top customers
- Understand customer behavior
- Analyze product categories
- Check delivery performance

---

## Dataset

- Source: Olist Brazilian E-commerce Dataset (Kaggle)

---Contains:
----100K+ orders
----Customer, product, payment, and delivery data

---

## Tools Used

- PostgreSQL
- SQL (Joins, Aggregations, Window Functions)
- pgAdmin

---

## Database Schema

-- Tables created: customers, orders, order_items, payments, products

---

## Key Analysis and Insights

### 1. Revenue per Order

---Insight: Top order value is 13,664.08, indicating presence of high-value transactions contributing significantly to revenue.

### 2. Top Customer by Revenue

---Insight: Top order value is 13,664.08, indicating presence of high-value transactions contributing significantly to revenue.

### 3. Monthly Revenue Trend 

---Insight: Top customer generated 13,664.08, showing revenue is driven by single high-value purchases rather than repeat customers.

### 4. Cetegory Perfomance

---Insight: Top category beleza_saude generated 1.44M revenue, followed by watches and home products → high dependency on few categories.    

### 5. Customer Behaviour 

---Insight: One-time customers: 93,099 (Repeat customers: 2,997)

👉 Indicates very low retention

### 6. Customer Ranking 

---Insight: A small group of customers contributes disproportionately high revenue → VIP targeting opportunity.

### 7. Average Order Value

---Insight: AOV ≈ 160.57, indicating moderate spending per transaction.

### 8. Delivery Performance

---Insight: Average delivery time ≈ 12.5 days, suggesting moderate logistics efficiency.

## Key Business Insights 

-- Revenue growth driven by increase in order volume
-- Business heavily depends on few product categories
-- Customer retention is very low (major concern)
-- Presence of high-value customers (VIP segment)
-- Delivery time can be optimized for better experience

## Conclusion:-

- The business shows strong growth but faces challenges in customer retention and category dependency. Strategic focus on customer loyalty and category diversification can improve long-term sustainability.