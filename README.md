# canyon_ranch


Entity Descriptions & Attributes

This document outlines the written requirements derived from the finalized Entity-Relationship (ER) diagram designed for Canyon Ranch, a wellness resort.
1. Customer
Captures guest-specific data essential for personalized experiences and communication.
•	CustomerID: Unique identifier
•	CustFName, CustLName, CustMName: Guest’s full name components
•	CustomerEmail, CustomerPhone, CustomerAddress: Contact details
•	Gender, DateOfBirth, Age (Derived): Demographics
•	Preferences: Preferences regarding room, spa, food, etc.
•	MedicalHistory: Nested attribute with Condition and Notes
•	ReferralCount: How many other guests they referred
•	VisitCount: Number of visits
2. Reservation
Handles room and service bookings.
•	ReservationID: Unique booking ID
•	ReservationDate: Booking creation date
•	CheckInDate, CheckOutDate: Duration of stay
•	ReservationType: Package type or guest type
•	SpecialRequests: Guest-specific needs
•	NoOfGuests: Total people under this reservation
•	Status: Active, Cancelled, Completed
3. Reservation_Service (Associative Entity)
Connects services with reservations.
•	ReservationServiceID: Unique ID
•	ServiceDate, TimeSlot: When service occurs
•	Status, Notes: Execution notes/status
•	Price: Final price after discount
•	StaffID: Who provided the service
4. Service
Defines service offerings like spa, fitness, etc.
•	ServiceID: Unique ID
•	ServiceName, ServiceType: Type and name
•	Description, Duration, Price, Capacity
5. Staff
Service personnel.
•	StaffID, StaffFName, StaffLName, StaffMName
•	StaffRole, Specialty, Availability
6. Program Coordinator
Acts as the key contact for guests.
•	PCID, PCFName, PCLName, PCMName
•	PCEmail, PCPhone, AssignedReservations, ShiftSchedule
7. Facility
Represents one of the five locations.
•	FacilityID, FacilityName, FacilityType, Address, Phone
•	ServiceAvailability, OperatingHours
8. Room
Represents guest accommodations.
•	RoomID, FacilityID, RoomType, RoomRate, Capacity, RoomStatus, Amenities
9. LoyaltyProgram
Captures loyalty tiers.
•	LoyaltyID, MembershipLevel, ExpiryDate, RewardPoints
10. Payment
Handles monetary transactions.
•	PaymentID, Amount, PaymentMethod, PaymentDate, PaymentStatus, Discount (Optional)
11. Feedback
Captures guest input post-reservation.
•	FeedbackID, FeedbackDate, Review, Rating
12. ReferralSource (Associative Entity)
Tracks how a customer was referred.
•	ReferralSourceID, ReferrerType (Customer, Affiliate, Website)
13. Affiliate
Third-party referring agents.
•	AffiliateID, AffiliateName, AffiliateContact, ReferralCount

Key Business Relationships & Logic
•	Customer ↔ Reservation: A customer can make multiple reservations.
•	Reservation ↔ Reservation_Service ↔ Service: Each reservation can include multiple services, delivered at specific time slots.
•	Reservation ↔ Feedback: One-to-one; each reservation optionally leads to feedback.
•	Reservation ↔ Payment: One-to-one; each reservation must have a payment record.
•	Reservation ↔ Program Coordinator: One coordinator manages many reservations.
•	Staff ↔ Reservation_Service: Staff are assigned to deliver specific booked services.
•	Service ↔ Staff: Tracks which staff are qualified to offer which services.
•	Facility ↔ Room / Staff / Program Coordinator / Service: All these are specific to one facility.
•	Customer ↔ ReferralSource ↔ Affiliate or Customer: Tracks who referred a new guest and how.

![image](https://github.com/user-attachments/assets/42ddc760-69f4-41eb-9852-64c55bf3730f)
