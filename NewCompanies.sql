/* Problem: Amber's conglomerate corporation just acquired some new
companies. Each of the companies follows this hierarchy:

Founder -> Lead Manager -> Senior Manager -> Manager -> Employee

Given the table schemas below, write a query to print the company_code,
founder name, total number of lead managers, total number of senior
managers, total number of managers, and total number of employees. Order
your output by ascending company_code.

Note:
The tables may contain duplicate records.
The company_code is string, so the sorting should not be numeric. For
example, if the company_codes are C_1, C_2, and C_10, then the ascending
company_codes will be C_1, C_10, and C_2. */

-- Tables have duplicate values, so we must count using DISTINCT.
-- We need to join all tables so that we can properly count while
-- grouping by each level of the hierarchy.

select C.company_code,C.founder ,
        count(distinct L.lead_manager_code),
        count(distinct S.senior_manager_code),
        count(distinct M.manager_code),
        count(distinct E.employee_code)        
from company C
    join Lead_Manager L on L.company_code = C.company_code
    join Senior_Manager S on S.lead_manager_code = L.lead_manager_code
    join Manager M on M.senior_manager_code = S.senior_manager_code
    join Employee E on E.manager_code = M.manager_code
group by C.company_code,C.founder
Order by C.company_code;
