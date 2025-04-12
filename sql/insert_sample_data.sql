-- Canyon Ranch Database Sample Data Script
-- This script populates the CanyonRanch database with sample data

USE CanyonRanch;
GO

-- Clear existing data (if any)
DELETE FROM ReferralSource;
DELETE FROM Feedback;
DELETE FROM Payment;
DELETE FROM LoyaltyProgram;
DELETE FROM Reservation_Service;
DELETE FROM Room;
DELETE FROM Reservation;
DELETE FROM Service;
DELETE FROM Staff;
DELETE FROM ProgramCoordinator;
DELETE FROM Affiliate;
DELETE FROM Customer;
DELETE FROM Facility;
GO

-- Reset identity columns
DBCC CHECKIDENT ('ReferralSource', RESEED, 0);
DBCC CHECKIDENT ('Feedback', RESEED, 0);
DBCC CHECKIDENT ('Payment', RESEED, 0);
DBCC CHECKIDENT ('LoyaltyProgram', RESEED, 0);
DBCC CHECKIDENT ('Reservation_Service', RESEED, 0);
DBCC CHECKIDENT ('Room', RESEED, 0);
DBCC CHECKIDENT ('Reservation', RESEED, 0);
DBCC CHECKIDENT ('Service', RESEED, 0);
DBCC CHECKIDENT ('Staff', RESEED, 0);
DBCC CHECKIDENT ('ProgramCoordinator', RESEED, 0);
DBCC CHECKIDENT ('Affiliate', RESEED, 0);
DBCC CHECKIDENT ('Customer', RESEED, 0);
DBCC CHECKIDENT ('Facility', RESEED, 0);
GO

-- Insert Facility data
INSERT INTO Facility (FacilityName, FacilityType, Address, Phone, ServiceAvailability, OperatingHours)
VALUES 
    ('Canyon Ranch Tucson', 'Resort', '8600 E Rockcliff Rd, Tucson, AZ 85750', '520-749-9000', 'Spa, Wellness, Fitness', '24/7'),
    ('Canyon Ranch Lenox', 'Resort', '165 Kemble St, Lenox, MA 01240', '413-637-4100', 'Spa, Wellness, Fitness', '24/7'),
    ('Canyon Ranch Woodside', 'Retreat', '16350 Skyline Blvd, Woodside, CA 94062', '650-384-5000', 'Retreat, Wellness', '24/7'),
    ('Canyon Ranch Las Vegas', 'Spa Club', '3355 Las Vegas Blvd S, Las Vegas, NV 89109', '702-414-3600', 'Spa, Fitness', '6:00 AM - 8:00 PM'),
    ('Canyon Ranch Miami Beach', 'Hotel & Spa', '6801 Collins Ave, Miami Beach, FL 33141', '305-514-7000', 'Spa, Beach, Wellness', '24/7');
GO

