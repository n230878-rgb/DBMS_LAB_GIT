USE taxation;

-- PART A
-- Step 1: Remove old columns
ALTER TABLE Income_Record
DROP COLUMN category_name,
DROP COLUMN financial_year;

-- Step 2: Add new columns
ALTER TABLE Income_Record
ADD category_id INT,
ADD year_id INT;

-- Step 3: Add Foreign Keys
ALTER TABLE Income_Record
ADD CONSTRAINT fk_taxpayer
FOREIGN KEY (taxpayer_id)
REFERENCES taxpayer(taxpayer_id);

ALTER TABLE Income_Record
ADD CONSTRAINT fk_category
FOREIGN KEY (category_id)
REFERENCES Income_Category(category_id);

ALTER TABLE Income_Record
ADD CONSTRAINT fk_year
FOREIGN KEY (year_id)
REFERENCES Financial_Year(year_id);

-- Step 4: Update existing records
UPDATE Income_Record SET category_id=1, year_id=6 WHERE income_id=1001;
UPDATE Income_Record SET category_id=1, year_id=6 WHERE income_id=1002;
UPDATE Income_Record SET category_id=2, year_id=6 WHERE income_id=1003;
UPDATE Income_Record SET category_id=1, year_id=6 WHERE income_id=1004;
UPDATE Income_Record SET category_id=2, year_id=6 WHERE income_id=1005;
UPDATE Income_Record SET category_id=2, year_id=6 WHERE income_id=1006;
#part-B
-- Task 1
INSERT INTO Income_Record
VALUES (1010,999,'ABC Company',500000,'2026-03-31',1,6,NULL);

-- Task 2
INSERT INTO Income_Record
VALUES (1011,101,'ABC Company',500000,'2026-03-31',20,6,NULL);

-- Task 3
INSERT INTO Income_Record
VALUES (1012,101,'ABC Company',500000,'2026-03-31',1,15,NULL);

-- Task 4
DELETE FROM taxpayer
WHERE taxpayer_id=101;

-- Task 5
DELETE FROM Income_Category
WHERE category_id=1;
# PART-c
SELECT DISTINCT occupation FROM taxpayer;

SELECT DISTINCT category_name FROM Income_Category;

SELECT DISTINCT year_label FROM Financial_Year;

SELECT DISTINCT income_source FROM Income_Record;
#PART-D 
SELECT full_name
FROM taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id FROM Income_Record WHERE category_id=1)

UNION

SELECT full_name
FROM taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id FROM Income_Record WHERE category_id=2);


SELECT income_source
FROM Income_Record
WHERE year_id=5

UNION

SELECT income_source
FROM Income_Record
WHERE year_id=6;


SELECT full_name
FROM taxpayer
WHERE occupation='Teacher'

UNION

SELECT full_name
FROM taxpayer
WHERE occupation='Software Engineer';
#PART-E
/*SELECT taxpayer_id
FROM Income_Record
WHERE category_id=1

INTERSECT

SELECT taxpayer_id
FROM Income_Record
WHERE category_id=2;


SELECT taxpayer_id
FROM Income_Record
WHERE year_id=5

INTERSECT

SELECT taxpayer_id
FROM Income_Record
WHERE year_id=6;*/
#PART-F
/*SELECT taxpayer_id
FROM Income_Record
WHERE category_id=1

EXCEPT

SELECT taxpayer_id
FROM Income_Record
WHERE category_id=2;


SELECT taxpayer_id
FROM Income_Record
WHERE year_id=6

EXCEPT

SELECT taxpayer_id
FROM Income_Record
WHERE year_id=5;*/
#PART-G
SELECT full_name
FROM taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id FROM Income_Record);


SELECT *
FROM taxpayer
WHERE occupation IN
(
SELECT occupation
FROM taxpayer
WHERE taxpayer_id IN
(
SELECT taxpayer_id
FROM Income_Record
WHERE category_id=2
)
);
#PART-H
SELECT *
FROM taxpayer
WHERE taxpayer_id NOT IN
(SELECT taxpayer_id FROM Income_Record);


SELECT occupation
FROM taxpayer
WHERE occupation NOT IN
(
SELECT occupation
FROM taxpayer
WHERE taxpayer_id IN
(SELECT taxpayer_id FROM Income_Record)
);
#PART-I 
SELECT *
FROM taxpayer t
WHERE EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.taxpayer_id=t.taxpayer_id
);


SELECT *
FROM Financial_Year f
WHERE EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.year_id=f.year_id
);
#PART-J 
SELECT *
FROM taxpayer t
WHERE NOT EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.taxpayer_id=t.taxpayer_id
);


SELECT *
FROM Income_Category c
WHERE NOT EXISTS
(
SELECT *
FROM Income_Record i
WHERE i.category_id=c.category_id
);
#PART-K 
SELECT *
FROM taxpayer
WHERE annual_income > ANY
(
SELECT annual_income
FROM taxpayer
WHERE occupation='Teacher'
);


SELECT *
FROM taxpayer
WHERE annual_income > ANY
(
SELECT amount
FROM Income_Record
WHERE category_id=2
);
#PART-L 
SELECT *
FROM taxpayer
WHERE annual_income > ALL
(
SELECT annual_income
FROM taxpayer
WHERE occupation='Teacher'
);


SELECT *
FROM taxpayer
WHERE annual_income > ALL
(
SELECT amount
FROM Income_Record
WHERE category_id=2
);
#PART-M
SELECT * FROM taxpayer ORDER BY full_name;

SELECT * FROM taxpayer WHERE annual_income>800000;

SELECT * FROM taxpayer WHERE occupation='Software Engineer';

SELECT * FROM Income_Record WHERE category_id=2;

SELECT * FROM Income_Record
WHERE amount BETWEEN 500000 AND 1000000;

SELECT * FROM taxpayer
WHERE full_name LIKE 'A%';

SELECT * FROM taxpayer
WHERE is_active=TRUE;

SELECT COUNT(*) FROM taxpayer;

SELECT MAX(annual_income) FROM taxpayer;
#PART-N
SELECT full_name,annual_income
FROM taxpayer
ORDER BY annual_income DESC
LIMIT 1;


SELECT category_id,COUNT(*) AS total
FROM Income_Record
GROUP BY category_id
ORDER BY total DESC
LIMIT 1;


SELECT occupation,COUNT(*) AS total
FROM taxpayer
GROUP BY occupation;


SELECT COUNT(*) AS Active_Taxpayers
FROM taxpayer

WHERE is_active=TRUE;


SELECT year_id,COUNT(*) AS total
FROM Income_Record
GROUP BY year_id
ORDER BY total DESC
LIMIT 1;
