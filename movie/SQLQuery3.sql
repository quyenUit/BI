/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [company]
  FROM [gaf].[dbo].[Dim_Company]


select * from  [gaf].[dbo].[Dim_Company]

select distinct * from  [gaf].[dbo].[Dim_Company]

SELECT Company, COUNT(*)
FROM [gaf].[dbo].[Dim_Company]
GROUP BY Company
HAVING COUNT(*) > 1;