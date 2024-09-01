-- Databricks notebook source
select * from hr_employee_csv;

-- COMMAND ----------

-- DBTITLE 1,Total number of employee
select sum(employeecount) from hr_employee_csv

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Find out Attrition division

-- COMMAND ----------

select sum(employeecount),attrition
from hr_employee_csv
group by Attrition;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Total 237 people leaving organization

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Age Analysis --find out which particular age attrition is high

-- COMMAND ----------

SELECT 
    SUM(employeecount) AS total_employees,
    CASE 
        WHEN age BETWEEN 20 AND 25 THEN '20-25'
        WHEN age BETWEEN 26 AND 30 THEN '26-30'
        WHEN age BETWEEN 31 AND 35 THEN '31-35'
        WHEN age BETWEEN 36 AND 40 THEN '36-40'
        ELSE '40+'
    END AS age_group
FROM 
    hr_employee_csv
WHERE 
    attrition = 'Yes'
GROUP BY 
    CASE 
        WHEN age BETWEEN 20 AND 25 THEN '20-25'
        WHEN age BETWEEN 26 AND 30 THEN '26-30'
        WHEN age BETWEEN 31 AND 35 THEN '31-35'
        WHEN age BETWEEN 36 AND 40 THEN '36-40'
        ELSE '40+'
    END;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Most of the 40+ age group people leaving the organization

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Find out attrition by department

-- COMMAND ----------

select sum(employeecount), department
from hr_employee_csv
where Attrition = 'Yes'
group by Department

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Research & Development people are leaving from the organization 

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by eduction -(1->Below college , 2->College, 3->Bachelor, 4-> master, 5-> Doctor)

-- COMMAND ----------

select sum(employeecount),
case when Education=1 then 'below college' when Education=2 then 'college' when Education=3 then 'bachelor' when Education = 4 then 'master' else 'doctor' end ed_group
from hr_employee_csv
where Attrition ='Yes'
group by 2;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Bachelor eduction people are leaving the most from organization

-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by environment satisfaction (1-low,2-medium,3-high,4-highly satisfied)

-- COMMAND ----------

select sum(employeecount),
case when Environmentsatisfaction=1 then 'low'
     when Environmentsatisfaction=2 then 'medium'
     when Environmentsatisfaction=3 then 'high'
     when Environmentsatisfaction=4 then 'highly satisfied'
     end enviroment
from hr_employee_csv
where Attrition = 'Yes'
group by 2;


-- COMMAND ----------

-- MAGIC %md
-- MAGIC Attrition by business travel

-- COMMAND ----------

select sum(employeecount),businesstravel
from hr_employee_csv
group by 2;

-- COMMAND ----------

-- MAGIC %md
-- MAGIC From the above dataset we got to know 
-- MAGIC 1)employee age between 40+ leaving organization
-- MAGIC 2)Research and development department people leaving organization
-- MAGIC 3) Bachelor's holding empolyees leaving organization
-- MAGIC 4) low satisfied people leaving organization
-- MAGIC 5) and lastly Rarely traveling employee people leaving organization

-- COMMAND ----------


