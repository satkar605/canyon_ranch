-- Canyon Ranch Database Schema Creation Script
-- This script creates the CanyonRanch database schema and all tables

-- Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'CanyonRanch')
BEGIN
    CREATE DATABASE CanyonRanch;
END
GO

USE CanyonRanch;
GO

-- Drop tables if they exist (for clean setup)
IF OBJECT_ID('ReferralSource', 'U') IS NOT NULL DROP TABLE ReferralSource;
IF OBJECT_ID('Feedback', 'U') IS NOT NULL DROP TABLE Feedback;
IF OBJECT_ID('Payment', 'U') IS NOT NULL DROP TABLE Payment;
IF OBJECT_ID('LoyaltyProgram', 'U') IS NOT NULL DROP TABLE LoyaltyProgram;
IF OBJECT_ID('Reservation_Service', 'U') IS NOT NULL DROP TABLE Reservation_Service;
IF OBJECT_ID('Room', 'U') IS NOT NULL DROP TABLE Room;
IF OBJECT_ID('Reservation', 'U') IS NOT NULL DROP TABLE Reservation;
IF OBJECT_ID('Service', 'U') IS NOT NULL DROP TABLE Service;
IF OBJECT_ID('Staff', 'U') IS NOT NULL DROP TABLE Staff;
IF OBJECT_ID('ProgramCoordinator', 'U') IS NOT NULL DROP TABLE ProgramCoordinator;
IF OBJECT_ID('Affiliate', 'U') IS NOT NULL DROP TABLE Affiliate;
IF OBJECT_ID('Customer', 'U') IS NOT NULL DROP TABLE Customer;
IF OBJECT_ID('Facility', 'U') IS NOT NULL DROP TABLE Facility;
GO

-- Create Facility Table
CREATE TABLE Facility (
    FacilityID INT PRIMARY KEY IDENTITY(1,1),
    FacilityName NVARCHAR(100) NOT NULL,
    FacilityType NVARCHAR(50) NOT NULL,
    Address NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(15) NOT NULL,
    ServiceAvailability NVARCHAR(MAX) NULL,
    OperatingHours NVARCHAR(MAX) NULL
);
GO

-- Create Customer Table
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustFName NVARCHAR(50) NOT NULL,
    CustLName NVARCHAR(50) NOT NULL,
    CustMName NVARCHAR(50) NULL,
    CustomerEmail NVARCHAR(100) NOT NULL UNIQUE,
    CustomerPhone NVARCHAR(15) NOT NULL,
    CustomerAddress NVARCHAR(255) NOT NULL,
    Gender NVARCHAR(20) NULL,
    DateOfBirth DATE NOT NULL,
    Preferences NVARCHAR(MAX) NULL,
    MedicalHistory NVARCHAR(MAX) NULL,
    ReferralCount INT DEFAULT 0,
    VisitCount INT DEFAULT 0
);
GO

-- Create Affiliate Table
CREATE TABLE Affiliate (
    AffiliateID INT PRIMARY KEY IDENTITY(1,1),
    AffiliateName NVARCHAR(100) NOT NULL,
    AffiliateContact NVARCHAR(100) NOT NULL,
    ReferralCount INT NOT NULL DEFAULT 0
);
GO

-- Create Program Coordinator Table
CREATE TABLE ProgramCoordinator (
    PCID INT PRIMARY KEY IDENTITY(1,1),
    PCFName NVARCHAR(50) NOT NULL,
    PCLName NVARCHAR(50) NOT NULL,
    PCMName NVARCHAR(50) NULL,
    PCEmail NVARCHAR(100) NOT NULL UNIQUE,
    PCPhone NVARCHAR(15) NOT NULL,
    AssignedReservations INT DEFAULT 0,
    ShiftSchedule NVARCHAR(MAX) NULL,
    FacilityID INT FOREIGN KEY REFERENCES Facility(FacilityID)
);
GO

-- Create Staff Table
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY IDENTITY(1,1),
    StaffFName NVARCHAR(50) NOT NULL,
    StaffLName NVARCHAR(50) NOT NULL,
    StaffMName NVARCHAR(50) NULL,
    StaffRole NVARCHAR(50) NOT NULL,
    Specialty NVARCHAR(100) NULL,
    Availability NVARCHAR(MAX) NULL,
    FacilityID INT FOREIGN KEY REFERENCES Facility(FacilityID)
);
GO

