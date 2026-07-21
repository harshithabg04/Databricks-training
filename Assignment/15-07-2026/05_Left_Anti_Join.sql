-- ===========================================================
-- LEFT ANTI JOIN ASSIGNMENTS
-- ===========================================================
-- 1. Find employees without departments.
-- ===========================================================

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- ===========================================================
-- 2. Find departments without employees.
-- ===========================================================

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;


-- ===========================================================
-- 3. Find employees without projects.
-- ===========================================================

SELECT e.EmployeeID,
       e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;


-- ===========================================================
-- 4. Find departments without projects.
-- ===========================================================

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;


-- ===========================================================
-- 5. Find projects without departments.
-- ===========================================================

SELECT p.ProjectID,
       p.ProjectName,
       p.DepartmentID
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;
