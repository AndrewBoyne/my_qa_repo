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
	,round(avg(t.tripduration) /60, 0) as 'Average Duration in whole minutes'
	from Seattle_cycles_station as s
	join Seattle_cycles_trip  as t
	on s.station_id=t.from_station_id
	group by t.from_station_id, t.from_station_name -- dont need a where... because we can see the most popular station
	order by 'Total Trips' desc

	--Answers – 
--1.	From which station (ID and name) were most cycle hire trips taken overall?							Pier 69…
--2.	How many trips were taken from this station?														13,054
--3.	How many unique bikes were borrowed from this station?												485
--4.	What was the average trip duration (rounded to the nearest number of minutes) from this station?	35

--On which dates did it snow in Seattle?

select Date 
	,events
	from Seattle_weather_conditions
	where events like '%Snow%'             --Answer 5 days.  2014-11-29, 2015-11-28, 2015-12-14, 2016-01-03, 2016-01-15

select cast(starttime as date)
	from Seattle_cycles_trip
		

		select  --top 1
		count(t.trip_id) as 'Number of Trips'   --gives the (highest) number of cycle trips which took place
		,w.Date									--on date
		from Seattle_weather_conditions as w	--we need the date to come from this table
		join  Seattle_cycles_trip as t			--this is where the trip info comes from
		on w.date=cast(t.starttime as Date)		--so we can match the format of the date on trip (YMDHMS) to that on weather (YMD)
		where w.events like '%Snow%'			--filter required to show days on which it rained
		group by w.date							--if there a filter we need to select a grouping - in this case dates (as we want most trips on a given date)
		order by 'Number of Trips' desc			--will put them in order of magnitude

		--How many trips were taken on each hour of the day when there had been snow that day?

	Select
		datepart (hh,t.starttime) as 'Hour of Day'	--converts date format into hour
		,count(t.trip_id) as 'Number of Trips'		--we need to know the number of trips taken per hour
		from seattle_weather_conditions as w		--the date comes from this table
		join seattle_cycles_trip as t				--trip info from this table
		on w.date=cast(t.starttime as date)			--need the date formats to match as above
		where w.events like '%Snow%'				--filter to show snowy days
		group by datepart(hh,t.starttime)			--group by (as there is the where filter)
		order by 'Hour of Day'						--number of trips taken
		

				


		
