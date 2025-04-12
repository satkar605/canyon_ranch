# 📊 SQL Server Schema Design for Canyon Ranch DB

This document outlines the SQL Server schema design decisions for the Canyon Ranch database, including the data types, constraints, and relationships for each entity.

## Database Schema: `CanyonRanch`

## Tables and Data Types

### 1. Customer
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| CustomerID       | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| CustFName        | NVARCHAR(50)   | NOT NULL                   | Customer first name               |
| CustLName        | NVARCHAR(50)   | NOT NULL                   | Customer last name                |
| CustMName        | NVARCHAR(50)   | NULL                       | Customer middle name (optional)   |
| CustomerEmail    | NVARCHAR(100)  | UNIQUE, NOT NULL           | Email address                     |
| CustomerPhone    | NVARCHAR(15)   | NOT NULL                   | Phone number                      |
| CustomerAddress  | NVARCHAR(255)  | NOT NULL                   | Physical address                  |
| Gender           | NVARCHAR(20)   | NULL                       | Gender                            |
| DateOfBirth      | DATE           | NOT NULL                   | Birth date                        |
| Preferences      | NVARCHAR(MAX)  | NULL                       | JSON string of preferences        |
| MedicalHistory   | NVARCHAR(MAX)  | NULL                       | Medical conditions and notes      |
| ReferralCount    | INT            | DEFAULT 0                  | Number of referrals made          |
| VisitCount       | INT            | DEFAULT 0                  | Number of visits                  |

### 2. Reservation
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| ReservationID    | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| CustomerID       | INT            | FOREIGN KEY                | References Customer               |
| ReservationDate  | DATETIME       | NOT NULL, DEFAULT GETDATE()| Date reservation was made         |
| CheckInDate      | DATE           | NOT NULL                   | Expected check-in date            |
| CheckOutDate     | DATE           | NOT NULL                   | Expected check-out date           |
| ReservationType  | NVARCHAR(50)   | NOT NULL                   | Type of reservation               |
| SpecialRequests  | NVARCHAR(MAX)  | NULL                       | Special requests text             |
| NoOfGuests       | INT            | NOT NULL, DEFAULT 1        | Number of guests                  |
| Status           | NVARCHAR(20)   | NOT NULL, DEFAULT 'Pending'| Reservation status                |
| PCID             | INT            | FOREIGN KEY                | Program Coordinator assigned      |

### 3. Service
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| ServiceID        | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| ServiceName      | NVARCHAR(100)  | NOT NULL                   | Name of service                   |
| ServiceType      | NVARCHAR(50)   | NOT NULL                   | Category of service               |
| Description      | NVARCHAR(MAX)  | NULL                       | Detailed description              |
| Duration         | INT            | NOT NULL                   | Duration in minutes               |
| Price            | DECIMAL(10,2)  | NOT NULL                   | Cost of service                   |
| Capacity         | INT            | NOT NULL                   | Maximum participants              |
| FacilityID       | INT            | FOREIGN KEY                | Facility where service is offered |

### 4. Reservation_Service (Associative)
| Column Name          | Data Type      | Constraints                             | Description                       |
|----------------------|----------------|----------------------------------------|-----------------------------------|
| ReservationServiceID | INT            | PRIMARY KEY, IDENTITY                   | Unique identifier                 |
| ReservationID        | INT            | FOREIGN KEY                             | References Reservation            |
| ServiceID            | INT            | FOREIGN KEY                             | References Service                |
| ServiceDate          | DATE           | NOT NULL                                | Date of scheduled service         |
| TimeSlot             | TIME           | NOT NULL                                | Time of scheduled service         |
| Status               | NVARCHAR(20)   | NOT NULL, DEFAULT 'Booked'              | Status of service booking         |
| Notes                | NVARCHAR(MAX)  | NULL                                    | Additional notes                  |
| Price                | DECIMAL(10,2)  | NOT NULL                                | Price for this specific booking   |
| StaffID              | INT            | FOREIGN KEY                             | Staff member providing service    |

### 5. Staff
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| StaffID          | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| StaffFName       | NVARCHAR(50)   | NOT NULL                   | Staff first name                  |
| StaffLName       | NVARCHAR(50)   | NOT NULL                   | Staff last name                   |
| StaffMName       | NVARCHAR(50)   | NULL                       | Staff middle name (optional)      |
| StaffRole        | NVARCHAR(50)   | NOT NULL                   | Job role                          |
| Specialty        | NVARCHAR(100)  | NULL                       | Area of expertise                 |
| Availability     | NVARCHAR(MAX)  | NULL                       | Availability schedule             |
| FacilityID       | INT            | FOREIGN KEY                | Facility assignment               |

### 6. Program Coordinator
| Column Name          | Data Type      | Constraints                | Description                       |
|----------------------|----------------|----------------------------|-----------------------------------|
| PCID                 | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| PCFName              | NVARCHAR(50)   | NOT NULL                   | Coordinator first name            |
| PCLName              | NVARCHAR(50)   | NOT NULL                   | Coordinator last name             |
| PCMName              | NVARCHAR(50)   | NULL                       | Coordinator middle name           |
| PCEmail              | NVARCHAR(100)  | UNIQUE, NOT NULL           | Email address                     |
| PCPhone              | NVARCHAR(15)   | NOT NULL                   | Phone number                      |
| AssignedReservations | INT            | DEFAULT 0                  | Count of assigned reservations    |
| ShiftSchedule        | NVARCHAR(MAX)  | NULL                       | Work schedule                     |
| FacilityID           | INT            | FOREIGN KEY                | Facility assignment               |

