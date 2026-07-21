
-- ===========================================================
-- INNER JOIN ASSIGNMENTS
-- ===========================================================

-- ===========================================================
-- BASIC INNER JOIN
-- ===========================================================

-- 1. Display employee names with department names.

SELECT e.EmployeeName, d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 2. Display project names with department names.

SELECT p.ProjectName, d.DepartmentName
FROM Projects p
INNER JOIN Departments d
ON p.DepartmentID = d.DepartmentID;


-- 3. Show employees along with project names.

SELECT e.EmployeeName, p.ProjectName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- 4. Show employee salary and department location.

SELECT e.EmployeeName,
       e.Salary,
       d.Location
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID;


-- 5. Display all employees working on projects.

SELECT DISTINCT e.EmployeeName
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID;


-- ===========================================================
-- INTERMEDIATE INNER JOIN
-- ===========================================================

-- 1. Show employees whose department is IT.

SELECT e.EmployeeName,
       d.DepartmentName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'IT';


-- 2. Display employees working on projects with budget above 200000.

SELECT e.EmployeeName,
       p.ProjectName,
       p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE p.Budget > 200000;


-- 3. Show employee names, department names and project names.

SELECT e.EmployeeName,
       d.DepartmentName,
       p.ProjectName
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID;


-- 4. Display total employees in each department.

SELECT d.DepartmentName,
       COUNT(e.EmployeeID) AS TotalEmployees
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- 5. Show average salary department-wise.

SELECT d.DepartmentName,
       AVG(e.Salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName;


-- ===========================================================
-- ADVANCED INNER JOIN
-- ===========================================================

-- 1. Find highest-paid employee in every department.

SELECT d.DepartmentName,
       e.EmployeeName,
       e.Salary
FROM Employees e
INNER JOIN Departments d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary = (
    SELECT MAX(e2.Salary)
    FROM Employees e2
    WHERE e2.DepartmentID = e.DepartmentID
);


-- 2. Find department having highest average salary.

SELECT d.DepartmentName,
       AVG(e.Salary) AS AverageSalary
FROM Departments d
INNER JOIN Employees e
ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY AverageSalary DESC
LIMIT 1;


-- 3. Find employee working on highest-budget project.

SELECT e.EmployeeName,
       p.ProjectName,
       p.Budget
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
ON ep.ProjectID = p.ProjectID
WHERE p.Budget = (
    SELECT MAX(Budget)
    FROM Projects
);


-- 4. Show managers and their employees.

SELECT
    m.EmployeeName AS Manager,
    e.EmployeeName AS Employee
FROM Employees e
INNER JOIN Employees m
ON e.ManagerID = m.EmployeeID;


-- 5. Find employees working on more than one project.

SELECT e.EmployeeName,
       COUNT(ep.ProjectID) AS ProjectCount
FROM Employees e
INNER JOIN EmployeeProjects ep
ON e.EmployeeID = ep.EmployeeID
GROUP BY e.EmployeeID, e.EmployeeName
HAVING COUNT(ep.ProjectID) > 1;
