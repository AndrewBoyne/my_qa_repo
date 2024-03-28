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

--SELECT server,
--       SUM(CASE WHEN outcome = 'AGENT' THEN 1 ELSE 0 END) AS agent_count,
--FROM CallCentreLogs
--GROUP BY server 
--ORDER BY agent_count DESC;

--SELECT server,
--       AVG(DATEDIFF(SECOND, '00:00:00', ser_time)) AS avg_ser_time_seconds
--FROM CallCentreLogs
--WHERE server IS NOT NULL and server != 'NO_SERVER'
--GROUP BY server
--ORDER BY avg_ser_time_seconds ASC;
--
--select district_id, COUNT(*) AS rating_count
--from Reviews where Rating = 5
--group by district_id
--order by rating_count desc;

--select * from District

--SELECT D.bank_branch AS district_name, 
--       COUNT(*) AS rating_count
--FROM Reviews R
--JOIN District D ON R.district_id = D.district_id
--WHERE R.Rating = 5
--GROUP BY R.district_id, D.bank_branch
--ORDER BY rating_count DESC;

SELECT Consumer_complaint_narrative, COUNT(*) AS answer_count
FROM Events 
WHERE Consumer_complaint_narrative IS NULL
GROUP BY Consumer_complaint_narrative
ORDER BY answer_count DESC;



SELECT C.district_id, COUNT(*) AS no_narrative
FROM Client C
JOIN Events E ON C.Client_id = E.Client_id
WHERE E.Consumer_complaint_narrative is Null
GROUP BY C.district_id
ORDER BY no_narrative DESC;

WITH BranchNullCount AS (
    SELECT C.district_id, COUNT(*) AS no_narrative
    FROM Client C
    JOIN Events E ON C.Client_id = E.Client_id
    WHERE E.Consumer_complaint_narrative IS NULL
    GROUP BY C.district_id
)
SELECT district_id, 
       no_narrative,
       ABS(no_narrative - 246) AS distance_from_mean
FROM BranchNullCount
ORDER BY distance_from_mean DESC;

WITH BranchNullCount AS (
    SELECT C.district_id, COUNT(*) AS no_narrative
    FROM Client C
    JOIN Events E ON C.Client_id = E.Client_id
    WHERE E.Consumer_complaint_narrative IS NULL
    GROUP BY C.district_id
)
SELECT D.bank_branch, 
       BNC.district_id, 
       BNC.no_narrative,
       ABS(BNC.no_narrative - 246) AS distance_from_mean
FROM BranchNullCount BNC
JOIN District D ON BNC.district_id = D.district_id
ORDER BY distance_from_mean DESC;