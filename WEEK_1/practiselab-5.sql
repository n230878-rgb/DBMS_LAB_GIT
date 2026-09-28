create database taxation_lab5;
CREATE TABLE taxation_lab5.Taxpayer
LIKE taxation_learning.Taxpayer;
INSERT INTO taxation_lab5.Taxpayer
SELECT * FROM taxation_learning.Taxpayer;
CREATE TABLE taxation_lab5.Income_Category
LIKE taxation_learning.Income_Category;
INSERT INTO taxation_lab5.Income_Category
SELECT * FROM taxation_learning.Income_Category;
CREATE TABLE taxation_lab5.Financial_Year
LIKE taxation_learning.Financial_Year;
INSERT INTO taxation_lab5.Financial_Year
SELECT * FROM taxation_learning.Financial_Year;
CREATE TABLE taxation_lab5.Income_Record
LIKE taxation_learning.Income_Record;
INSERT INTO taxation_lab5.Income_Record
SELECT * FROM taxation_learning.Income_Record;
select * from income_record;
use taxation_lab5;
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
set year_id=1
where taxpayer_id="101";
update income_record
set year_id=2
where taxpayer_id="102";
update income_record
set year_id=3
where taxpayer_id="103";
update income_record
set year_id=4
where taxpayer_id="104";
update income_record
set year_id=5
where taxpayer_id="105";
update income_record
set year_id=6
where taxpayer_id="106";


#level-1 task-1
select count(*) as
total_records
from income_record;
#task-2
select sum(amount) as
total_income
from income_record;

select avg(amount) as
average_income
from income_record;
select max(amount) as
highest_income
from income_record;
select min(amount) as
lowest_incomw
from income_record;
#level-2
#task-1
select category_id,count(*)
as number_of_records
from income_record
group by category_id;
#task-2
select category_id,
sum(amount) as
total_income
from income_record
group by category_id;
#task-3
select category_id,
avg(amount) as
average_income
from income_record
group by category_id;
#task-4
select category_id,
max(amount) as
highest_income
from income_record
group by category_id;
select category_id,
min(amount) as
lowest_income
from income_record
group by category_id;
select year_id,
sum(amount) as
total_income
from income_record
group by year_id;
select year_id,count(*) as
number_of_records
from income_record
group by year_id;
select category_id,year_id,
sum(amount)
as total_income
from income_record
group by category_id,year_id;

