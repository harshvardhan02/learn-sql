# Window Aggregate Functions

## 🔢 SQL Window COUNT() Function

The `COUNT()` Window Function is used to count rows without grouping them into a single result.

Unlike `GROUP BY`, Window Functions:

✅ Keep all original rows
✅ Add calculated values beside each row
✅ Work using the `OVER()` clause

### 🧠 Basic Syntax
```sql
COUNT(column_name)
OVER (
    PARTITION BY column_name
)
```
### 🔍 Key Concepts
| Keyword        | Meaning                  |
| -------------- | ------------------------ |
| `COUNT()`      | Counts rows              |
| `OVER()`       | Defines the window       |
| `PARTITION BY` | Divides rows into groups |

### 📦 Example Tables
📋 `orders`
| order_id | order_date | customer_id |
| -------- | ---------- | ----------- |
| 101      | 2024-01-01 | 1           |
| 102      | 2024-01-02 | 2           |
| 103      | 2024-01-03 | 1           |
| 104      | 2024-01-04 | 3           |
| 105      | 2024-01-05 | 2           |

👥 `customers`
| customer_id | name  | country | score |
| ----------- | ----- | ------- | ----- |
| 1           | Rahul | India   | 80    |
| 2           | Neha  | India   | 75    |
| 3           | John  | USA     | NULL  |
| 4           | Maria | Spain   | 90    |

### 📊 1️⃣ Total Orders Using Window COUNT()
```sql
SELECT
Order_id,
Order_date,
COUNT(*) OVER() TotalOrders
FROM orders;
```
📤 Result
| order_id | order_date | totalorders |
| -------- | ---------- | ----------- |
| 101      | 2024-01-01 | 5           |
| 102      | 2024-01-02 | 5           |
| 103      | 2024-01-03 | 5           |
| 104      | 2024-01-04 | 5           |
| 105      | 2024-01-05 | 5           |

### 💡 Explanation
`COUNT(*) OVER()` counts all rows in the table.
The value is repeated for every row because the window covers the entire dataset.

### 🧑‍💼 2️⃣ Orders Per Customer
```sql
SELECT
Order_id,
Order_date,
COUNT(*) OVER() TotalOrders,
COUNT(*) OVER(PARTITION BY customer_id) OrdersByCustomers
FROM orders;
```

### 📤 Result
| order_id | order_date | totalorders | ordersbycustomers |
| -------- | ---------- | ----------- | ----------------- |
| 101      | 2024-01-01 | 5           | 2                 |
| 103      | 2024-01-03 | 5           | 2                 |
| 102      | 2024-01-02 | 5           | 2                 |
| 105      | 2024-01-05 | 5           | 2                 |
| 104      | 2024-01-04 | 5           | 1                 |

### 💡 Explanation
Two window calculations are happening:
| Expression                                | Meaning               |
| ----------------------------------------- | --------------------- |
| `COUNT(*) OVER()`                         | Total orders in table |
| `COUNT(*) OVER(PARTITION BY customer_id)` | Orders per customer   |

### 👥 3️⃣ Total Customers
```sql
SELECT
*,
COUNT(*) OVER () TotalCustomers
FROM customers;
```

### 📤 Result
| customer_id | name  | country | score | totalcustomers |
| ----------- | ----- | ------- | ----- | -------------- |
| 1           | Rahul | India   | 80    | 4              |
| 2           | Neha  | India   | 75    | 4              |
| 3           | John  | USA     | NULL  | 4              |
| 4           | Maria | Spain   | 90    | 4              |

### 💡 Explanation
`COUNT(*) OVER()` counts all rows in the customers table.
Total customers = 4.

### 🎯 4️⃣ Counting Non-NULL Scores
```sql
SELECT
*,
COUNT(*) OVER () TotalCustomers,
COUNT(score) OVER () TotalScore
FROM customers;
```

### 📤 Result
| customer_id | name  | country | score | totalcustomers | totalscore |
| ----------- | ----- | ------- | ----- | -------------- | ---------- |
| 1           | Rahul | India   | 80    | 4              | 3          |
| 2           | Neha  | India   | 75    | 4              | 3          |
| 3           | John  | USA     | NULL  | 4              | 3          |
| 4           | Maria | Spain   | 90    | 4              | 3          |

### 💡 Explanation
Important difference:
| Function       | Behavior            |
| -------------- | ------------------- |
| `COUNT(*)`     | Counts all rows     |
| `COUNT(score)` | Ignores NULL values |

