/*=========================================================================================================================*/
--PROCEDURE NAME : SCD_LOADER
--DESCRIPTION   : PROCEDURE TO LOAD DATA INTO SCD TABLE
--PARAMETERS    : @i_STG_TABLE_NAME - STAGING TABLE NAME
--                @i_SCD_TABLE_NAME - SCD TABLE NAME
--                @i_KEY - PRIMARY KEY OF THE TABLE
--RETURNS       : NONE
--VERSION       : 1.0
--AUTHOR        : DHIRAJ RM
--CREATED DATE  : 2025-01-04
/*=========================================================================================================================*/
--CHANGE HISTORY

--VERSION       DATE            AUTHOR              DESCRIPTION
--1.0           2025-01-04      DHIRAJ RM           CREATED THE PROCEDURE
--1.1           2025-01-05      DHIRAJ RM           FIED THE LOGIC FOR CLOSING THE EXISTING RECORDS

/*=========================================================================================================================*/


CREATE PROCEDURE SCD_LOADER
    @i_STG_TABLE_NAME NVARCHAR(100),
    @i_SCD_TABLE_NAME NVARCHAR(100),
    @i_KEY NVARCHAR(100)
AS
BEGIN
    DECLARE @v_TODAY DATE = GETDATE()
    DECLARE @v_INSERT_COUNT INT
    DECLARE @v_UPDATE_COUNT INT
    DECLARE @v_STG_COLUMNS NVARCHAR(MAX)
    DECLARE @v_COLUMNS NVARCHAR(MAX)

    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  STARTING THE SCD PROCESS FOR ' + @i_SCD_TABLE_NAME
    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  STAGING TABLE : ' + @i_STG_TABLE_NAME
    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  SCD TABLE : ' + @i_SCD_TABLE_NAME
    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  KEY : ' + @i_KEY

    -- GET THE COLUMNS OF THE STAGING TABLE

    SELECT @v_COLUMNS = STRING_AGG(COLUMN_NAME, ',') 
    FROM INFORMATION_SCHEMA.COLUMNS 
    WHERE TABLE_NAME = @i_STG_TABLE_NAME;

    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' : STG Columns: ' + @v_COLUMNS

    -- STEP 1 : INSERT THE NEW RECORDS
    DECLARE @v_SQL_INSERT NVARCHAR(MAX)
    SET @v_SQL_INSERT = 'INSERT INTO '+ @i_SCD_TABLE_NAME + '(' + @v_COLUMNS + ', STRT_DT, END_DT)' +
                                ' SELECT ' + @v_COLUMNS + ', ''' + 
                                CONVERT(NVARCHAR, @v_TODAY, 23) + ''' AS STRT_DT, ''' + CONVERT(NVARCHAR,'9999-12-31', 23) + ''' AS END_DT 
                                 FROM ' + @i_STG_TABLE_NAME +
                        ' WHERE ' + @i_KEY + ' NOT IN (SELECT ' + @i_KEY + ' FROM ' + @i_SCD_TABLE_NAME + ');'
    
    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  INSERTING THE NEW RECORDS INTO SCD TABLE ' + @i_SCD_TABLE_NAME

    EXEC(@v_SQL_INSERT)

    -- Get the count of inserted records
    SET @v_INSERT_COUNT = @@ROWCOUNT

    -- Display the insert count
    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  NUMBER OF RECORDS INSERTED : ' + CAST(@v_INSERT_COUNT AS NVARCHAR(10))

    -- STEP 2 : CAPTURE THE UPDATED RECORDS

    -- BUILD THE CHANGE CAPTURE CONDITION
    DECLARE @v_SQL_CHANGE_CAPTURE NVARCHAR(MAX)
    SELECT @v_SQL_CHANGE_CAPTURE = STRING_AGG('STG.' + value + ' <> SCD.' + value, ' OR ') 
    FROM STRING_SPLIT(@v_STG_COLUMNS, ',');

    SELECT @v_STG_COLUMNS = STRING_AGG('STG.' + value ,',') 
    FROM STRING_SPLIT(@v_COLUMNS, ',');

    -- BUILD QUERY TO UPDATE THE EXISTNG RECORDS

    DECLARE @v_SQL_UPDATE NVARCHAR(MAX)

    SET @v_SQL_UPDATE = 'UPDATE '+ @i_SCD_TABLE_NAME +' SET END_DT = ''' + CONVERT(NVARCHAR, DATEADD(DAY, -1, @v_TODAY), 23) + '''' +
                        ' FROM ' + @i_SCD_TABLE_NAME + ' SCD INNER JOIN ' + @i_STG_TABLE_NAME + ' STG' +
                        ' ON STG.' + @i_KEY + ' = SCD.' + @i_KEY + 
                        ' WHERE END_DT = ''' + CONVERT(NVARCHAR,'9999-12-31',23) + '''' + ' AND ' + @v_SQL_CHANGE_CAPTURE + ';'

    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  CLOSING THE EXISTING RECORDS IN SCD TABLE ' + @i_SCD_TABLE_NAME
    EXEC(@v_SQL_UPDATE)

    -- BUILD QUERY TO INSERT THE UPDATED RECORDS
    DECLARE @v_SQL_INSERT_UPDATED NVARCHAR(MAX)
    SET @v_SQL_INSERT_UPDATED = 'INSERT INTO ' + @i_SCD_TABLE_NAME + '(' + @v_STG_COLUMNS + ', STRT_DT, END_DT)' +
                                ' SELECT ' + @v_STG_COLUMNS + ', ''' + 
                                CONVERT(NVARCHAR, @v_TODAY, 23) + ''' AS STRT_DT, ''' + CONVERT(NVARCHAR, '9999-12-31', 23) + ''' AS END_DT' +
                                ' FROM ' + @i_STG_TABLE_NAME + ' STG INNER JOIN ' +
                                '(SELECT ' + @v_COLUMNS + ' FROM ' + @i_SCD_TABLE_NAME + ' WHERE END_DT = ''9999-12-31'') SCD' +
                                ' ON STG.' + @i_KEY + ' = SCD.' + @i_KEY + 
                                ' WHERE ' + @v_SQL_CHANGE_CAPTURE + ';'
    
    PRINT 'INSERT UPDATE SQL : ' + @v_SQL_INSERT_UPDATED

    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  UPDATING THE RECORDS IN SCD TABLE ' + @i_SCD_TABLE_NAME
    EXEC(@v_SQL_INSERT_UPDATED)
    
    SELECT @v_UPDATE_COUNT = @@ROWCOUNT
    PRINT 'LOG ' + CONVERT(NVARCHAR,CURRENT_TIMESTAMP,120) + ' :  NUMBER OF UPDATED RECORDS INSERTED : ' + CAST(@v_UPDATE_COUNT AS NVARCHAR(10))





END