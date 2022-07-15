USE OOVEO_Salon

SELECT *
FROM MsCustomer

--no 1
SELECT *
FROM MsStaff
WHERE StaffGender = 'Female'


--no 2
SELECT 
	StaffName,
	'Rp. ' + CAST(StaffSalary AS VARCHAR) AS [StaffSalary]
FROM MsStaff
WHERE StaffName LIKE '%m%' AND StaffSalary >= 10000000


--no 3
SELECT TreatmentName, Price
FROM MsTreatment
WHERE TreatmentTypeId IN ('TT002', 'TT003')


--no 4
SELECT StaffName,
       StaffPosition,
	   CONVERT(VARCHAR, TransactionDate, 107) AS TransactionDate
FROM MsStaff AS ms
JOIN 
	HeaderSalonServices AS hss 
	ON (StaffSalary BETWEEN 7000000 AND 10000000) AND ms.StaffId = hss.StaffId


--no 5
SELECT SUBSTRING(CustomerName, 1, CHARINDEX(' ', CustomerName)) AS 'Name',
	   LEFT(CustomerGender,1) AS Gender,
	   PaymentType
FROM MsCustomer AS mc
JOIN
	HeaderSalonServices AS hss
	ON PaymentType = 'Debit' AND mc.CustomerId = hss.CustomerId


--no 6
SELECT UPPER(LEFT(CustomerName,1)) + SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName)+1, 1) AS 'Initial',
	   DATENAME(WEEKDAY,TransactionDate) AS 'Day'
FROM MsCustomer AS mc
JOIN
	HeaderSalonServices AS hss
	ON mc.CustomerId = hss.CustomerId AND (24 - DATENAME(day,TransactionDate)) < 3


--no 7
SELECT TransactionDate,
       SUBSTRING(CustomerName, CHARINDEX(' ', CustomerName)+1, LEN(CustomerName)) AS 'CustomerName'
FROM HeaderSalonServices AS hss
JOIN 
MsCustomer AS mc
ON (CustomerName LIKE '% %') AND (mc.CustomerId = hss.CustomerId) AND DATENAME(WEEKDAY,TransactionDate) = 'Saturday'


--no 8
SELECT StaffName,
       CustomerName,
	   REPLACE(CustomerPhone, LEFT(CustomerPhone, 1), '+62') AS 'CustomerPhone',
	   CustomerAddress
FROM HeaderSalonServices AS hss
JOIN 
MsCustomer AS mc
ON (mc.CustomerId = hss.CustomerId)
JOIN
MsStaff AS ms
ON (ms.StaffId = hss.StaffId) AND (StaffName LIKE '% % %')



--no 9
SELECT StaffName,
	TreatmentName,
	24 - DATENAME(DAY,TransactionDate) AS 'Term of Transaction'
FROM DetailSalonServices AS dss
JOIN
HeaderSalonServices AS hss
ON (dss.TransactionId = hss.TransactionId)
JOIN
MsTreatment AS mt
ON (mt.TreatmentId = dss.TreatmentId) AND ((LEN(TreatmentName) > 20) OR (TreatmentName LIKE '% %'))
JOIN
MsStaff AS ms
ON (ms.StaffId = hss.StaffId)



--no 10
SELECT TransactionDate,
       CustomerName,
	   TreatmentName,
	   CONVERT(INT, Price*20/100) AS Price
FROM DetailSalonServices AS dss
JOIN
HeaderSalonServices AS hss
ON (dss.TransactionId = hss.TransactionId) AND (DATENAME(DAY, TransactionDate) = 22)
JOIN
MsCustomer AS mc
ON (mc.CustomerId = hss.CustomerId)
JOIN
MsTreatment AS mt
ON (mt.TreatmentId = dss.TreatmentId)