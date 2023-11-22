select * from Seattle_cycles_trip

select 
from_station_id
, t.trip_id
, t.bikeid
, t.tripduration
, s.name
from Seattle_cycles_trip as t
join seattle_cycles_station as s
on t.from_station_id=s.station_id
