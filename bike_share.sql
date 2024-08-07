USE bike_share;

GO


-- Join Tables
with cte as (
select * from bike_share_2021
union
select * from bike_share_2022)


select
dteday,
season,
a.yr,
weekday,
hr,
rider_type,
riders,
price,
COGS,
riders*price as revenue,
riders*price -COGS as profit
from cte a
left join cost_table b
on a.yr = b.yr