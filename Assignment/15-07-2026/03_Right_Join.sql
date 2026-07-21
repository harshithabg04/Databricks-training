-- ===========================================================
-- RIGHT JOIN ASSIGNMENTS
-- ===========================================================

-- ===========================================================
-- BASIC RIGHT JOIN
-- ===========================================================

-- 1. Show all departments even if there are no employees.

SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 2. Show all projects even if no employee is assigned.

SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
RIGHT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- 3. Display every department and employees.

SELECT d.DepartmentName,
       e.EmployeeName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 4. Show all projects with departments.

SELECT d.DepartmentName,
       p.ProjectName
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID;


-- 5. Show every project assignment including projects without employees.

SELECT e.EmployeeName,
       p.ProjectName
FROM Employees e
RIGHT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- ===========================================================
-- INTERMEDIATE RIGHT JOIN
-- ===========================================================

-- 1. Find departments having no employees.

SELECT d.DepartmentID,
       d.DepartmentName
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.EmployeeID IS NULL;


-- 2. Find projects without employees.

SELECT p.ProjectID,
       p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;


-- 3. Show departments even if no projects exist.

SELECT d.DepartmentID,
       d.DepartmentName,
       p.ProjectName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID;


-- 4. Count employees in every department.

SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;


-- 5. List every project whether employees are assigned or not.

SELECT p.ProjectID,
       p.ProjectName,
       e.EmployeeName
FROM Employees e
RIGHT JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- ===========================================================
-- ADVANCED RIGHT JOIN
-- ===========================================================

-- 1. Find projects without employees.

SELECT p.ProjectID,
       p.ProjectName
FROM EmployeeProjects ep
RIGHT JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE ep.EmployeeID IS NULL;


-- 2. Find departments without projects.

SELECT d.DepartmentID,
       d.DepartmentName
FROM Projects p
RIGHT JOIN Departments d
ON p.DepartmentID = d.DepartmentID
WHERE p.ProjectID IS NULL;


-- 3. Find projects whose department doesn't exist.

SELECT p.ProjectID,
       p.ProjectName,
       p.DepartmentID
FROM Departments d
RIGHT JOIN Projects p
ON d.DepartmentID = p.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 4. Find orphan employee records.
-- (Employees whose DepartmentID doesn't exist in Departments)

SELECT e.EmployeeID,
       e.EmployeeName,
       e.DepartmentID
FROM Departments d
RIGHT JOIN Employees e
ON d.DepartmentID = e.DepartmentID
WHERE d.DepartmentID IS NULL;


-- 5. Display every department and employee count.

SELECT d.DepartmentID,
       d.DepartmentName,
       COUNT(e.EmployeeID) AS EmployeeCount
FROM Employees e
RIGHT JOIN Departments d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
ORDER BY d.DepartmentID;
