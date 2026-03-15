## 🔍 SQL Subqueries

A Subquery is a query inside another SQL query.

It is used to retrieve data that will be used by the main query.

Subqueries are extremely useful for:

-- 📊 Filtering data
-- 🧠 Performing multi-step queries
-- 🔎 Comparing values
-- 📈 Data analysis


### 🧠 Basic Syntax
```sql
SELECT column_name
FROM table_name
WHERE column_name OPERATOR (
    SELECT column_name
    FROM table_name
);
```

```sql
--/Task: Find the products that have a price higher than the average price of all products/

-- Main Query

SELECT 
      ProductID,
      Price,
      AVG(Price) OVER () AvgPrice
FROM Sales.Products

--Subquery

SELECT
*
FROM
    (SELECT 
          ProductID,
          Price,
          AVG(Price) OVER () AvgPrice
          FROM Sales.Products)t
WHERE Price > AvgPrice

--Rank Customers based on their total amount of sales

-- Main Query

SELECT
   CustomerID,
   SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY CustomerID

--Subquery

SELECT
*,
RANK() OVER (ORDER BY TotalSales DESC) CustomerRank
FROM(
SELECT
   CustomerID,
   SUM(Sales) TotalSales
FROM Sales.Orders
GROUP BY CustomerID)t

--Show the product IDs, product names, prices, and the total number of orders

-- Main Query
SELECT
   ProductID,
   Product,
   Price,
--Subquery
   (SELECT COUNT(*) FROM Sales.Orders) AS TotalOrders
FROM Sales.Products;

--Show all customer details and find the total orders of each customer

-- Main Query

SELECT
c.*,
o.TotalOrders
FROM Sales.Customers c
LEFT JOIN (
    SELECT    --Subquery
    CustomerID,
    COUNT(*) TotalOrders
    FROM Sales.Orders
    GROUP BY CustomerID) o
ON c.CustomerID = o.CustomerID

--Find the products that have a price higher than the average price of all products

--Main Query
SELECT
ProductID,
Price,
(SELECT AVG(Price) FROM Sales.Products) AvgPrice                  --Subquery
FROM Sales.Products
WHERE Price > (SELECT AVG(Price) FROM Sales.Products)

--Show the details of orders made by customers in Germany

--Main Query

SELECT     
*
FROM Sales.Orders
WHERE CustomerID IN
                (SELECT                    --Subquery
                 CustomerID
                 FROM Sales.Customers
                 WHERE Country != 'Germany')

--Find femal employees whose salaries are greater
--than the salaries of any male employees

SELECT
     EmployeeID,
     FirstName,
     Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ANY (SELECT Salary FROM Sales.Employees WHERE Gender = 'M');

SELECT
     EmployeeID,
     FirstName,
     Salary
FROM Sales.Employees
WHERE Gender = 'M'; 


SELECT
     EmployeeID,
     FirstName,
     Salary
FROM Sales.Employees
WHERE Gender = 'F'
AND Salary > ALL (SELECT Salary FROM Sales.Employees WHERE Gender = 'M');

SELECT
     EmployeeID,
     FirstName,
     Salary
FROM Sales.Employees
WHERE Gender = 'M';

--Show all customer details and find the total orders of each customer

--Main Query
SELECT
*,
(SELECt COUNT(*) FROM Sales.Orders o WHERE o.CustomerID = c.CustomerID) TotalSales
FROM Sales.Customers c

--Show the details of orders made by customers in Germany

SELECT
*
FROM Sales.Orders o
WHERE EXISTS (SELECT 
                *
                FROM Sales.Customers c
                WHERE Country = 'Germany'
                AND o.CustomerID = c.CustomerID)

SELECT
*
FROM Sales.Orders o
WHERE NOT EXISTS (SELECT 1
                FROM Sales.Customers c
                WHERE Country = 'Germany'
                AND o.CustomerID = c.CustomerID)

```
