-- ===========================================================
-- FULL ANTI JOIN ASSIGNMENTS
-- ===========================================================
-- 1. Find all unmatched employees and departments.
-- ===========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.DepartmentID AS EmployeeDepartmentID,
    d.DepartmentID AS DepartmentID,
    d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
   OR d.DepartmentID IS NULL;


-- ===========================================================
-- 2. Find all unmatched departments and employees.
-- (Same result as Question 1)
-- ===========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName,
    e.EmployeeID,
    e.EmployeeName
FROM Departments d
FULL JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL
   OR e.DepartmentID IS NULL;


-- ===========================================================
-- 3. Find projects without departments
--    and departments without projects.
-- ===========================================================

SELECT
    d.DepartmentID,
    d.DepartmentName,
    p.ProjectID,
    p.ProjectName
FROM Departments d
FULL JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL
   OR p.DepartmentID IS NULL;


-- ===========================================================
-- 4. Find employees without projects
--    and projects without employees.
-- ===========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    p.ProjectID,
    p.ProjectName
FROM Employees e
FULL JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
FULL JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL
   OR ep.ProjectID IS NULL;


-- ===========================================================
-- 5. Show all orphan records across Employees and Departments.
-- ===========================================================

SELECT
    e.EmployeeID,
    e.EmployeeName,
    e.DepartmentID AS EmployeeDepartmentID,
    d.DepartmentID AS DepartmentID,
    d.DepartmentName
FROM Employees e
FULL JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.DepartmentID IS NULL
   OR d.DepartmentID IS NULL;
