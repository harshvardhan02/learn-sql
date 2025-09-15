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
