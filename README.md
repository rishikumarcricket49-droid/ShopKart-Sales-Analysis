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

The project includes 25 SQL analyses covering sales, products, customers, orders, payments, and business performance.

### 1. 💰 Total Sales

Calculates the total sales value generated from products sold.

```sql
SELECT 
    SUM(price * quantity) AS total_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id;

##2.🏆 Category-wise Sales

SELECT 
    category,
    SUM(price * quantity) AS category_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY category_sales DESC;

3. 📦 Most Sold Products

SELECT 
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY total_quantity_sold DESC;

4. 💵 Product-wise Revenue

SELECT 
    product_name,
    SUM(price * quantity) AS revenue
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY revenue DESC;

5. 👥 Customer-wise Order Analysis

SELECT 
    customer_name,
    COUNT(order_id) AS total_orders
FROM customers;
SELECT 
    customer_name,
    SUM(price * quantity) AS total_revenue
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customer_name
ORDER BY total_revenue DESC;
SELECT
    MONTH(order_date) AS month,
    SUM(price * quantity) AS total_sales
FROM orders
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY MONTH(order_date)
ORDER BY month;
SELECT
    order_status,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;
SELECT
    payment_method,
    COUNT(payment_id) AS total_payments
FROM payments
GROUP BY payment_method
ORDER BY total_payments DESC;
SELECT
    payment_status,
    COUNT(payment_id) AS total_payments
FROM payments
GROUP BY payment_status
ORDER BY total_payments DESC;
SELECT
    AVG(order_total) AS average_order_value
FROM (
    SELECT
        order_id,
        SUM(price * quantity) AS order_total
    FROM order_items
    JOIN products
        ON order_items.product_id = products.product_id
    GROUP BY order_id
) AS order_summary;
SELECT
    customer_name,
    SUM(price * quantity) AS total_revenue
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customer_name
ORDER BY total_revenue DESC
LIMIT 5;
SELECT
    MONTH(order_date) AS month,
    SUM(price * quantity) AS total_sales
FROM orders
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY MONTH(order_date)
ORDER BY month;
SELECT
    SUM(payment_amount) AS total_successful_payment
FROM payments
WHERE payment_status = 'Success';
SELECT
    COUNT(DISTINCT orders.order_id) AS cancelled_orders,
    SUM(price * quantity) AS cancelled_order_value
FROM orders
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
WHERE order_status = 'Cancelled';
SELECT
    category,
    SUM(quantity) AS total_quantity_sold
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY category
ORDER BY total_quantity_sold DESC;
SELECT
    product_name,
    SUM(quantity) AS total_quantity_sold
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;
SELECT
    category,
    AVG(price) AS average_price
FROM products
GROUP BY category
ORDER BY average_price DESC;
SELECT
    product_name,
    category,
    stock_quantity
FROM products
WHERE stock_quantity < 30
ORDER BY stock_quantity ASC;
SELECT
    city,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY city
ORDER BY total_customers DESC;
SELECT
    MONTH(signup_date) AS month,
    COUNT(customer_id) AS new_customers
FROM customers
GROUP BY MONTH(signup_date)
ORDER BY month;
SELECT
    customer_name,
    SUM(price * quantity) AS total_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customer_name
ORDER BY total_order_value DESC;
SELECT
    order_status,
    COUNT(order_id) AS total_orders,
    ROUND(
        COUNT(order_id) * 100.0 / (SELECT COUNT(*) FROM orders),
        2
    ) AS order_percentage
FROM orders
GROUP BY order_status
ORDER BY order_percentage DESC;
SELECT
    payment_method,
    SUM(payment_amount) AS total_payment_amount
FROM payments
WHERE payment_status = 'Success'
GROUP BY payment_method
ORDER BY total_payment_amount DESC;
SELECT
    MONTH(order_date) AS month,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY month;
SELECT
    product_name,
    SUM(price * quantity) AS total_revenue
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 5;
SELECT
    city,
    SUM(price * quantity) AS total_revenue
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY city
ORDER BY total_revenue DESC;
SELECT
    customer_name,
    COUNT(order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customer_name
HAVING COUNT(order_id) >= 2
ORDER BY total_orders DESC;
SELECT
    customer_name,
    COUNT(order_id) AS total_orders
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY customer_name
HAVING COUNT(order_id) >= 2
ORDER BY total_orders DESC;
SELECT
    customer_name,
    ROUND(SUM(price * quantity) / COUNT(DISTINCT orders.order_id), 2) AS average_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
GROUP BY customer_name
ORDER BY average_order_value DESC;
SELECT
    SUM(price * quantity) AS delivered_sales
FROM orders
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id
WHERE order_status = 'Delivered';
SELECT
    category,
    SUM(quantity) AS total_quantity_sold,
    SUM(price * quantity) AS total_sales
FROM products
JOIN order_items
    ON products.product_id = order_items.product_id
GROUP BY category
ORDER BY total_sales DESC;
SELECT
    COUNT(DISTINCT orders.order_id) AS total_orders,
    COUNT(DISTINCT customers.customer_id) AS total_customers,
    COUNT(DISTINCT products.product_id) AS total_products,
    SUM(order_items.quantity) AS total_units_sold,
    SUM(products.price * order_items.quantity) AS total_sales
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id
JOIN order_items
    ON orders.order_id = order_items.order_id
JOIN products
    ON order_items.product_id = products.product_id;
