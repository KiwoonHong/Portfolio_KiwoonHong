-- Cleansed Dim_Coustomers Table
SELECT 
  CustomerKey, 
  --,[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  c.firstname as [First Name], 
  --,[MiddleName]
  c.lastname AS [Last Name], 
  c.firstname + ' ' + lastname AS [Full Name], 
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  CASE c.gender WHEN 'M' THEN 'Male' WHEN 'F' THEN 'Female' END AS Gender, 
  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  DateFirstPurchase, 
  --,[CommuteDistance]
  g.city AS [CustomerCity] 
FROM 
  dbo.DimCustomer AS c 
  LEFT JOIN dbo.dimgeography AS g ON g.GeographyKey = c.GeographyKey 
ORDER BY 
  CustomerKey ASC
