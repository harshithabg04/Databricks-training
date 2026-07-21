-- ===========================================================
-- LEFT JOIN ASSIGNMENTS
-- ===========================================================

-- ===========================================================
-- BASIC LEFT JOIN
-- ===========================================================

-- 1. Show all employees even if they don't belong to any department.

SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 2. Show all departments even if no employee works there.

SELECT d.DepartmentName,
       e.EmployeeName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID;


-- 3. Show all projects and their department names.

SELECT p.ProjectName,
       d.DepartmentName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;


-- 4. Show every employee and their assigned projects.

SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- 5. Display all employees even if they are not assigned to any project.

SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- ===========================================================
-- INTERMEDIATE LEFT JOIN
-- ===========================================================

-- 1. Find employees without departments.

SELECT e.EmployeeID,
       e.EmployeeName
FROM Employees e
LEFT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 2. Find employees without projects.

SELECT e.EmployeeID,
       e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;


-- 3. Find departments without employees.

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE e.EmployeeID IS NULL;


-- 4. Find projects without departments.

SELECT p.ProjectID,
       p.ProjectName
FROM Projects p
LEFT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 5. Show departments with total employees including zero employees.

SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;


-- ===========================================================
-- ADVANCED LEFT JOIN
-- ===========================================================

-- 1. Find employees not assigned to any project.

SELECT e.EmployeeID,
       e.EmployeeName
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
WHERE ep.ProjectID IS NULL;


-- 2. Find departments having no projects.

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL;


-- 3. Find departments having employees but no projects.

SELECT d.DepartmentID,
       d.DepartmentName
FROM Departments d
LEFT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE p.ProjectID IS NULL
  AND e.EmployeeID IS NOT NULL
GROUP BY d.DepartmentID, d.DepartmentName;


-- 4. Show employees with project count.

SELECT e.EmployeeID,
       e.EmployeeName,
       COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
LEFT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
ORDER BY e.EmployeeID;


-- 5. Show project count department-wise including zero.

SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(p.ProjectID) AS ProjectCount
FROM Departments d
LEFT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;
