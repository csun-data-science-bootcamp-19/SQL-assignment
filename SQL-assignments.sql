-- Assignment 1 --

-- A
SELECT *
FROM wp.PROJECT;

-- B
SELECT ProjectID, ProjectName, StartDate, EndDate
FROM wp.PROJECT;

-- C
SELECT ProjectID, ProjectName, Department, MaxHours, StartDate, EndDate
FROM wp.PROJECT
WHERE StartDate < '2017-08-01'

-- D
SELECT *
FROM wp.PROJECT
WHERE EndDate IS NULL

-- Assignment 2 --

-- A
SELECT wp.PROJECT.ProjectID, E.EmployeeNumber, E.LastName, E.FirstName, E.OfficePhone
FROM wp.PROJECT
JOIN wp.ASSIGNMENT ON wp.PROJECT.ProjectID = wp.ASSIGNMENT.ProjectID
JOIN wp.EMPLOYEE E ON wp.ASSIGNMENT.EmployeeNumber = E.EmployeeNumber
ORDER BY wp.PROJECT.ProjectID

-- B
SELECT wp.PROJECT.ProjectID, wp.PROJECT.ProjectName, wp.PROJECT.Department, E.EmployeeNumber, E.LastName, E.FirstName, E.OfficePhone
FROM wp.PROJECT
JOIN wp.ASSIGNMENT ON wp.PROJECT.ProjectID = wp.ASSIGNMENT.ProjectID
JOIN wp.EMPLOYEE E ON wp.ASSIGNMENT.EmployeeNumber = E.EmployeeNumber
ORDER BY wp.PROJECT.ProjectID

-- C
SELECT wp.PROJECT.ProjectID, wp.PROJECT.ProjectName, wp.PROJECT.Department, D.DepartmentPhone,  E.EmployeeNumber, E.LastName, E.FirstName, E.OfficePhone
FROM wp.PROJECT
JOIN wp.ASSIGNMENT ON wp.PROJECT.ProjectID = wp.ASSIGNMENT.ProjectID
JOIN wp.EMPLOYEE E ON wp.ASSIGNMENT.EmployeeNumber = E.EmployeeNumber
JOIN wp.DEPARTMENT D ON wp.PROJECT.Department = D.DepartmentName
ORDER BY wp.PROJECT.ProjectID

-- D
SELECT wp.PROJECT.ProjectID, wp.PROJECT.ProjectName, wp.PROJECT.Department, D.DepartmentPhone,  E.EmployeeNumber, E.LastName, E.FirstName, E.OfficePhone
FROM wp.PROJECT
JOIN wp.ASSIGNMENT ON wp.PROJECT.ProjectID = wp.ASSIGNMENT.ProjectID
JOIN wp.EMPLOYEE E ON wp.ASSIGNMENT.EmployeeNumber = E.EmployeeNumber
JOIN wp.DEPARTMENT D ON wp.PROJECT.Department = D.DepartmentName
WHERE D.DepartmentName = 'Sales and Marketing'
ORDER BY wp.PROJECT.ProjectID

-- E
SELECT COUNT(ProjectID) as NumberOfMarketingDeptProjects
FROM wp.PROJECT
WHERE Department = 'Sales and Marketing'

-- F
SELECT SUM(MaxHours) as TotalMaxHrsForMKTGDeptProjects
FROM wp.PROJECT
WHERE Department = 'Sales and Marketing'

-- G
SELECT AVG(MaxHours) as AvgMaxHrsForMKTGDeptProjects
FROM wp.PROJECT
WHERE Department = 'Sales and Marketing'

-- H
SELECT Department, COUNT(ProjectID) as NumberOfDeptProject
FROM wp.PROJECT
GROUP BY Department