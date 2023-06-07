/********************************************************************************************/
--Specify Start Date and End date here
--Value of Start Date Must be Less than Your End Date 

DECLARE @StartDate DATETIME = '01/01/2010' --Starting value of Date Range
DECLARE @EndDate DATETIME = '01/01/2030' --End Value of Date Range

--Temporary Variables To Hold the Values During Processing of Each Date of Year
DECLARE
	@DayOfWeekInMonth INT,
	@DayOfWeekInYear INT,
	@DayOfQuarter INT,
	@WeekOfMonth INT,
	@CurrentYear INT,
	@CurrentMonth INT,
	@CurrentQuarter INT

/*Table Data type to store the day of week count for the month and year*/
DECLARE @DayOfWeek TABLE (DOW INT, MonthCount INT, QuarterCount INT, YearCount INT)

INSERT INTO @DayOfWeek VALUES (1, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (2, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (3, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (4, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (5, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (6, 0, 0, 0)
INSERT INTO @DayOfWeek VALUES (7, 0, 0, 0)

--Extract and assign various parts of Values from Current Date to Variable

DECLARE @CurrentDate AS DATETIME = @StartDate
SET @CurrentMonth = DATEPART(MM, @CurrentDate)
SET @CurrentYear = DATEPART(YY, @CurrentDate)
SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)

/********************************************************************************************/
--Proceed only if Start Date(Current date ) is less than End date you specified above

WHILE @CurrentDate < @EndDate
BEGIN
 
/*Begin day of week logic*/

         /*Check for Change in Month of the Current date if Month changed then 
          Change variable value*/
	IF @CurrentMonth != DATEPART(MM, @CurrentDate) 
	BEGIN
		UPDATE @DayOfWeek
		SET MonthCount = 0
		SET @CurrentMonth = DATEPART(MM, @CurrentDate)
	END

        /* Check for Change in Quarter of the Current date if Quarter changed then change 
         Variable value*/

	IF @CurrentQuarter != DATEPART(QQ, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET QuarterCount = 0
		SET @CurrentQuarter = DATEPART(QQ, @CurrentDate)
	END
       
        /* Check for Change in Year of the Current date if Year changed then change 
         Variable value*/
	

	IF @CurrentYear != DATEPART(YY, @CurrentDate)
	BEGIN
		UPDATE @DayOfWeek
		SET YearCount = 0
		SET @CurrentYear = DATEPART(YY, @CurrentDate)
	END
	
        -- Set values in table data type created above from variables 

	UPDATE @DayOfWeek
	SET 
		MonthCount = MonthCount + 1,
		QuarterCount = QuarterCount + 1,
		YearCount = YearCount + 1
	WHERE DOW = DATEPART(DW, @CurrentDate)

	SELECT
		@DayOfWeekInMonth = MonthCount,
		@DayOfQuarter = QuarterCount,
		@DayOfWeekInYear = YearCount
	FROM @DayOfWeek
	WHERE DOW = DATEPART(DW, @CurrentDate)
	
/*End day of week logic*/


/* Populate Your Dimension Table with values*/
	
	INSERT INTO [dbo].[DimDate]
	SELECT
		
		CONVERT (char(8),@CurrentDate,112) as DateKey,
		@CurrentDate AS Date,
		CONVERT (char(10),@CurrentDate,103) as FullDateUK,
		CONVERT (char(10),@CurrentDate,101) as FullDateUSA,
		DATEPART(DD, @CurrentDate) AS DayOfMonth,
		--Apply Suffix values like 1st, 2nd 3rd etc..
		CASE 
			WHEN DATEPART(DD,@CurrentDate) IN (11,12,13) 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 1 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'st'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 2 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'nd'
			WHEN RIGHT(DATEPART(DD,@CurrentDate),1) = 3 
			THEN CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'rd'
			ELSE CAST(DATEPART(DD,@CurrentDate) AS VARCHAR) + 'th' 
			END AS DaySuffix,
		
		DATENAME(DW, @CurrentDate) AS DayName,
		DATEPART(DW, @CurrentDate) AS DayOfWeekUSA,

		-- check for day of week as Per US and change it as per UK format 
		CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 7
			WHEN 2 THEN 1
			WHEN 3 THEN 2
			WHEN 4 THEN 3
			WHEN 5 THEN 4
			WHEN 6 THEN 5
			WHEN 7 THEN 6
			END 
			AS DayOfWeekUK,
		
		@DayOfWeekInMonth AS DayOfWeekInMonth,
		@DayOfWeekInYear AS DayOfWeekInYear,
		@DayOfQuarter AS DayOfQuarter,
		DATEPART(DY, @CurrentDate) AS DayOfYear,
		DATEPART(WW, @CurrentDate) + 1 - DATEPART(WW, CONVERT(VARCHAR, 
		DATEPART(MM, @CurrentDate)) + '/1/' + CONVERT(VARCHAR, 
		DATEPART(YY, @CurrentDate))) AS WeekOfMonth,
		(DATEDIFF(DD, DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0), 
		@CurrentDate) / 7) + 1 AS WeekOfQuarter,
		DATEPART(WW, @CurrentDate) AS WeekOfYear,
		DATEPART(MM, @CurrentDate) AS Month,
		DATENAME(MM, @CurrentDate) AS MonthName,
		CASE
			WHEN DATEPART(MM, @CurrentDate) IN (1, 4, 7, 10) THEN 1
			WHEN DATEPART(MM, @CurrentDate) IN (2, 5, 8, 11) THEN 2
			WHEN DATEPART(MM, @CurrentDate) IN (3, 6, 9, 12) THEN 3
			END AS MonthOfQuarter,
		DATEPART(QQ, @CurrentDate) AS Quarter,
		CASE DATEPART(QQ, @CurrentDate)
			WHEN 1 THEN 'First'
			WHEN 2 THEN 'Second'
			WHEN 3 THEN 'Third'
			WHEN 4 THEN 'Fourth'
			END AS QuarterName,
		DATEPART(YEAR, @CurrentDate) AS Year,
		'CY ' + CONVERT(VARCHAR, DATEPART(YEAR, @CurrentDate)) AS YearName,
		LEFT(DATENAME(MM, @CurrentDate), 3) + '-' + CONVERT(VARCHAR, 
		DATEPART(YY, @CurrentDate)) AS MonthYear,
		RIGHT('0' + CONVERT(VARCHAR, DATEPART(MM, @CurrentDate)),2) + 
		CONVERT(VARCHAR, DATEPART(YY, @CurrentDate)) AS MMYYYY,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, 
		@CurrentDate) - 1), @CurrentDate))) AS FirstDayOfMonth,
		CONVERT(DATETIME, CONVERT(DATE, DATEADD(DD, - (DATEPART(DD, 
		(DATEADD(MM, 1, @CurrentDate)))), DATEADD(MM, 1, 
		@CurrentDate)))) AS LastDayOfMonth,
		DATEADD(QQ, DATEDIFF(QQ, 0, @CurrentDate), 0) AS FirstDayOfQuarter,
		DATEADD(QQ, DATEDIFF(QQ, -1, @CurrentDate), -1) AS LastDayOfQuarter,
		CONVERT(DATETIME, '01/01/' + CONVERT(VARCHAR, DATEPART(YY, 
		@CurrentDate))) AS FirstDayOfYear,
		CONVERT(DATETIME, '12/31/' + CONVERT(VARCHAR, DATEPART(YY, 
		@CurrentDate))) AS LastDayOfYear,
        CASE DATEPART(DW, @CurrentDate)
			WHEN 1 THEN 0
			WHEN 2 THEN 1
			WHEN 3 THEN 1
			WHEN 4 THEN 1
			WHEN 5 THEN 1
			WHEN 6 THEN 1
			WHEN 7 THEN 0
			END AS IsWeekday,
        null,
        null

	SET @CurrentDate = DATEADD(DD, 1, @CurrentDate)