-- Insert Customer data
INSERT INTO Customer (CustFName, CustLName, CustMName, CustomerEmail, CustomerPhone, CustomerAddress, Gender, DateOfBirth, Preferences, MedicalHistory)
VALUES
    ('John', 'Smith', NULL, 'john.smith@email.com', '555-123-4567', '123 Main St, Boston, MA 02108', 'Male', '1975-06-15', 'Vegetarian, Morning Yoga', 'Hypertension'),
    ('Emily', 'Johnson', 'Rose', 'emily.johnson@email.com', '555-234-5678', '456 Oak Ave, Chicago, IL 60611', 'Female', '1982-09-23', 'Gluten-free, Pilates', 'None'),
    ('Michael', 'Williams', 'James', 'michael.williams@email.com', '555-345-6789', '789 Pine Rd, San Francisco, CA 94109', 'Male', '1968-03-12', 'Low-sodium, Meditation', 'Type 2 Diabetes'),
    ('Jennifer', 'Brown', NULL, 'jennifer.brown@email.com', '555-456-7890', '101 Cedar Ln, Denver, CO 80202', 'Female', '1990-11-05', 'Vegan, Hot Stone Massage', 'Asthma'),
    ('Robert', 'Jones', 'Thomas', 'robert.jones@email.com', '555-567-8901', '202 Elm St, Seattle, WA 98101', 'Male', '1972-08-30', 'Early Riser, Hiking', 'None'),
    ('Lisa', 'Garcia', 'Marie', 'lisa.garcia@email.com', '555-678-9012', '303 Birch Dr, Miami, FL 33139', 'Female', '1985-05-20', 'Pescatarian, Acupuncture', 'Migraine'),
    ('David', 'Miller', 'Alan', 'david.miller@email.com', '555-789-0123', '404 Walnut Ave, Austin, TX 78701', 'Male', '1980-02-14', 'Keto, Strength Training', 'None'),
    ('Sarah', 'Davis', 'Jane', 'sarah.davis@email.com', '555-890-1234', '505 Maple Rd, Portland, OR 97201', 'Female', '1978-07-18', 'Organic Food, Yoga', 'Hypothyroidism'),
    ('James', 'Rodriguez', NULL, 'james.rodriguez@email.com', '555-901-2345', '606 Spruce St, Phoenix, AZ 85004', 'Male', '1965-12-09', 'Low-carb, Swimming', 'Arthritis'),
    ('Michelle', 'Martinez', 'Lynn', 'michelle.martinez@email.com', '555-012-3456', '707 Pine Ln, Dallas, TX 75201', 'Female', '1988-04-27', 'Dairy-free, Hot Yoga', 'None'),
    ('Richard', 'Anderson', 'Scott', 'richard.anderson@email.com', '555-234-5678', '808 Oak Ct, Atlanta, GA 30303', 'Male', '1970-09-22', 'Mediterranean Diet, Golf', 'High Cholesterol'),
    ('Amanda', 'Thomas', NULL, 'amanda.thomas@email.com', '555-876-5432', '909 Elm Rd, Philadelphia, PA 19103', 'Female', '1983-01-15', 'Paleo, HIIT Training', 'None'),
    ('Christopher', 'White', 'John', 'christopher.white@email.com', '555-654-3210', '1010 Cedar Ave, San Diego, CA 92101', 'Male', '1966-06-08', 'Intermittent Fasting, Tennis', 'Hypertension'),
    ('Stephanie', 'Harris', 'Ann', 'stephanie.harris@email.com', '555-432-1098', '1111 Birch Ln, Nashville, TN 37203', 'Female', '1992-03-31', 'Vegetarian, Pilates', 'Allergies'),
    ('Daniel', 'Clark', NULL, 'daniel.clark@email.com', '555-210-9876', '1212 Walnut St, Las Vegas, NV 89109', 'Male', '1977-11-26', 'High-protein, Weights', 'None');
GO

-- Insert Affiliate data
INSERT INTO Affiliate (AffiliateName, AffiliateContact, ReferralCount)
VALUES
    ('Wellness Travel Agency', 'contact@wellnesstravel.com', 12),
    ('Corporate Wellness Solutions', 'partners@corpwellness.com', 8),
    ('Luxury Spa Magazine', 'marketing@luxuryspa.com', 10),
    ('Health Retreat Directory', 'listings@healthretreats.com', 5),
    ('Premium Credit Card Concierge', 'concierge@premiumcc.com', 15);
GO

-- Insert Program Coordinator data
INSERT INTO ProgramCoordinator (PCFName, PCLName, PCMName, PCEmail, PCPhone, AssignedReservations, ShiftSchedule, FacilityID)
VALUES
    ('Jessica', 'Patel', NULL, 'jessica.patel@canyonranch.com', '520-749-9001', 8, 'Mon-Fri: 8am-4pm', 1),
    ('Marcus', 'Rivera', 'Luis', 'marcus.rivera@canyonranch.com', '520-749-9002', 6, 'Wed-Sun: 10am-6pm', 1),
    ('Elizabeth', 'Wong', 'Kim', 'elizabeth.wong@canyonranch.com', '413-637-4101', 9, 'Mon-Fri: 9am-5pm', 2),
    ('Brian', 'Johnson', NULL, 'brian.johnson@canyonranch.com', '413-637-4102', 7, 'Thu-Mon: 7am-3pm', 2),
    ('Sophia', 'Chen', NULL, 'sophia.chen@canyonranch.com', '650-384-5001', 5, 'Tue-Sat: 11am-7pm', 3),
    ('Jamal', 'Washington', 'Andre', 'jamal.washington@canyonranch.com', '702-414-3601', 10, 'Wed-Sun: 8am-4pm', 4),
    ('Rachel', 'Kim', 'Min', 'rachel.kim@canyonranch.com', '305-514-7001', 8, 'Mon-Fri: 9am-5pm', 5);
GO

