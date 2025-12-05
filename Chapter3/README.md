# 📐 Data Definition Language

1️⃣ Example query to create table.
```sql
CREATE TABLE persons (
	id INT NOT NULL AUTO_INCREMENT, -- AUTO_INCREMENT will create sys gen id.
  person_name VARCHAR(50) NOT NULL,
  birth_date DATE,
  phone VARCHAR(15) NOT NULL,
  CONSTRAINT pk_persons PRIMARY KEY (id)
)
```
| PersonID | Person Name   | Birth Date | Phone         |
| -------- | ------------- | ---------- | ------------- |
| 1        | Asha Verma    | 1990-04-12 | +919876543210 |
| 2        | John Doe      | 1985-11-20 | NULL          |
| 3        | Sara Khan     | 2000-01-05 | +447911123456 |
| 4        | Michael Smith | 1992-09-30 | +12125550123  |
| 5        | Emily Johnson | 1998-06-15 | NULL          |

---

## Insert sample rows
```sql
INSERT INTO persons (person_name, birth_date, phone)
VALUES
('Harsh Singh', '1990-03-02', '9822356789'), 
('Anjali Singh', '1990-02-05', '9822356389');
```

---

## ALTER - ADD
### add a new column called email to the person table
```sql
ALTER TABLE persons
ADD email VARCHAR(50) NOT NULL;
```

---

## ALTER - DROP
### Remove the column phone from the persons table
```sql
ALTER TABLE persons
DROP phone;
```