### 🌍 5️⃣ Counting Non-NULL Countries
```sql
SELECT
*,
COUNT(*) OVER () TotalCustomers,
COUNT(score) OVER () TotalScore,
COUNT(country) OVER () TotalCountry
FROM customers;
```
### 💡 Explanation
-- `COUNT(country)` counts non-NULL country values
-- Since all rows have country values, the result is 4

### Other Examples
```sql
SELECT 
   order_id,
COUNT(*) OVER(PARTITION BY order_id) CheckPK
FROM orders

SELECT
  country,
  COUNT(*) OVER(PARTITION BY country) CheckPK
FROM customers

SELECT
*
FROM (
SELECT
  country,
  COUNT(*) OVER(PARTITION BY country) CheckPK
FROM customers
)t WHERE CheckPK > 1
```

### ⚠️ Important Rule
| Expression      | Result              |
| --------------- | ------------------- |
| `COUNT(*)`      | Counts all rows     |
| `COUNT(column)` | Ignores NULL values |

### 🧠 Quick Summary
| Query                             | Purpose               |
| --------------------------------- | --------------------- |
| `COUNT(*) OVER()`                 | Total rows            |
| `COUNT(*) OVER(PARTITION BY col)` | Count per group       |
| `COUNT(column) OVER()`            | Count non-NULL values |

---

## ➕ SQL Window SUM() Function
The `SUM()` Window Function calculates the total of numeric values across a window of rows while still keeping each original row in the result.

Unlike `GROUP BY`, Window Functions:

✅ Do not collapse rows
✅ Perform calculations across related rows
✅ Return a value for every row

### 🧠 Syntax
```sql
SUM(column_name)
OVER (
    PARTITION BY column_name
)
```

### 🔍 Components
| Clause         | Description              |
| -------------- | ------------------------ |
| `SUM()`        | Adds numeric values      |
| `OVER()`       | Defines the window       |
| `PARTITION BY` | Divides rows into groups |

### 📦 Example Table
| order_id | order_date | sales | customer_id |
| -------- | ---------- | ----- | ----------- |
| 101      | 2024-01-01 | 200   | 1           |
| 102      | 2024-01-02 | 150   | 2           |
| 103      | 2024-01-03 | 300   | 1           |
| 104      | 2024-01-04 | 250   | 3           |
| 105      | 2024-01-05 | 100   | 2           |

### 📊 1️⃣ Total Sales and Sales Per Customer
```sql
SELECT
  order_id,
  order_date,
  sales,
  customer_id,
  SUM(sales) OVER () TotalSales,
  SUM(sales) OVER (PARTITION BY customer_id) SalesByCustomers
FROM orders;
```

### 📤 Result
| order_id | order_date | sales | customer_id | totalsales | salesbycustomers |
| -------- | ---------- | ----- | ----------- | ---------- | ---------------- |
| 101      | 2024-01-01 | 200   | 1           | 1000       | 500              |
| 103      | 2024-01-03 | 300   | 1           | 1000       | 500              |
| 102      | 2024-01-02 | 150   | 2           | 1000       | 250              |
| 105      | 2024-01-05 | 100   | 2           | 1000       | 250              |
| 104      | 2024-01-04 | 250   | 3           | 1000       | 250              |

### 💡 Explanation
Two calculations are performed:
| Expression                                  | Meaning                             |
| ------------------------------------------- | ----------------------------------- |
| `SUM(sales) OVER()`                         | Total sales across the entire table |
| `SUM(sales) OVER(PARTITION BY customer_id)` | Total sales per customer            |

### 📈 2️⃣ Percentage Contribution of Each Sale
```sql
SELECT
OrderID,
ProductID,
Sales,
SUM(Sales) OVER () TotalSales,
ROUND (CAST (Sales AS Float) / SUM(Sales) OVER () * 100, 2) PercentageOfTotal
FROM Sales.Orders;
```

### 📤 Result
| orderid | productid | sales | totalsales | percentageoftotal |
| ------- | --------- | ----- | ---------- | ----------------- |
| 1       | 101       | 200   | 1000       | 20.00             |
| 2       | 102       | 300   | 1000       | 30.00             |
| 3       | 103       | 250   | 1000       | 25.00             |
| 4       | 104       | 150   | 1000       | 15.00             |
| 5       | 105       | 100   | 1000       | 10.00             |

