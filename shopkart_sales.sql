-- ============================================
-- SHOPKART SALES ANALYSIS PROJECT
-- Database: MySQL
-- ============================================

CREATE DATABASE IF NOT EXISTS shopkart_sales;
USE shopkart_sales;


-- ============================================
-- 1. CUSTOMERS TABLE
-- ============================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);


-- ============================================
-- 2. PRODUCTS TABLE
-- ============================================

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
);


-- ============================================
-- 3. ORDERS TABLE
-- ============================================

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),

    CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);


-- ============================================
-- 4. ORDER ITEMS TABLE
-- ============================================

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,

    CONSTRAINT fk_order_items_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT fk_order_items_products
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);


-- ============================================
-- 5. PAYMENTS TABLE
-- ============================================

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_amount DECIMAL(10,2),
    payment_status VARCHAR(30),

    CONSTRAINT fk_payments_orders
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);


-- ============================================
-- 6. CUSTOMERS DATA
-- ============================================

INSERT INTO customers
(customer_name, email, city, signup_date)
VALUES
('RAHUL KUMAR','rahul@gmail.com','DELHI','2026-01-05'),
('AMAN VERMA','aman@gmail.com','MUMBAI','2026-01-10'),
('PRIYA SINGH','priya@gmail.com','LUCKNOW','2026-01-12'),
('NEHA GUPTA','neha@gmail.com','JAIPUR','2026-01-15'),
('ARJUN MEHTA','arjun@gmail.com','PUNE','2026-01-18'),
('SNEHA PATEL','sneha@gmail.com','AHMEDABAD','2026-01-22'),
('ROHIT KUMAR','rohit@gmail.com','DELHI','2026-02-01'),
('ANJALI SHARMA','anjali@gmail.com','LUCKNOW','2026-02-05'),
('KARAN MALHOTRA','karan@gmail.com','MUMBAI','2026-02-10'),
('POOJA VERMA','pooja@gmail.com','JAIPUR','2026-02-14'),
('VIKRAM SINGH','vikram@gmail.com','DELHI','2026-02-18'),
('SIMRAN KAUR','simran@gmail.com','CHANDIGARH','2026-02-22'),
('ADITYA JAIN','aditya@gmail.com','PUNE','2026-03-01'),
('RIYA KAPOOR','riya@gmail.com','MUMBAI','2026-03-05'),
('MOHIT YADAV','mohit@gmail.com','LUCKNOW','2026-03-09'),
('NISHA SHARMA','nisha@gmail.com','DELHI','2026-03-12'),
('SAURABH GUPTA','saurabh@gmail.com','AHMEDABAD','2026-03-15'),
('KAVYA MEHTA','kavya@gmail.com','PUNE','2026-03-18'),
('MANISH PATEL','manish@gmail.com','SURAT','2026-03-22'),
('DIVYA JOSHI','divya@gmail.com','JAIPUR','2026-03-25');


-- ============================================
-- 7. PRODUCTS DATA
-- ============================================

INSERT INTO products
(product_name, category, price, stock_quantity)
VALUES
('Laptop','Electronics',55000.00,25),
('Wireless Mouse','Electronics',1200.00,80),
('Keyboard','Electronics',1800.00,60),
('Smartphone','Electronics',28000.00,35),
('Headphones','Electronics',2500.00,50),
('Smart Watch','Electronics',4500.00,40),
('Backpack','Fashion',1800.00,70),
('Running Shoes','Fashion',3200.00,45),
('T-Shirt','Fashion',900.00,100),
('Jeans','Fashion',2200.00,65),
('Office Chair','Furniture',8500.00,20),
('Study Table','Furniture',7000.00,15),
('Water Bottle','Lifestyle',700.00,120),
('Coffee Mug','Lifestyle',500.00,100),
('Notebook','Stationery',250.00,150);


-- ============================================
-- 8. ORDERS DATA
-- ============================================

INSERT INTO orders
(customer_id, order_date, order_status)
VALUES
(1,'2026-04-01','Delivered'),
(2,'2026-04-02','Delivered'),
(3,'2026-04-03','Pending'),
(4,'2026-04-05','Delivered'),
(5,'2026-04-06','Cancelled'),
(6,'2026-04-08','Delivered'),
(7,'2026-04-10','Delivered'),
(8,'2026-04-11','Pending'),
(9,'2026-04-13','Delivered'),
(10,'2026-04-15','Delivered'),
(1,'2026-04-18','Delivered'),
(11,'2026-04-20','Delivered'),
(12,'2026-04-22','Cancelled'),
(13,'2026-04-25','Delivered'),
(14,'2026-04-27','Pending'),
(15,'2026-05-01','Delivered'),
(2,'2026-05-03','Delivered'),
(16,'2026-05-05','Delivered'),
(17,'2026-05-07','Pending'),
(18,'2026-05-10','Delivered'),
(3,'2026-05-12','Delivered'),
(19,'2026-05-15','Cancelled'),
(20,'2026-05-17','Delivered'),
(4,'2026-05-20','Delivered'),
(5,'2026-05-22','Delivered'),
(6,'2026-05-25','Pending'),
(7,'2026-05-27','Delivered'),
(9,'2026-05-29','Delivered'),
(10,'2026-06-01','Delivered'),
(1,'2026-06-03','Delivered');


