-- Database and Table setup
CREATE DATABASE retail_db;

DROP TABLE IF EXISTS sales;
CREATE TABLE sales (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    customer_id VARCHAR(10),
    gender VARCHAR(10),
    age INT,
    product_category VARCHAR(20),
    quantity INT,
    price_per_unit INT,
    total_amount INT
);

-- Data Analysis
-- Task 1: Sales per month
SELECT EXTRACT(MONTH FROM transaction_date) AS month, 
    COUNT(*) AS month_count
FROM sales
GROUP BY month
ORDER BY month;

-- Task 2: Average age of customers
SELECT AVG(age)
FROM sales;

-- Task 3: Average order value per customer
SELECT AVG(total_amount)
FROM sales;

-- Task 4: Most purchased product categories
SELECT product_category, COUNT(*) AS category_count
FROM sales
GROUP BY product_category;

-- Task 5: Highest sale volume per product category
SELECT product_category, 
    SUM(total_amount) as total_sales
FROM sales
GROUP BY product_category
ORDER BY total_sales DESC;

-- Task 6: Sales by gender
SELECT gender, COUNT(*) as order_count
FROM sales
GROUP BY gender;

-- Task 7: Average order value by gender
SELECT gender, AVG(total_amount)
FROM SALES
GROUP BY gender;

-- Task 8: Sales in Q1 (Jan-Mar)
SELECT EXTRACT(MONTH FROM transaction_date) AS month,
    SUM(total_amount) AS sales_total
FROM SALES
WHERE EXTRACT(MONTH FROM transaction_date) < 4
GROUP BY EXTRACT(MONTH FROM transaction_date) 
ORDER By EXTRACT(MONTH FROM transaction_date);

-- Task 9: Top 5 highest paying customers
SELECT customer_id, SUM(total_amount) AS total_spent
FROM sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Task 10: Sales count by product category and gender
SELECT product_category, gender, COUNT(*) as sales_count
FROM sales
GROUP BY product_category, gender
ORDER BY product_category, gender;