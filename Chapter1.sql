USE MyDatabase;

-- Find all the data from the customers table
SELECT *
From customers 

-- Find only the first name and country name of customers
SELECT first_name, country
From customers 

-- Find the first name, country, and score of customers with a score greater than 500
SELECT *
From customers 
WHERE Score > 500

-- Find all the data with ASCENDING and DESCENDING order of customers based on their score
SELECT *
From customers 
ORDER BY country ASC, score DESC

-- Find the total score of customers from each country
SELECT 
	country,
    SUM(score) AS score
FROM customers
GROUP BY country

-- Find count of customers from each country
SELECT 
	country,
    SUM(score) AS score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country