CREATE DATABASE exampless;
USE examples;

-- CREATE TABLES
DROP TABLE IF EXISTS department;
DROP TABLE IF EXISTS physician;

CREATE TABLE physician (
    employeeid INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(100),
    ssn VARCHAR(20)
);

CREATE TABLE department (
    departmentid INT PRIMARY KEY,
    name VARCHAR(100),
    head INT
);

-- INSERT DATA
INSERT INTO physician VALUES
(1,'AJAI Manikanta','Staff Internist','111111111'),
(2,'Elliot Reid','Attending Physician','222222222'),
(3,'Christopher Turk','Surgical Attending Physician','333333333'),
(4,'Percival Cox','Senior Attending Physician','444444444'),
(5,'Bob Kelso','Head Chief of Medicine','555555555'),
(6,'Todd Quinlan','Surgical Attending Physician','666666666'),
(7,'John Wen','Surgical Attending Physician','777777777'),
(8,'Keith Dudemeister','MD Resident','888888888'),
(9,'Molly Clock','Attending Psychiatrist','999999999');

INSERT INTO department VALUES
(1,'General Medicine',4),
(2,'Surgery',7),
(3,'Psychiatry',9);

-- 1. INNER JOIN
SELECT d.name AS Department, p.name AS Head_Physician
FROM department d
JOIN physician p ON d.head = p.employeeid;

-- 2. WHERE
SELECT *
FROM physician
WHERE position = 'Surgical Attending Physician';

-- 3. LIKE
SELECT *
FROM physician
WHERE name LIKE 'John%';

-- 4. COUNT()
SELECT COUNT(*) AS Total_Physicians
FROM physician;

-- 5. COUNT(DISTINCT)
SELECT COUNT(DISTINCT position) AS Total_Positions
FROM physician;

-- 6. GROUP BY
SELECT position, COUNT(*) AS Total_Employees
FROM physician
GROUP BY position;

-- 7. GROUP BY + HAVING
SELECT position, COUNT(*) AS Total_Employees
FROM physician
GROUP BY position
HAVING COUNT(*) > 1;

-- 8. ORDER BY
SELECT *
FROM physician
ORDER BY name ASC;

-- 9. ORDER BY DESC
SELECT *
FROM physician
ORDER BY employeeid DESC;

-- 10. IN + SUBQUERY
SELECT *
FROM physician
WHERE employeeid IN
(SELECT head FROM department);

-- 11. NOT IN + SUBQUERY
SELECT *
FROM physician
WHERE employeeid NOT IN
(SELECT head FROM department);

-- 12. GROUP BY + ORDER BY
SELECT position, COUNT(*) AS Total_Employees
FROM physician
GROUP BY position
ORDER BY Total_Employees DESC;

-- 13. LIKE
SELECT *
FROM physician
WHERE position LIKE '%Attending%';

-- 14. JOIN + WHERE
SELECT p.name
FROM physician p
JOIN department d ON p.employeeid = d.head
WHERE d.name = 'Surgery';

-- 15. JOIN + ORDER BY
SELECT d.name AS Department, p.name AS Head
FROM department d
JOIN physician p ON d.head = p.employeeid
ORDER BY d.name;

-- 16. NOT LIKE
SELECT *
FROM physician
WHERE position NOT LIKE '%Surgical%';

-- 17. HAVING + COUNT
SELECT position, COUNT(*) AS Total
FROM physician
GROUP BY position
HAVING COUNT(*) >= 2;

-- 18. EXISTS
SELECT *
FROM department d
WHERE EXISTS (
    SELECT 1
    FROM physician p
    WHERE p.employeeid = d.head
);

-- 19. MAX()
SELECT MAX(employeeid) AS Highest_ID
FROM physician;

-- 20. MIN()
SELECT MIN(employeeid) AS Lowest_ID
FROM physician;