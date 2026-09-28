create database taxation_lab6;
CREATE TABLE taxation_lab6.Taxpayer
LIKE taxation_learning.Taxpayer;
INSERT INTO taxation_lab6.Taxpayer
SELECT * FROM taxation_learning.Taxpayer;
CREATE TABLE taxation_lab6.Income_Category
LIKE taxation_learning.Income_Category;
INSERT INTO taxation_lab6.Income_Category
SELECT * FROM taxation_learning.Income_Category;
CREATE TABLE taxation_lab6.Financial_Year
LIKE taxation_learning.Financial_Year;
INSERT INTO taxation_lab6.Financial_Year
SELECT * FROM taxation_learning.Financial_Year;
CREATE TABLE taxation_lab6.Income_Record
LIKE taxation_learning.Income_Record;
INSERT INTO taxation_lab6.Income_Record
SELECT * FROM taxation_learning.Income_Record;
select * from income_record;
select * from taxpayer;
select * from income_category;
select * from financial_year;
use taxation_lab6;

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
select * from
income_record
where amount=(select max(amount) from income_record);
select * from
income_record
where amount=(select min(amount) from income_record);
select * from
income_record
where amount>(select avg(amount) from income_record);
select * from 
income_record
where amount=(select max(amount) from income_record);
select * from taxpayer
where taxpayer_id in 
(select taxpayer_id
from taxpayer
where occupation="business owner");
#where occupation='business owner';
#level-2
select * from taxpayer
where taxpayer_id in(
select taxpayer_id
from income_record);
select * from taxpayer
where taxpayer_id in 
(select taxpayer_id from income_record
where  category_id=(select category_id from income_category
where category_name='business'));
select * 
from income_record
where year_id=(select year_id from financial_year
where financial_year='2025-2026');#output all 6 records;
select * from
income_record
where amount>
(select min(amount)
from income_record
where  category_id=(select category_id from income_category
where category_name='business'));
select * from
income_record
where amount>
(select min(amount)
from income_record
where  category_id=(select category_id from income_category
where category_name='business'));
select * from
income_record
where amount>
(select min(amount)
from income_record
where  category_id=(select category_id from income_category
where category_name='business'));
select * from
income_record
where amount>
(select min(amount)
from income_record
where  category_id=(select category_id from income_category
where category_name='business'));
select * from
income_record
where amount>
(select min(amount)
from income_record
where  category_id=(select category_id from income_category
where category_name='business'));
SELECT *
FROM Income_Record
WHERE amount <
(SELECT MAX(amount)
FROM Income_Record
WHERE category_id =
(SELECT category_id
FROM Income_Category
WHERE category_name = 'Salary'));
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id
FROM Income_Record
WHERE amount >
(SELECT AVG(amount)
FROM Income_Record));

SELECT *
FROM Income_Category
WHERE category_id IN
(SELECT category_id
FROM Income_Record);

SELECT *
FROM Taxpayer
WHERE taxpayer_id NOT IN
(SELECT taxpayer_id
FROM Income_Record
WHERE category_id = 3);
# LEVEL 3 – MEDIUM TO ADVANCED
# Task 1
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id
FROM Income_Record
wheRE amount =
(SELECT MAX(amount)
FROM Income_Record));
# Task 2
SELECT *
FROM Income_Record
WHERE amount >
(SELECT AVG(amount)
FROM Income_Record
WHERE category_id =
(SELECT category_id
FROM Income_Category
WHERE category_name = 'Business'));
# Task 3
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id
FROM Income_Record
WHERE amount >
(SELECT AVG(amount)
FROM Income_Record));
#Task 4
SELECT *
FROM Income_Record
WHERE amount > ANY
(SELECT amount
FROM Income_Record
WHERE category_id =
(SELECT category_id
FROM Income_Category
WHERE category_name = 'Investment'));

#Task 5
SELECT *
FROM Income_Record
WHERE amount > ALL
(SELECT amount
FROM Income_Record
WHERE category_id =
(SELECT category_id
FROM Income_Category
WHERE category_name = 'Investment'));
# Task 6
SELECT *
FROM Income_Category
WHERE category_id =
(SELECT category_id
frOM Income_Record
WHERE amount =
(SELECT MAX(amount)
fROM Income_Record));
#Task 7
SELECT *
FROM Financial_Year
WHERE year_id =
(SELECT year_id
frOM Income_Record
GROUP BY year_id
ORDER BY SUM(amount) DESC
LIMIT 1);
#Task 8
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) >
(SELECT AVG(total_income)
FROM
(selECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id) AS T);
#REAL-WORLD TAXATION ANALYSIS
# Task 1
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id
frOM Income_Record
WHERE amount =
(SELECT MAX(amount)
FROM Income_Record));

#Task 2
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id
FROM Income_Record
WHERE amount >
(SELECT AVG(amount)
fROM Income_Record));
-- Task 3
SELECT *
FROM Income_Category
WHERE category_id =
(SELECT category_id
FROM Income_Record
WHERE amount =
(SELECT MAX(amount)
FROM Income_Record));
-#Task 4:
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
whERE category_id =
(SELECT category_id
FROM Income_Category
WHERE category_name = 'Investment'));


#ask 
SELECT *
FROM Income_Record
WHERE amount > ALL
      (SELECT amount
       FROM Income_Record
       WHERE category_id =
             (SELECT category_id
              FROM Income_Category
              WHERE category_name = 'Investment'));
#Task 6: 
SELECT *
FROM Income_Record
WHERE amount > ANY
(SELECT amount
frOM Income_Record
WHERE category_id =
(SELECT category_id
FROM Income_Category
WHERE category_name = 'Investment'));
# Task 7:
SELECT taxpayer_id, SUM(amount) AS total_income
FROM Income_Record
GROUP BY taxpayer_id
HAVING SUM(amount) =
       (SELECT MAX(total_income)
        FROM
        (SELECT taxpayer_id, SUM(amount) AS total_income
         FROM Income_Record
         GROUP BY taxpayer_id) AS T);
 #Task 8: 
SELECT *
FROM Income_Record IR
WHERE amount >
      (SELECT AVG(amount)
       FROM Income_Record
       WHERE category_id = IR.category_id);
       