SELECT *
From customers

| Id | first_name | country     | score |
|----|------------|-------------|-------|
| 1  | Arjun      | India       | 85    |
| 2  | Maria      | Spain       | 90    |
| 3  | Kenji      | Japan       | 78    |
| 4  | Sarah      | USA         | 92    |
| 5  | Luca       | Italy       | 88    |


SELECT first_name, country
From customers 

| first_name | country |
|------------|---------|
| Arjun      | India   |
| Maria      | Spain   |
| Kenji      | Japan   |

SELECT *
From customers 
WHERE Score > 500

| Id | first_name | country | score |
|----|------------|---------|-------|
| 10 | Deepak     | India   | 520   |
| 17 | Maria      | Brazil  | 801   |
| 23 | Kenji      | Japan   | 650   |

SELECT *
From customers 
ORDER BY country ASC, score DESC

| Id | first_name | country | score |
|----|------------|---------|-------|
| 4  | Sarah      | Canada  | 700   |
| 12 | Ali        | Canada  | 650   |
| 7  | Maria      | India   | 900   |
| 15 | Deepak     | India   | 850   |
| 9  | Kenji      | Japan   | 940   |
| 3  | Yuki       | Japan   | 890   |
