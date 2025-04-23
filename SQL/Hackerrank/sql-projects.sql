/*

You are given a table, Projects, containing three columns: Task_ID, Start_Date and End_Date. 
It is guaranteed that the difference between the End_Date and the Start_Date is equal to 1 day
for each row in the table.

*/

select min(start_date), max(end_date) from(
select Start_Date , end_date,to_char(start_date,'dd')- row_number() over (order by start_date) as rnk
from projects)
group by rnk
order by max(end_date)-min(start_date) ,min(start_date);
    