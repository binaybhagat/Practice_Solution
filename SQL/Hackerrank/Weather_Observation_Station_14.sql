/*
Query the greatest value of the Northern Latitudes (LAT_N) from STATION that is less than . 
Truncate your answer to  decimal places.
*/

SELECT ROUND(MAX(lat_n), 4)
FROM   station
WHERE  lat_n < 137.2345;