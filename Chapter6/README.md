# Inner Join
---
```sql
SELECT *
FROM customers
INNER JOIN orders
ON id = customer_id;
```
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