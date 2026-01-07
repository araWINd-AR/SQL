-- Use database
USE youtube;


-- Drop tables if they already exist
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS customers;

-- Create customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(30),
    city VARCHAR(30)
);

-- Create orders table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(30),
    amount INT
);

-- Insert data into customers table
INSERT INTO customers VALUES
(1, 'Arjun',   'Hyderabad'),
(2, 'Sneha',   'Bangalore'),
(3, 'Rahul',   'Chennai'),
(4, 'Priya',   'Mumbai');

-- Insert data into orders table
INSERT INTO orders VALUES
(101, 1, 'Laptop',   60000),
(102, 1, 'Mouse',     1500),
(103, 2, 'Mobile',   25000),
(104, 3, 'Tablet',   30000),
(105, 5, 'Keyboard',  2000);

-- View customers table
SELECT * FROM customers;

-- View orders table
SELECT * FROM orders;


-- INNER JOIN
-- Show customers who have placed orders
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id;


-- LEFT JOIN
-- Show all customers, even if they have not placed any order
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id;


-- RIGHT JOIN
-- Show all orders, even if customer details are missing
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;


-- FULL JOIN (MySQL workaround using UNION)
-- Show all customers and all orders
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id

UNION

SELECT customers.customer_name, orders.product, orders.amount
FROM customers
RIGHT JOIN orders
ON customers.customer_id = orders.customer_id;


-- JOIN with WHERE condition
-- Orders with amount greater than 20,000
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.amount > 20000;


-- JOIN with ORDER BY
-- Sort orders by amount (highest first)
SELECT customers.customer_name, orders.product, orders.amount
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
ORDER BY orders.amount DESC;


-- JOIN with aggregation
-- Total order amount per customer
SELECT customers.customer_name, SUM(orders.amount) AS total_spent
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_name;


-- Customers who have NOT placed any orders
SELECT customers.customer_name
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;



