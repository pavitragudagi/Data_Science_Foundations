
CREATE DATABASE instacart;
USE instacart;

-- =========- Create Tables============
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    aisle_id INT,
    department_id INT
);

CREATE TABLE aisles (
    aisle_id INT PRIMARY KEY,
    aisle VARCHAR(255)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department VARCHAR(255)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    eval_set VARCHAR(50),
    order_number INT,
    order_dow INT,
    order_hour_of_day INT,
    days_since_prior_order INT
);

CREATE TABLE order_products (
    order_id INT,
    product_id INT,
    add_to_cart_order INT,
    reordered INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- =========- Create  table=====================

CREATE TABLE product_backup LIKE products;

-- ===============Insert manual records=================
INSERT INTO product_backup VALUES (50001, 'Sample Product A', 1, 1),
                                  (50002, 'Sample Product B', 2, 2),
                                  (50003, 'Sample Product C', 3, 3);


-- =============Update product names=================

UPDATE product_backup
SET product_name = CONCAT(product_name, '_new')
WHERE department_id = 1;

-- ======================SECTION A=========================
-- 1. Create backup table
CREATE TABLE product_backup LIKE products;

-- 2. Insert 3 manual records
INSERT INTO product_backup VALUES
(50001, 'Sample Product A', 1, 1),
(50002, 'Sample Product B', 2, 2),
(50003, 'Sample Product C', 3, 3);

-- 3. Update product_name
UPDATE product_backup
SET product_name = CONCAT(product_name, '_new')
WHERE department_id = 1;

-- 4. Delete products
DELETE FROM products
WHERE product_id > 50000;

-- 5. Orders placed on order_dow between 1 and 3
SELECT * FROM orders
WHERE order_dow BETWEEN 1 AND 3;

-- 6. Products where product_name LIKE 'A%'
SELECT * FROM products
WHERE product_name LIKE 'A%';

-- 7. Orders not in hours 0–3
SELECT * FROM orders
WHERE order_hour_of_day NOT IN (0,1,2,3);

-- 8. Top 15 products by product_id
SELECT * FROM products
ORDER BY product_id
LIMIT 15;

-- 9. Aggregate functions
SELECT MIN(order_hour_of_day) AS min_hour,
       MAX(order_hour_of_day) AS max_hour,
       AVG(order_hour_of_day) AS avg_hour,
       COUNT(order_id) AS total_orders,
       SUM(days_since_prior_order) AS sum_days
FROM orders;

-- 10. Orders with days_since_prior_order between 5 and 10
SELECT * FROM orders
WHERE days_since_prior_order BETWEEN 5 AND 10;

-- ============================SECTION B=======================
-- 11. Count products per department
SELECT department_id, COUNT(*) AS product_count
FROM products
GROUP BY department_id;

-- 12. Count products per aisle
SELECT aisle_id, COUNT(*) AS product_count
FROM products
GROUP BY aisle_id;

-- 13. Total orders per user
SELECT user_id, COUNT(*) AS total_orders
FROM orders
GROUP BY user_id;

-- 14. Departments with >500 products
SELECT department_id, COUNT(*) AS product_count
FROM products
GROUP BY department_id
HAVING COUNT(*) > 500;

-- 15. Average days_since_prior_order per user
SELECT user_id, AVG(days_since_prior_order) AS avg_days
FROM orders
GROUP BY user_id;

-- 16. Total reordered items per product
SELECT product_id, SUM(reordered) AS total_reordered
FROM order_products
GROUP BY product_id;

-- 17. Departments with >1000 products
SELECT department_id, COUNT(*) AS product_count
FROM products
GROUP BY department_id
HAVING COUNT(*) > 1000;

--  ======================SECTION C=======================
-- 18. Product name, aisle, department
SELECT p.product_name, a.aisle, d.department
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
JOIN departments d ON p.department_id = d.department_id;

-- 19. Order_id, user_id, product_name
SELECT o.order_id, o.user_id, p.product_name
FROM orders o
JOIN order_products op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id;

-- 20. Department name and total products
SELECT d.department, COUNT(p.product_id) AS total_products
FROM departments d
LEFT JOIN products p ON d.department_id = p.department_id
GROUP BY d.department;

-- 21. All aisles even if no products
SELECT a.aisle, COUNT(p.product_id) AS product_count
FROM aisles a
LEFT JOIN products p ON a.aisle_id = p.aisle_id
GROUP BY a.aisle;

-- 22. User_id and total products purchased
SELECT o.user_id, COUNT(op.product_id) AS total_products_purchased
FROM orders o
JOIN order_products op ON o.order_id = op.order_id
GROUP BY o.user_id;

-- ======================SECTION D========================
-- 23. Department name and total products ordered
SELECT d.department, COUNT(op.product_id) AS total_products_ordered
FROM order_products op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department;

-- 24. Top 5 most ordered products
SELECT p.product_name, COUNT(op.order_id) AS total_orders
FROM order_products op
JOIN products p ON op.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_orders DESC
LIMIT 5;

-- 25. Department name and total reordered products
SELECT d.department, SUM(op.reordered) AS total_reordered
FROM order_products op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department;

-- 26. Aisle name and distinct products ordered
SELECT a.aisle, COUNT(DISTINCT op.product_id) AS distinct_products_ordered
FROM order_products op
JOIN products p ON op.product_id = p.product_id
JOIN aisles a ON p.aisle_id = a.aisle_id
GROUP BY a.aisle;

-- 27. User_id and total reordered items
SELECT o.user_id, SUM(op.reordered) AS total_reordered_items
FROM orders o
JOIN order_products op ON o.order_id = op.order_id
GROUP BY o.user_id;

-- 28. Department name and avg products added per order
SELECT d.department, AVG(op.add_to_cart_order) AS avg_products_per_order
FROM order_products op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department;

-- 29. Busiest hour of the day
SELECT order_hour_of_day, COUNT(order_id) AS total_orders
FROM orders
GROUP BY order_hour_of_day
ORDER BY total_orders DESC
LIMIT 1;

-- 30. Department and weekend orders
SELECT d.department, COUNT(o.order_id) AS weekend_orders
FROM orders o
JOIN order_products op ON o.order_id = op.order_id
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
WHERE o.order_dow IN (0,6)
GROUP BY d.department;

-- 31. User_id and unique products purchased
SELECT o.user_id, COUNT(DISTINCT op.product_id) AS unique_products
FROM orders o
JOIN order_products op ON o.order_id = op.order_id
GROUP BY o.user_id;

-- 32. Top 3 departments with max reordered items
SELECT d.department, SUM(op.reordered) AS total_reordered
FROM order_products op
JOIN products p ON op.product_id = p.product_id
JOIN departments d ON p.department_id = d.department_id
GROUP BY d.department
ORDER BY total_reordered DESC
LIMIT 3;

