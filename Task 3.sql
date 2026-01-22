3. Queries using aggregate functions (COUNT, AVG, MIN, MAX, SUM), Group by, Orderby. Employee(E_id, E_name, Age, Salary)
◉ Create Employee table containing all Records E_id, E_name, Age, Salary.
◉ Count number of employee names from employee table.
◉ Find the Maximum age from employee table.
◉ Find the Minimum age from employee table.
◉ Find salaries of employee in Ascending Order.
◉ Find grouped salaries of employees.

Step 1: Create Employee table:

CREATE TABLE Employee (
    E_id INTEGER PRIMARY KEY,
    E_name VARCHAR(100),
    Age INTEGER,
    Salary DECIMAL(10, 2)
);
Step 2: Insert Five Records into the Table:

INSERT INTO Employee VALUES (1, 'Braham Kumar', 30, 50000);
INSERT INTO Employee VALUES (2, 'Shubham Kumar', 25, 60000);
INSERT INTO Employee VALUES (3, 'Anjali Kumari', 35, 55000);
INSERT INTO Employee VALUES (4, 'Aman Kumar', 28, 62000);
INSERT INTO Employee VALUES (5, 'Shoaib Akhtar', 40, 70000);
Step 3: Count the number of employee names from the employee table:

SELECT COUNT(E_NAME) AS "NUMBER OF EMPLOYEES" 
FROM EMPLOYEE;
Step 4: Find the Maximum age from the employee table:

SELECT MAX(AGE) AS "MAXIMUM AGE" 
FROM EMPLOYEE;
Step 5: Find the Minimum age from the employee table:

SELECT MIN(AGE) AS "MINIMUM AGE"
FROM EMPLOYEE;
Step 6: Find salaries of employees in ascending order:

SELECT E_NAME, SALARY 
FROM EMPLOYEE 
ORDER BY SALARY ASC;
Step 7: Find grouped salaries of employees:

SELECT Age, SUM(SALARY) AS "TOTAL SALARY"
FROM EMPLOYEE
GROUP BY AGE;