-- Insert Staff data
INSERT INTO Staff (StaffFName, StaffLName, StaffMName, StaffRole, Specialty, Availability, FacilityID)
VALUES
    ('Alex', 'Thompson', NULL, 'Massage Therapist', 'Deep Tissue, Hot Stone', 'Mon-Fri: 9am-5pm', 1),
    ('Maria', 'Gonzalez', 'Elena', 'Yoga Instructor', 'Vinyasa, Restorative', 'Tue-Sat: 7am-3pm', 1),
    ('Thomas', 'Nguyen', NULL, 'Nutritionist', 'Weight Management, Sports Nutrition', 'Mon-Thu: 8am-6pm', 1),
    ('Olivia', 'Jackson', 'Mae', 'Personal Trainer', 'HIIT, Strength Training', 'Wed-Sun: 6am-2pm', 1),
    ('Derek', 'Williams', 'James', 'Acupuncturist', 'Pain Management, Stress Reduction', 'Mon-Fri: 10am-6pm', 2),
    ('Priya', 'Sharma', NULL, 'Ayurvedic Practitioner', 'Detox, Wellness', 'Tue-Sat: 9am-5pm', 2),
    ('Nathan', 'Lee', 'Min', 'Fitness Coach', 'Functional Training, Pilates', 'Wed-Sun: 8am-4pm', 2),
    ('Gabrielle', 'Wilson', 'Rose', 'Spa Therapist', 'Facials, Body Treatments', 'Thu-Mon: 10am-6pm', 2),
    ('Tyler', 'Brown', NULL, 'Meditation Guide', 'Mindfulness, Sound Healing', 'Mon-Fri: 7am-3pm', 3),
    ('Elena', 'Rodriguez', 'Maria', 'Health Educator', 'Stress Management, Life Balance', 'Tue-Sat: 9am-5pm', 3),
    ('Justin', 'Miller', 'Thomas', 'Personal Trainer', 'Sports Performance, Rehabilitation', 'Wed-Sun: 6am-2pm', 3),
    ('Kimberly', 'Davis', NULL, 'Massage Therapist', 'Swedish, Aromatherapy', 'Thu-Mon: 8am-4pm', 4),
    ('Ryan', 'Patel', 'Raj', 'Yoga Instructor', 'Hatha, Kundalini', 'Mon-Fri: 6am-2pm', 4),
    ('Sophia', 'Martinez', 'Isabella', 'Nutritionist', 'Plant-based, Anti-inflammatory', 'Tue-Sat: 10am-6pm', 4),
    ('Brandon', 'Taylor', NULL, 'Fitness Coach', 'Cardio, Circuit Training', 'Wed-Sun: 7am-3pm', 5),
    ('Aisha', 'Johnson', 'Nicole', 'Spa Therapist', 'Scrubs, Wraps', 'Mon-Fri: 9am-5pm', 5),
    ('Michael', 'Chen', 'Wei', 'Acupuncturist', 'Fertility, Digestive Health', 'Tue-Sat: 8am-4pm', 5),
    ('Natalie', 'Garcia', NULL, 'Health Educator', 'Sleep Health, Detox', 'Thu-Mon: 10am-6pm', 5);
GO

