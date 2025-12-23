# 🔔 Data Manipulation Langugage (DML)
## 1️⃣ Insert
```sql
INSERT INTO persons (person_name, birth_date, phone)
VALUES
('Harsh Singh', '1990-03-02', '9822356789'), 
('Anjali Singh', '1990-02-05', '9822356389');
```

---

## 2️⃣ Insert from one to another table
## First we will query source table then we will insert into target table.
```sql
INSERT INTO persons (person_name, birth_date, email)
SELECT
first_name,
NULL,
'Unknown'
FROM customers;
```

## 3️⃣ Update - TO update data in table
### ❗️ Always use WHERE to avoid UPDATING all rows unintentionally.
```sql
UPDATE persons
SET email = 'harsh@gmail.com', person_name = 'Harsh Baghel'
WHERE id = 4;
```
---

### Update all customers with a NULL score by setting their score to 0

```sql
UPDATE customers
SET score = 0
WHERE score IS NULL
```

---

# DELETE 
### ❗️ Always use WHERE to avoid UPDATING all rows unintentionally.
```sql
DELETE FROM persons WHERE id > 6;
DELETE FROM persons WHERE id = 4;
DELETE FROM persons WHERE id < 6;
```
### To Delete whole table we have two queries
```sql
DELETE FROM persons -- normal delete
TRUNCATE TABLE persons -- removes all rows instantly without logging each row.
```