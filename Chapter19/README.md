## CTAS & TEMP Tables

```sql
-- Generate a sequence of Numbers from 1 to 20

With Series AS (
    -- Anchor Query
    SELECT
    1 AS MyNumber
    UNION ALL
    --Recursive Query
    SELECT
    MyNumber + 1
    FROM Series
    WHERE MyNumber < 50
)
--Main Query
SELECT *
FROM Series
OPTION (MAXRECURSION 100)*/

--Task: Show the employee hierarchy by displaying each employee's level within the 

WITH CTE_Emp_Hierarchy AS
(
    --Anchor Query
    SELECT
        EmployeeID,
        FirstName,
        ManagerID,
        1 AS Level
    FROM Sales.Employees
    WHERE  ManagerID IS Null
    UNION ALL
    --Recursive Query
    SELECT
        e.EmployeeID,
        e.FirstName,
        e.ManagerID,
        Level +1  -- (2 AS Level)
    FROM Sales.Employees AS e
    INNER JOIN CTE_Emp_Hierarchy ceh
    ON e.ManagerID = ceh.EmployeeID
)
--Main Query
SELECT
*
FROM CTE_Emp_Hierarchy


--Find the running total of sales for each month

With CTE_Monthly_Summary AS (
    SELECT
    DATETRUNC(month, OrderDate) OrderMonth,
    SUM(Sales) TotalSale,
    Count(orderID) TotalOrders,
    SUM(Quantity) TotalQuantities
    FROM Sales.Orders
    GROUP BY DATETRUNC(month, OrderDate)
)
SELECT
OrderMonth,
TotalSale,
SUM(TotalSale) OVER (ORDER BY OrderMonth) AS RunningTotal
FROM CTE_Monthly_Summary
```