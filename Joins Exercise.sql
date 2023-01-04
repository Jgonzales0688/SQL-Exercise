/* 1. joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
SELECT p.Name, c.Name 
FROM products AS p 
JOIN categories AS c
ON p.CategoryID = c.CategoryID
WHERE c.Name = 'Computers';
  
/* 2. joins: find all product names, product prices, and products ratings that have a rating of 5 */

SELECT products.Name, products.Price, reviews.Rating
FROM products 
JOIN reviews 
ON products.ProductID = reviews.ProductID
WHERE reviews.Rating = 5;

/* 3. joins: find the employee with the most total quantity sold.  use the sum() function and group by */

SELECT e.FirstName, e.LastName, sum(s.Quantity) AS total
FROM sales As s
JOIN employees AS e
ON s.EmployeeID = e.EmployeeID
group by s.EmployeeID
ORDER BY total DESC;

/* 4. joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name, c.Name
FROM departments AS d
JOIN categories AS c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = 'Appliances' or c.Name = 'Games';

/* 5. joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name, SUM(s.Quantity) AS 'Total # sold', SUM(s.Quantity * s.PricePerUnit) AS 'Total price sold'
 FROM products AS p
 JOIN sales AS s
 ON p.ProductID = s.ProductID
 WHERE p.Name = 'Eagles: Hotel California';
 
/* 6. joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.comment
FROM products AS p
JOIN reviews AS r
ON p.ProductID = r.ProductID
WHERE p.name = 'Visio TV' AND r.rating = 1;

-- ------------------------------------------ Extra - May be difficult
/* Bonus. Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */

SELECT e.EmployeeID, e.FirstName, e.LastName, p.Name AS 'Product', s.Quantity
FROM employees AS e
JOIN sales AS s
ON e.EmployeeID = s.EmployeeID
JOIN products AS p
ON p.ProductID = s.ProductID
ORDER BY e.EmployeeID;
