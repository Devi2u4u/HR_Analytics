use hranalystics;
select * from hr_1;
-- Average Hourly rate of Male Research Scientist
select avg(HourlyRate) from hr_1 where gender = "Male" and JobRole = "Research Scientist";
-- Department wise avg attrition rate
select Department, avg(Attrition = "Yes")*100 as Attrition_Rate from hr_1 group by Department order by Attrition_Rate desc;
-- Attrition rate Vs Year since last promotion relation
SELECT YearsSinceLastPromotion, AVG(Attrition = 'Yes')*100 AS Attrition_Rate
FROM HR_2 A JOIN HR_1 B
ON A.Employee_ID = B.EmployeeNumber
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;
-- Average working years for each Department
SELECT Department,round(AVG(TotalWorkingYears)) AS Avg_working_yr FROM HR_2 A JOIN HR_1 B
ON A.Employee_ID = B.EmployeeNumber
GROUP BY Department;
-- Job Role Vs Work life balance
SELECT JobRole,AVG(WorkLifeBalance) AS Avg_WorkLifeBalance FROM HR_2 A JOIN HR_1 B
ON A.Employee_ID = B.EmployeeNumber
GROUP BY JobRole;

-- Attrition rate Vs Monthly income stats
SELECT MonthlyIncome, AVG(Attrition = 'Yes')*100 AS Attrition_Rate
FROM HR_2 A JOIN HR_1 B
ON A.Employee_ID = B.EmployeeNumber
GROUP BY MonthlyIncome;
