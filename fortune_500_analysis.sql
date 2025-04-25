-- Fortune 500 Analysis
-- Project: Querying a fake Fortune 500 database

-- -------------------
-- DATABASE CREATION
-- -------------------

-- Create the table (example structure)
CREATE TABLE fortune_companies (
    company_id INT PRIMARY KEY,
    company_name VARCHAR(255),
    industry VARCHAR(100),
    revenue DECIMAL(15,2), -- Revenue in millions
    employees INT,
    headquarters_state VARCHAR(50),
    healthcare_benefits BIT -- 1 = Yes, 0 = No
);

-- Insert some sample data
INSERT INTO fortune_companies (company_id, company_name, industry, revenue, employees, headquarters_state, healthcare_benefits)
VALUES 
(1, 'TechNova', 'Technology', 55000, 120000, 'California', 1),
(2, 'HealthWorks', 'Healthcare', 35000, 85000, 'New York', 1),
(3, 'RetailMart', 'Retail', 18000, 250000, 'Texas', 0),
(4, 'EnergyCorp', 'Energy', 60000, 60000, 'Texas', 1),
(5, 'FinServe', 'Financial Services', 22000, 40000, 'Illinois', 1);

-- (Continue inserting more sample data as needed...)

-- -------------------
-- PROJECT QUERIES
-- -------------------

-- 1. Find companies in Technology or Healthcare industries that offer healthcare benefits
SELECT company_name, industry, healthcare_benefits
FROM fortune_companies
WHERE (industry = 'Technology' OR industry = 'Healthcare')
  AND healthcare_benefits = 1;
-- This query uses WHERE with OR to filter specific industries and checks for healthcare benefits.

-- 2. Calculate revenue per employee for each company
SELECT company_name, revenue, employees,
       (revenue / employees) AS revenue_per_employee
FROM fortune_companies;
-- This query performs a calculation and creates an alias 'revenue_per_employee'.

-- 3. Categorize companies by size based on revenue
SELECT company_name, revenue,
       CASE
           WHEN revenue > 50000 THEN 'Large'
           WHEN revenue BETWEEN 10000 AND 50000 THEN 'Medium'
           ELSE 'Small'
       END AS revenue_category
FROM fortune_companies;
-- This query uses a CASE statement to categorize companies into 'Large', 'Medium', or 'Small'.

-- 4. Show industries where the average revenue is greater than 20 billion
SELECT industry, AVG(revenue) AS avg_revenue
FROM fortune_companies
GROUP BY industry
HAVING AVG(revenue) > 20000;
-- This query uses GROUP BY and HAVING with an AVG aggregate function to filter industries.

-- 5. List companies not in Retail or Energy industries and with more than 10,000 employees
SELECT company_name, industry, employees
FROM fortune_companies
WHERE industry NOT IN ('Retail', 'Energy')
  AND employees > 10000;
-- This query uses WHERE with NOT IN and an AND condition to filter out certain industries.
