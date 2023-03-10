use employee_attrition;
SELECT * FROM HREMP;
-- Employess under attrition having 5+ years of experience in between the age group of 27-35

SELECT * FROM HREMP
WHERE ï»¿Age BETWEEN 27 AND 35
AND TOTALWORKINGYEARS >= 5;

-- Fetch the deatils of the employees having maximum and minimum salary working in different departments who received less than 13% salary hike
SELECT Department, PERCENTSALARYHIKE,MAX(MONTHLYINCOME),MIN(MONTHLYINCOME) FROM HREMP
GROUP BY DEPARTMENT
HAVING PERCENTSALARYHIKE < 13;

-- Calculate the average monthly income of all the employees who worked more than 3 years whose education background is medical
SELECT AVG(MONTHLYINCOME) FROM HREMP
WHERE YEARSATCOMPANY > 3 AND EDUCATIONFIELD = 'MEDICAL';

-- Identify the total no of male and female employees under attrition whose marital status is married and haven't received promotion in the last 2 yrs

SELECT GENDER,COUNT(ATTRITION) AS NO_OF_EMPLOYEES FROM HREMP
WHERE MARITALSTATUS = 'MARRIED' AND YEARSSINCELASTPROMOTION = 2 AND ATTRITION ='YES'
GROUP BY GENDER;

-- Employees with max performance rating but no promotion for 4 yrs and above

SELECT COUNT(ATTRITION) AS NO_OF_EMPLOYEES FROM HREMP
WHERE PERFORMANCERATING = (SELECT MAX(PERFORMANCERATING) FROM HREMP) AND YEARSSINCELASTPROMOTION >= 4;

-- Who has max and min percentage of salary hike

SELECT YEARSATCOMPANY,PERFORMANCERATING,YEARSSINCELASTPROMOTION,
MAX(PERCENTSALARYHIKE),MIN(PERCENTSALARYHIKE) FROM HREMP
GROUP BY YEARSATCOMPANY,PERFORMANCERATING,YEARSSINCELASTPROMOTION
ORDER BY MAX(PERCENTSALARYHIKE) DESC, MIN(PERCENTSALARYHIKE) ASC;

SELECT * FROM HREMP
WHERE OVERTIME = 'YES' AND YEARSATCOMPANY > 5
AND PERCENTSALARYHIKE = (SELECT MIN(PERCENTSALARYHIKE) FROM HREMP);

SELECT * FROM HREMP
WHERE OVERTIME = 'NO' AND YEARSATCOMPANY < 5
AND PERCENTSALARYHIKE = (SELECT MAX(PERCENTSALARYHIKE) FROM HREMP);

SELECT MARITALSTATUS,MAX(RELATIONSHIPSATISFACTION),MIN(RELATIONSHIPSATISFACTION)
FROM HREMP
GROUP BY MARITALSTATUS;

