--select * from Reviews where Rating = 1
--select district_id, COUNT(*) AS rating_count
--from Reviews where Rating = 1
--group by district_id
--order by rating_count desc;

--select count(distinct district_id) as distinct_district_count
--from Reviews

--select district_id, COUNT(*) AS rating_count
--from Reviews where Rating = 1
--group by district_id
--order by rating_count desc
--LIMIT TOP 20 PERCENT;
--LIMIT (SELECT COUNT(rating_count) * 0.2 from Reviews;

--select district_id, COUNT(*) AS rating_count
--from Reviews where Rating = 1
--group by district_id
--order by rating_count desc

--SELECT C.district_id, COUNT(*) AS closed_without_relief_count
--FROM Client C
--JOIN Events E ON C.Client_id = E.Client_id
--WHERE E.Company_response_to_consumer = 'Closed without relief'
--GROUP BY C.district_id
--ORDER BY closed_without_relief_count DESC;

--WITH DistrictClosedCount AS (
--    SELECT C.district_id, COUNT(*) AS closed_without_relief_count
--    FROM Client C
--    JOIN Events E ON C.Client_id = E.Client_id
--    WHERE E.Company_response_to_consumer = 'Closed without relief'
--    GROUP BY C.district_id
--), RankedDistricts AS (
--    SELECT district_id, closed_without_relief_count,
--           PERCENT_RANK() OVER (ORDER BY closed_without_relief_count DESC) AS percent_rank
--    FROM DistrictClosedCount
--)
--SELECT district_id, closed_without_relief_count
--FROM RankedDistricts
--WHERE percent_rank <= 0.2
--ORDER BY closed_without_relief_count DESC;

SELECT server,
       SUM(CASE WHEN outcome = 'AGENT' THEN 1 ELSE 0 END) AS agent_count       
FROM CallCentreLogs
GROUP BY server
ORDER BY agent_count DESC;
