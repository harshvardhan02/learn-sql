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
### 🟫 SQL Range Operator
Range operators help filter data between two values.
SQL provides one primary range operator:
| Category              | Operator  |
| --------------------- | --------- |
| 🟫 **Range Operator** | `BETWEEN` |

### 🔹 Meaning:
Selects values within a specified range, and both boundaries are included.

#### ✅ Example 1: People born between 1990 and 2000
```sql
SELECT *
FROM persons
WHERE birth_date BETWEEN '1990-01-01' AND '2000-12-31';
```
✔ Includes values on both ends
✔ '1990-01-01' and '2000-12-31' are included

#### ✅ Example 2: People with PersonID between 2 and 4
```sql
SELECT *
FROM persons
WHERE id BETWEEN 2 AND 4;
```
✔ Returns rows with IDs: 2, 3, 4

#### ✅ Example 3: People whose name alphabetically falls between 'A' and 'M'
```sql
SELECT *
FROM persons
WHERE person_name BETWEEN 'A' AND 'M';
```
✔ Useful for alphabetical filtering

#### 🛑 NOT BETWEEN (Advanced)
```sql
SELECT *
FROM persons
WHERE birth_date NOT BETWEEN '1990-01-01' AND '2000-12-31';
```
---
### 🟪 Membership Operators
| Operator | Meaning                              |
| -------- | ------------------------------------ |
| `IN`     | Matches any value **in a list**      |
| `NOT IN` | True if value is **not in the list** |

# 🟪 **SQL Membership Operators**

Membership operators let you check whether a value **exists inside a list** of values.

| Category | Operators |
|---------|-----------|
| 🟪 **Membership Operators** | `IN`, `NOT IN` |

---

# 📘 **Detailed Explanation + Examples (Using `persons` Table)**

Assume your table:

```sql
persons(id, person_name, birth_date, phone)
```

---

## 🟪 **1. IN Operator**

🔹 **Meaning:**  
Returns rows where a value **matches any value in a list**.

### ✅ Example 1: Select people whose IDs are **1, 3, or 5**

```sql
SELECT *
FROM persons
WHERE id IN (1, 3, 5);
```

---

### ✅ Example 2: Find people whose names are in a specific list

```sql
SELECT *
FROM persons
WHERE person_name IN ('Asha Verma', 'Sara Khan');
```

---

## 🟪 **2. NOT IN Operator**

🔹 **Meaning:**  
Returns rows where a value **does NOT match any value** in the list.

### ✅ Example 3: Exclude certain people by ID

```sql
SELECT *
FROM persons
WHERE id NOT IN (2, 4);
```

✔ Returns all persons **except** ID 2 and 4

---

### ✅ Example 4: People whose name is **not** one of the given values

```sql
SELECT *
FROM persons
WHERE person_name NOT IN ('John Doe', 'Emily Johnson');
```

---

# 🌟 Bonus Example: Combine with Logical Operators

### People who have a phone number *AND* whose ID is in a specific list:

```sql
SELECT *
FROM persons
WHERE phone IS NOT NULL
  AND id IN (1, 3, 4);
```

---
### 🟧 Search Operator
| Operator | Meaning                            |
| -------- | ---------------------------------- |
| `LIKE`   | Pattern matching using `%` and `_` |

# 🟧 **SQL Search Operator — Color Themed Guide**

Search operators allow pattern matching using wildcards like `%` and `_`.

| Category | Operator |
|---------|----------|
| 🟧 **Search Operator** | `LIKE` |

---

# 📘 **Detailed Explanation + Examples (Using `persons` Table)**

Assume your table:

```sql
persons(id, person_name, birth_date, phone)
```

---

## 🟧 **1. LIKE Operator**

🔹 **Meaning:**  
Used for **pattern matching** in strings.  
Uses two common wildcards:

| Wildcard | Meaning |
|----------|---------|
| `%` | Matches *zero or more* characters |
| `_` | Matches *exactly one* character |

---

## 🔍 Example Queries

### ✅ Example 1: Names that **start with 'A'**

```sql
SELECT *
FROM persons
WHERE person_name LIKE 'A%';
```

---

### ✅ Example 2: Names that **end with 'n'**

```sql
SELECT *
FROM persons
WHERE person_name LIKE '%n';
```

---

### ✅ Example 3: Names that **contain 'er'**

```sql
SELECT *
FROM persons
WHERE person_name LIKE '%er%';
```

---

### ✅ Example 4: Phone numbers that start with **+91**

```sql
SELECT *
FROM persons
WHERE phone LIKE '+91%';
```

---

### ✅ Example 5: Names with exactly **5 characters before** 'a'

```sql
SELECT *
FROM persons
WHERE person_name LIKE '_____a%';
```

---

# 🌟 Bonus: Case-Insensitive Search (MySQL Default)

MySQL searches using `LIKE` are **case-insensitive** for most collations.

```sql
SELECT *
FROM persons
WHERE person_name LIKE '%michael%';
```
