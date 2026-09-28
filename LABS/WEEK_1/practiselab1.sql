# Lab 1 — Taxation Learning Database

#Part 1 — Create and Select the Database

CREATE DATABASE taxation_learning;

USE taxation_learning;

#Check that you are using the correct database

SELECT DATABASE();
#Part 2 — Create the Taxpayer Table

CREATE TABLE Taxpayer (
    taxpayer_id INT PRIMARY KEY,
    pan_number VARCHAR(10) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    occupation VARCHAR(50) NOT NULL,
    annual_income DECIMAL(12,2) NOT NULL,
    email VARCHAR(100) UNIQUE,
    is_active BOOLEAN
);
DESCRIBE Taxpayer;
#Part 3 — Insert Taxpayer Data
INSERT INTO Taxpayer
(taxpayer_id, pan_number, full_name, date_of_birth, occupation, annual_income, email, is_active)
VALUES
(101, 'ABCDE1234F', 'Ravi Kumar', '1995-06-15', 'Software Engineer', 850000.00, 'ravi.kumar@example.com', TRUE),
(102, 'BCDEF2345G', 'Priya Sharma', '1992-11-22', 'Doctor', 1200000.00, 'priya.sharma@example.com', TRUE),
(103, 'CDEFG3456H', 'Arjun Reddy', '1988-03-10', 'Business Owner', 1800000.00, 'arjun.reddy@example.com', TRUE),
(104, 'DEFGH4567J', 'Sneha Patel', '1998-08-05', 'Teacher', 620000.00, 'sneha.patel@example.com', TRUE),
(105, 'EFGHJ5678K', 'Kiran Rao', '1990-01-18', 'Freelancer', 750000.00, 'kiran.rao@example.com', TRUE),
(106, 'FGHJK6789L', 'Meera Singh', '1985-12-30', 'Consultant', 1500000.00, 'meera.singh@example.com', FALSE);
SELECT * FROM Taxpayer;

---

# Create Income_Category

CREATE TABLE Income_Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(200) NOT NULL,
    taxable BOOLEAN NOT NULL
);
INSERT INTO Income_Category
(category_id, category_name, description, taxable)
VALUES
(1, 'Salary', 'Income received from employment', TRUE),
(2, 'Business', 'Income earned from business activities', TRUE),
(3, 'House Property', 'Income received from property or rent', TRUE),
(4, 'Capital Gains', 'Income from transfer of eligible assets', TRUE),
(5, 'Other Sources', 'Income such as bank interest', TRUE),
(6, 'Agricultural Income', 'Income from eligible agricultural activities', FALSE);
show tables;
SELECT * FROM Income_Category;
#Create Financial_Year
CREATE TABLE Financial_Year (
    year_id INT PRIMARY KEY,
    year_label VARCHAR(9) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    filing_deadline DATE,
    is_current BOOLEAN NOT NULL
);

INSERT INTO Financial_Year
(year_id, year_label, start_date, end_date, filing_deadline, is_current)
VALUES
(1, '2020-2021', '2020-04-01', '2021-03-31', '2021-07-31', FALSE),
(2, '2021-2022', '2021-04-01', '2022-03-31', '2022-07-31', FALSE),
(3, '2022-2023', '2022-04-01', '2023-03-31', '2023-07-31', FALSE),
(4, '2023-2024', '2023-04-01', '2024-03-31', '2024-07-31', FALSE),
(5, '2024-2025', '2024-04-01', '2025-03-31', '2025-07-31', FALSE),
(6, '2025-2026', '2025-04-01', '2026-03-31', '2026-07-31', TRUE);
SELECT * FROM Financial_Year;
# Create Income_Record
CREATE TABLE Income_Record (
    income_id INT PRIMARY KEY,
    taxpayer_id INT NOT NULL,
    income_source VARCHAR(100) NOT NULL,
    category_name VARCHAR(50) NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    received_date DATE NOT NULL,
    financial_year VARCHAR(9) NOT NULL
);
INSERT INTO Income_Record
(income_id, taxpayer_id, income_source, category_name, amount, received_date, financial_year)
VALUES
(1001, 101, 'TechNova Solutions', 'Salary', 850000.00, '2026-03-31', '2025-2026'),
(1002, 102, 'City Care Hospital', 'Salary', 1200000.00, '2026-03-31', '2025-2026'),
(1003, 103, 'Reddy Enterprises', 'Business', 1800000.00, '2026-03-31', '2025-2026'),
(1004, 104, 'Sunrise School', 'Salary', 620000.00, '2026-03-31', '2025-2026'),
(1005, 105, 'Web Design Projects', 'Business', 750000.00, '2026-03-31', '2025-2026'),
(1006, 106, 'Professional Consulting', 'Business', 1500000.00, '2026-03-31', '2025-2026');
SELECT * FROM Income_Record;
#7.1 Add taxpayer 107
INSERT INTO Taxpayer
(taxpayer_id, pan_number, full_name, date_of_birth, occupation, annual_income, email, is_active)
VALUES
(107, 'GHIJK7890M', 'Ananya Das', '1996-04-12', 'Analyst', 900000.00, 'ananya.das@example.com', TRUE);
SELECT * FROM Taxpayer;

