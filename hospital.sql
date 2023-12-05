-- -------- Hospital Management System -----------------
---------------------------------------------------------

create database HospitalManagementSystem;
use HospitalManagementSystem;

create table patient(
PatientID VARCHAR(10) PRIMARY KEY,
FirstName VARCHAR(25) NOT NULL,
LastName VARCHAR(25) NOT NULL,
Disease VARCHAR(25) NOT NULL,
DateOfRegistration DateTime NOT NULL,
Gender VARCHAR(25) NOT NULL,
Email VARCHAR(30) UNIQUE NOT NULL,
Phone VARCHAR(25) NOT NULL
);
INSERT INTO patient (PatientID,FirstName,LastName,Disease,DateOfRegistration,Gender,
Email,Phone) VALUES
('S101','John', 'Doe','fever','2000-10-10','M', 'john@example.com','9878457945'),
('S102','Jane', 'Smith','Pneumonia','2013-08-08','M', 'jane@example.com','9977457745');

CREATE TABLE doctor (
doctorID VARCHAR(10) PRIMARY KEY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30),
specilization varchar(30)

);

INSERT INTO doctor (doctorID ,FirstName,LastName,specilization) VALUES
('I101','Sunil','Rawat','Neurologist'),
('I102','Nida','Fatima','Physician'),
('I103','Shiv','Kumar','ENT');

CREATE TABLE reception (
bookingID VARCHAR(10) PRIMARY KEY,
Bookingtime time,
Price VARCHAR(10)
);

CREATE TABLE adimn (
userid varchar(25) primary key,
userpwd varchar(25));

drop table reception;

INSERT INTO reception (bookingID, Bookingtime, Price)
VALUES (101, '12:34:02', 700),
       (102, '10:44:02', 500),
       (103, '02:04:02', 900);

select * from reception;
select * from doctor;
select * from patient;

ALTER TABLE patient
ADD COLUMN DoctorID VARCHAR(10),
ADD FOREIGN KEY (DoctorID) REFERENCES doctor(doctorID);

ALTER TABLE patient
ADD COLUMN BookingID VARCHAR(10),
ADD FOREIGN KEY (BookingID) REFERENCES reception(bookingID);

ALTER TABLE doctor
ADD COLUMN BookingID VARCHAR(10),
ADD FOREIGN KEY (BookingID) REFERENCES reception(bookingID);


CREATE USER 'your_username'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON your_database_name.* TO 'your_username'@'localhost';
FLUSH PRIVILEGES;

