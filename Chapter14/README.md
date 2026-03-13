## 🏆 SQL Window Ranking Functions

Window Ranking Functions in SQL assign a rank or position to rows within a result set based on a specified ordering.

These functions are extremely useful when you want to:

📊 Rank data
🥇 Find top performers
🔢 Generate row numbers
🧠 Handle ties differently depending on the function used

All ranking functions use the `OVER()` clause.

### 🧠 Syntax
```sql
RANKING_FUNCTION() OVER(
    PARTITION BY column_name
    ORDER BY column_name
)
```

### 🔍 Comparison of Ranking Functions
| Function       | Duplicate Rank | Skips Rank Numbers |
| -------------- | -------------- | ------------------ |
| `ROW_NUMBER()` | ❌ No           | ❌ No               |
| `RANK()`       | ✅ Yes          | ✅ Yes              |
| `DENSE_RANK()` | ✅ Yes          | ❌ No               |

### 🚀 When to Use What
| Use Case            | Function       |
| ------------------- | -------------- |
| Unique numbering    | `ROW_NUMBER()` |
| Competition ranking | `RANK()`       |
| Continuous ranking  | `DENSE_RANK()` |


```sql
--Rank the orders based on their sales from highest to lowest
USE SalesDB;

SELECT 
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row
FROM Sales.Orders

--Rank
SELECT 
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,
    RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank
FROM Sales.Orders

--DENSE Rank
SELECT 
    OrderID,
    ProductID,
    Sales,
    ROW_NUMBER() OVER(ORDER BY Sales DESC) SalesRank_Row,
    RANK() OVER(ORDER BY Sales DESC) SalesRank_Rank,
    DENSE_Rank() OVER(ORDER BY Sales DESC) SalesRank_Dense
FROM Sales.Orders

--Find the top highest sales for each product
SELECT
      OrderID,
      ProductID,
      Sales,
ROW_Number() OVER (PARTITION BY ProductID ORDER BY Sales DESC) RankByProduct
FROM Sales.Orders

SELECT *
FROM(
SELECT
      OrderID,
      ProductID,
      Sales,
ROW_Number() OVER (PARTITION BY ProductID ORDER BY Sales DESC) RankByProduct
FROM Sales.Orders
)t WHERE RankByProduct = 1

--Find the lowest 2 customers based on their total sales
SELECT
      CustomerID,
      SUM(Sales) TotalSales,
      ROW_NUMBER() OVER(ORDER BY Sum(Sales)) RankCustomers
FROM Sales.Orders
GROUP BY
CustomerID

SELECT *
FROM(
SELECT
      CustomerID,
      SUM(Sales) TotalSales,
      ROW_NUMBER() OVER(ORDER BY Sum(Sales)) RankCustomers
FROM Sales.Orders
GROUP BY
CustomerID
)t WHERE RankCustomers <= 2

-- Assign unique IDs to the rows of the 'Orders Archive' table
SELECT
ROW_NUMBER() OVER (ORDER BY OrderID, OrderDate) UniqueID,
*
From Sales.OrdersArchive

-- Identify duplicate row in the table 'Orders Archive'
-- and return a clean result without any duplicayes
SELECt
ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) rn,
*
FROM Sales.OrdersArchive

SELECT * FROM(
SELECt
ROW_NUMBER() OVER (PARTITION BY OrderID ORDER BY CreationTime DESC) rn,
*
FROM Sales.OrdersArchive
)t WHERE rn=1


-- Find the products that fail within the highest 40% of the prices
SELECt
     Product,
     Price,
     CUME_DIST() OVER (ORDER BY PRice DESC) DistRank
FROM Sales.Products

SELECT
*
FROM(
SELECt
     Product,
     Price,
     CUME_DIST() OVER (ORDER BY PRice DESC) DistRank
FROM Sales.Products
)t WHERE DistRank <= 0.4

SELECT
*,
CONCAT(DistRank * 100, '%') DistRankPerc
FROM(
SELECt
     Product,
     Price,
     CUME_DIST() OVER (ORDER BY PRice DESC) DistRank
FROM Sales.Products
)t WHERE DistRank <= 0.4

SELECT
*,
CONCAT(DistRank * 100, '%') DistRankPerc
FROM(
SELECt
     Product,
     Price,
     PERCENT_RANK() OVER (ORDER BY PRice DESC) DistRank
FROM Sales.Products
)t WHERE DistRank <= 0.4

--NTILE 
SELECT
   OrderID,
   Sales,
   NTILE(4) OVER (ORDER BY Sales DESC) FourBucket,
   NTILE(3) OVER (ORDER BY Sales DESC) ThreeBucket,
   NTILE(2) OVER (ORDER BY Sales DESC) TwoBucket,
   NTILE(1) OVER (ORDER BY Sales DESC) OneBucket
FROM Sales.Orders

--Segment all orders into 3 categories: high , medium and low sales.
SELECT
     OrderID,
     Sales,
     NTILE(3) OVER (ORDER BY Sales DESC) Buckets
FROM Sales.Orders

SELECT
*,
CASE WHEN Buckets = 1 THEN 'High'
     WHEN Buckets = 2 THEN 'Medium'
     WHEN Buckets = 3 THEN 'Low'
END SalesSegmentations
FROM (
    SELECT
         OrderID,
         Sales,
         NTILE(3) OVER (ORDER BY Sales DESC) Buckets
    FROM Sales.Orders
)t 

--In order to export the data, divide the orders into 2 groups:
SELECT
NTILE(2) OVER (ORDER BY OrderID) Buckets,
*
FROM Sales.Orders
```