#7.2 Update Ravi Kumar's income
UPDATE Taxpayer
SET annual_income = 950000.00
WHERE taxpayer_id = 101;

SELECT * FROM Taxpayer
WHERE taxpayer_id = 101;

#7.3 Update Kiran Rao's occupation

UPDATE Taxpayer
SET occupation = 'Software Consultant'
WHERE taxpayer_id = 105;

#7.4 Activate Meera Singh
UPDATE Taxpayer
SET is_active = TRUE
WHERE taxpayer_id = 106;

SELECT * FROM Taxpayer
WHERE taxpayer_id = 106;

#7.5 Delete taxpayer 107

DELETE FROM Taxpayer
WHERE taxpayer_id = 107;

SELECT * FROM Taxpayer;

#7.6 Add Rental Income category

INSERT INTO Income_Category
(category_id, category_name, description, taxable)
VALUES
(7, 'Rental Income', 'Income received from renting property', TRUE);

#Part 8 — ALTER TABLE
#8.1 Add phone_number to Taxpayer

ALTER TABLE Taxpayer
ADD phone_number VARCHAR(15);

DESCRIBE Taxpayer;

#8.2 Add remarks to Income_Record

ALTER TABLE Income_Record
ADD remarks VARCHAR(200);
DESCRIBE Income_Record;

# occupation size

ALTER TABLE Taxpayer
MODIFY occupation VARCHAR(100) NOT NULL;

#Part 9 — Temporary Tax_Office Table
CREATE TABLE Tax_Office (
    office_id INT PRIMARY KEY,
    office_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

INSERT INTO Tax_Office
(office_id, office_name, city)
VALUES
(1, 'Central Tax Office', 'Vijayawada'),
(2, 'Regional Tax Office', 'Hyderabad');

SELECT * FROM Tax_Office;

#Part 10 — TRUNCATE

TRUNCATE TABLE Tax_Office;
SELECT * FROM Tax_Office;
#The table still exists, but its rows are gone.

#Part 11 — DROP
DROP TABLE Tax_Office;
SHOW TABLES;
#"Tax_Office" should no longer appear.
#Part 12 — Constraint Experiments
INSERT INTO Taxpayer
(taxpayer_id, pan_number, full_name, date_of_birth, occupation, annual_income, email, is_active)
VALUES
(101, 'ZZZZZ9999Z', 'Test Person', '2000-01-01', 'Student', 300000.00, 'test@example.com', TRUE);

#This should fail because "taxpayer_id = 101" already exists.

#Duplicate UNIQUE value
INSERT INTO Taxpayer
(taxpayer_id, pan_number, full_name, date_of_birth, occupation, annual_income, email, is_active)
VALUES
(108, 'ABCDE1234F', 'Test Person', '2000-01-01', 'Student', 300000.00, 'test2@example.com', TRUE);

#This should fail because "ABCDE1234F" already belongs to another taxpayer.

#NULL in NOT NULL column
INSERT INTO Taxpayer
(taxpayer_id, pan_number, full_name, date_of_birth, occupation, annual_income, email, is_active)
VALUES
(109, 'ZZZZZ8888Z', NULL, '2000-01-01', 'Student', 300000.00, 'test3@example.com', TRUE);
#This should fail because "full_name" is "NOT NULL".

SELECT DATABASE();
SHOW TABLES;