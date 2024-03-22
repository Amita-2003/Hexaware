CREATE DATABASE Hospital_Management;
USE Hospital_Management;

CREATE TABLE Patient (
    patientId INT PRIMARY KEY IDENTITY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    dateOfBirth DATE,
    gender VARCHAR(1),
    contactNumber VARCHAR(15),
    address VARCHAR(255)
);

CREATE TABLE Doctor (
    doctorId INT PRIMARY KEY IDENTITY,
    firstName VARCHAR(255),
    lastName VARCHAR(255),
    specialization VARCHAR(255),
    contactNumber VARCHAR(15)
);

CREATE TABLE Appointment (
    appointmentId INT PRIMARY KEY IDENTITY,
    patientId INT,
    doctorId INT,
    appointmentDate DATETIME,
    description TEXT,
    FOREIGN KEY (patientId) REFERENCES Patient(patientId),
    FOREIGN KEY (doctorId) REFERENCES Doctor(doctorId)
);
SET IDENTITY_INSERT Patient ON;

INSERT INTO Patient (patientId, firstName, lastName, dateOfBirth, gender, contactNumber, address)
VALUES
    (1, 'John', 'Doe', '1980-01-01', 'M', '1234567890', '123 Main St'),
    (2, 'Jane', 'Smith', '1985-05-15', 'F', '9876543210', '456 Elm St'),
    (3, 'Michael', 'Johnson', '1976-09-22', 'M', '5551234567', '789 Oak Ave'),
    (4, 'Emily', 'Brown', '1990-03-10', 'F', '5559876543', '101 Maple St'),
    (5, 'William', 'Wilson', '1982-07-08', 'M', '5552223333', '222 Pine St'),
    (6, 'Amanda', 'Taylor', '1988-11-30', 'F', '5554445555', '333 Cedar St'),
    (7, 'James', 'Anderson', '1975-04-18', 'M', '5556667777', '444 Birch St'),
    (8, 'Sarah', 'Martinez', '1995-06-25', 'F', '5558889999', '555 Willow St'),
    (9, 'Matthew', 'Hernandez', '1983-02-14', 'M', '5551112222', '666 Oak St'),
    (10, 'Jennifer', 'Garcia', '1978-08-20', 'F', '5553334444', '777 Elm St'),
    (11, 'Daniel', 'Lopez', '1986-12-05', 'M', '5555556666', '888 Maple St'),
    (12, 'Jessica', 'Gonzalez', '1992-01-03', 'F', '5557778888', '999 Pine St'),
    (13, 'David', 'Perez', '1980-05-27', 'M', '5559990000', '123 Oak Ave'),
    (14, 'Ashley', 'Rodriguez', '1977-10-12', 'F', '5551112222', '234 Cedar St'),
    (15, 'Christopher', 'Miller', '1984-03-08', 'M', '5553334444', '345 Birch St'),
    (16, 'Brittany', 'Gomez', '1990-07-15', 'F', '5555556666', '456 Willow St'),
    (17, 'Andrew', 'Jackson', '1973-11-28', 'M', '5557778888', '567 Oak St'),
    (18, 'Stephanie', 'Hill', '1989-01-17', 'F', '5559990000', '678 Elm St'),
    (19, 'Joshua', 'Campbell', '1981-04-20', 'M', '5551112222', '789 Maple St'),
    (20, 'Nicole', 'Young', '1996-09-01', 'F', '5553334444', '890 Pine St'),
    (21, 'Ryan', 'Evans', '1976-02-11', 'M', '5555556666', '901 Oak Ave'),
    (22, 'Lauren', 'King', '1987-08-05', 'F', '5557778888', '012 Cedar St'),
    (23, 'Justin', 'Wright', '1993-12-07', 'M', '5559990000', '123 Birch St'),
    (24, 'Megan', 'Scott', '1982-06-14', 'F', '5551112222', '234 Willow St'),
    (25, 'Brandon', 'Diaz', '1979-10-29', 'M', '5553334444', '345 Oak St'),
    (26, 'Kayla', 'Hill', '1991-04-03', 'F', '5555556666', '456 Elm St'),
    (27, 'Eric', 'Baker', '1985-08-17', 'M', '5557778888', '567 Maple St'),
    (28, 'Samantha', 'Carter', '1974-01-22', 'F', '5559990000', '678 Pine St'),
    (29, 'Joseph', 'Morris', '1988-05-09', 'M', '5551112222', '789 Oak Ave'),
    (30, 'Melissa', 'Watson', '1994-09-18', 'F', '5553334444', '890 Cedar St');

	SET IDENTITY_INSERT Patient OFF;

	SET IDENTITY_INSERT Doctor ON;

