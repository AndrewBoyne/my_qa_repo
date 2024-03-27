--select * from Reviews where Rating = 1
select district_id, COUNT(*) AS rating_count
from Reviews where Rating = 1
group by district_id
order by rating_count desc;

--select count(distinct district_id as