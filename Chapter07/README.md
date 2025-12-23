# SET Rules and Syntax

## Rules of SET Operators

### 1️⃣ Rule | ORDER BY can be used only once
### 2️⃣ Rule | Same number of Columns
### 3️⃣ Rule | Matching Data Types
### 4️⃣ Rule | Same Order of Columns
### 5️⃣ Rule | First Query Controls Aliases
### 6️⃣ Rule | Mapping Correct Columns

## 1. UNION
### Removes duplicates → returns unique rows.

```sql
SELECT country AS value
FROM customers
UNION
SELECT order_date AS value
FROM orders;
```

## 2. UNION ALL
### Keeps duplicates → returns all rows from both queries.

```sql
SELECT country AS value
FROM customers
UNION ALL
SELECT order_date AS value
FROM orders;
```

## 3. EXCEPT
### Returns rows that appear in first query but not second.
#### ❗ MySQL does NOT support EXCEPT — but we can simulate it with LEFT JOIN.

```sql
SELECT id, first_name
FROM customers
EXCEPT
SELECT customer_id, NULL
FROM orders;
```

#### ✔ MySQL Simulation

```sql
SELECT t1.*
FROM table1 t1
LEFT JOIN table2 t2
 ON t1.col1 = t2.col1
 AND t1.col2 = t2.col2
WHERE t2.col1 IS NULL;
```

## 4. INTERSECT
### Returns rows that appear in both queries.
#### ❗ MySQL does NOT support INTERSECT — but we can simulate it.

```sql
SELECT id
FROM customers
INTERSECT
SELECT customer_id
FROM orders;
```

#### MySQL Version
```sql
SELECT DISTINCT c.id
FROM customers c
INNER JOIN orders o
 ON c.id = o.customer_id;
```