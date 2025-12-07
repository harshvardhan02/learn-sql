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
<td>1</td>
<td>Alice</td>
<td>USA</td>
<td>85</td>
<td>101</td>
<td>1</td>
<td>2024-01-05</td>
<td>500</td>
</tr>
<tr>
<td>1</td>
<td>Alice</td>
<td>USA</td>
<td>85</td>
<td>102</td>
<td>1</td>
<td>2024-02-10</td>
<td>900</td>
</tr>
<tr>
<td>3</td>
<td>Charlie</td>
<td>UK</td>
<td>92</td>
<td>103</td>
<td>3</td>
<td>2024-01-20</td>
<td>200</td>
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
| 1  | Alice      | 101      | 500   |
| 1  | Alice      | 102      | 900   |
| 2  | Bob        | NULL     | NULL  |
| 3  | Charlie    | 103      | 200   |
