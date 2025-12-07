# Inner Join
---
### Syntax
```sql
SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id;
```
<div style="overflow-x: auto; white-space: nowrap;">
<table>
<thead>
<tr>
<th>id</th>
<th>first_name</th>
<th>order_id</th>
<th>sales</th>
</tr>
</thead>
<tbody>
<tr>
<td>1</td>
<td>Maria</td>
<td>1001</td>
<td>35</td>
</tr>
<tr>
<td>2</td>
<td>John</td>
<td>1002</td>
<td>15</td>
</tr>
<tr>
<td>3</td>
<td>Georg</td>
<td>1003</td>
<td>20</td>
</tr>
<tr>
<td>4</td>
<td>Martin</td>
<td>NULL</td>
<td>NULL</td>
</tr>
<tr>
<td>5</td>
<td>Peter</td>
<td>NULL</td>
<td>NULL</td>
</tr>
</tbody>
</table>
</div>

### We will only select the column name which is required (Best practices). Example

```sql
SELECT 
  id,
  first_name,
  sales
FROM customers
INNER JOIN orders
ON id = customer_id;
```
| id | first_name | sales |
| -- | ---------- | ----- |
| 1  | Maria      | 35    |
| 2  | John       | 15    |
| 3  | Georg      | 20    |

### We have to tell sql that which column is coming from which table. Example

```sql
SELECT 
  customers.id,
  customers.first_name,
  orders.order_id,
  orders.sales
FROM customers
INNER JOIN orders
ON customers.id = orders.customer_id;
```

### To get rid of multiple writing of table name we will set Alias for table. Example
```sql
SELECT 
  c.id,
  c.first_name,
  o.order_id,
  o.sales
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id;
```

# Left Join
---
### Syntax
```sql
SELECT 
  c.id,
  c.first_name,
  o.order_id,
  o.sales
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;
```
| id | first_name | order_id | sales |
| -- | ---------- | -------- | ----- |
| 1  | Maria      | 1001     | 35    |
| 2  | John       | 1002     | 15    |
| 3  | Georg      | 1003     | 20    |
| 4  | Martin     | NULL     | NULL  |
| 5  | Peter      | NULL     | NULL  |

---

# Right Join
---
```sql
SELECT 
  c.id,
  c.first_name,
  o.order_id,
  o.sales
FROM customers AS c
RIGHT JOIN orders AS o
ON c.id = o.customer_id;
```
| id   | first_name | order_id | sales |
| ---- | ---------- | -------- | ----- |
| 1    | Maria      | 1001     | 35    |
| 2    | John       | 1002     | 15    |
| 3    | Georg      | 1003     | 20    |
| NULL | NULL       | 1004     | 10    |

---

# Full Join

```sql
SELECT 
  c.id,
  c.first_name,
  o.order_id,
  o.sales
FROM customers c
LEFT JOIN orders o
 ON c.id = o.customer_id

UNION

SELECT
  c.id,
  c.first_name,
  o.order_id,
  o.sales
FROM customers c
RIGHT JOIN orders o
 ON c.id = o.customer_id;
```

| id   | first_name | order_id | sales |
| ---- | ---------- | -------- | ----- |
| 1    | Maria      | 1001     | 35    |
| 2    | John       | 1002     | 15    |
| 3    | Georg      | 1003     | 20    |
| 4    | Martin     | NULL     | NULL  |
| 5    | Peter      | NULL     | NULL  |
| NULL | NULL       | 1004     | 10    |

---

# ✅ Query (LEFT ANTI JOIN)

<div style="overflow-x: auto; white-space: nowrap;">
<table>
<thead>
<tr>
<th>id</th>
<th>first_name</th>
<th>country</th>
<th>score</th>
<th>order_id</th>
<th>customer_id</th>
<th>order_date</th>
<th>sales</th>
</tr>
</thead>
<tbody>
<tr>
<td>4</td>
<td>Martin</td>
<td>Germany</td>
<td>500</td>
<td>NULL</td>
<td>NULL</td>
<td>NULL</td>
<td>NULL</td>
</tr>
<tr>
<td>5</td>
<td>Peter</td>
<td>USA</td>
<td>0</td>
<td>NULL</td>
<td>NULL</td>
<td>NULL</td>
<td>NULL</td>
</tr>
</tbody>
</table>
</div>
