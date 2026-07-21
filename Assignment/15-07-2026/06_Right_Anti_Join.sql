-- ===========================================================
-- RIGHT ANTI JOIN ASSIGNMENTS
-- ===========================================================
-- 1. Departments without employees.
-- ===========================================================

SELECT d.DepartmentID,
       d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;


-- ===========================================================
-- 2. Projects without employees.
-- ===========================================================

SELECT p.ProjectID,
       p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;


-- ===========================================================
-- 3. Departments without projects.
-- ===========================================================

SELECT d.DepartmentID,
       d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;


-- ===========================================================
-- 4. Employees whose departments don't exist.
-- ===========================================================

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;


-- ===========================================================
-- 5. Projects whose departments don't exist.
-- ===========================================================

SELECT p.ProjectID,
       p.ProjectName,
       p.DepartmentID
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;
