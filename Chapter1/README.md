# 📊 SELECT Query Examples

## 1️⃣ Show all customers
```sql
SELECT *
FROM customers;
```

| Id | First Name | Country  | Score |
|----|------------|----------|-------|
| 1  | Maria      | Germany  | 350   |
| 2  | John       | USA      | 900   |
| 3  | Georg      | UK       | 750   |
| 4  | Martin     | Germany  | 500   |
| 5  | Peter      | USA      | 0     |

---
## 2️⃣ Select first_name and country
```sql
SELECT first_name, country
FROM customers;
```
| First Name | Country |
| ---------- | ------- |
| Maria      | Germany |
| John       | USA     |
| Georg      | UK      |
| Martin     | Germany |
| Peter      | USA     |

---
## 3️⃣ Customers with score > 500
```sql
SELECT *
FROM customers 
WHERE score > 500;
```
| Id | First Name | Country | Score |
| -- | ---------- | ------- | ----- |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |

---
## 4️⃣ Order by country ASC, score DESC
```sql
SELECT *
FROM customers 
ORDER BY country ASC, score DESC;
```
| Id | First Name | Country | Score |
| -- | ---------- | ------- | ----- |
| 4  | Martin     | Germany | 500   |
| 1  | Maria      | Germany | 350   |
| 3  | Georg      | UK      | 750   |
| 2  | John       | USA     | 900   |
| 5  | Peter      | USA     | 0     |

---
## 5️⃣ Sum of scores by country
```sql
SELECT 
    country,
    SUM(score) AS score
FROM customers
GROUP BY country;
```
| Country | Score |
| ------- | ----- |
| Germany | 850   |
| UK      | 750   |
| USA     | 900   |

---
## 6️⃣ Sum of scores and total customers by country
```sql
SELECT 
    country,
    SUM(score) AS score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country;
```
| Country | Score | Total Customers |
| ------- | ----- | --------------- |
| Germany | 850   | 2               |
| UK      | 750   | 1               |
| USA     | 900   | 2               |

---
```sql
SELECT 
    country,
    AVG(score) AS score
FROM Players
WHERE Score != 0
GROUP BY country
HAVING AVG(score) > 430
```
country | score
--------+-------
USA     | 900
UK      | 750


