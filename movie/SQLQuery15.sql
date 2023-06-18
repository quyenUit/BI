/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [released]
      ,[year]
  FROM [gaf].[dbo].[Dim_ReleasedDate]

  select * from [gaf].[dbo].[Dim_ReleasedDate]
    select distinct released AS  new_released from [gaf].[dbo].[Dim_ReleasedDate] where released is not null

	update [gaf].[dbo].[Dim_ReleasedDate]
	set released = (select distinct released from [gaf].[dbo].[Dim_ReleasedDate] where released is not null)

UPDATE d
SET d.released = t.released
FROM Dim_ReleasedDate d
JOIN (
    SELECT DISTINCT released
    FROM [gaf].[dbo].[Dim_ReleasedDate]
    WHERE released IS NOT NULL
      ) t ON 1=1


SELECT TOP (100) [released]
      ,[year]
	  FROM [gaf].[dbo].[Dim_ReleasedDate]


UPDATE [gaf].[dbo].[Dim_ReleasedDate]
SET released = (
    SELECT DISTINCT released
    FROM (
        SELECT released, year, ROW_NUMBER() OVER (PARTITION BY year ORDER BY released) AS rn
        FROM [gaf].[dbo].[Dim_ReleasedDate]
    ) AS temp
    WHERE [gaf].[dbo].[Dim_ReleasedDate].year = temp.year AND rn = 1
)

DELETE FROM [gaf].[dbo].[Dim_ReleasedDate]
WHERE released IS NULL OR year IS NULL

ALTER TABLE [gaf].[dbo].[Dim_ReleasedDate]
ADD PRIMARY KEY (released);

ALTER TABLE [gaf].[dbo].[Dim_ReleasedDate]
ADD CONSTRAINT valid_date CHECK (YEAR(released) = year);