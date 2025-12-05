# 📐 Data Definition Language

1️⃣ Example query to create table.
```sql
CREATE TABLE dbo.Persons
(
    PersonID    INT IDENTITY(1,1) PRIMARY KEY, -- auto-increment primary key
    person_name NVARCHAR(100) NOT NULL,        -- person's full name
    birth_date  DATE NULL,                     -- date of birth
    phone       VARCHAR(20) NULL               -- phone number
);
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