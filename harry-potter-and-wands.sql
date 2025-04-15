/*
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed
 to buy each non-evil wand of high power and age. 
 Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, 
 sorted in order of descending power. If more than one wand has same power, 
 sort the result in order of descending age.
 */
 
 select Wands.id,Wands_Property.age,Wands.coins_needed,Wands.power
from Wands join
Wands_Property on Wands.code = Wands_Property.code and Wands_Property.is_evil = 0
where (Wands.power, Wands.code, Wands.coins_needed) IN (
        SELECT power, code, MIN(coins_needed)
          FROM Wands
        GROUP BY power, code
       )
order by Wands.power desc ,Wands_Property.age desc;
