
--Q1 How many rows are in the Seattle_cycles_station table?  Answer - 58

SELECT count (*) -- or (@@CURSOR_ROWS)
  FROM [Seattle_cyclehire].[dbo].[Seattle_cycles_station] 

-- Q2 How many unique station IDs are there?  Answer - 58

  select * from Seattle_cycles_station -- gives all overall info

  select distinct station_id from Seattle_cycles_station 

-- Q3 Which cycle stations (names) have been decommissioned?  Answer - 4
  
 select name
 , decommission_date
 from Seattle_cycles_station
 where decommission_date is not null 

-- Q4 In total, how many installed docks have been decommissioned?

 select * from Seattle_cycles_station

 select sum (install_dockcount) 
 from Seattle_cycles_station
 where decommission_date is not null -- Answer 68

 -- Q5 What was the earliest date and the latest date that cycle stations were installed?

  select * from Seattle_cycles_station

  select max(install_date), min(install_date) from Seattle_cycles_station -- Answer - Latest date - 2016-08-09 
  -- or both queries
  select min(install_date) from Seattle_cycles_station -- Answer - Earliest date - 2014-10-13 

  -- Q6 How many unique trips are there overall?  Does that match the number of rows in the Seattle_cycles_trip table?

  select * from Seattle_cycles_trip

  select count(*) trip_id from Seattle_cycles_trip -- Answer - 187,800, part 2 - yes

  SELECT count (*) -- or (@@CURSOR_ROWS)
  FROM [Seattle_cycles_trip]

  -- Q7 What is the average trip duration in minutes?

  select * from Seattle_cycles_trip

  select avg((tripduration)/60)
  from Seattle_cycles_trip -- this is in seconds so we need to divide by 60.  Andswer - 19.6322212657091

  -- Q8 From which station did the largest number of individual trips begin?

 select 
 count (trip_id) as 'Number of Trips'
 ,from_station_name
 from Seattle_cycles_trip
 group by from_station_name
 order by 'Number of Trips' desc  -- Answer Number of Trips	from_station_name 8269	Pier 69 / Alaskan Way & Clay St

 -- Q9 How many male members of the cycle hire scheme made trips in 2015?

   select * from Seattle_cycles_trip

   select count (gender)
   from Seattle_cycles_trip
   where gender ='Male'
   and starttime like '2015%';       -- gets the info.  now need to sum the column gender?  Answer  70,047

-- Q10 How many rows do not have nulls for the column birth year?

select * from Seattle_cycles_trip

select count (birthyear)
birthyear
 from Seattle_cycles_trip
 where birthyear is not null -- Answer 118,689

 -- Q11 How old was the youngest rider that we know about?

select * from Seattle_cycles_trip

select
usertype
, birthyear
from Seattle_cycles_trip
where birthyear is not null
order by birthyear desc  -- assuming it is now 2023, the answer is 24














 
  






