# 📊 SQL Query Examples

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

```sql
SELECT *
FROM customers 
WHERE score > 500;
```
| Id | First Name | Country | Score |
| -- | ---------- | ------- | ----- |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |

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


