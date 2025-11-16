# Smart Agriculture Analytics Project

This project focuses on analyzing agricultural data using Python, SQL, and Power BI to uncover meaningful insights related to crops, rainfall, soil nutrients, fertilizer usage, and production patterns across different Indian states and districts.

The overall workflow includes:
- **Python** for data cleaning, preprocessing, merging multiple datasets, and performing exploratory data analysis (EDA).
- **SQL (MSSQL)** for analytical querying, advanced joins, window functions, and generating insights directly from structured data.
- **Power BI** for building an interactive dashboard that visualizes the agricultural trends and patterns.

## Project Objective

The objective of this project is to analyze agricultural data to understand the relationships between crop production, rainfall, soil nutrients, and fertilizer usage across different regions. By integrating Python, SQL, and Power BI, the project aims to generate meaningful insights that can support data-driven decisions in smart agriculture. The final goal is to build an interactive analytical system that helps identify patterns, improve planning, and optimize agricultural outcomes.

## Dataset Used

The project uses four separate agricultural datasets covering crop details, rainfall, soil micronutrients, and fertilizer distribution. Each dataset was cleaned individually to remove errors, standardize formats, and handle missing values. Finally, all four datasets were merged into a single master dataset using pandas, enabling unified analysis across regions and agricultural factors.

## Data Cleaning & Preprocessing

Removed duplicates, handled missing values, and standardized column names.
Converted data types where needed (numeric, categorical, datetime).
Merged all datasets into one final master file for analysis.
Verified data consistency across states, districts, and seasons.

## SQL Integration

Imported the cleaned dataset into MS SQL Server.
Performed queries including joins, aggregations, window functions, and analytical queries.
Created SQL-based insights to support data validation and analysis.

## Power BI Dashboard

Designed a clean dashboard with slicers for State, District, and City.
Added visuals such as bar charts, line charts, and pie charts for better insights.
Applied custom formatting, colors, and layout for a professional look.
Created DAX calculations to derive additional metrics.

## Machine Learning (Work in Progress)

Currently experimenting with different algorithms.
Data preparation and feature engineering in progress.
Model tuning and evaluaton will be added soon.






