--select * from Reviews where Rating = 1
select district_id, COUNT(*) AS rating_count
from Reviews where Rating = 1
group by district_id
order by rating_count desc;

select count(distinct district_id) as distinct_district_count
from Reviews

select district_id, COUNT(*) AS rating_count
from Reviews where Rating = 1
group by district_id
order by rating_count desc
--LIMIT TOP 20 PERCENT;
--LIMIT (SELECT COUNT(DISTINCT district_id) * 0.2 from Reviews;