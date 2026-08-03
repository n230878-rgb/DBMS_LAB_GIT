USE taxation;

-- =========================
-- PART A
-- =========================

SHOW TABLES;

SELECT * FROM taxpayer;
SELECT * FROM Income_Category;
SELECT * FROM Financial_Year;
SELECT * FROM Income_Record;

-- =========================
-- PART B : STRING FUNCTIONS
-- =========================

-- 1
SELECT UPPER(full_name) AS Name_Upper
FROM taxpayer;

-- 2
SELECT LOWER(occupation) AS Occupation_Lower
FROM taxpayer;

-- 3
SELECT full_name,
LENGTH(full_name) AS Name_Length
FROM taxpayer;

-- 4
SELECT pan_number,
LEFT(pan_number,4) AS First4
FROM taxpayer;

-- 5
SELECT CONCAT(full_name,' - ',occupation) AS Details
FROM taxpayer;

-- 6
SELECT REPLACE(category_name,'Income','Inc.') AS Category
FROM Income_Category;

-- 7
SELECT TRIM(full_name) AS Name
FROM taxpayer;

-- 8
SELECT SUBSTRING_INDEX(full_name,' ',1) AS First_Name
FROM taxpayer;

-- 9
SELECT CONCAT('Taxpayer : ',full_name,
'\nOccupation : ',occupation) AS Display_Details
FROM taxpayer;

-- 10
SELECT *
FROM taxpayer
WHERE pan_number LIKE 'AP%';

-- =========================
-- PART C : NUMERIC FUNCTIONS
-- =========================

-- 1
SELECT full_name,
ROUND(annual_income) AS Rounded_Income
FROM taxpayer;

-- 2
SELECT full_name,
ABS(annual_income-500000) AS Difference
FROM taxpayer;

-- 3
SELECT full_name,
POWER(annual_income,2) AS Square
FROM taxpayer;

-- 4
SELECT full_name,
MOD(annual_income,1000) AS Remainder
FROM taxpayer;

-- 5
SELECT full_name,
ROUND(annual_income,2) AS Rounded
FROM taxpayer;

-- 6
SELECT full_name,
CEIL(annual_income) AS Ceiling_Value,
FLOOR(annual_income) AS Floor_Value
FROM taxpayer;

-- 7
SELECT FLOOR(RAND()*100)+1 AS Random_Number;

-- 8
SELECT full_name,
SQRT(annual_income) AS Square_Root
FROM taxpayer;

-- 9
SELECT full_name,
annual_income,
annual_income*1.10 AS Incremented_Income
FROM taxpayer;

-- =========================
-- PART D : DATE FUNCTIONS
-- =========================

-- 1
SELECT CURDATE();

-- 2
SELECT NOW();

-- 3
SELECT year_label,
YEAR(start_date) AS Year_Value
FROM Financial_Year;

-- 4
SELECT year_label,
MONTH(start_date) AS Month_Value
FROM Financial_Year;

-- 5
SELECT year_label,
DAY(start_date) AS Day_Value
FROM Financial_Year;

-- 6
SELECT year_label,
DATE_ADD(start_date,INTERVAL 1 YEAR) AS End_Date
FROM Financial_Year;

-- 7
SELECT year_label,
DATE_ADD(start_date,INTERVAL 30 DAY) AS Add_30_Days
FROM Financial_Year;

-- 8
SELECT year_label,
DATE_SUB(start_date,INTERVAL 7 DAY) AS Minus_7_Days
FROM Financial_Year;

-- 9
SELECT year_label,
DATEDIFF(CURDATE(),start_date) AS Total_Days
FROM Financial_Year;

-- 10
SELECT *
FROM Financial_Year
WHERE YEAR(start_date)=YEAR(CURDATE());

-- =========================
-- PART E : CONVERSION FUNCTIONS
-- =========================

-- 1
SELECT full_name,
CAST(annual_income AS SIGNED) AS Integer_Income
FROM taxpayer;

-- 2
SELECT CAST(taxpayer_id AS CHAR) AS Taxpayer_ID
FROM taxpayer;

-- 3
SELECT year_label,
CAST(start_date AS DATETIME) AS Start_DateTime
FROM Financial_Year;

-- 4
SELECT full_name,
CAST(annual_income AS DECIMAL(12,2)) AS Decimal_Income
FROM taxpayer;

-- 5
SELECT full_name,
CAST(annual_income AS CHAR) AS Income_String
FROM taxpayer;

-- 6
SELECT full_name,
CAST(annual_income AS DECIMAL(12,2))*0.10 AS Tax_Amount
FROM taxpayer;