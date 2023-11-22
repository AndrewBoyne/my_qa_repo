select * from Seattle_cycles_trip

select 
from_station_id
, t.trip_id
, t.bikeid
, t.tripduration
, count (s.name) 
from Seattle_cycles_trip as t
join seattle_cycles_station as s
on t.from_station_id=s.station_id

-- From which station (ID and name) were most cycle hire trips taken overall? 

  select
  name
  , count (name) as 'Number of trips'
  from Seattle_cycles_station as s
  join Seattle_cycles_trip  as t
  on s.station_id=t.from_station_id
  group by name
  order by count (name) desc  -- Answer Pier 69 / Alaskan Way & Clay St

--How many trips were taken from this station?  Answer is included in the above result - 13,054

select * from Seattle_cycles_trip

 select 
 left (tripduration/60, 2) as 'duration in minutes'
 from Seattle_cycles_trip

 --How many unique bikes were borrowed from this station?

 select 
 count(distinct bikeid) as 'Number of trips from pier 69...'
 --, (from_station_name) as 'Location'
 from Seattle_cycles_trip
 where from_station_name='Pier 69 / Alaskan Way & Clay St' -- Answer 485
 --group by from_station_name
-- order by count (from_station_name)
 
  select 
count (distinct bikeid) as 'Unique bikes borrowed'
--, (from_station_name) as 'Location'
 from Seattle_cycles_trip
 where from_station_name='Pier 69 / Alaskan Way & Clay St'
 --group by from_station_name
-- order by count (from_station_name)

-- What was the average trip duration (rounded to the nearest number of minutes) from this station?

select * from Seattle_cycles_trip

select 
	--s.station_id  --not required on the select section
	t.from_station_name -- do not need to select columns and then do the count, sum or avg functions.  Enough to write the function
	,count(t.trip_id) as 'Total Trips'
	,count (distinct t.bikeid) as 'Bikes taken from station'
	,round(avg(t.tripduration) /60, 0) as 'Average Duration'
	from Seattle_cycles_station as s
	join Seattle_cycles_trip  as t
	on s.station_id=t.from_station_id
	group by t.from_station_id, t.from_station_name -- dont need a where... because we can see the most popular station
	order by 'Total Trips' desc