-- Insert Service data
INSERT INTO Service (ServiceName, ServiceType, Description, Duration, Price, Capacity, FacilityID)
VALUES
    ('Deep Tissue Massage', 'Massage', 'Therapeutic massage targeting deeper muscle layers for tension relief', 60, 150.00, 1, 1),
    ('Hot Stone Massage', 'Massage', 'Relaxing massage using heated basalt stones to ease muscle tension', 90, 195.00, 1, 1),
    ('Vinyasa Flow Yoga', 'Fitness', 'Dynamic yoga class linking breath with movement for strength and flexibility', 60, 45.00, 20, 1),
    ('Nutrition Consultation', 'Wellness', 'Personalized nutrition plan with a certified nutritionist', 60, 125.00, 1, 1),
    ('Chakra Balancing Meditation', 'Wellness', 'Guided meditation focusing on energy centers alignment', 45, 65.00, 10, 2),
    ('Ayurvedic Body Treatment', 'Spa', 'Traditional Indian wellness treatment customized to your dosha', 120, 225.00, 1, 2),
    ('Reformer Pilates', 'Fitness', 'Equipment-based Pilates session for core strength and flexibility', 55, 85.00, 8, 2),
    ('Hydrafacial', 'Spa', 'Advanced facial treatment for deep cleansing and hydration', 60, 175.00, 1, 2),
    ('Mindfulness Workshop', 'Wellness', 'Interactive session teaching practical mindfulness techniques', 90, 75.00, 15, 3),
    ('Forest Bathing Walk', 'Outdoor', 'Guided nature immersion for stress reduction and relaxation', 120, 90.00, 10, 3),
    ('HIIT Circuit Training', 'Fitness', 'High-intensity interval training for maximum calorie burn', 45, 55.00, 12, 3),
    ('Swedish Massage', 'Massage', 'Classic full-body massage promoting relaxation and wellness', 60, 140.00, 1, 4),
    ('Candlelit Yoga', 'Fitness', 'Gentle evening yoga practice by candlelight for deep relaxation', 75, 50.00, 15, 4),
    ('Plant-Based Cooking Demo', 'Culinary', 'Hands-on demonstration of nutritious plant-based meal preparation', 90, 95.00, 8, 4),
    ('Beach Boot Camp', 'Fitness', 'Challenging fitness session on the beach combining cardio and strength', 60, 60.00, 15, 5),
    ('Ocean Radiance Body Wrap', 'Spa', 'Detoxifying seaweed wrap with scalp massage and moisturization', 90, 185.00, 1, 5),
    ('Acupuncture Session', 'Wellness', 'Traditional Chinese medicine treatment for balancing energy flow', 60, 130.00, 1, 5),
    ('Healthy Sleep Workshop', 'Education', 'Expert guidance on improving sleep quality naturally', 60, 40.00, 20, 5);
GO

-- Insert Room data
INSERT INTO Room (FacilityID, RoomType, RoomRate, Capacity, RoomStatus, Amenities)
VALUES
    (1, 'Deluxe King', 450.00, 2, 'Available', 'Mountain view, Balcony, Organic linens, Rainfall shower'),
    (1, 'Executive Suite', 675.00, 2, 'Available', 'Living area, Soaking tub, Desert view, Organic toiletries'),
    (1, 'Double Queen', 425.00, 4, 'Available', 'Garden view, Workspace, Mini fridge, Aromatherapy diffuser'),
    (1, 'ADA Accessible King', 450.00, 2, 'Available', 'Roll-in shower, Wider doorways, Lowered amenities'),
    (2, 'Berkshire Suite', 695.00, 2, 'Available', 'Fireplace, Forest view, Soaking tub, Sitting area'),
    (2, 'Deluxe King', 475.00, 2, 'Available', 'Luxury linens, Garden view, Rainfall shower, Meditation corner'),
    (2, 'Double Queen', 450.00, 4, 'Available', 'Workspace, Reading nook, Organic bath products'),
    (2, 'ADA Accessible Queen', 450.00, 2, 'Available', 'Accessible bathroom, Visual alarms, Wider doorways'),
    (3, 'Forest Treehouse', 895.00, 2, 'Available', 'Elevated room, Panoramic forest views, Private deck, Luxury linens'),
    (3, 'Redwood Retreat', 750.00, 2, 'Available', 'Woodland view, Meditation cushions, Outdoor shower option'),
    (3, 'Canopy King', 695.00, 2, 'Available', 'Floor-to-ceiling windows, Natural toiletries, Reading nook'),
    (5, 'Oceanfront Suite', 950.00, 2, 'Available', 'Direct ocean view, Balcony, Living area, Soaking tub'),
    (5, 'Deluxe King', 650.00, 2, 'Available', 'Partial ocean view, Balcony, Luxury linens, Rainfall shower'),
    (5, 'Double Queen Oceanview', 675.00, 4, 'Available', 'Ocean view, Workspace, Mini fridge, Yoga mat');
GO