INSERT INTO Doctor (doctorId, firstName, lastName, specialization, contactNumber)
VALUES
    (1, 'Dr. Smith', 'Smithson', 'Cardiologist', '5551234567'),
    (2, 'Dr. Johnson', 'Johnsonson', 'Neurologist', '5559876543'),
    (3, 'Dr. Williams', 'Williamson', 'Dermatologist', '5551112222'),
    (4, 'Dr. Brown', 'Browner', 'Endocrinologist', '5553334444'),
    (5, 'Dr. Jones', 'Joneson', 'Gastroenterologist', '5555556666'),
    (6, 'Dr. Davis', 'Davison', 'Hematologist', '5557778888'),
    (7, 'Dr. Miller', 'Millerson', 'Nephrologist', '5559990000'),
    (8, 'Dr. Wilson', 'Wilsonson', 'Oncologist', '5552223333'),
    (9, 'Dr. Moore', 'Moorer', 'Ophthalmologist', '5554445555'),
    (10, 'Dr. Taylor', 'Taylorson', 'Orthopedic Surgeon', '5556667777'),
    (11, 'Dr. Anderson', 'Andersonson', 'Pediatrician', '5558889999'),
    (12, 'Dr. Thomas', 'Thomason', 'Psychiatrist', '5551212121'),
    (13, 'Dr. Jackson', 'Jacksonson', 'Pulmonologist', '5553434343'),
    (14, 'Dr. White', 'Whiterson', 'Radiologist', '5555656565'),
    (15, 'Dr. Harris', 'Harrison', 'Rheumatologist', '5557878787'),
    (16, 'Dr. Martin', 'Martinson', 'Urologist', '5559898989'),
    (17, 'Dr. Garcia', 'Garcia', 'Allergist', '5551112233'),
    (18, 'Dr. Martinez', 'Martinezson', 'Anesthesiologist', '5552323232'),
    (19, 'Dr. Robinson', 'Robinsson', 'Dentist', '5554545454'),
    (20, 'Dr. Clark', 'Clarkson', 'Dermatologist', '5556767676'),
    (21, 'Dr. Rodriguez', 'Rodriguez', 'Endocrinologist', '5557878787'),
    (22, 'Dr. Lewis', 'Lewison', 'Gastroenterologist', '5558989898'),
    (23, 'Dr. Lee', 'Leeson', 'Hematologist', '5551212121'),
    (24, 'Dr. Walker', 'Walkerson', 'Nephrologist', '5552323232'),
    (25, 'Dr. Hall', 'Hallson', 'Oncologist', '5553434343'),
    (26, 'Dr. Allen', 'Allenson', 'Ophthalmologist', '5554545454'),
    (27, 'Dr. Young', 'Youngson', 'Orthopedic Surgeon', '5555656565'),
    (28, 'Dr. Hernandez', 'Hernandezson', 'Pediatrician', '5556767676'),
    (29, 'Dr. King', 'Kingson', 'Psychiatrist', '5557878787'),
    (30, 'Dr. Wright', 'Wrightson', 'Pulmonologist', '5558989898');

    SET IDENTITY_INSERT Doctor OFF;

	SET IDENTITY_INSERT Appointment ON;

INSERT INTO Appointment (appointmentId, patientId, doctorId, appointmentDate, description)
VALUES
    (1, 1, 1, '2024-03-20 09:00:00', 'Routine checkup'),
    (2, 2, 2, '2024-03-21 10:00:00', 'Follow-up appointment'),
    (3, 3, 3, '2024-03-22 11:00:00', 'Annual physical exam'),
    (4, 4, 4, '2024-03-23 12:00:00', 'Diabetes consultation'),
    (5, 5, 5, '2024-03-24 13:00:00', 'Colonoscopy'),
    (6, 6, 6, '2024-03-25 14:00:00', 'Blood transfusion'),
    (7, 7, 7, '2024-03-26 15:00:00', 'Kidney biopsy'),
    (8, 8, 8, '2024-03-27 16:00:00', 'Chemotherapy session'),
    (9, 9, 9, '2024-03-28 17:00:00', 'Eye surgery'),
    (10, 10, 10, '2024-03-29 18:00:00', 'Knee replacement'),
    (11, 11, 11, '2024-03-30 19:00:00', 'Pediatric checkup'),
    (12, 12, 12, '2024-03-31 20:00:00', 'Psychiatric evaluation'),
    (13, 13, 13, '2024-04-01 09:00:00', 'Lung function test'),
    (14, 14, 14, '2024-04-02 10:00:00', 'MRI scan'),
    (15, 15, 15, '2024-04-03 11:00:00', 'Arthritis treatment'),
    (16, 16, 16, '2024-04-04 12:00:00', 'Prostate exam'),
    (17, 17, 17, '2024-04-05 13:00:00', 'Allergy testing'),
    (18, 18, 18, '2024-04-06 14:00:00', 'Anesthesia consultation'),
    (19, 19, 19, '2024-04-07 15:00:00', 'Dental cleaning'),
    (20, 20, 20, '2024-04-08 16:00:00', 'Skin biopsy'),
    (21, 21, 21, '2024-04-09 17:00:00', 'Hormone therapy'),
    (22, 22, 22, '2024-04-10 18:00:00', 'Colonoscopy follow-up'),
    (23, 23, 23, '2024-04-11 19:00:00', 'Physical therapy session'),
    (24, 24, 24, '2024-04-12 20:00:00', 'X-ray'),
    (25, 25, 25, '2024-04-13 09:00:00', 'Hemodialysis'),
    (26, 26, 26, '2024-04-14 10:00:00', 'Urology consultation'),
    (27, 27, 27, '2024-04-15 11:00:00', 'Cataract surgery'),
    (28, 28, 28, '2024-04-16 12:00:00', 'Ultrasound'),
    (29, 29, 29, '2024-04-17 13:00:00', 'Gynecological exam'),
    (30, 30, 30, '2024-04-18 14:00:00', 'Physical examination');

	SET IDENTITY_INSERT Appointment OFF;

	SELECT * FROM Appointment WHERE appointmentId = 2;

