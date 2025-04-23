/*
The total score of a hacker is the sum of their maximum scores for all of the challenges. 
Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score.
If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. 
Exclude all hackers with a total score of 0 from your result.
*/

with Submission as (
select hacker_id,challenge_id,max(score) as score from Submissions
    group by hacker_id,challenge_id
)
selecT s.hacker_id,h.name,sum(s.score) from Hackers h 
   join Submission s on h.hacker_id = s.hacker_id
group by s.hacker_id,h.name
having sum(s.score) <> 0
order by sum(s.score) desc ,s.hacker_id asc;
   