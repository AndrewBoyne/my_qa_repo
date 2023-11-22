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
  order by count (name) desc
 
