/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/

selecT N, 
CASE when COALESCE(P,P,0) = 0  THEN 'Root'
 when N NOT IN (select distinct COALESCE(P,P,0) from BST) THEN 'Leaf' 
 when N IN (select distinct COALESCE(P,P,0) from BST) THEN 'Inner' END 
from BST order by N ASC;
