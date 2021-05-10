--This Script creates Dimension and Fact tables of Alabama Department of Environment Management
--Dimension tables are created with Surrogate Keys using IDENTITY(1,1)
--IDENTITY(1,1) gives an incremental value(ID Column) for every row inserted into table automatically.
USE DW_2020
GO 

CREATE TABLE Station
(
Station_ID INT IDENTITY(1,1) PRIMARY KEY
,StationName VARCHAR(50) NOT NULL
,StationType  CHAR(10) NOT NULL
,Street  VARCHAR(50) NOT NULL
,City VARCHAR(30) NOT NULL
,County VARCHAR(30) NOT NULL
,Region VARCHAR(30) NOT NULL
,[State] VARCHAR(25) NOT NULL
)
GO

CREATE TABLE Devices
(
Device_ID INT IDENTITY(1,1) PRIMARY KEY 
,DeviceName NVARCHAR(50) NOT NULL
,MinRange INT NOT NULL
,MaxRange INT NOT NULL
,Units NVARCHAR(20) NOT NULL
,DeviceAccuracy DECIMAL(5,2) NOT NULL
,[Description] VARCHAR(200) NOT NULL
)
GO

CREATE TABLE [Date]
(
Date_Key BIGINT IDENTITY(1,1) PRIMARY KEY 
,[Hour] TINYINT NOT NULL
,[Day] TINYINT NOT NULL
,[Month] TINYINT NOT NULL
,[Year] INT NOT NULL
,Season CHAR(10) NOT NULL
)
GO

CREATE TABLE Toxins
(
Toxin_ID INT IDENTITY(1,1) PRIMARY KEY 
,[Name] VARCHAR(50) NOT NULL
,ChemicalFormula NVARCHAR(20) NOT NULL
,[Standard] VARCHAR(50) NOT NULL
,MaxExposureTime VARCHAR(50) NULL
,MaxConcentrationLimit DECIMAL(5,2) NULL
,[Description] NVARCHAR(255)
)
GO

CREATE TABLE AirQuality
(
Station_FK INT NOT NULL
,Device_FK INT NOT NULL
,Date_FK BIGINT NOT NULL
,Toxin_FK INT NOT NULL
,WindSpeed VARCHAR(50) NULL
,AtmosphericVisibility VARCHAR(50) NULL
,AirQualityIndex SMALLINT NULL
,ToxinConcentrationLevel DECIMAL(5,2) NULL
)
ALTER TABLE AirQuality
ADD CONSTRAINT FK_Station
FOREIGN KEY (Station_FK) REFERENCES Station(Station_ID);

ALTER TABLE AirQuality
ADD CONSTRAINT FK_Devices
FOREIGN KEY (Device_FK) REFERENCES Devices(Device_ID);

ALTER TABLE AirQuality
ADD CONSTRAINT FK_Date
FOREIGN KEY (Date_FK) REFERENCES [Date](Date_Key);

ALTER TABLE AirQuality
ADD CONSTRAINT FK_Toxins
FOREIGN KEY (Toxin_FK) REFERENCES Toxins(Toxin_ID);
GO
