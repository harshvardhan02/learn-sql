# NULL Functions

# 🔍 ISNULL & COALESCE – SQL Server & MySQL Guide

## 📌 Overview
`ISNULL` and `COALESCE` are used to **handle NULL values** by replacing them with a specified default value.

- `ISNULL()` is **SQL Server–specific**
- `COALESCE()` is **ANSI SQL standard**
- MySQL supports **only `COALESCE()`**
- `COALESCE()` can handle **multiple values**, `ISNULL()` cannot

---

## 🧩 Syntax

### ISNULL (SQL Server only)
```sql
ISNULL(expression, replacement_value)
```

```sql
COALESCE(expression1, expression2, ..., expressionN)
```

| Parameter         | Description                          |
| ----------------- | ------------------------------------ |
| expression        | Column or value that may be NULL     |
| replacement_value | Value returned if expression is NULL |
| expression2..N    | Fallback values (COALESCE only)      |


## ✅ Basic Examples
### Replace NULL with 0

## SQL Server
```sql
SELECT ISNULL(discount, 0) AS discount_value
FROM orders;
```

## MySQL

```sql
SELECT COALESCE(discount, 0) AS discount_value
FROM orders;
```

### 🔁 Multiple Fallback Values (COALESCE)
```sql
SELECT COALESCE(phone, mobile, 'Not Available') AS contact_number
FROM customers;
```

### 🧪 Examples with Strings
```sql
SELECT
  COALESCE(customer_name, 'Unknown Customer') AS customer_name
FROM customers;
```

### 🧪 Examples with Dates
```sql
SELECT
  COALESCE(shipping_date, order_date) AS final_shipping_date
FROM orders;
```

### 🧮 Using with Calculations
```sql
SELECT
  price * COALESCE(discount, 0) AS discounted_price
FROM orders;
```

### 🔁 SQL Server vs MySQL Comparison
| Feature              | ISNULL | COALESCE           |
| -------------------- | ------ | ------------------ |
| SQL Standard         | ❌ No   | ✅ Yes             |
| SQL Server           | ✅ Yes  | ✅ Yes             |
| MySQL                | ❌ No   | ✅ Yes             |
| Multiple arguments   | ❌ No   | ✅ Yes             |
| Data type precedence | Fixed  | Based on arguments |

### ⚠️ Important Notes

- ISNULL() accepts only 2 arguments

- COALESCE() accepts multiple arguments

- COALESCE() evaluates arguments left to right

- Return data type in COALESCE() depends on highest-precedence type

---

# 🧪 NULLIF Handling Examples

## NULLIF Example
Returns `NULL` if two expressions are equal.

```sql
SELECT NULLIF(quantity, 0) AS quantity_value
FROM orders;
```

## ISNULL Example (SQL Server only)

### Replaces NULL with a specified value.
```sql
SELECT ISNULL(discount, 0) AS discount_value
FROM orders;
```

## IS NOT NULL Example

### Filters rows where a column is NOT NULL.

```sql
SELECT *
FROM customers
WHERE email IS NOT NULL;
```

```markdown
If you want, I can also prepare:
- A **single-page NULL functions cheat sheet**
- **MySQL-only equivalents**
- **Interview-focused examples**
```