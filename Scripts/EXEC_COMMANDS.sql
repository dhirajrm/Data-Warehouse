/*
Instructions:
1. Ensure that the staging table (DMORG_EMPS_STG) and the SCD table (DMORG_EMPS_SCD) are created and populated with data.
2. The SCD_LOADER stored procedure will insert new records from the staging table into the SCD table.
3. It will also update existing records in the SCD table based on changes detected in the staging table.
4. The procedure logs the number of records inserted and updated.

Execution Steps:
1. Create the necessary tables by running the scripts in the /Tables directory.
2. Populate the staging table with data by running the scripts in the /Inserts directory.
3. Create the SCD_LOADER stored procedure by running the script in the /StoredProcedures directory.
4. Execute the SCD_LOADER stored procedure using the command below.
*/

-- Step 1: Create the necessary tables
-- Run the scripts in the /Tables directory
-- Example:
-- /Tables/Create_STG_Table.sql
-- /Tables/Create_SCD_Table.sql

-- Step 2: Populate the staging table with data
-- Run the scripts in the /Inserts directory
-- Example:
-- /Inserts/Insert_STG.sql

-- Step 3: Create the SCD_LOADER stored procedure
-- Run the script in the /StoredProcedures directory
-- Example:
-- /StoredProcedures/SCD_Loader.sql

-- Step 4: Execute the SCD_LOADER stored procedure

EXEC SCD_LOADER 
    @i_STG_TABLE_NAME = 'DMORG_EMPS_STG', 
    @i_SCD_TABLE_NAME = 'DMORG_EMPS_SCD', 
    @i_KEY = 'EmployeeID';