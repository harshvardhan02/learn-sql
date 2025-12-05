# 🎨 SQL WHERE Operators —
## 🟨 WHERE Clause Operators Overview
| Category                    | Operators                             |
| --------------------------- | ------------------------------------- |
| 🟦 **Comparison Operators** | `=`, `<>`, `!=`, `>`, `>=`, `<`, `<=` |
| 🟩 **Logical Operators**    | `AND`, `OR`, `NOT`                    |
| 🟫 **Range Operator**       | `BETWEEN`                             |
| 🟪 **Membership Operators** | `IN`, `NOT IN`                        |
| 🟧 **Search Operator**      | `LIKE`                                |

---
## 📘 Explanation Table for Each Operator
### 🟦 Comparison Operators
| Operator | Meaning                          |
| -------- | -------------------------------- |
| `=`      | Equal to                         |
| `<>`     | Not equal to (ANSI Standard)     |
| `!=`     | Not equal to (MySQL alternative) |
| `>`      | Greater than                     |
| `>=`     | Greater than or equal to         |
| `<`      | Less than                        |
| `<=`     | Less than or equal to            |

---
### 🟩 Logical Operators
| Operator | Meaning                                    |
| -------- | ------------------------------------------ |
| `AND`    | True if **both** conditions are true       |
| `OR`     | True if **at least one** condition is true |
| `NOT`    | Reverses the condition                     |

## 🟩 SQL Logical Operators
| Category                 | Operators          |
| ------------------------ | ------------------ |
| 🟩 **Logical Operators** | `AND`, `OR`, `NOT` |
### 🟩 1. AND Operator

🔹 Meaning:
Returns rows only when both conditions are TRUE.

### ✅ Example: Find people born after 1990 AND who have a phone number.
```sql
SELECT *
FROM persons
WHERE birth_date > '1990-01-01'
  AND phone IS NOT NULL;
```

### 🟩 2. OR Operator

🔹 Meaning:
Returns rows if at least one condition is TRUE.

### ✅ Example: Find people who either have no phone number OR were born before 1990.
```sql
SELECT *
FROM persons
WHERE phone IS NULL
   OR birth_date < '1990-01-01';
```

### 🟩 3. NOT Operator

🔹 Meaning:
Reverses (negates) a condition.

### ✅ Example: Find people whose phone number is NOT NULL.
```sql
SELECT *
FROM persons
WHERE NOT phone IS NULL;
```
Another example:

### Find all people NOT born after 1995:
```sql
SELECT *
FROM persons
WHERE NOT (birth_date > '1995-01-01');
```
### 🌟 Bonus: Combined Logical Operators
### Example: People who have a phone number AND (were born before 1995 OR after 2000)
```sql
SELECT *
FROM persons
WHERE phone IS NOT NULL
  AND (
        birth_date < '1995-01-01'
        OR birth_date > '2000-01-01'
      );
```
---
### 🟫 Range Operator
| Operator  | Meaning                                       |
| --------- | --------------------------------------------- |
| `BETWEEN` | Selects values **within a range** (inclusive) |

---
### 🟪 Membership Operators
| Operator | Meaning                              |
| -------- | ------------------------------------ |
| `IN`     | Matches any value **in a list**      |
| `NOT IN` | True if value is **not in the list** |

---
### 🟧 Search Operator
| Operator | Meaning                            |
| -------- | ---------------------------------- |
| `LIKE`   | Pattern matching using `%` and `_` |

