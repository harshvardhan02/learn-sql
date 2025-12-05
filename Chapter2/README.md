# 📐 Data Definition Language
```sql
CREATE TABLE dbo.Persons
(
    PersonID    INT IDENTITY(1,1) PRIMARY KEY, -- auto-increment primary key
    person_name NVARCHAR(100) NOT NULL,        -- person's full name
    birth_date  DATE NULL,                     -- date of birth
    phone       VARCHAR(20) NULL               -- phone number
);
```