### 🧠 Quick Summary

| Query                             | Purpose       |
| --------------------------------- | ------------- |
| `SUM(col) OVER()`                 | Total sum     |
| `SUM(col) OVER(PARTITION BY col)` | Sum per group |
| `SUM(col) OVER(ORDER BY col)`     | Running total |

---

## 📊 SQL Window AVG() Function
The `AVG()` Window Function calculates the average value across a set of rows while still keeping all original rows in the result.

Unlike `GROUP BY`, window functions:

✅ Keep every row in the dataset
✅ Add analytical values beside each row
✅ Work using the `OVER()` clause

### 🧠 Syntax
```sql
AVG(column_name)
OVER (
    PARTITION BY column_name
)
```

### 1️⃣ Average Sales Across All Orders
```sql
-- Window AVG
USE SalesDB;

SELECT
   OrderID,
   OrderDate,
   Sales,
   AVG(Sales) OVER () AvgSales
FROM Sales.Orders
```

### 📤 Result
| orderid | orderdate  | sales | avgsales |
| ------- | ---------- | ----- | -------- |
| 1       | 2024-01-01 | 200   | 200      |
| 2       | 2024-01-02 | 300   | 200      |
| 3       | 2024-01-03 | 250   | 200      |
| 4       | 2024-01-04 | 150   | 200      |
| 5       | 2024-01-05 | 100   | 200      |

### 2️⃣ Average Sales Per Product
```sql
SELECT
   OrderID,
   OrderDate,
   Sales,
   AVG(Sales) OVER () AvgSales,
   AVG(Sales) OVER (PARTITION BY ProductID) AvgSalesByProducts
FROM Sales.Orders
```

### 📤 Result
| orderid | orderdate  | sales | avgsales | avgsalesbyproducts |
| ------- | ---------- | ----- | -------- | ------------------ |
| 1       | 2024-01-01 | 200   | 200      | 225                |
| 3       | 2024-01-03 | 250   | 200      | 225                |
| 2       | 2024-01-02 | 300   | 200      | 200                |
| 5       | 2024-01-05 | 100   | 200      | 200                |
| 4       | 2024-01-04 | 150   | 200      | 150                |

### 3️⃣ Handling NULL Values in AVG()
```sql
SELECT
  CustomerID,
  LastName,
  Score,
  COALESCE(Score,0) CustomerScore,
  AVG(Score) OVER () AvgScore,
  AVG(COALESCE(Score,0)) OVER () AvgScoreWithoutNull
FROM Sales.Customers
```

### 📤 Result
| customerid | lastname | score | customerscore | avgscore | avgscorewithoutnull |
| ---------- | -------- | ----- | ------------- | -------- | ------------------- |
| 1          | Smith    | 80    | 80            | 81.67    | 61.25               |
| 2          | Kumar    | 75    | 75            | 81.67    | 61.25               |
| 3          | Garcia   | NULL  | 0             | 81.67    | 61.25               |
| 4          | Lee      | 90    | 90            | 81.67    | 61.25               |

### 📈 4️⃣ Find Orders Above Average Sales
```sql
SELECT
  OrderID,
  ProductID,
  Sales,
  AVG(Sales) OVER() AvgSales
FROM Sales.Orders
```

### 📤 Result
| orderid | productid | sales | avgsales |
| ------- | --------- | ----- | -------- |
| 1       | 101       | 200   | 200      |
| 2       | 102       | 300   | 200      |
| 3       | 101       | 250   | 200      |
| 4       | 103       | 150   | 200      |
| 5       | 102       | 100   | 200      |

### 5️⃣ Filter Orders Greater Than Average
```sql
SELECT
*
FROM(
SELECT
  OrderID,
  ProductID,
  Sales,
  AVG(Sales) OVER() AvgSales
FROM Sales.Orders
)t WHERE Sales > AvgSales
```

### 📤 Result
| orderid | productid | sales | avgsales |
| ------- | --------- | ----- | -------- |
| 2       | 102       | 300   | 200      |
| 3       | 101       | 250   | 200      |

### 🧠 Quick Summary
| Query                             | Purpose                         |
| --------------------------------- | ------------------------------- |
| `AVG(col) OVER()`                 | Average of entire dataset       |
| `AVG(col) OVER(PARTITION BY col)` | Average per group               |
| `AVG(COALESCE(col,0))`            | Handle NULL values              |
| Subquery filter                   | Filter rows using window result |

