use taxation;
#part-a
select *
from income_record
where amount=
(
select max(amount)
from income_record
);
select *
from income_record
where amount=
(
select min(amount)
from income_record
);
select *
from income_record
where amount>
(
select avg(amount)
from income_record
);
select *
from income_record
where  amount=
(
select max(amount)
from income_record
);
select *
from taxpayer
where taxpayer_id in
(
select taxpayer_id
from taxpayer
where occupation="Business Owner");
#PART-b
SELECT *
FROM taxpayer
where taxpayer_id in 
(
select taxpayer_id 
from income_record
);
select *
from taxpayer
where taxpayer_id in
(
select taxpayer_id 
from income_record 
where category_id in
(
select category_id 
from income_category
where category_name="Business"
)
);
select * 
from income_record
where year_label in(
select year_label
from financial_year
where year_label="2025-2026"
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);
select* 
from income_record
where amount>
(
select min(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="business"
)
);

select* 
from income_record
where amount <
(
select max(amount)
from income_record
where category_id in
(
select category_id
from income_category
where category_name="salary"
)
);
select *
from taxpayer
where taxpayer_id in (
select taxpayer_id
from income_record
where amount>
(
select avg(amount)
from income_record
)
);
select*
from income_category
where category_id in
(
select category_id
from income_record
);
SELECT *
FROM Taxpayer
WHERE taxpayer_id NOT IN
(
    SELECT taxpayer_id
    FROM Income_Record
    WHERE category_id =
    (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Investment'
    )
);
#level-3
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(
    SELECT taxpayer_id
    FROM Income_Record
    WHERE amount =
    (
        SELECT MAX(amount)
        FROM Income_Record
    )
);
SELECT *
FROM Income_Record
WHERE amount >
(
    SELECT AVG(amount)
    FROM Income_Record
    WHERE category_id IN
    (
        SELECT category_id
        FROM Income_Category
        WHERE category_name = 'Business'
    )
);
SELECT *
FROM Taxpayer
WHERE taxpayer_id IN
(
    SELECT taxpayer_id
    FROM Income_Record
    WHERE amount >
    (
        SELECT AVG(amount)
        FROM Income_Record
    )
);