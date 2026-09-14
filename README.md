# 🛒 ShopKart Sales Analysis

## 📌 Project Overview

ShopKart Sales Analysis is a MySQL-based sales analysis project built using an e-commerce dataset.

The project analyzes customers, products, orders, order items, and payments to answer real-world business questions and generate useful sales insights.

### 🎯 Project Objectives

- Analyze overall sales performance
- Identify top-selling products
- Compare category-wise revenue
- Analyze customer ordering patterns
- Understand order and payment trends
- Generate business insights using SQL

### 🛠️ Tools & Technologies

- MySQL
- SQL
- GitHub

---

## 📊 Database Structure

The project contains 5 related tables:

1. Customers
2. Products
3. Orders
4. Order Items
5. Payments

---

## 1. 👥 Customers

Stores customer information.

| Column | Description |
|---|---|
| `customer_id` | Unique customer ID |
| `customer_name` | Customer name |
| `email` | Customer email |
| `city` | Customer city |
| `signup_date` | Registration date |

---

## 2. 📦 Products

Stores product information.

| Column | Description |
|---|---|
| `product_id` | Unique product ID |
| `product_name` | Product name |
| `category` | Product category |
| `price` | Product price |
| `stock_quantity` | Available stock |

---

## 3. 🛍️ Orders

Stores customer order information.

| Column | Description |
|---|---|
| `order_id` | Unique order ID |
| `customer_id` | Customer who placed the order |
| `order_date` | Date of order |
| `order_status` | Order status |

---

## 4. 🧾 Order Items

Stores products included in each order.

| Column | Description |
|---|---|
| `order_item_id` | Unique order-item ID |
| `order_id` | Related order |
| `product_id` | Related product |
| `quantity` | Quantity purchased |

---

## 5. 💳 Payments

Stores payment information.

| Column | Description |
|---|---|
| `payment_id` | Unique payment ID |
| `order_id` | Related order |
| `payment_date` | Payment date |
| `payment_method` | UPI / Card / Cash |
| `payment_amount` | Amount paid |
| `payment_status` | Payment status |

---

## 🔗 Database Relationships

```text
Customers
    │
    │ customer_id
    ▼
Orders
    │
    │ order_id
    ▼
Order_Items
    │
    │ product_id
    ▼
Products
Orders
    │
    │ order_id
    ▼
Payments
---

## 🔍 Business Questions

This project uses SQL to answer real-world business questions such as:

- What is the total sales revenue?
- Which product generates the highest revenue?
- Which products are sold the most?
- Which category generates the highest sales?
- Which customers place the most orders?
- What is the order status distribution?
- Which payment methods are used most frequently?
- Which customers contribute the most revenue?

---
   

## 🧠 SQL Concepts Used

- `SELECT`
- `WHERE`
- `GROUP BY`
- `ORDER BY`
- Aggregate Functions
- `SUM()`
- `COUNT()`
- `AVG()`
- `INNER JOIN`
- `LEFT JOIN`
- `CASE`
- Subqueries
- Date Functions

---
---

## 📈 Key Analysis

### 💰 Sales Analysis

- Total sales revenue
- Category-wise sales
- Product-wise revenue

### 📦 Product Analysis

- Most sold products
- Highest revenue-generating products
- Product performance by category

### 👥 Customer Analysis

- Customer-wise order count
- Top customers by orders
- Customer purchasing patterns

### 🛍️ Order Analysis

- Order status distribution
- Delivered, Pending and Cancelled orders
- Order trends

### 💳 Payment Analysis

- Payment methods
- Successful and failed payments
- Payment amount analysis

---
---

## 📊 Key Results

Based on the SQL analysis performed on the ShopKart dataset:

| Metric | Result |
|---|---:|
| 💰 Total Sales | ₹5,18,200 |
| 🏆 Top Sales Category | Electronics — ₹4,33,700 |
| 📦 Most Sold Product | Notebook — 12 units |
| 💵 Highest Revenue Product | Laptop — ₹2,75,000 |
| 👤 Top Customer by Orders | RAHUL KUMAR — 3 orders |

### 💡 Business Insights

- **Electronics** generates the highest sales among all categories.
- **Laptop** is the highest revenue-generating product.
- **Notebook** has the highest sales quantity, with 12 units sold.

- **RAHUL KUMAR** has the highest number of orders, with 3 orders.
- The analysis helps identify high-performing products, categories, and customers.

---
---

## 💻 SQL Analysis Showcase

### 1. 💰 Total Sales

Calculates the total revenue generated from products sold.

```sql
SELECT 
    SUM(price * quantity) AS total_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id;
SELECT 
    category,
    SUM(price * quantity) AS category_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY category_sales DESC;
SELECT 
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY total_quantity_sold DESC;
SELECT 
    product_name,
    SUM(price * quantity) AS revenue
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY revenue DESC;
SELECT 
    customer_name,
    COUNT(order_id) AS total_orders
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customer_name
ORDER BY total_orders DESC;
