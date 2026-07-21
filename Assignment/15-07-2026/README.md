# 🗃️ SQL Joins Assignment Repository

Welcome to my **SQL Joins Practice Repository**! 🚀

This repository contains SQL assignments that helped me understand different types of joins, table relationships, and real-world database querying techniques. The exercises range from basic join operations to advanced SQL scenarios.

---

## 📂 Repository Structure

```text
Assignments/
│
└── 📁 15-07-2026
    ├── 📄 01_Inner_Join.sql
    ├── 📄 02_Left_Join.sql
    ├── 📄 03_Right_Join.sql
    ├── 📄 04_Full_Join.sql
    ├── 📄 05_Left_Anti_Join.sql
    ├── 📄 06_Right_Anti_Join.sql
    └── 📄 07_Full_Anti_Join.sql
```

---

## 📘 SQL Join Categories

### 🔸 INNER JOIN
Retrieves records that have matching values in both tables.

✨ Practice Includes:
- Employee & Department information
- Employee & Project mapping
- Department-wise analysis
- Manager & Employee relationships

---

### 🔸 LEFT JOIN
Returns every record from the left table along with matching records from the right table.

✨ Practice Includes:
- Employees without departments
- Employees without project assignments
- Departments with no employees
- Departments without projects

---

### 🔸 RIGHT JOIN
Returns every record from the right table and matching records from the left table.

✨ Practice Includes:
- Departments with or without employees
- Projects with or without employees
- Department-wise employee count
- Project assignment details

---

### 🔸 FULL JOIN
Combines matching and non-matching records from both tables.

✨ Practice Includes:
- Employees & Departments
- Departments & Projects
- Employees & Projects
- Missing and unmatched records

> ⚠️ **Note:** MySQL doesn't support `FULL OUTER JOIN` directly. These examples are included for conceptual understanding.

---

### 🔸 LEFT ANTI JOIN
Finds records that exist only in the left table.

✨ Practice Includes:
- Employees without departments
- Employees without projects
- Departments without projects
- Projects with invalid departments

---

### 🔸 RIGHT ANTI JOIN
Finds records that exist only in the right table.

✨ Practice Includes:
- Departments without employees
- Projects without employees
- Invalid department references
- Orphan project records

---

### 🔸 FULL ANTI JOIN
Returns every unmatched record from both tables.

✨ Practice Includes:
- Unmatched Employees & Departments
- Departments & Projects
- Employees & Projects
- Orphan records across tables

---

## 🏗️ Database Schema

The assignments are based on the following tables:

- 🏢 **Departments**
- 👨‍💻 **Employees**
- 📁 **Projects**
- 🔗 **EmployeeProjects**

These tables are connected using **Primary Keys** and **Foreign Keys** to demonstrate various SQL join operations.

---

## 🎯 Skills Gained

Through these assignments, I practiced:

- ✅ INNER JOIN
- ✅ LEFT JOIN
- ✅ RIGHT JOIN
- ✅ FULL JOIN
- ✅ LEFT ANTI JOIN
- ✅ RIGHT ANTI JOIN
- ✅ FULL ANTI JOIN
- ✅ Multi-table Joins
- ✅ Self Joins
- ✅ Aggregate Functions
- ✅ GROUP BY & HAVING
- ✅ SQL Query Writing
- ✅ Relational Database Concepts

---

## 🛠️ Environment

- 🐬 MySQL 8.0+
- 💻 MySQL Workbench