END

/********************************************************************************************/
 
-- Step 3.
-- Update Values of Holiday as per UK Government Declaration for National Holiday.

/*Update HOLIDAY fields of UK as per Govt. Declaration of National Holiday*/
	
-- Good Friday  April 18 
	UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Good Friday'
	WHERE [Month] = 4 AND [DayOfMonth]  = 18

-- Easter Monday  April 21 
	UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Easter Monday'
	WHERE [Month] = 4 AND [DayOfMonth]  = 21

-- Early May Bank Holiday   May 5 
   UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Early May Bank Holiday'
	WHERE [Month] = 5 AND [DayOfMonth]  = 5

-- Spring Bank Holiday  May 26 
	UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Spring Bank Holiday'
	WHERE [Month] = 5 AND [DayOfMonth]  = 26

-- Summer Bank Holiday  August 25 
    UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Summer Bank Holiday'
	WHERE [Month] = 8 AND [DayOfMonth]  = 25

-- Boxing Day  December 26  	
    UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Boxing Day'
	WHERE [Month] = 12 AND [DayOfMonth]  = 26	

--CHRISTMAS
	UPDATE [dbo].[DimDate]
		SET HolidayUK = 'Christmas Day'
	WHERE [Month] = 12 AND [DayOfMonth]  = 25

--New Years Day
	UPDATE [dbo].[DimDate]
		SET HolidayUK  = 'New Year''s Day'
	WHERE [Month] = 1 AND [DayOfMonth] = 1

--Update flag for UK Holidays 1= Holiday, 0=No Holiday
	
	UPDATE [dbo].[DimDate]
		SET IsHolidayUK  = CASE WHEN HolidayUK   IS NULL 
		THEN 0 WHEN HolidayUK   IS NOT NULL THEN 1 END
		
 
/*****************************************************************************************/

SELECT * FROM [dbo].[DimDate]