-- Insert Reservation data
INSERT INTO Reservation (CustomerID, ReservationDate, CheckInDate, CheckOutDate, ReservationType, SpecialRequests, NoOfGuests, Status, PCID)
VALUES
    (1, '2023-02-15', '2023-03-10', '2023-03-15', 'Wellness Retreat', 'Early check-in if possible', 1, 'Completed', 1),
    (2, '2023-03-01', '2023-04-05', '2023-04-12', 'Spa Getaway', 'Room away from elevator', 2, 'Completed', 3),
    (3, '2023-03-20', '2023-05-15', '2023-05-20', 'Fitness Boot Camp', 'Extra yoga mat and meditation cushion', 1, 'Completed', 5),
    (4, '2023-04-10', '2023-06-01', '2023-06-05', 'Weekend Escape', 'Gluten-free menu options', 2, 'Completed', 6),
    (5, '2023-05-05', '2023-07-10', '2023-07-17', 'Summer Wellness', 'Room with the best mountain view', 2, 'Completed', 2),
    (6, '2023-06-12', '2023-08-20', '2023-08-27', 'Rejuvenation Week', 'Hypoallergenic bedding', 1, 'Completed', 7),
    (7, '2023-07-08', '2023-09-15', '2023-09-20', 'Fitness Focused', 'Early morning workout schedule', 1, 'Completed', 4),
    (8, '2023-08-15', '2023-10-05', '2023-10-12', 'Autumn Retreat', 'Vegan meal plan', 2, 'Completed', 5),
    (9, '2023-09-20', '2023-11-15', '2023-11-20', 'Pre-Holiday Detox', 'Quiet room location', 1, 'Completed', 3),
    (10, '2023-10-10', '2023-12-01', '2023-12-08', 'Holiday Escape', 'Champagne in room upon arrival', 2, 'Completed', 1),
    (11, '2023-11-05', '2024-01-10', '2024-01-15', 'New Year Renewal', 'Daily fresh fruit basket', 2, 'Completed', 6),
    (12, '2023-12-15', '2024-02-05', '2024-02-10', 'Winter Wellness', 'Extra blankets', 1, 'Completed', 2),
    (13, '2024-01-10', '2024-03-01', '2024-03-07', 'Spring Awakening', 'Low floor room', 2, 'Completed', 7),
    (14, '2024-02-20', '2024-04-15', '2024-04-20', 'Wellness Weekend', 'Late checkout if possible', 2, 'Completed', 4),
    (15, '2024-03-05', '2024-05-01', '2024-05-07', 'Detox Retreat', 'Daily meditation session', 1, 'Confirmed', 1),
    (1, '2024-03-10', '2024-05-15', '2024-05-22', 'Annual Wellness', 'Same room as last visit', 1, 'Confirmed', 3),
    (3, '2024-03-25', '2024-06-10', '2024-06-17', 'Summer Fitness', 'Access to gym 24/7', 1, 'Confirmed', 5),
    (5, '2024-04-01', '2024-07-05', '2024-07-12', 'Mountain Retreat', 'Hiking guide recommendations', 2, 'Confirmed', 2),
    (7, '2024-04-15', '2024-08-01', '2024-08-07', 'Fitness Week', 'Personal training sessions', 1, 'Confirmed', 4),
    (9, '2024-05-01', '2024-09-10', '2024-09-17', 'Fall Wellness', 'Room with desk for working', 1, 'Confirmed', 6);
GO

