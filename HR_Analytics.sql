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
SELECT CASE
		WHEN MonthlyIncome BETWEEN 1001 AND 6000 THEN '1001 - 6000'
        WHEN MonthlyIncome BETWEEN 6001 AND 11000 THEN '6001 - 11000'
        WHEN MonthlyIncome BETWEEN 11001 AND 16000 THEN '11001 - 16000'
        WHEN MonthlyIncome BETWEEN 16001 AND 21000 THEN '16001 - 21000'
        WHEN MonthlyIncome BETWEEN 21001 AND 26000 THEN '21001 - 26000'
        WHEN MonthlyIncome BETWEEN 26001 AND 31000 THEN '26001 - 31000'
        WHEN MonthlyIncome BETWEEN 31001 AND 36000 THEN '31001 - 36000'
        WHEN MonthlyIncome BETWEEN 36001 AND 41000 THEN '36001 - 41000'
        WHEN MonthlyIncome BETWEEN 41001 AND 46000 THEN '41001 - 46000'
        WHEN MonthlyIncome BETWEEN 46001 AND 51000 THEN '46001 - 51000'
        ELSE '>51001'
		END MonthlyIncomeRange,
ROUND(AVG(Attrition = 'Yes')*100,2) as Attrition_Rate
FROM HR_2 A
INNER JOIN HR_1 B
ON A.Employee_ID = B.EmployeeNumber
GROUP BY MonthlyIncomeRange
ORDER BY Attrition_Rate DESC;
