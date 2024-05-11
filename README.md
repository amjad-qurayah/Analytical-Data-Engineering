# Analytical-Data-Engineering-Project


1. **Project Overview**: Involves Analytical Data Engineering focusing on data ingestion from various sources into Snowflake, data transformation, and preparing data for Business Intelligence (BI) usage with Metabase.

2. **About Data**: Utilizes a dataset from TPCDS, focusing on Retail Sales data including sales records from websites and catalogs, inventory details, and 15 dimensional tables containing customer, warehouse, and item information.

3. **Business Requirements**:
   - Metabase Requirements for Dashboards and Reports:
     - Identify top and bottom-performing items weekly.
     - Show items with low inventory levels weekly.
     - Identify items with low stock levels weekly.
   - Snowflake Data Warehouse Requirements:
     - Create new fact tables consolidating raw data.
     - Include metrics for weekly sales amount, sales quantity, net profit, inventory levels, weeks of supply, and low stock flags.

4. **Project Infrastructure**: Setting up servers in AWS, installing tools like Airbyte for data ingestion, Metabase for BI, creating a Snowflake account for data storage, and utilizing AWS Lambda for data ingestion from S3.

5. **Project Outline**:
   - Part One: Data Ingestion involves connecting to Postgres DB and S3 bucket using Airbyte and Lambda to transfer data to Snowflake.
   - Part Two: Data Transformation focuses on reshaping tables within Snowflake, creating ETL scripts, and establishing data loading schedules.
   - Part Three: Data Analysis establishes a connection between Snowflake and Metabase for generating dashboards and reports.

6. **Data Modelling**: Involves creating new tables, dimensional tables, ETL scripts, and Snowflake tasks for daily and weekly data aggregation and loading, focusing on customer dimension tables, fact tables, and scheduling tasks using Snowflake procedures.

7. **Data Visualization**: Involves utilizing Metabase for visualizing data and generating reports based on business requirements, connecting Metabase with the Snowflake database, and creating reports to meet the specified criteria.
ed in the project description that provide a clear understanding of the tasks involved in Analytical Data Engineering with a focus on Snowflake, Metabase, and data processing functionalities.  
