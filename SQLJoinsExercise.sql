/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.name, c.name
 FROM products as p
 JOIN categories as c
 ON c.CategoryID = p.CategoryID
 WHERE c.Name = "Computers";
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.name, p.price, r.rating
 FROM products as p
 JOIN reviews as r
 ON p.ProductID = r.ProductID
 WHERE r.Rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, SUM(s.Quantity) AS Total
FROM employees AS e
JOIN sales AS s
ON s.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID
ORDER BY Total DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name, c.name
FROM categories as c
JOIN departments as d
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, SUM(s.Quantity) AS TotalSold, SUM(s.Quantity * s.PricePerUnit) AS TotalPrice
FROM products as p
INNER JOIN sales as s
ON p.ProductID = s.ProductID
WHERE p.ProductID = 97;
/* to verify */
SELECT * FROM sales WHERE ProductID = 97;

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.comment
FROM reviews as r
JOIN products as p
ON p.ProductID = r.ProductID
WHERE p.name LIKE "%Visio%" AND r.rating < 5;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
SELECT e.EmployeeID, e.FirstName, e.LastName, p.name AS ProductName, SUM(s.Quantity) AS AmountSold
FROM employees as e
INNER JOIN sales as s
ON e.EmployeeID = s.EmployeeID
INNER JOIN products as p
ON s.ProductID = p.ProductID
GROUP BY e.EmployeeID, p.ProductID;
