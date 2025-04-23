/*

We define an employee's total earnings to be their monthly salary x month  worked, 
and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. 
Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. 
Then print these values as  space-separated integers.

*/

with cte as 
(
select employee_id, (months * salary) as total_income
 from Employee
)
select total_income,count(distinct employee_id) from cte
where total_income = (select max(total_income) from cte)
group by total_income;