/*
Query the following two values from the STATION table:

The sum of all values in LAT_N rounded to a scale of  decimal places.
The sum of all values in LONG_W rounded to a scale of  decimal places.

*/

SELECT ROUND(Sum(lat_n), 2),ROUND(Sum(long_w), 2)
FROM   station;