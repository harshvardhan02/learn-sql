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