-- Insert Reservation_Service data
INSERT INTO Reservation_Service (ReservationID, ServiceID, ServiceDate, TimeSlot, Status, Notes, Price, StaffID)
VALUES
    (1, 1, '2023-03-11', '10:00:00', 'Completed', 'Client requested extra focus on shoulders', 150.00, 1),
    (1, 3, '2023-03-12', '08:00:00', 'Completed', NULL, 45.00, 2),
    (1, 4, '2023-03-13', '14:00:00', 'Completed', 'Follow-up session recommended', 125.00, 3),
    (2, 5, '2023-04-06', '09:00:00', 'Completed', NULL, 65.00, 5),
    (2, 6, '2023-04-07', '11:00:00', 'Completed', 'Client loved the treatment', 225.00, 6),
    (2, 8, '2023-04-09', '15:00:00', 'Completed', 'Recommended home care products', 175.00, 8),
    (3, 9, '2023-05-16', '10:00:00', 'Completed', NULL, 75.00, 9),
    (3, 10, '2023-05-17', '14:00:00', 'Completed', 'Extended session by 15 minutes', 90.00, 10),
    (3, 11, '2023-05-18', '08:00:00', 'Completed', 'Client requested higher intensity', 55.00, 11),
    (4, 12, '2023-06-02', '16:00:00', 'Completed', NULL, 140.00, 12),
    (4, 13, '2023-06-03', '19:00:00', 'Completed', 'Client attended with partner', 50.00, 13),
    (5, 1, '2023-07-11', '11:00:00', 'Completed', NULL, 150.00, 1),
    (5, 3, '2023-07-12', '08:00:00', 'Completed', 'Client requested private session', 75.00, 2),
    (5, 4, '2023-07-13', '15:00:00', 'Completed', 'Diet plan provided', 125.00, 3),
    (6, 15, '2023-08-21', '07:00:00', 'Completed', 'Moved to beach location', 60.00, 15),
    (6, 16, '2023-08-22', '14:00:00', 'Completed', NULL, 185.00, 16),
    (6, 17, '2023-08-23', '10:00:00', 'Completed', 'Focus on digestive health', 130.00, 17),
    (7, 7, '2023-09-16', '09:00:00', 'Completed', 'Advanced level session', 85.00, 7),
    (7, 11, '2023-09-17', '16:00:00', 'Completed', NULL, 55.00, 11),
    (8, 9, '2023-10-06', '10:00:00', 'Completed', NULL, 75.00, 9),
    (8, 10, '2023-10-07', '14:00:00', 'Completed', 'Extended to 150 minutes', 115.00, 10),
    (9, 5, '2023-11-16', '09:00:00', 'Completed', NULL, 65.00, 5),
    (9, 6, '2023-11-17', '11:00:00', 'Completed', 'Customized for detox focus', 225.00, 6),
    (10, 12, '2023-12-02', '15:00:00', 'Completed', 'Added aromatherapy', 160.00, 12),
    (10, 14, '2023-12-04', '11:00:00', 'Completed', 'Private session', 150.00, 14),
    (11, 17, '2024-01-11', '13:00:00', 'Completed', NULL, 130.00, 17),
    (11, 18, '2024-01-12', '16:00:00', 'Completed', 'Personalized sleep plan created', 40.00, 17),
    (12, 1, '2024-02-06', '10:00:00', 'Completed', NULL, 150.00, 1),
    (12, 3, '2024-02-07', '08:00:00', 'Completed', NULL, 45.00, 2),
    (13, 16, '2024-03-02', '14:00:00', 'Completed', NULL, 185.00, 16),
    (13, 17, '2024-03-03', '11:00:00', 'Completed', 'Focus on stress reduction', 130.00, 17),
    (14, 7, '2024-04-16', '10:00:00', 'Completed', NULL, 85.00, 7),
    (14, 8, '2024-04-17', '13:00:00', 'Completed', 'Added LED therapy', 200.00, 8),
    (15, 1, '2024-05-02', '09:00:00', 'Booked', NULL, 150.00, 1),
    (15, 4, '2024-05-03', '14:00:00', 'Booked', 'Focus on detox nutrition', 125.00, 3),
    (16, 5, '2024-05-16', '10:00:00', 'Booked', NULL, 65.00, 5),
    (16, 6, '2024-05-17', '13:00:00', 'Booked', NULL, 225.00, 6),
    (17, 9, '2024-06-11', '09:00:00', 'Booked', NULL, 75.00, 9),
    (17, 11, '2024-06-12', '16:00:00', 'Booked', 'Advanced level', 55.00, 11),
    (18, 1, '2024-07-06', '10:00:00', 'Booked', NULL, 150.00, 1),
    (18, 3, '2024-07-07', '08:00:00', 'Booked', NULL, 45.00, 2),
    (19, 7, '2024-08-02', '09:00:00', 'Booked', NULL, 85.00, 7),
    (19, 11, '2024-08-03', '16:00:00', 'Booked', 'High intensity requested', 55.00, 11),
    (20, 17, '2024-09-11', '11:00:00', 'Booked', NULL, 130.00, 17),
    (20, 18, '2024-09-12', '14:00:00', 'Booked', NULL, 40.00, 17);
GO

-- Insert LoyaltyProgram data
INSERT INTO LoyaltyProgram (CustomerID, MembershipLevel, ExpiryDate, RewardPoints)
VALUES
    (1, 'Gold', '2025-12-31', 2500),
    (2, 'Silver', '2025-12-31', 1200),
    (3, 'Gold', '2025-12-31', 3100),
    (4, 'Bronze', '2025-12-31', 750),
    (5, 'Platinum', '2025-12-31', 5600),
    (6, 'Silver', '2025-12-31', 1850),
    (7, 'Bronze', '2025-12-31', 500),
    (8, 'Gold', '2025-12-31', 2850),
    (9, 'Silver', '2025-12-31', 1400),
    (10, 'Bronze', '2025-12-31', 650);
GO

