-- use data_new
-- 1. show all columns and rows in the table
select * from salaries where 1;            -- "where 1" is optional

-- 2. show only employee name and job title
select  EmployeeName, JobTitle from salaries;

-- 3. show the no. of employee in the table
select count(distinct(EmployeeName)) from salaries; 

-- 4. show the unique job titles in the table
select distinct(JobTitle) from salaries;

-- 5. show the job title and overtime pay for all employee with overtime pay greater then 50000
select JobTitle, OvertimePay from salaries where OvertimePay > 50000; 

-- 6. show the average pay for all the employees.
select avg(BasePay) as "Avg. Base Pay" from salaries;

-- 7. show the top 10 highest paid employee.
select EmployeeName, TotalPay from salaries order by TotalPay desc limit 10; 

-- 8. Show the average of basepay,Overtimepay and otherpay for each employee
select EmployeeName,(BasePay+OvertimePay+OtherPay)/3 as "Avg. of BP,OTP,OP" from salaries; 

-- 9. Show all employees who have the word "Manager" in their job title.
select EmployeeName,JobTitle  from salaries where JobTitle like "%Manager%";

-- 10. Show all employees with a job title not equal to "Manager".
SELECT * FROM salaries WHERE JobTitle not like '%manager%';

-- 11. Show all employees with a total pay between 50,000 and 75,000
select EmployeeName,TotalPay from salaries where TotalPay between 50000 and 75000;  

-- 12. Show all employees with a base pay less then 50,000 or a totalpay greater then 100000
select EmployeeName, BasePay, TotalPay from salaries where BasePay < 50000 and TotalPay >100000; 

-- 13. Show all employees with a total pay benefits value between 1,25,000 and 1,50,000 and a job title containing the word "Director"
select Id,EmployeeName, TotalPayBenefits, JobTitle from salaries where TotalPayBenefits between 125000 and 150000 and lower(JobTitle) like "%Director%";

-- 14. Show all employees ordered by their total pay benefits in the decending order.
select EmployeeName, TotalPayBenefits from salaries order by TotalPayBenefits desc;

-- 15. Show all job titles with an average base pay of atleast 1,00,000 and order them by the average base pay in descending order.
select JobTitle, avg(BasePay) as "Avg_Base_Pay" from salaries group by JobTitle having avg(BasePay) >= 100000 order by Avg_Base_Pay desc;  

-- 16. Delete the column
select * from salaries ;
alter table salaries drop column Notes;
alter table salaries drop column Benefits;

-- 17. Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%.
SET SQL_SAFE_UPDATES = 0;
update salaries set BasePay = BasePay * 1.1 where JobTitle like "%Manager%";
select EmployeeName,JobTitle,BasePay from salaries;

-- 18. Delete all employees who have no overtimepay
select * from salaries where OverTimePay =0;
delete from salaries where OverTimePay =0;