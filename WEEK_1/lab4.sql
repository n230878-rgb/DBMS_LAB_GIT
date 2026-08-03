USE taxation;

-- ===========================
-- PART A
-- ===========================

SHOW TABLES;

SELECT * FROM taxpayer;
SELECT * FROM Income_Category;
SELECT * FROM Financial_Year;
SELECT * FROM Income_Record;

-- ===========================
-- PART B - LEVEL 1
-- ===========================

-- Task 1
SELECT t.full_name, i.income_source
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id = i.taxpayer_id;

-- Task 2
SELECT t.full_name, c.category_name
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id = i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id = c.category_id;

-- Task 3
SELECT i.income_id, i.income_source, f.year_label
FROM Income_Record i
INNER JOIN Financial_Year f
ON i.year_id = f.year_id;

-- Task 4
SELECT t.full_name,
       t.annual_income,
       i.amount
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id = i.taxpayer_id;

-- Task 5
SELECT t.full_name,
       i.income_source,
       c.category_name,
       f.year_label
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id = i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id = c.category_id
INNER JOIN Financial_Year f
ON i.year_id = f.year_id;

-- ===========================
-- LEVEL 2
-- ===========================

-- Task 1
SELECT t.full_name,
       i.income_source
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id = i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id = c.category_id
WHERE c.category_name='Salary';

-- Task 2
SELECT t.full_name,
       t.occupation,
       i.income_source
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id
WHERE c.category_name='Business';

-- Task 3
SELECT t.full_name,
       f.start_date,
       f.end_date
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Financial_Year f
ON i.year_id=f.year_id;

-- Task 4
SELECT t.full_name,
       c.description
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id;

-- Task 5
SELECT t.full_name,
       t.pan_number,
       t.occupation,
       i.income_source,
       c.category_name,
       i.amount,
       f.year_label,
       f.start_date,
       f.end_date
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id
INNER JOIN Financial_Year f
ON i.year_id=f.year_id;

-- ===========================
-- LEVEL 3
-- ===========================

-- Task 1
SELECT t.full_name,
       i.income_source
FROM taxpayer t
LEFT OUTER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id;

-- Task 2
SELECT c.category_name,
       i.income_source
FROM Income_Record i
RIGHT OUTER JOIN Income_Category c
ON i.category_id=c.category_id;

-- Task 3
SELECT t.full_name,
       i.income_source
FROM taxpayer t
LEFT JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id

UNION

SELECT t.full_name,
       i.income_source
FROM taxpayer t
RIGHT JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id;

-- Task 4
SELECT t.full_name,
       f.year_label
FROM taxpayer t
CROSS JOIN Financial_Year f;

-- Task 5
SELECT A.full_name AS Taxpayer1,
       B.full_name AS Taxpayer2,
       A.occupation
FROM taxpayer A
JOIN taxpayer B
ON A.occupation=B.occupation
AND A.taxpayer_id<B.taxpayer_id;

-- ===========================
-- ADDITIONAL PRACTICE
-- ===========================

-- Task 6
SELECT t.full_name,
       t.pan_number,
       i.income_source,
       c.category_name,
       f.year_label
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id
INNER JOIN Financial_Year f
ON i.year_id=f.year_id;

-- Task 7
SELECT t.full_name,
       c.category_name,
       c.description
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id;

-- Task 8
SELECT i.income_source,
       f.year_label
FROM Income_Record i
INNER JOIN Financial_Year f
ON i.year_id=f.year_id;

-- Task 9
SELECT t.full_name,
       c.category_name,
       f.year_label
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id
INNER JOIN Financial_Year f
ON i.year_id=f.year_id
WHERE c.category_name='Business'
AND f.year_label='2025-2026';

-- Task 10
SELECT t.taxpayer_id,
       t.full_name,
       t.pan_number,
       t.occupation,
       i.income_source,
       i.amount,
       c.category_name,
       c.description,
       f.year_label,
       f.start_date,
       f.end_date
FROM taxpayer t
INNER JOIN Income_Record i
ON t.taxpayer_id=i.taxpayer_id
INNER JOIN Income_Category c
ON i.category_id=c.category_id
INNER JOIN Financial_Year f
ON i.year_id=f.year_id;