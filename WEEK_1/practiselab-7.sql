create database taxation_lab7;
CREATE TABLE taxation_lab7.Taxpayer
LIKE taxation_learning.Taxpayer;
INSERT INTO taxation_lab7.Taxpayer
SELECT * FROM taxation_learning.Taxpayer;
CREATE TABLE taxation_lab7.Income_Category
LIKE taxation_learning.Income_Category;
INSERT INTO taxation_lab7.Income_Category
SELECT * FROM taxation_learning.Income_Category;
CREATE TABLE taxation_lab7.Financial_Year
LIKE taxation_learning.Financial_Year;
INSERT INTO taxation_lab7.Financial_Year
SELECT * FROM taxation_learning.Financial_Year;
CREATE TABLE taxation_lab7.Income_Record
LIKE taxation_learning.Income_Record;
INSERT INTO taxation_lab7.Income_Record
SELECT * FROM taxation_learning.Income_Record;
select * from income_record;
select * from taxpayer;
select * from income_category;
select * from financial_year;
use taxation_lab7;

alter table income_record
add column category_id int,
add column year_id int;
alter table income_record
add constraint
fk_income_category
foreign key(category_id)
references
income_category(category_id);
alter table income_record
add constraint
fk_income_year
foreign key(year_id)
references
financial_year(year_id);
update income_record
set category_id=1
where income_id='1001';
update income_record
set category_id=1
where income_id='1002';
update income_record
set category_id=2
where income_id='1003';
update income_record
set category_id=1
where income_id='1004';
update income_record
set category_id=2
where income_id='1005';
update income_record
set category_id=2
where income_id='1006';
set sql_safe_updates=0;
update income_record
set year_id=6
where taxpayer_id="101";
update income_record
set year_id=6
where taxpayer_id="102";
update income_record
set year_id=6
where taxpayer_id="103";
update income_record
set year_id=6
where taxpayer_id="104";
update income_record
set year_id=6
where taxpayer_id="105";
update income_record
set year_id=6
where taxpayer_id="106";
select * from income_record;
#level-1
-- Task 1
CREATE VIEW highest_income_view AS
SELECT *
FROM Income_Record
WHERE amount = (SELECT MAX(amount) FROM Income_Record);

-- Task 2
CREATE VIEW lowest_income_view AS
SELECT *
FROM Income_Record
WHERE amount = (SELECT MIN(amount) FROM Income_Record);

-- Task 3
CREATE VIEW above_average_income AS
SELECT *
FROM Income_Record
WHERE amount > (SELECT AVG(amount) FROM Income_Record);
select * from above_average_income;
-- Task 4
CREATE VIEW highest_recorded_income AS
SELECT *
FROM Income_Record
WHERE amount = (SELECT MAX(amount) FROM Income_Record);

-- Task 5
CREATE VIEW business_owners AS
SELECT taxpayer_id, full_name, occupation
FROM Taxpayer
WHERE occupation = 'Business Owner';
#level-2
-- Task 1
CREATE VIEW taxpayers_with_income AS
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record);

-- Task 2
CREATE VIEW business_income_taxpayers AS
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Business'));

-- Task 3
CREATE VIEW income_2025_2026 AS
SELECT i.*
FROM Income_Record i
INNER JOIN Financial_Year f
ON i.year_id = f.year_id
WHERE f.financial_year = '2025-2026';

-- Task 4
CREATE VIEW above_min_business_income AS
SELECT *
FROM Income_Record
WHERE amount >
      (SELECT MIN(amount)
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Business'));

-- Task 5
CREATE VIEW below_max_salary_income AS
SELECT *
FROM Income_Record
WHERE amount <
      (SELECT MAX(amount)
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Salary'));

-- Task 6
CREATE VIEW above_average_taxpayers AS
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE amount > (SELECT AVG(amount)
                       FROM Income_Record));

-- Task 7
CREATE VIEW categories_with_income AS
SELECT *
FROM Income_Category
WHERE category_id IN
      (SELECT category_id
       FROM Income_Record);

-- Task 8
CREATE VIEW taxpayers_without_investment AS
SELECT *
FROM Taxpayer
WHERE taxpayer_id NOT IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));
#level-3
-- Task 1
CREATE VIEW highest_income_taxpayer AS
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE amount = (SELECT MAX(amount)
                       FROM Income_Record));

-- Task 2
CREATE VIEW above_average_business_income AS
SELECT *
FROM Income_Record
WHERE amount >
      (SELECT AVG(amount)
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Business'));

-- Task 3
CREATE VIEW taxpayers_above_average_total AS
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) >
       (SELECT AVG(total_income)
        FROM
        (SELECT taxpayer_id, SUM(amount) AS total_income
         FROM Income_Record
         GROUP BY taxpayer_id) AS T);

-- Task 4
CREATE VIEW greater_than_any_investment AS
SELECT *
FROM Income_Record
WHERE amount > ANY
      (SELECT amount
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));

-- Task 5
CREATE VIEW greater_than_all_investment AS
SELECT *
FROM Income_Record
WHERE amount > ALL
      (SELECT amount
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));

-- Task 6
CREATE VIEW highest_income_category AS
SELECT *
FROM Income_Category
WHERE category_id =
      (SELECT category_id
       FROM Income_Record
       WHERE amount = (SELECT MAX(amount)
                       FROM Income_Record));

-- Task 7
CREATE VIEW highest_income_year AS
SELECT *
FROM Financial_Year
WHERE year_id =
      (SELECT year_id
       FROM Income_Record
       GROUP BY year_id
       ORDER BY SUM(amount) DESC
       LIMIT 1);

-- Task 8
CREATE VIEW taxpayers_above_average_total_income AS
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) >
       (SELECT AVG(total_income)
        FROM
        (SELECT taxpayer_id, SUM(amount) AS total_income
         FROM Income_Record
         GROUP BY taxpayer_id) AS T);
#applications
-- Task 1
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE amount = (SELECT MAX(amount)
                       FROM Income_Record));

-- Task 2
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE amount > (SELECT AVG(amount)
                       FROM Income_Record));

-- Task 3
SELECT *
FROM Income_Category
WHERE category_id =
      (SELECT category_id
       FROM Income_Record
       WHERE amount = (SELECT MAX(amount)
                       FROM Income_Record));

-- Task 4
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Business'))
AND taxpayer_id NOT IN
      (SELECT taxpayer_id
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));

-- Task 5
SELECT *
FROM Income_Record
WHERE amount > ALL
      (SELECT amount
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));

-- Task 6
SELECT *
FROM Income_Record
WHERE amount > ANY
      (SELECT amount
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));

-- Task 7
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) =
       (SELECT MAX(total_income)
        FROM
        (SELECT taxpayer_id, SUM(amount) AS total_income
         FROM Income_Record
         GROUP BY taxpayer_id) AS T);

-- Task 8
SELECT *
FROM Income_Record
WHERE amount >
      (SELECT AVG(amount)
       FROM Income_Record
       WHERE category_id = Income_Record.category_id);