---

## 🔽🔼 SQL Window `MIN()` and `MAX()` Functions

The **`MIN()` and `MAX()` Window Functions** are used to find the **lowest and highest values** across a window of rows while still **keeping every row in the result set**.

Unlike `GROUP BY`, window functions:

- ✅ Keep all rows in the result
- ✅ Add analytical values beside each row
- ✅ Use the `OVER()` clause to define the window

---

### 🧠 Syntax

```sql
MIN(column_name) OVER (PARTITION BY column_name)

MAX(column_name) OVER (PARTITION BY column_name)
```

### 🔍 Components
| Clause         | Description                |
| -------------- | -------------------------- |
| `MIN()`        | Returns the smallest value |
| `MAX()`        | Returns the largest value  |
| `OVER()`       | Defines the window         |
| `PARTITION BY` | Splits rows into groups    |

### 1️⃣ Highest and Lowest Sales Across All Orders
```sql
-- Window Min & Max
USE SalesDB;

SELECT
OrderID,
OrderDate,
ProductID,
MAX(Sales) OVER() HighestSales,
MIN(Sales) OVER() LowestSales
FROM Sales.Orders
```
### 💡 Explanation
`MAX(Sales) OVER()` → Finds the highest sales value in the entire table
`MIN(Sales) OVER()` → Finds the lowest sales value in the entire table
Both values appear in every row.

### 2️⃣ Highest and Lowest Sales Per Product
```sql
SELECT
OrderID,
OrderDate,
ProductID,
Sales,
MAX(Sales) OVER() HighestSales,
MIN(Sales) OVER() LowestSales,
MAX(Sales) OVER(PARTITION BY ProductID) HighestSalesByProduct,
MIN(Sales) OVER(PARTITION BY ProductID) LowestSalesByProduct
FROM Sales.Orders
```

### 💡 Explanation
Two levels of calculation happen:

🧠 Quick Summary
| Function                          | Purpose                  |
| --------------------------------- | ------------------------ |
| `MAX(col) OVER()`                 | Highest value in dataset |
| `MIN(col) OVER()`                 | Lowest value in dataset  |
| `MAX(col) OVER(PARTITION BY col)` | Highest value per group  |
| `MIN(col) OVER(PARTITION BY col)` | Lowest value per group   |

### 👨‍💼 Employees With Highest Salary
```sql
SELECT
*
FROM(
   SELECT
   *,
   MAX(Salary) OVER() HighestSalary
   FROM Sales.Employees
)t WHERE Salary = HighestSalary
```

### 💡 Explanation
Steps:
1️⃣ The inner query calculates the maximum salary in the table.
2️⃣ The outer query filters employees where:

```sql
Salary = HighestSalary
```
This returns only employees with the highest salary.

### 📉 Deviation From Minimum and Maximum Sales
```sql
SELECT
   OrderID,
   OrderDate,
   ProductID,
   Sales,
   MAX(Sales) OVER() HighestSales,
   MIN(Sales) OVER() LowestSales,
   Sales - MIN(Sales) OVER() DeviationFromMin,
   MAX(Sales) OVER() - Sales DeviationFromMax
FROM Sales.Orders
```

### 💡 Explanation
Two calculations are performed:

| Formula              | Meaning                    |
| -------------------- | -------------------------- |
| `Sales - MIN(Sales)` | Distance from lowest sale  |
| `MAX(Sales) - Sales` | Distance from highest sale |

### 📊 Moving Average & Rolling Average
Window functions can also calculate moving averages over time.
```sql
SELECT
  OrderID,
  ProductID,
  OrderDate,
  Sales,
  AVG(Sales) OVER (PARTITION BY ProductID) AvgByProduct,
  AVG(Sales) OVER (PARTITION BY ProductID ORDER BY OrderDate) MovingAvg,
  AVG(Sales) OVER (
      PARTITION BY ProductID 
      ORDER BY OrderDate 
      ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING
  ) RollingAvg
FROM Sales.Orders
```

### 💡 Explanation
| Expression                                 | Meaning                              |
| ------------------------------------------ | ------------------------------------ |
| `AVG(Sales) OVER(PARTITION BY ProductID)`  | Average sales per product            |
| `ORDER BY OrderDate`                       | Calculates running average over time |
| `ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING` | Includes current row and next row    |



