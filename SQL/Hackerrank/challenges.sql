/*
Julia asked her students to create some coding challenges. 
Write a query to print the hacker_id, name, and the total number of challenges created by each student. 
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is 
less than the maximum number of challenges created, then exclude those students from the result.
*/

with challenge_count as
( select hacker_id, count(challenge_id) chal 
 from challenges group by hacker_id),
duplicate_challenge as
(select chal,count(chal) dup from challenge_count group by chal having count(chal) > 1),
filterout_chal as 
(select chal,dup from duplicate_challenge where chal < (selecT max(chal) from challenge_count))
select c.hacker_id ,h.name, c.chal 
from challenge_count c inner join Hackers h on c.hacker_id=h.hacker_id
where c.chal not in (select distinct chal from filterout_chal)
order by c.chal desc,c.hacker_id ;