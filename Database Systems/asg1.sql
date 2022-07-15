USE salon

CREATE TABLE MsCustomer (
	CustomerId CHAR(5) NOT NULL UNIQUE,
	CustomerName VARCHAR(50),
	CustomerGender VARCHAR(10),
	CustomerPhone VARCHAR(13),
	CustomerAddress VARCHAR(100),

	CONSTRAINT cust_id
		CHECK(CustomerId LIKE 'CU[0-9][0-9][0-9]'),
	CONSTRAINT cust_pk
		PRIMARY KEY(CustomerID),
	CONSTRAINT cust_gender
		CHECK(CustomerGender in ('Male', 'Female'))
)

SELECT *
FROM MsCustomer

DELETE FROM MsCustomer

INSERT INTO MsCustomer
VALUES 
('CU002', 'Audrey', 'Male', '0891920', 'jl')

CREATE TABLE MsStaff (
	StaffId CHAR(5) NOT NULL UNIQUE,
	StaffName VARCHAR(50),
	StaffGender VARCHAR(10),
	StaffPhone VARCHAR(13),
	StaffAddress VARCHAR(100),
	StaffSalary NUMERIC(11,2),
	StaffPosition VARCHAR(20),

	CONSTRAINT staff_id
		CHECK (StaffId LIKE 'SF[0-9][0-9][0-9]'),
	CONSTRAINT staff_pk
		PRIMARY KEY(StaffId),
	CONSTRAINT staff_gender
		CHECK (StaffGender in ('Male', 'Female'))
)

SELECT * FROM MsStaff

INSERT INTO MsStaff
VALUES 
('SF001', 'Audrey', 'Female', '0129', 'jl', 1000000, 'staff')

DELETE FROM MsStaff

DROP TABLE MsTreatmentType

CREATE TABLE MsTreatmentType (
	TreatmentTypeId CHAR(5) NOT NULL UNIQUE,
	TreatmentTypeName VARCHAR(50),

	CONSTRAINT tr_id
		CHECK (TreatmentTypeId LIKE 'TT[0-9][0-9][0-9]'),
	CONSTRAINT tr_pk
		PRIMARY KEY(TreatmentTypeId)
)

SELECT * FROM MsTreatmentType

INSERT INTO MsTreatmentType
VALUES ('TT001', 'AUdrey')

DELETE FROM MsTreatmentType

CREATE TABLE MsTreatment (
	TreatmentId CHAR(5) NOT NULL UNIQUE,
	TreatmentTypeId CHAR(5),
	TreatmentName VARCHAR(50),
	Price NUMERIC(11,2),

	CONSTRAINT tre_id
		CHECK (TreatmentId LIKE 'TM[0-9][0-9][0-9]'),
	CONSTRAINT tr_fk
		FOREIGN KEY(TreatmentTypeId) REFERENCES MsTreatmentType(TreatmentTypeId)
		ON UPDATE CASCADE
		ON DELETE SET NULL
)

SELECT * FROM MsTreatment

INSERT INTO MsTreatment
VALUES ('TM001', 'TT001', 'Audrey', 2000000)

DELETE FROM MsTreatment

CREATE TABLE HeaderSalonServices (
	TransactionId CHAR(5) NOT NULL UNIQUE,
	CustomerId CHAR(5),
	StaffId CHAR(5),
	TransactionDate DATE,
	PaymentType VARCHAR(20),

	CONSTRAINT transaction_id
		CHECK (TransactionId LIKE 'TR[0-9][0-9][0-9]'),
	CONSTRAINT transactionid_pk
		PRIMARY KEY(TransactionId),
	CONSTRAINT cust_fk
		FOREIGN KEY(CustomerId) REFERENCES MsCustomer(CustomerId)
		ON UPDATE CASCADE
		ON DELETE SET NULL,
	CONSTRAINT staff_fk
		FOREIGN KEY (StaffId) REFERENCES MsStaff(StaffId)
		ON UPDATE CASCADE
		ON DELETE SET NULL
)

DROP TABLE HeaderSalonServices

SELECT * FROM HeaderSalonServices

INSERT INTO HeaderSalonServices 
VALUES ('TR001', 'CU002', 'SF001', GETDATE(), 'CASH')

CREATE TABLE DetailSalonServices (
	TransactionId CHAR(5) NOT NULL,
	TreatmentId CHAR(5) NOT NULL,

	CONSTRAINT transaction_id_pk 
		PRIMARY KEY(TransactionId, TreatmentId),
		--CONSTRAINT treatment_id_pk
		--PRIMARY KEY(TreatmentId),
	CONSTRAINT transaction_id_fk 
		FOREIGN KEY(TransactionId) REFERENCES HeaderSalonServices(TransactionId)
		ON UPDATE CASCADE,
	CONSTRAINT treatment_id_fk
		FOREIGN KEY(TreatmentId) REFERENCES MsTreatMent(TreatmentId)
		ON UPDATE CASCADE,
)

SELECT * FROM DetailSalonServices

DROP TABLE DetailSalonServices

INSERT INTO DetailSalonServices
VALUES ('TR001', 'TM001')

CREATE TABLE DetailSalonServices (
	TransactionId CHAR(5) NOT NULL,
	TreatmentId CHAR(5) NOT NULL,

	CONSTRAINT transaction_id_fk 
		FOREIGN KEY(TransactionId) REFERENCES HeaderSalonServices(TransactionId)
		ON UPDATE CASCADE,
	CONSTRAINT treatment_id_fk
		FOREIGN KEY(TreatmentId) REFERENCES MsTreatMent(TreatmentId)
		ON UPDATE CASCADE,
)

ALTER TABLE DetailSalonServices
ADD PRIMARY KEY(TransactionId, TreatmentId)

ALTER TABLE MsStaff
ADD CONSTRAINT validate CHECK(LEN(StaffName) > 5 AND LEN(StaffName) < 20 )

ALTER TABLE MsStaff
DROP CONSTRAINT validate

SELECT * FROM MsStaff

SELECT * FROM MsTreatment

ALTER TABLE MsTreatment
ADD MsTreatmentDescription VARCHAR(100)

ALTER TABLE MsTreatment
DROP COLUMN MsTreatmentDescription