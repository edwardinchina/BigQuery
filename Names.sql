with T as (select *
from `bigquery-public-data.usa_names.usa_1910_2013`
where name like 'Ann%'
)
select gender, sum(number)
from T
group by gender;

with T as (select *
from `bigquery-public-data.usa_names.usa_1910_2013`
where name like 'Ann%'
)
select name, array_to_string(array_agg(distinct gender order by gender asc),''), sum(number) total, (select sum(number) from T where gender = 'M' and name = T2.name) M, (select sum(number) from T where gender = 'F' and name = T2.name) as F
from T as T2
group by name
order by count(*) desc;
