SELECT sumdid, tripduration AS travel_minutes
FROM trips
WHERE trips.tripduration > '1'
ORDER BY travel_minutes DESC
LIMIT 5;

SELECT 
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY tripduration) AS q1,
  PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY tripduration) AS q2,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY tripduration) AS q3
FROM trips AS t
WHERE t.tripduration > '1'
AND t.tripduration < '1440'
AND t.pubtimestamp >='2019-05-05T00:00:00Z' AND pubtimestamp <='2019-05-11T23:59:59Z'


SELECT 
	(SELECT tripduration 
FROM trips AS t
WHERE t.tripduration > '1'
AND t.tripduration < '1440'
AND t.pubtimestamp >='2019-05-05T00:00:00Z' AND pubtimestamp <='2019-05-11T23:59:59Z') AS may_trips, 
	(SELECT tripduration
FROM trips AS t
WHERE t.tripduration > '1'
AND t.tripduration < '1440'
AND t.pubtimestamp >='2019-06-02T00:00:00Z' AND pubtimestamp <='2019-06-08T23:59:59Z') AS june_trips


SELECT AVG(tripduration)
FROM trips AS t
WHERE t.tripduration > '1'
AND t.tripduration < '1440'
AND t.pubtimestamp >='2019-06-02T00:00:00Z' AND pubtimestamp <='2019-06-08T23:59:59Z'
