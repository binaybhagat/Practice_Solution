/*
Print Prime Numbers

Write a query to print all prime numbers less than or equal to . Print your result on a single line, and use the ampersand () character as your separator (instead of a space).
For example, the output for all prime numbers < 10 would be:

2&3&5&7

*/

with CTE as (
select l prime_number
  from (select level l from dual connect by level <= 1000)
     , (select level m from dual connect by level <= 1000)
 where m<=l
 group by l
having count(case l/m when trunc(l/m) then 'Y' end) = 2
 order by l
 )
 select listagg(prime_number,'&') WITHIN GROUP (ORDER BY prime_number asc)  from cte;