--select * 
--from District
--where bank_branch in ('Quay Manchester', 'Minneapolis Quay', 'Washinton State Quay', 'Quay Nachsville Main', 'Quay Sioux Falls');
--select * from [Permanant Order]

SELECT AVG(no_narrative) AS mean_null_count
FROM (
    SELECT C.district_id, COUNT(*) AS no_narrative
    FROM Client C
    JOIN Events E ON C.Client_id = E.Client_id
    WHERE E.Consumer_complaint_narrative IS NULL
    GROUP BY C.district_id
) AS subquery;

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