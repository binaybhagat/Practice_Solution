/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
select name||'('||substr(occupation,1,1)||')' as output_text from OCCUPATIONS order by name;
selecT 'There are a total of '||occupation_count||' '||LOWER(occupation)||'s'|| '.' as output_text 
from 
(select count(1) as occupation_count,occupation from OCCUPATIONS group by occupation 
order by occupation_count,occupation ASC);

