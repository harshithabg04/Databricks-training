-- ===========================================================
-- FULL JOIN ASSIGNMENTS
-- ===========================================================
-- BASIC FULL JOIN
-- ===========================================================

-- 1. Show all employees and all departments.

SELECT e.EmployeeID,
       e.EmployeeName,
       d.DepartmentID,
       d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 2. Show all departments and projects.

SELECT d.DepartmentID,
       d.DepartmentName,
       p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID;


-- 3. Display all employees and projects.

SELECT e.EmployeeID,
       e.EmployeeName,
       p.ProjectName
FROM Employees e
FULL JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- 4. Show every department whether employees exist or not.

SELECT d.DepartmentID,
       d.DepartmentName,
       e.EmployeeName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID;


-- 5. Show all departments and projects including unmatched records.

SELECT d.DepartmentID,
       d.DepartmentName,
       p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID;


-- ===========================================================
-- INTERMEDIATE FULL JOIN
-- ===========================================================

-- 1. Display all departments and employees.

SELECT d.DepartmentID,
       d.DepartmentName,
       e.EmployeeName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID;


-- 2. Show unmatched employees.

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 3. Show unmatched departments.

SELECT d.DepartmentID,
       d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;


-- 4. Show all employees and departments with NULL handling.

SELECT
    COALESCE(e.EmployeeName, 'No Employee') AS Employee,
    COALESCE(d.DepartmentName, 'No Department') AS Department
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 5. Display departments and projects including unmatched rows.

SELECT
    d.DepartmentID,
    d.DepartmentName,
    p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID;
