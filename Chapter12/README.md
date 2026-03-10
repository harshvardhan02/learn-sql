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

# 🪟 SQL Window Functions
SQL Window Functions perform calculations across a set of table rows related to the current row.

Unlike Aggregate Functions, Window Functions do not collapse rows.
They return a result for each row while keeping the original rows intact.

💡 Think of it like:

"Calculate something across a group but still show every row."

📊 Syntax of Window Function
```sql
function_name(column)
OVER (
    PARTITION BY column
    ORDER BY column
)
```
## 🔍 Components
| Clause         | Description                     |
| -------------- | ------------------------------- |
| `OVER()`       | Defines the window              |
| `PARTITION BY` | Divides rows into groups        |
| `ORDER BY`     | Defines order inside the window |

## 🗂 Example Table
### 📋 `employees`
| id | name  | department | salary |
| -- | ----- | ---------- | ------ |
| 1  | Rahul | IT         | 60000  |
| 2  | Neha  | HR         | 50000  |
| 3  | Aman  | IT         | 70000  |
| 4  | Priya | Finance    | 65000  |
| 5  | Rohan | IT         | 55000  |

## 🔢 1. ROW_NUMBER()
### 📌 Description

ROW_NUMBER() assigns a unique sequential number to each row.
### 🧾 Query
```sql
SELECT name, department, salary,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;
```
📤 Result

| name  | department | salary | row_num |
| ----- | ---------- | ------ | ------- |
| Aman  | IT         | 70000  | 1       |
| Priya | Finance    | 65000  | 2       |
| Rahul | IT         | 60000  | 3       |
| Rohan | IT         | 55000  | 4       |
| Neha  | HR         | 50000  | 5       |

### 💡 Explanation
Rows are sorted by salary (highest first).
Each row gets a unique number.

## 🏆 2. RANK()
### 📌 Description

`RANK()` assigns a ranking to rows but skips numbers when duplicates exist.

### 🧾 Query
```sql
SELECT name, salary,
RANK() OVER(ORDER BY salary DESC) AS rank_position
FROM employees;
```

### 📤 Result
| name  | salary | rank_position |
| ----- | ------ | ------------- |
| Aman  | 70000  | 1             |
| Priya | 65000  | 2             |
| Rahul | 60000  | 3             |
| Rohan | 60000  | 3             |
| Neha  | 50000  | 5             |

### 💡 Explanation
Notice:
Two employees share rank 3
Next rank becomes 5 (rank 4 skipped)

## 🥇 3. DENSE_RANK()
### 📌 Description
`DENSE_RANK()` works like `RANK()` but does not skip numbers.
### 🧾 Query
```sql
SELECT name, salary,
DENSE_RANK() OVER(ORDER BY salary DESC) AS dense_rank
FROM employees;
```
### 📤 Result
| name  | salary | dense_rank |
| ----- | ------ | ---------- |
| Aman  | 70000  | 1          |
| Priya | 65000  | 2          |
| Rahul | 60000  | 3          |
| Rohan | 60000  | 3          |
| Neha  | 50000  | 4          |

### 💡 Explanation
Ranks remain continuous.
No numbers are skipped.