### 7. Facility
| Column Name          | Data Type      | Constraints                | Description                       |
|----------------------|----------------|----------------------------|-----------------------------------|
| FacilityID           | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| FacilityName         | NVARCHAR(100)  | NOT NULL                   | Name of facility                  |
| FacilityType         | NVARCHAR(50)   | NOT NULL                   | Type of facility                  |
| Address              | NVARCHAR(255)  | NOT NULL                   | Physical address                  |
| Phone                | NVARCHAR(15)   | NOT NULL                   | Contact number                    |
| ServiceAvailability  | NVARCHAR(MAX)  | NULL                       | Available services                |
| OperatingHours       | NVARCHAR(MAX)  | NULL                       | Hours of operation                |

### 8. Room
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| RoomID           | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| FacilityID       | INT            | FOREIGN KEY                | Facility location                 |
| RoomType         | NVARCHAR(50)   | NOT NULL                   | Type of room                      |
| RoomRate         | DECIMAL(10,2)  | NOT NULL                   | Cost per night                    |
| Capacity         | INT            | NOT NULL                   | Maximum occupancy                 |
| RoomStatus       | NVARCHAR(20)   | NOT NULL, DEFAULT 'Available'| Current status                  |
| Amenities        | NVARCHAR(MAX)  | NULL                       | Available amenities               |

### 9. LoyaltyProgram
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| LoyaltyID        | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| CustomerID       | INT            | FOREIGN KEY, UNIQUE        | References Customer               |
| MembershipLevel  | NVARCHAR(20)   | NOT NULL, DEFAULT 'Bronze' | Level in loyalty program          |
| ExpiryDate       | DATE           | NOT NULL                   | Membership expiry                 |
| RewardPoints     | INT            | NOT NULL, DEFAULT 0        | Accumulated points                |

### 10. Payment
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| PaymentID        | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| ReservationID    | INT            | FOREIGN KEY                | References Reservation            |
| Amount           | DECIMAL(10,2)  | NOT NULL                   | Payment amount                    |
| PaymentMethod    | NVARCHAR(50)   | NOT NULL                   | Method of payment                 |
| PaymentDate      | DATETIME       | NOT NULL, DEFAULT GETDATE()| Date of payment                   |
| PaymentStatus    | NVARCHAR(20)   | NOT NULL                   | Status of payment                 |
| Discount         | DECIMAL(5,2)   | NULL                       | Discount percentage if applicable |

### 11. Feedback
| Column Name      | Data Type      | Constraints                | Description                       |
|------------------|----------------|----------------------------|-----------------------------------|
| FeedbackID       | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| ReservationID    | INT            | FOREIGN KEY, UNIQUE        | References Reservation            |
| FeedbackDate     | DATETIME       | NOT NULL, DEFAULT GETDATE()| Date feedback was provided        |
| Review           | NVARCHAR(MAX)  | NULL                       | Written review                    |
| Rating           | INT            | NOT NULL                   | Numerical rating (1-5)            |

### 12. ReferralSource
| Column Name        | Data Type      | Constraints                | Description                       |
|--------------------|----------------|----------------------------|-----------------------------------|
| ReferralSourceID   | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| CustomerID         | INT            | FOREIGN KEY                | Customer being referred           |
| ReferrerType       | NVARCHAR(20)   | NOT NULL                   | Type of referrer                  |
| ReferrerID         | INT            | NULL                       | ID of referring entity            |

### 13. Affiliate
| Column Name        | Data Type      | Constraints                | Description                       |
|--------------------|----------------|----------------------------|-----------------------------------|
| AffiliateID        | INT            | PRIMARY KEY, IDENTITY      | Unique identifier                 |
| AffiliateName      | NVARCHAR(100)  | NOT NULL                   | Name of affiliate                 |
| AffiliateContact   | NVARCHAR(100)  | NOT NULL                   | Contact information               |
| ReferralCount      | INT            | NOT NULL, DEFAULT 0        | Number of referrals               |

## Notes on Data Type Choices

- **INT** for all IDs: Provides sufficient range for primary keys while being efficient for joins
- **NVARCHAR** vs VARCHAR: NVARCHAR chosen to support multilingual data (international guests)
- **NVARCHAR(MAX)** for large text fields: Allows for unlimited text length for detailed descriptions
- **DECIMAL(10,2)** for monetary values: Provides precision needed for financial calculations
- **DATE** vs DATETIME: DATE used when time component is not needed; DATETIME when timestamp is important
- **IDENTITY** for auto-incrementing primary keys: Simplifies record creation
- **DEFAULT** constraints: Provide sensible defaults where appropriate

## Key Database Constraints

- All tables have proper PRIMARY KEY constraints
- FOREIGN KEY constraints maintain referential integrity
- NOT NULL constraints on required fields
- UNIQUE constraints on fields requiring uniqueness (emails, etc.)
- DEFAULT constraints for fields with standard initial values

## Next Steps

- Implement schema in SQL Server
- Create appropriate indexes for performance optimization
- Set up proper security and access controls 