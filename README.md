# 📘 SQL Learning Repository

Welcome to my **SQL Learning Journey** 🚀  
This repository contains exercises, queries, and examples as I learn and practice SQL concepts.  

---

## 📊 Sample Data Table  

Below is a sample dataset I’ll use for practicing queries:

| Id | First Name | Country  | Score |
|----|------------|----------|-------|
| 1  | Maria      | Germany  | 350   |
| 2  | John       | USA      | 900   |
| 3  | Georg      | UK       | 750   |
| 4  | Martin     | Germany  | 500   |
| 5  | Peter      | USA      | 0     |

---

## 📖 Explanation of Clauses

SELECT → columns or expressions to return

FROM → table(s) where data comes from

JOIN → combine rows from multiple tables

WHERE → filter rows before grouping

GROUP BY → group rows for aggregation

HAVING → filter groups after aggregation

ORDER BY → sort the result

LIMIT / OFFSET → restrict number of rows returned

## 🔢 SQL SELECT Query Clauses

The typical sequence when writing a `SELECT` statement is:

```sql
SELECT column1, column2, aggregate_function(column3)
FROM table_name
JOIN other_table ON condition
WHERE condition
GROUP BY column1, column2
HAVING aggregate_condition
ORDER BY column1 [ASC|DESC]
LIMIT number OFFSET number;
```

## 🛠️ Example Query  

```sql
-- Get all users from the USA with score greater than 100
SELECT *
FROM users
WHERE country = 'USA' AND score > 100;
```

## Create Table and Insert Query

```sql
CREATE TABLE Players (
    Id INT PRIMARY KEY,
    FirstName VARCHAR(50),
    Country VARCHAR(50),
    Score INT
);

-- Insert the data
INSERT INTO Players (Id, FirstName, Country, Score)
VALUES
(1, 'Maria', 'Germany', 350),
(2, 'John', 'USA', 900),
(3, 'Georg', 'UK', 750),
(4, 'Martin', 'Germany', 500),
(5, 'Peter', 'USA', 0);
```