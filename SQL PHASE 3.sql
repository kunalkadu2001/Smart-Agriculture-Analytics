

-- PHASE 3 SQL 

select * from [dbo].[final_master]

SELECT COLUMN_NAME 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'final_master';



-- Q1) Count total records in the table

SELECT COUNT(*) AS Total_Rows
FROM final_master

-- Q2) List all unique states

SELECT DISTINCT State_Name
FROM final_master
ORDER BY State_Name;

-- Q3) How many districts are in the dataset?

SELECT COUNT(DISTINCT District_Name) AS Total_Districts
FROM final_master;

-- Q4) Count unique crops present

SELECT COUNT(DISTINCT Crop) AS Total_Crops
FROM final_master;

-- Q5) Get maximum and minimum rainfall (Rabi)

SELECT 
    MAX(Rainfall_Rabi) AS Max_Rabi_Rainfall,
    MIN(Rainfall_Rabi) AS Min_Rabi_Rainfall
FROM final_master;

-- Q6) Top 5 states by overall production

SELECT TOP 5 
    State_Name,
    SUM(CAST(Production AS BIGINT)) AS Total_Production
FROM final_master
GROUP BY State_Name
ORDER BY Total_Production DESC;


-- Q7) Find records where rainfall is ZERO (bad for crops)

SELECT *
FROM final_master
WHERE Rainfall_Rabi = 0 
   OR Rainfall_Kharif = 0 
   OR Annual_Kharif = 0;

-- Q8) Get average micronutrient levels state-wise

SELECT 
    State_Name,
    AVG(Zn) AS Avg_Zn,
    AVG(Fe) AS Avg_Fe,
    AVG(Cu) AS Avg_Cu,
    AVG(Mn) AS Avg_Mn,
    AVG(B) AS Avg_B,
    AVG(S) AS Avg_S
FROM final_master
GROUP BY State_Name
ORDER BY State_Name;


-- Q9) Count fertilizer type distribution

SELECT 
    fertiliser_type,
    COUNT(*) AS Usage_Count
FROM final_master
GROUP BY fertiliser_type
ORDER BY Usage_Count DESC;

-- Q10) View total fertilizer production by year (FY columns)

SELECT 
    SUM(fy_2014_15) AS Total_2014_15,
    SUM(fy_2015_16) AS Total_2015_16,
    SUM(fy_2016_17) AS Total_2016_17,
    SUM(fy_2017_18) AS Total_2017_18,
    SUM(fy_2018_19) AS Total_2018_19,
    SUM(fy_2019_20) AS Total_2019_20,
    SUM(fy_2020_21) AS Total_2020_21,
    SUM(fy_2021_22) AS Total_2021_22,
    SUM(fy_2022_23) AS Total_2022_23,
    SUM(fy_2023_24) AS Total_2023_24,
    SUM(fy_2024_25) AS Total_2024_25
FROM final_master;


-- Q11. Find the average Rainfall (Rabi, Kharif, Annual) for each State

SELECT 
    State_Name,
    AVG(Rainfall_Rabi) AS Avg_Rabi_Rainfall,
    AVG(Rainfall_Kharif) AS Avg_Kharif_Rainfall,
    AVG(Annual_Kharif) AS Avg_Annual_Rainfall
FROM final_master
GROUP BY State_Name
ORDER BY Avg_Annual_Rainfall DESC;

-- Q12. Identify the Top 5 Districts with Highest Rainfall (Annual_Kharif)

SELECT TOP 5
    District_Name,
    State_Name,
    AVG(Annual_Kharif) AS Avg_Annual_Rainfall
FROM final_master
GROUP BY District_Name, State_Name
ORDER BY Avg_Annual_Rainfall DESC;


-- Q13) List crops that show highest production under low rainfall conditions (< 200 mm)

SELECT 
    Crop,
    AVG(Production) AS Avg_Production_LowRain
FROM final_master
WHERE Rainfall_Kharif < 200
GROUP BY Crop
ORDER BY Avg_Production_LowRain DESC;

-- Q14) Compare rainfall and area for each season for Top 10 high-production crops


SELECT TOP 10
    Crop,
    AVG(Area) AS Avg_Area,
    AVG(Rainfall_Rabi) AS Avg_Rabi_Rainfall,
    AVG(Rainfall_Kharif) AS Avg_Kharif_Rainfall
FROM final_master
GROUP BY Crop
ORDER BY Avg_Area DESC;


-- Q15) Compare rainfall and area for each season for Top 10 high-production crops

SELECT TOP 10
    Crop,
    AVG(Area) AS Avg_Area,
    AVG(Rainfall_Rabi) AS Avg_Rabi_Rainfall,
    AVG(Rainfall_Kharif) AS Avg_Kharif_Rainfall
FROM final_master
GROUP BY Crop
ORDER BY Avg_Area DESC;

-- Q16) State-wise Highest Yield (Production per Area)

SELECT 
    State_Name,
    AVG(CAST(Production AS FLOAT) / NULLIF(Area,0)) AS Avg_Yield
FROM final_master
GROUP BY State_Name
ORDER BY Avg_Yield DESC;

-- Q17) Top 5 Districts with highest crop diversity (number of unique crops)

SELECT TOP 5
    District_Name,
    State_Name,
    COUNT(DISTINCT Crop) AS Unique_Crop_Count
FROM final_master
GROUP BY District_Name, State_Name
ORDER BY Unique_Crop_Count DESC;

-- Q18) Identify districts with highest micronutrient deficiency (low Zn, Fe, Cu)

SELECT 
    District_Name,
    State_Name,
    AVG(Zn) AS Avg_Zn,
    AVG(Fe) AS Avg_Fe,
    AVG(Cu) AS Avg_Cu
FROM final_master
GROUP BY District_Name, State_Name
ORDER BY Avg_Zn, Avg_Fe, Avg_Cu ASC;


-- Q19) Top 10 states with richest soil quality (highest micronutrient levels)

SELECT TOP 10
    State_Name,
    AVG(Zn + Fe + Cu + Mn + B + S) AS Soil_Quality_Score
FROM final_master
GROUP BY State_Name
ORDER BY Soil_Quality_Score DESC;


-- Q20) Top cities by average Rabi rainfall (DENSE_RANK())

SELECT *
FROM (
    SELECT 
        City,
        AVG(rainfall_rabi) AS avg_rabi_rainfall,
        DENSE_RANK() OVER (
            ORDER BY AVG(rainfall_rabi) DESC
        ) AS rabi_rank
    FROM final_master
    GROUP BY City
) AS t
WHERE rabi_rank <= 3
ORDER BY rabi_rank;

-- ------------------------------------------------------------------------------------------
