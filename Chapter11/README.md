# 🔀 CASE WHEN Statement – SQL Guide

## 📌 Overview
The `CASE WHEN` statement is used to implement **conditional logic** in SQL.
It works like an **IF–ELSE** statement and is supported by **SQL Server, MySQL, and all major databases**.

---

## 🧩 Syntax

```sql
CASE
  WHEN condition1 THEN result1
  WHEN condition2 THEN result2
  ELSE result
END
```

### Example Query

```sql
SELECT 
order_id,
sales,
CASE
	WHEN sales >= 35 THEN 'HIGH'
    WHEN sales >= 20 THEN 'MEDIUM'
    ELSE 'LOW'
END Category
FROM orders;
```
---

```sql
SELECT
Category,
SUM(sales) as TotalSales
FROM(
	SELECT 
	order_id,
	sales,
	CASE
		WHEN sales >= 35 THEN 'HIGH'
		WHEN sales >= 20 THEN 'MEDIUM'
		ELSE 'LOW'
	END Category
	FROM orders
)t -- this must be written for sub query
GROUP BY Category
ORDER BY TotalSales DESC;
```