--What is the overall graduation rate across all schools?
SELECT 
    ROUND(SUM(Y.No_Graduated) * 1.0 / SUM(Y.No_in_Class) * 100,1) AS Overall_Graduation_Rate
FROM 
    yr2023_grad_data AS Y;




--What are the top 10 schools with the highest graduation rates
--for Maricopa County, Arizona?
SELECT 
    Y.School_Name, 
    Y.Subgroup_Name, 
    AVG(Y.Percent_Graduated) AS Graduation_Rate
FROM 
    yr2023_grad_data AS Y
WHERE 
    Y.Subgroup_Name = 'All' 
GROUP BY 
    Y.School_Name, Y.Subgroup_Name
ORDER BY 
    Graduation_Rate DESC
LIMIT 10;

--What are the 10 bottom schools with the lowest graduation rates
--for Maricopa County, Arizona?
SELECT 
    Y.School_Name, 
    Y.Subgroup_Name, 
    AVG(Y.Percent_Graduated) AS Graduation_Rate
FROM 
    yr2023_grad_data AS Y
WHERE 
    Y.Subgroup_Name = 'All' 
GROUP BY 
    Y.School_Name, Y.Subgroup_Name
ORDER BY 
    Graduation_Rate ASCE
LIMIT 10;

--How does the graduation rate vary by subgroups?.
SELECT 
    Y.Subgroup_Name, 
    ROUND(SUM(Y.No_Graduated) * 1.0 / SUM(Y.No_in_Class) * 100,1) AS Graduation_Rate
FROM 
    yr2023_grad_data AS Y
GROUP BY 
    Y.Subgroup_Name;

    
--Which schools show the largest gaps in graduation rates between subgroups?
SELECT 
    Y.School_Name, 
    ROUND(CAST(MAX(Y.Percent_Graduated) - MIN(Y.Percent_Graduated) AS numeric), 1) AS Graduation_Rate_Gap
FROM 
    yr2023_grad_data AS Y
GROUP BY 
    Y.School_Name
ORDER BY 
    Graduation_Rate_Gap DESC;


