/*
Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id and name of hackers who achieved full scores 
for more than one challenge. Order your output in descending order by the total number of 
challenges in which the hacker earned a full score. If more than one hacker received 
full scores in same number of challenges, then sort them by ascending hacker_id.

*/

with diff_score as 
(
    select c.challenge_id,c.hacker_id, d.score 
    from Difficulty d join Challenges c on c.difficulty_level = d.difficulty_level
),
sub_score as 
(
    select s.hacker_id,count(s.challenge_id) cnt_value from Submissions s join diff_score d 
    on d.score = s.score and s.challenge_id = d.challenge_id
    group by s.hacker_id having  count(s.challenge_id) > 1
)
select h.hacker_id,h.name  from sub_score s join Hackers h on h.hacker_id=s.hacker_id
order by cnt_value desc,hacker_id asc;