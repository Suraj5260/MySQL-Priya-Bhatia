-- 1. create a ndatabase named ecommerce_sales_data
CREATE DATABASE IF NOT EXISTS ecommerce_sales_data
SHOW DATABASES
USE ecommerce_sales_data
DESC DATABASES

-- 2. create a table inside the database named "ecommerce_sales_data"
-- command to generate SQL File(): csvsql --dialect mysql --snifflimit 10000 Sales_Dataset.csv > Result.sql
CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);

SHOW TABLES

DESC Sales_Dataset

-- 3. Load the data available in Sale_Dataset.csv file to the salaes_Dataset table
-- Famous error: MySQL is running at secure-file-private error

LOAD DATA INFILE 'D:/coding/sql Priya Bhatia/queries/Sales_Dataset.csv'
INTO TABLE Sales_Dataset
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Sales_Dataset

-- Identify the top 3 states with highest shipping costs
-- state highest_sum_shipping_cost

SELECT state , SUM(shipping_cost) AS highest_sum_shipping_cost
FROM Sales_Dataset
GROUP BY state
ORDER BY  highest_sum_shipping_cost DESC LIMIT 3

-- Common table Expressions(CTE) - Complexity of any given query + Reusability of the query
-- it makes a virtual table
WITH states  AS (
	SELECT state , SUM(shipping_cost) AS highest_sum_shipping_cost
	FROM Sales_Dataset
	GROUP BY state
	ORDER BY  highest_sum_shipping_cost DESC LIMIT 3
)SELECT * FROM states  -- use SELECT as soon as () ends

-- whenever u see a lot of subqueries or alot of joins then go for CTE

 