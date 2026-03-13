## 🔄 SQL Window LEAD() & LAG() Functions

`LEAD()` and `LAG()` are window functions used to access data from next or previous rows in a result set without using self joins.

These functions are extremely useful for:

📈 Trend analysis
📊 Comparing rows
🔁 Finding previous or next values
💹 Calculating differences between rows

Both functions use the `OVER()` clause.

### 🧠 Syntax
### ⬅️ LAG()
```sql
LAG(column_name, offset, default_value)
OVER(
    PARTITION BY column_name
    ORDER BY column_name
)
```

### ➡️ LEAD()
```sql
LEAD(column_name, offset, default_value)
OVER(
    PARTITION BY column_name
    ORDER BY column_name
)
```

### 🔹 Parameters
| Parameter       | Description                         |
| --------------- | ----------------------------------- |
| `column_name`   | Column whose value we want          |
| `offset`        | Number of rows before/after         |
| `default_value` | Value returned if row doesn't exist |


```sql
--Window Value Functions

USE SalesDB;

--Window LEAD & LAG
-- Analyze the month-over-month performance by finding the percentage change
-- In sales between the current and previous months 
SELECT
     OrderID,
     OrderDate,
     MONTH(OrderDate) OrderMonth
FROM Sales.Orders

SELECT
     MONTH(OrderDate) OrderMonth,
     SUM(Sales) CurrentMonthSales,
     LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
     MONTH(OrderDate)

SELECT
*,
CurrentMonthSales - PreviousMonthSales AS MOM_Change,
ROUND(CAST((CurrentMonthSales - PreviousMonthSales) AS FLOAT)/PreviousMonthSales *100 , 1) AS MOM_Perc
FROM(
SELECT
     MONTH(OrderDate) OrderMonth,
     SUM(Sales) CurrentMonthSales,
     LAG(SUM(Sales)) OVER (ORDER BY MONTH(OrderDate)) PreviousMonthSales
FROM Sales.Orders
GROUP BY 
     MONTH(OrderDate)
)t

--In order to analyze customer loyalty,
--rank customers based on the average days between their orders
SELECt
    OrderID,
    CustomerID,
    OrderDate
FROM Sales.Orders
ORDER BY CustomerID, OrderDate

SELECt
    OrderID,
    CustomerID,
    OrderDate CurrentOrder,
    LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) NextOrder
FROM Sales.Orders
ORDER BY CustomerID, OrderDate

SELECt
    OrderID,
    CustomerID,
    OrderDate CurrentOrder,
    LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) NextOrder,
    DATEDIFF(day,OrderDate, LEAD(OrderDate) OVER (PARTITION BY CUstomerID ORDER BY OrderDate)) DaysUntilNextOrder
FROM Sales.Orders
ORDER BY CustomerID, OrderDate

SELECT
CustomerID,
AVG(DaysUntilNextOrder) AvgDays,
RANK() OVER (ORDER BY COALESCE(AVG(DaysUntilNextOrder),999999)) RankAvg
FROM (
    SELECt
        OrderID,
        CustomerID,
        OrderDate CurrentOrder,
        LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) NextOrder,
        DATEDIFF(day,OrderDate, LEAD(OrderDate) OVER (PARTITION BY CUstomerID ORDER BY OrderDate)) DaysUntilNextOrder
    FROM Sales.Orders
)t
GROUP BY 
    CustomerID

--Find the average shipping duration in  days for each month
SELECT
   OrderID,
   OrderDate,
   ShipDate,
   (DATEDIFF(day, OrderDate, ShipDate)) Day2Ship
FROM Sales.Orders

SELECT
   MONTH(OrderDate)AS OrderDate,
   AVG(DATEDIFF(day, OrderDate, ShipDate)) AvgShip
FROM Sales.Orders
GROUP BY MONTH(OrderDate)

--Time Gap Analysis
--Find the number of days between each order and the previoud order
SELECT
   OrderId,
   OrderDate CurrentOrderDate,
   LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate
FROM Sales.Orders

SELECT
   OrderId,
   OrderDate CurrentOrderDate,
   LAG(OrderDate) OVER (ORDER BY OrderDate) PreviousOrderDate,
   DATEDIFF(day, LAG(OrderDate) OVER (ORDER BY OrderDate), OrderDate) NrOfDays
FROM Sales.Orders

-- Find the lowest and highest sales for each product
SELECT
   OrderID,
   ProductID,
   Sales,
   FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales) LowestSales,
   LAST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales
   ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) HighestSales,
   FIRST_VALUE(Sales) OVER (PARTITION BY ProductID ORDER BY Sales DESC) HighestSales2,
   MIN(Sales) OVER (PARTITION BY ProductID) LowestSales2,
   MAX(Sales) OVER (PARTITION BY ProductID) HighestSales3
FROM Sales.Orders
```