-- Insert Payment data
INSERT INTO Payment (ReservationID, Amount, PaymentMethod, PaymentDate, PaymentStatus, Discount)
VALUES
    (1, 1245.00, 'Credit Card', '2023-02-15', 'Completed', 10.00),
    (2, 2350.00, 'Credit Card', '2023-03-01', 'Completed', NULL),
    (3, 895.00, 'PayPal', '2023-03-20', 'Completed', 5.00),
    (4, 760.00, 'Credit Card', '2023-04-10', 'Completed', NULL),
    (5, 2475.00, 'Bank Transfer', '2023-05-05', 'Completed', NULL),
    (6, 1925.00, 'Credit Card', '2023-06-12', 'Completed', 15.00),
    (7, 725.00, 'Credit Card', '2023-07-08', 'Completed', NULL),
    (8, 1990.00, 'PayPal', '2023-08-15', 'Completed', 10.00),
    (9, 1115.00, 'Credit Card', '2023-09-20', 'Completed', NULL),
    (10, 1310.00, 'Credit Card', '2023-10-10', 'Completed', 5.00),
    (11, 845.00, 'Bank Transfer', '2023-11-05', 'Completed', NULL),
    (12, 795.00, 'Credit Card', '2023-12-15', 'Completed', NULL),
    (13, 1495.00, 'PayPal', '2024-01-10', 'Completed', 10.00),
    (14, 1085.00, 'Credit Card', '2024-02-20', 'Completed', NULL),
    (15, 975.00, 'Credit Card', '2024-03-05', 'Completed', NULL),
    (16, 1190.00, 'Bank Transfer', '2024-03-10', 'Completed', 5.00),
    (17, 830.00, 'Credit Card', '2024-03-25', 'Completed', NULL),
    (18, 1695.00, 'Credit Card', '2024-04-01', 'Completed', 10.00),
    (19, 840.00, 'PayPal', '2024-04-15', 'Completed', NULL),
    (20, 970.00, 'Credit Card', '2024-05-01', 'Completed', NULL);
GO

-- Insert Feedback data
INSERT INTO Feedback (ReservationID, FeedbackDate, Review, Rating)
VALUES
    (1, '2023-03-16', 'Excellent facilities and attentive staff. The massage was particularly outstanding.', 5),
    (2, '2023-04-13', 'Very relaxing stay. The Ayurvedic treatment was transformative. Would have liked more dining options.', 4),
    (3, '2023-05-21', 'The mindfulness workshop changed my perspective. Facilities were clean and well-maintained.', 5),
    (4, '2023-06-06', 'Peaceful atmosphere and professional staff. Room was slightly smaller than expected.', 4),
    (5, '2023-07-18', 'Perfect getaway with stunning views. The nutrition consultation was eye-opening.', 5),
    (6, '2023-08-28', 'The ocean views were breathtaking, but the beach was crowded. Spa services were excellent.', 4),
    (7, '2023-09-21', 'Pilates instructor was exceptional. Would have appreciated better WiFi connectivity.', 4),
    (8, '2023-10-13', 'Forest bathing experience was magical. Will definitely return for another retreat.', 5),
    (9, '2023-11-21', 'The meditation sessions were deeply restorative. Room service was a bit slow.', 4),
    (10, '2023-12-09', 'Wonderful holiday escape. The Swedish massage and yoga sessions were perfect.', 5),
    (11, '2024-01-16', 'Great way to start the year. Acupuncture session was transformative.', 5),
    (12, '2024-02-11', 'Cozy winter stay. Would have liked more indoor activity options.', 3),
    (13, '2024-03-08', 'The body wrap treatment was luxurious. Staff was attentive to all needs.', 5),
    (14, '2024-04-21', 'Enjoyed the Pilates and facial treatments. Room decor could use updating.', 4);
GO

-- Insert ReferralSource data
INSERT INTO ReferralSource (CustomerID, ReferrerType, ReferrerID)
VALUES
    (1, 'Affiliate', 1),
    (2, 'Customer', 1),
    (3, 'Affiliate', 3),
    (4, 'Affiliate', 2),
    (5, 'Customer', 3),
    (6, 'Affiliate', 5),
    (7, 'Customer', 5),
    (8, 'Affiliate', 4),
    (9, 'Customer', 8),
    (10, 'Affiliate', 5),
    (11, 'Customer', 10),
    (12, 'Affiliate', 2),
    (13, 'Customer', 12),
    (14, 'Affiliate', 1),
    (15, 'Customer', 14);
GO

-- Success message
PRINT 'Canyon Ranch database has been populated with sample data.';
GO 