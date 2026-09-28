USE taxation_db;


SHOW TABLES;

SELECT * FROM Taxpayer;
SELECT * FROM Income_Category;
SELECT * FROM Financial_Year;
SELECT * FROM Income_Record;



-- LEVEL 1

SELECT COUNT(*) AS total_income_records
FROM Income_Record;


-- Task 2

SELECT SUM(amount) AS total_income
FROM Income_Record;


-- Task 3

SELECT AVG(amount) AS average_income
FROM Income_Record;


-- Task 4: 

SELECT MAX(amount) AS highest_income
FROM Income_Record;


-- Task 5:

SELECT MIN(amount) AS lowest_income
FROM Income_Record;




-- Task 1: 

SELECT category_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY category_id;


-- Task 2: 

SELECT category_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id;


-- Task 3: 

SELECT category_id,
       AVG(amount) AS average_income
FROM Income_Record
GROUP BY category_id;


-- Task 4: 

SELECT category_id,
       MAX(amount) AS highest_income
FROM Income_Record
GROUP BY category_id;


-- Task 5: 

 

-- Task 6: 

SELECT year_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY year_id;


-- Task 7: 

SELECT year_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY year_id;


-- Task 8: 

SELECT category_id,
       year_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id, year_id;




-- Task 1: 

SELECT category_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id
HAVING SUM(income_amount) > 1000000;




SELECT category_id,
       AVG(income_amount) AS average_income
FROM Income_Record
GROUP BY category_id
HAVING AVG(income_amount) > 500000;


SELECT year_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY year_id
HAVING COUNT(*) > 3;


-- Task 4: 

SELECT category_id,
       SUM(mount) AS total_income
FROM Income_Record
GROUP BY category_id
ORDER BY SUM(mount) DESC;


-- Task 5: 

SELECT category_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id
HAVING SUM(amount) > 1000000
ORDER BY SUM(amount) DESC;


-- Task 6: 

SELECT category_id,
       SUM(amount) AS total_income,
       AVG(amount) AS average_income
FROM Income_Record
GROUP BY category_id;


-- Task 7:

SELECT category_id,
       year_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id, year_id
ORDER BY SUM(amount) DESC
LIMIT 1;


-- Task 8:
SELECT year_id,
       COUNT(DISTINCT taxpayer_id) AS number_of_taxpayers
FROM Income_Record
GROUP BY year_id;




-- PART C – REAL-WORLD TAXATION ANALYSIS


-- Task 1:
SELECT category_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY category_id
ORDER BY SUM(amount) DESC
LIMIT 1;


-- Task 2: 

SELECT year_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY year_id
ORDER BY SUM(amount) DESC
LIMIT 1;


-- Task 3: 

SELECT category_id,
       AVG(amount) AS average_income
FROM Income_Record
GROUP BY category_id
ORDER BY AVG(amount) DESC
LIMIT 1;


-- Task 4: 

SELECT category_id,
       COUNT(*) AS number_of_records
FROM Income_Record
GROUP BY category_id
HAVING COUNT(*) > 2;


-- Task 5: 

SELECT year_id,
       SUM(amount) AS total_income
FROM Income_Record
GROUP BY year_id
HAVING SUM(amount) > 1000000;


-- Task 6: 

SELECT category_id,
       COUNT(*) AS number_of_records,
       SUM(amount) AS total_income,
       AVG(amount) AS average_income,
       MAX(amount) AS highest_income,
       MIN(amount) AS lowest_income
FROM Income_Record
GROUP BY category_id;