## 🧩 SQL Common Table Expression (CTE)
A Common Table Expression (CTE) is a temporary result set that you can reference within a SQL query.

CTEs make queries:

- 📖 More readable
- 🧠 Easier to maintain
- 🔁 Reusable within the same query
- 🚀 Better structured than complex subqueries

CTEs are defined using the `WITH` keyword.

### 🧠 Basic Syntax
```sql
WITH cte_name AS (
    SELECT column1, column2
    FROM table_name
)
SELECT *
FROM cte_name;
```

---

```sql
USE salesDB;

--Step1:nFind the total sales per customer

WITH CTE_Total_Sales AS
(
SELECT
     CustomerID,
     Sum(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
--Main Query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID
ORDER BY CustomerID

--Step1:nFind the total sales per customer (standalone CTE)

WITH CTE_Total_Sales AS
(
SELECT
     CustomerID,
     Sum(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
--STEP2: Find the last order date for each customer
, CTE_Last_Order AS
(
SELECT  
     CustomerID,
     MAX(OrderDate) AS Last_Order
FROM sales.Orders
GROUP BY CustomerID
)
--Main Query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Last_Order
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_order clo
ON clo.CustomerID = c.CustomerID

--Step1:nFind the total sales per customer (standalone CTE)

WITH CTE_Total_Sales AS
(
SELECT
     CustomerID,
     Sum(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
--STEP2: Find the last order date for each customer
, CTE_Last_Order AS
(
SELECT  
     CustomerID,
     MAX(OrderDate) AS Last_Order
FROM sales.Orders
GROUP BY CustomerID
)
--Step3: Rank customer based on Total Sales Per Customer
, CTE_Customer_Rank AS
(
SELECT
CustomerID,
TotalSales,
RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales
)

--Main Query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Last_Order,
CCR.CustomerRank
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_order clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID = c.CustomerID

--Step1: Find the total sales per customer (standalone CTE)

WITH CTE_Total_Sales AS
(
SELECT
     CustomerID,
     Sum(Sales) AS TotalSales
FROM Sales.Orders
GROUP BY CustomerID
)
--STEP2: Find the last order date for each customer
, CTE_Last_Order AS
(
SELECT  
     CustomerID,
     MAX(OrderDate) AS Last_Order
FROM sales.Orders
GROUP BY CustomerID
)
--Step3: Rank customer based on Total Sales Per Customer
, CTE_Customer_Rank AS
(
SELECT
CustomerID,
TotalSales,
RANK() OVER (ORDER BY TotalSales DESC) AS CustomerRank
FROM CTE_Total_Sales
)
--Step:4 segment customers based on their total sales
, CTE_Customer_Segments AS
(
SELECT
CustomerID,
CASE WHEN TotalSales > 100 THEN 'High'
     WHEN TotalSales > 50 THEN 'Medium'
     ELSE 'Low'
END CustomerSegments
FROM CTE_Total_Sales
)

--Main Query
SELECT
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSales,
clo.Last_Order,
ccr.CustomerRank,
ccs.CustomerSegments
FROM Sales.Customers c
LEFT JOIN CTE_Total_Sales cts
ON cts.CustomerID = c.CustomerID
LEFT JOIN CTE_Last_order clo
ON clo.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Rank ccr
ON ccr.CustomerID = c.CustomerID
LEFT JOIN CTE_Customer_Segments ccs
ON ccs.CustomerID = c.CustomerID
```