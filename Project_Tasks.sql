
-- Creating and Executing the Task for Customer Dimension:
-- creating a task called tpcds.analytics.creating_customer_diminsion, which is scheduled to run using the COMPUTE_WH warehouse on a daily basis at 8 AM, coordinated with the UTC time zone.

  CREATE OR REPLACE TASK tpcds.analytics.creating_customer_diminsion
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = 'USING CRON * 8 * * * UTC'
    AS
-- call the populating_customer_diminsion() stored procedure, aiming to populate and update the customer dimension in the designated tables.
CALL populating_customer_diminsion();

ALTER TASK tpcds.analytics.creating_customer_diminsion RESUME;
EXECUTE TASK tpcds.analytics.creating_customer_diminsion;
drop task tpcds.analytics.creating_customer_diminsion;
drop procedure populating_customer_diminsion() ; 

truncate table TPCDS.INTERMEDIATE.CUSTOMER_SNAPSHOT;
truncate table TPCDS.ANALYTICS.CUSTOMER_DIM;



-- Creating and Executing the Task for Fact Tables:
-- This task is set to utilize the COMPUTE_WH warehouse on a daily basis at 8 AM in UTC.
CREATE OR REPLACE TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally
    WAREHOUSE = COMPUTE_WH
    SCHEDULE = 'USING CRON * 8 * * * UTC'
    AS
-- calls the populating_daily_aggregated_sales_incrementally() stored procedure, which is responsible for incrementally populating the daily aggregated sales data.
CALL populating_daily_aggregated_sales_incrementally();

ALTER TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally RESUME;
     EXECUTE TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally;
     DROP TASK tpcds.intermediate.creating_daily_aggregated_sales_incrementally;
     DROP PROCEDURE tpcds.intermediate.creating_daily_aggregated_sales_incrementally();
     
     truncate table TPCDS.INTERMEDIATE.DAILY_AGGREGATED_SALES;
     
     
     
     
-- weekly aggregated sales

CREATE OR REPLACE TASK tpcds.analytics.creating_weekly_aggregated_sales_incrementally
WAREHOUSE = COMPUTE_WH
SCHEDULE = 'USING CRON 0 9 * * 0 UTC'
AS
CALL populating_weekly_aggregated_sales_incrementally();

ALTER TASK tpcds.analytics.creating_weekly_aggregated_sales_incrementally RESUME;
EXECUTE TASK tpcds.analytics.creating_weekly_aggregated_sales_incrementally;