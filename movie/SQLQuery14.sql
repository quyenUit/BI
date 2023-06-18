/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [company]
  FROM [MOV].[dbo].[Dim_Company]

select distinct company from [MOV].[dbo].[Dim_Company]

select * from [MOV].[dbo].[Dim_Company]

select * from [MOV].[dbo].[Dim_Genre]
select * from [MOV].[dbo].[Dim_Director]
select * from [MOV].[dbo].[Dim_ReleasedDate]


select distinct genre from [MOV].[dbo].[Dim_Genre]
select  distinct director from [MOV].[dbo].[Dim_Director]

