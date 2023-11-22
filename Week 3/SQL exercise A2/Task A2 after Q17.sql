
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
   and starttime like '2015%';       -- gets the info.  now need to sum the column gender?  Answer  84,908


   -- or can use

   select count (*)
   from Seattle_cycles_trip
    where gender ='Male'
   and starttime like '2015%';


-- Q10 How many rows do not have nulls for the column birth year?

select * from Seattle_cycles_trip

select count (birthyear)
birthyear
 from Seattle_cycles_trip
 where birthyear is not null -- Answer 181,553

 -- Q11 How old was the youngest rider that we know about?

select * from Seattle_cycles_trip

select top 1
trip_id
, usertype
, birthyear
from Seattle_cycles_trip
where birthyear is not null
order by birthyear desc  -- assuming it is now 2023, the answer is 24 (the most recent birth year is 1999)

-- Q12 How many total trips started and ended at the same station?

select * from Seattle_cycles_trip

select
trip_id
, from_station_name
, to_station_name
from Seattle_cycles_trip
where from_station_name = to_station_name  -- gives all the info.  Now need to count 'how many'

select count (*) from_station_name
from Seattle_cycles_trip
where from_station_name = to_station_name -- tried to use Trip ID to give more columns.  Answer is 15,282

-- Q13 how many unique bikes were rented per year by short term pass holders?

select * from Seattle_cycles_trip

select count (distinct bikeid) as 'Unique bikes'-- distinct shows each bikeid once only
, year (starttime) as 'Year' -- using function rather than grouping by 
from Seattle_cycles_trip 
where usertype = 'Short-Term Pass Holder' -- to distinguish between types
group by year (starttime) -- won't work without this                          Answer is 2014 - 474.  2015 - 468

-- Q14 What is the earliest and latest dates we have in the Seattle_weather_conditions table?

select * from Seattle_weather_daily

select min(Date) as 'Earliest date', max(Date) as 'Latest date' from Seattle_weather_daily -- Answer earliest - 2014-10-13.  Latest date - 2016-08-31

-- Q15 Calculate the difference in temperature on each day between the maximum (F) and minimum (F), then sort your results to diiscover on 
--which date(s) this difference was largest

select * from Seattle_weather_daily

select
Date
, (Max_Temperature_F - Min_TemperatureF) as 'Difference between Max and Min Temp'
from Seattle_weather_daily
order by 'Difference between Max and Min Temp' desc -- Answer is 2016-08-19 - Diff was 69

-- Q16 Summarise the average humidity per month (all years)

select * from Seattle_weather_conditions

select 
year (Date) as 'Month'
, month (Date) as Year
, Mean_Humidity
from Seattle_weather_conditions
--group by month (Date);
order by year (Date)

select 
year (Date) as 'Year'
, month (Date) as Month
, Mean_Humidity
from Seattle_weather_conditions
--group by month (Date);
order by year (Date) -- this gives the years and months with their mean humidity but does not summarise

select 
month (Date) as 'Month'
, avg(Mean_humidity) as 'Average Humidity'
from Seattle_weather_conditions
group by month(Date) -- Answer given in Ave Humidity as first column

-- Q17 Which month(s) in 2015 saw the highest max windspeed (not gusts) recorded?

select * from Seattle_weather_conditions

select
year (Date) as Year -- to be able to distinguish between months and  years
, month (Date) as Month
, Max_Wind_Speed_MPH
from Seattle_weather_conditions
order by Max_Wind_Speed_MPH desc -- to arrange from highest to lowest.  Answer is December 2015, Max winde speed 30mph

-- Q18 















 
  






