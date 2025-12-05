# 📐 Data Definition Language

1️⃣ Example query to create table.
```sql
CREATE TABLE persons (
	id INT NOT NULL,
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

# Insert sample rows
```sql
INSERT INTO dbo.Persons (person_name, birth_date, phone)
VALUES
('Asha Verma',  '1990-04-12', '+919876543210'),
('John Doe',    '1985-11-20', NULL),
('Sara Khan',   '2000-01-05', '+447911123456');
```