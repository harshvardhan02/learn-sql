# 📊 SQL Aggregate Functions

SQL Aggregate Functions are used to perform calculations on a set of values and return a single value.

These functions are commonly used with the `GROUP BY` clause to summarize data.

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

## Another Example

```sql
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;
```

---