-- ============================================
-- 9. ORDER ITEMS DATA
-- ============================================

INSERT INTO order_items
(order_id, product_id, quantity)
VALUES
(1,1,1),
(1,2,2),
(2,4,1),
(2,5,1),
(3,7,2),
(4,11,1),
(4,14,2),
(5,3,1),
(6,6,1),
(6,13,2),
(7,8,1),
(7,9,2),
(8,10,1),
(9,1,1),
(9,3,1),
(10,5,2),
(11,4,1),
(11,2,1),
(12,12,1),
(12,15,3),
(13,7,1),
(14,1,1),
(14,6,1),
(15,9,3),
(16,10,2),
(16,13,1),
(17,4,1),
(17,5,1),
(18,11,1),
(18,14,2),
(19,2,2),
(20,6,1),
(20,8,1),
(21,1,1),
(21,15,5),
(22,3,2),
(23,12,1),
(23,13,2),
(24,7,2),
(24,9,1),
(25,4,1),
(25,5,1),
(26,10,1),
(27,2,1),
(27,3,1),
(28,8,2),
(28,14,1),
(29,1,1),
(29,6,1),
(30,11,1),
(30,15,4);


-- ============================================
-- 10. PAYMENTS DATA
-- ============================================

INSERT INTO payments
(order_id, payment_date, payment_method, payment_amount, payment_status)
VALUES
(1,'2026-04-01','UPI',57400.00,'Success'),
(2,'2026-04-02','Card',30500.00,'Success'),
(3,'2026-04-03','UPI',3600.00,'Pending'),
(4,'2026-04-05','Card',9500.00,'Success'),
(5,'2026-04-06','UPI',1800.00,'Failed'),
(6,'2026-04-08','Cash',5900.00,'Success'),
(7,'2026-04-10','UPI',5000.00,'Success'),
(8,'2026-04-11','Card',2200.00,'Pending'),
(9,'2026-04-13','Card',56800.00,'Success'),
(10,'2026-04-15','UPI',5000.00,'Success'),
(11,'2026-04-18','UPI',29200.00,'Success'),
(12,'2026-04-20','Card',7750.00,'Success'),
(13,'2026-04-25','UPI',1800.00,'Success'),
(14,'2026-04-25','Card',59500.00,'Success'),
(15,'2026-04-27','UPI',2700.00,'Pending'),
(16,'2026-05-01','Card',2900.00,'Success'),
(17,'2026-05-03','UPI',30500.00,'Success'),
(18,'2026-05-05','Card',8500.00,'Success'),
(19,'2026-05-07','UPI',1800.00,'Pending'),
(20,'2026-05-10','Card',7700.00,'Success'),
(21,'2026-05-12','UPI',56250.00,'Success'),
(22,'2026-05-15','UPI',3600.00,'Failed'),
(23,'2026-05-17','Card',8400.00,'Success'),
(24,'2026-05-20','UPI',3100.00,'Success'),
(25,'2026-05-22','Card',30500.00,'Success'),
(26,'2026-05-25','UPI',2200.00,'Pending'),
(27,'2026-05-27','Card',3000.00,'Success'),
(28,'2026-05-29','UPI',6900.00,'Success'),
(29,'2026-06-01','Card',59500.00,'Success'),
(30,'2026-06-03','UPI',9500.00,'Success');


-- ============================================
-- 11. ANALYSIS QUERIES
-- ============================================

-- Total Sales
SELECT SUM(price * quantity) AS total_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id;


-- Category-wise Sales
SELECT category,
       SUM(price * quantity) AS total_sales
FROM order_items
JOIN products
ON order_items.product_id = products.product_id
GROUP BY category
ORDER BY SUM(price * quantity) DESC;


-- Most Sold Products
SELECT product_name,
       SUM(quantity) AS total_quantity_sold
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY SUM(quantity) DESC;


-- Product-wise Revenue
SELECT product_name,
       SUM(price * quantity) AS total_revenue
FROM products
JOIN order_items
ON products.product_id = order_items.product_id
GROUP BY product_name
ORDER BY SUM(price * quantity) DESC;


-- Customer-wise Order Count
SELECT customer_name,
       COUNT(order_id) AS total_orders
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customer_name
ORDER BY COUNT(order_id) DESC;