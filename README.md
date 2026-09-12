# 🛒 ShopKart Sales Analysis

> A MySQL-based sales and orders analysis project built to answer real-world business questions using SQL.

## 📌 Project Overview

ShopKart is a fictional e-commerce business selling products across multiple categories such as Electronics, Fashion, Furniture, Lifestyle, and Stationery.

The goal of this project is to analyze customer orders, product sales, revenue, and purchasing behavior using **MySQL and SQL**.

This project demonstrates practical SQL skills including:

- JOINs
- GROUP BY
- Aggregate Functions
- SUM()
- COUNT()
- ORDER BY
- Foreign Keys
- Business-focused SQL analysis

---

## 🛠️ Tools & Technologies

- **Database:** MySQL
- **Tool:** MySQL Workbench
- **Language:** SQL
- **Version Control:** GitHub

---

## 🗂️ Database Structure

The project contains 5 main tables:

### 1. Customers
Stores customer information.

| Column | Description |
|---|---|
| customer_id | Unique customer ID |
| customer_name | Customer name |
| email | Customer email |
| city | Customer city |
| signup_date | Registration date |

### 2. Products
Stores product information.

| Column | Description |
|---|---|
| product_id | Unique product ID |
| product_name | Product name |
| category | Product category |
| price | Product price |
| stock_quantity | Available stock |

### 3. Orders
Stores customer order information.

| Column | Description |
|---|---|
| order_id | Unique order ID |
| customer_id | Customer who placed the order |
| order_date | Date of order |
| order_status | Order status |

### 4. Order Items
Stores products included in each order.

| Column | Description |
|---|---|
| order_item_id | Unique order-item ID |
| order_id | Related order |
| product_id | Related product |
| quantity | Quantity purchased |

### 5. Payments
Stores payment information.

| Column | Description |
|---|---|
| payment_id | Unique payment ID |
| order_id | Related order |
| payment_date | Payment date |
| payment_method | UPI / Card / Cash |
| payment_amount | Amount paid |
| payment_status | Payment status |

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
