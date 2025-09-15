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