-- Create Service Table
CREATE TABLE Service (
    ServiceID INT PRIMARY KEY IDENTITY(1,1),
    ServiceName NVARCHAR(100) NOT NULL,
    ServiceType NVARCHAR(50) NOT NULL,
    Description NVARCHAR(MAX) NULL,
    Duration INT NOT NULL, -- Duration in minutes
    Price DECIMAL(10,2) NOT NULL,
    Capacity INT NOT NULL,
    FacilityID INT FOREIGN KEY REFERENCES Facility(FacilityID)
);
GO

-- Create Reservation Table
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    ReservationDate DATETIME NOT NULL DEFAULT GETDATE(),
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    ReservationType NVARCHAR(50) NOT NULL,
    SpecialRequests NVARCHAR(MAX) NULL,
    NoOfGuests INT NOT NULL DEFAULT 1,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Pending',
    PCID INT FOREIGN KEY REFERENCES ProgramCoordinator(PCID),
    -- Add constraint to ensure checkout date is after checkin date
    CONSTRAINT CK_Reservation_Dates CHECK (CheckOutDate > CheckInDate)
);
GO

-- Create Room Table
CREATE TABLE Room (
    RoomID INT PRIMARY KEY IDENTITY(1,1),
    FacilityID INT FOREIGN KEY REFERENCES Facility(FacilityID),
    RoomType NVARCHAR(50) NOT NULL,
    RoomRate DECIMAL(10,2) NOT NULL,
    Capacity INT NOT NULL,
    RoomStatus NVARCHAR(20) NOT NULL DEFAULT 'Available',
    Amenities NVARCHAR(MAX) NULL
);
GO

-- Create Reservation_Service (Associative Table)
CREATE TABLE Reservation_Service (
    ReservationServiceID INT PRIMARY KEY IDENTITY(1,1),
    ReservationID INT FOREIGN KEY REFERENCES Reservation(ReservationID),
    ServiceID INT FOREIGN KEY REFERENCES Service(ServiceID),
    ServiceDate DATE NOT NULL,
    TimeSlot TIME NOT NULL,
    Status NVARCHAR(20) NOT NULL DEFAULT 'Booked',
    Notes NVARCHAR(MAX) NULL,
    Price DECIMAL(10,2) NOT NULL,
    StaffID INT FOREIGN KEY REFERENCES Staff(StaffID)
);
GO

-- Create LoyaltyProgram Table
CREATE TABLE LoyaltyProgram (
    LoyaltyID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID) UNIQUE,
    MembershipLevel NVARCHAR(20) NOT NULL DEFAULT 'Bronze',
    ExpiryDate DATE NOT NULL,
    RewardPoints INT NOT NULL DEFAULT 0
);
GO

-- Create Payment Table
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY IDENTITY(1,1),
    ReservationID INT FOREIGN KEY REFERENCES Reservation(ReservationID),
    Amount DECIMAL(10,2) NOT NULL,
    PaymentMethod NVARCHAR(50) NOT NULL,
    PaymentDate DATETIME NOT NULL DEFAULT GETDATE(),
    PaymentStatus NVARCHAR(20) NOT NULL,
    Discount DECIMAL(5,2) NULL,
    -- Add constraint to ensure amount is positive
    CONSTRAINT CK_Payment_Amount CHECK (Amount > 0)
);
GO

-- Create Feedback Table
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY IDENTITY(1,1),
    ReservationID INT FOREIGN KEY REFERENCES Reservation(ReservationID) UNIQUE,
    FeedbackDate DATETIME NOT NULL DEFAULT GETDATE(),
    Review NVARCHAR(MAX) NULL,
    Rating INT NOT NULL,
    -- Add constraint to ensure rating is between 1 and 5
    CONSTRAINT CK_Feedback_Rating CHECK (Rating BETWEEN 1 AND 5)
);
GO

-- Create ReferralSource Table
CREATE TABLE ReferralSource (
    ReferralSourceID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customer(CustomerID),
    ReferrerType NVARCHAR(20) NOT NULL,
    ReferrerID INT NULL -- This could be CustomerID or AffiliateID depending on ReferrerType
);
GO

-- Add indexes for performance
CREATE INDEX IX_Reservation_CustomerID ON Reservation(CustomerID);
CREATE INDEX IX_Reservation_Service_ReservationID ON Reservation_Service(ReservationID);
CREATE INDEX IX_Reservation_Service_ServiceID ON Reservation_Service(ServiceID);
CREATE INDEX IX_Room_FacilityID ON Room(FacilityID);
CREATE INDEX IX_Service_FacilityID ON Service(FacilityID);
CREATE INDEX IX_Staff_FacilityID ON Staff(FacilityID);
GO

-- Print success message
PRINT 'CanyonRanch database schema created successfully.'
GO 