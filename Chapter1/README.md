```sql
SELECT *
From customers

## 📊 Result
| Id | first_name | country     | score |
|----|------------|-------------|-------|
| 1  | Arjun      | India       | 85    |
| 2  | Maria      | Spain       | 90    |
| 3  | Kenji      | Japan       | 78    |
| 4  | Sarah      | USA         | 92    |
| 5  | Luca       | Italy       | 88    |

---

SELECT first_name, country
From customers

| First Name | Country |
| ---------- | ------- |
| Maria      | Germany |
| John       | USA     |
| Georg      | UK      |
| Martin     | Germany |
| Peter      | USA     |

SELECT *
From customers 
WHERE Score > 500

| Id | First Name | Country | Score |
| -- | ---------- | ------- | ----- |
| 2  | John       | USA     | 900   |
| 3  | Georg      | UK      | 750   |

SELECT *
From customers 
ORDER BY country ASC, score DESC

| Id | First Name | Country | Score |
| -- | ---------- | ------- | ----- |
| 4  | Martin     | Germany | 500   |
| 1  | Maria      | Germany | 350   |
| 3  | Georg      | UK      | 750   |
| 2  | John       | USA     | 900   |
| 5  | Peter      | USA     | 0     |

SELECT 
	country,
    SUM(score) AS score
FROM customers
GROUP BY country

| Country | Score |
| ------- | ----- |
| Germany | 850   |
| UK      | 750   |
| USA     | 900   |

SELECT 
	country,
    SUM(score) AS score,
    COUNT(id) AS total_customers
FROM customers
GROUP BY country

| Country | Score | Total Customers |
| ------- | ----- | --------------- |
| Germany | 850   | 2               |
| UK      | 750   | 1               |
| USA     | 900   | 2               |
