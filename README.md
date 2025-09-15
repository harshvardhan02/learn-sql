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
