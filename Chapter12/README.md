# 📊 SQL Aggregate Functions

## 🔑 Common SQL Aggregate Functions
- `COUNT()` → Counts rows
- `SUM()` → Adds values
- `AVG()` → Calculates average
- `MIN()` → Finds smallest value
- `MAX()` → Finds largest value

```sql
SELECT
COUNT(*) AS total_nr_orders,
SUM(sales) AS total_sales,
AVG(sales) AS avg_sales,
MIN(sales) AS lowes_sales,
MAX(sales) AS highest_sales
FROM orders
GROUP BY customer_id
```