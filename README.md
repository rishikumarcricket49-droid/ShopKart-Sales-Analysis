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
    │
    │ order_id
    ▼
Payments
