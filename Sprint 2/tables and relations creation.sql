-- the vehicle rental system (vrc) database creation
--CREATE DATABASE vrc 
-- using the vrc database as a parent database
USE vrc
--creation of the rental location table
CREATE TABLE rental_Location
(
	pin_number varchar(10)PRIMARY KEY,
	gps_loc VARCHAR(20) NOT NULL
)
-- creating the vehicle data table
CREATE TABLE Vehicle
(
	id INT PRIMARY KEY IDENTITY,
	owned VARCHAR(6) NOT NULL,
	v_status VARCHAR(14) DEFAULT 'available',
	rate DECIMAL(4,2) NOT NULL,
	class VARCHAR(20) NOT NULL,
	brand VARCHAR(20) NOT NULL,
	model VARCHAR(20) NOT NULL,
	current_milage INT NOT NULL,
	gps_loc VARCHAR(20) NOT NULL,
	loc varchar(10)
	FOREIGN KEY(loc) REFERENCES rental_location ON	DELETE set null ON UPDATE CASCADE 
)
-- creation of the motorcycle subclass
CREATE TABLE motorcycle
(
	id INT ,
	motor decimal(4,1) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES vehicle ON DELETE CASCADE ON UPDATE CASCADE
)
-- creation of the scooter subclass
CREATE TABLE scooter
(
id INT ,
battery DECIMAL(4,1) NOT NULL check(battery between 0.0 and 100.0),
PRIMARY KEY(id),
FOREIGN KEY(id) REFERENCES vehicle ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the customer table
CREATE TABLE Customer
(
ssn VARCHAR(14) PRIMARY KEY,
customer_name VARCHAR(25) NOT NULL,
customer_email VARCHAR(50) UNIQUE NOT NULL,
customer_address VARCHAR(40) NOT NULL,
customer_password VARCHAR(20) NOT NULL
)
--creation of the customerphone table (multi value)
CREATE TABLE Customer_Phone
(
ssn varchar(14), 
phone varchar(11) NOT NULL-- egyptian standard
PRIMARY KEY (ssn,phone),
FOREIGN KEY (ssn) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the vehicle rating table
CREATE TABLE Vehicle_Rating
(
vehicle INT,
Customer VARCHAR(14),
rating INT NOT NULL
PRIMARY KEY(vehicle,Customer),
FOREIGN KEY (vehicle) REFERENCES vehicle ON	DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Customer) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the payment type table
CREATE TABLE Payment_Type
(
	Customer VARCHAR(14),
	Number varchar(16) NOT NULL
	PRIMARY KEY (Customer,Number),
	FOREIGN KEY (Customer) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the credit table 
CREATE TABLE Credit
(
	Customer VARCHAR(14) ,
	Number varchar(16),
	cvv varchar(3) NOT NULL CHECK(cvv BETWEEN 0 AND 999),
	expire datetime NOT NULL 
	PRIMARY KEY(Customer,Number),
	FOREIGN KEY (Customer,number) REFERENCES Payment_Type ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the Payment_Info table 
CREATE TABLE Payment_Info
(
	P_Id INT PRIMARY KEY IDENTITY,
	P_Value decimal(8,3) NOT NULL,
	Exp_Date DATETIME NOT NULL,
	Customer VARCHAR(14)
	FOREIGN KEY (Customer) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the Insurance table
CREATE TABLE Insurance
(
	Insurance_Number varchar(15) PRIMARY KEY,
	rate decimal(4,1) NOT NULL,
)
--creation of the Basic_Insurance table
CREATE TABLE Basic_Insurance
(
	Insurance_Number varchar(15) PRIMARY KEY,
	FOREIGN KEY(Insurance_Number) REFERENCES Insurance ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the Advanced_Insurance table
CREATE TABLE Advanced_Insurance
(
	Insurance_Number varchar(15) PRIMARY KEY,
	iability_amount DECIMAL(5,2) NOT NULL
	FOREIGN KEY(Insurance_Number) REFERENCES Insurance ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the Premium_Insurance table
CREATE TABLE Premium_Insurance
(
	Insurance_Number varchar(15)PRIMARY KEY,
	FOREIGN KEY(Insurance_Number) REFERENCES Insurance ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the employee table
CREATE TABLE Employee
(
	ssn VARCHAR(14) PRIMARY KEY ,
	employee_name VARCHAR(25) NOT NULL, 
	employee_email VARCHAR(50) NOT NULL UNIQUE,
	employee_address VARCHAR(40) NOT NULL,
	employee_password VARCHAR(20) NOT NULL,
	Hours_Per_Week INT NOT NULL
)
--creation of the Accident table
CREATE TABLE Accident
(
	Id INT PRIMARY KEY IDENTITY,
	Accident_Description VARCHAR(100) NOT NULL,
)
--creation of the extra table 
CREATE TABLE Extra
(
	id INT PRIMARY KEY IDENTITY ,
	extra_type VARCHAR(15) NOT NULL,
	rate DECIMAL(4,2) NOT NULL,
	Rented_By VARCHAR(14) default null
	FOREIGN KEY(Rented_By) REFERENCES Customer ON DELETE SET NULL ON UPDATE CASCADE
)


--creation of the Rents_for_time relationship
CREATE TABLE Rents_for_time
(
	Vehicle INT,
	Insurance varchar(15),
	Customer VARCHAR(14),
	Rent_Time decimal(4,2),
	destination VARCHAR(40)
	PRIMARY KEY (Vehicle,Insurance,Customer),
	FOREIGN KEY(Vehicle) REFERENCES Vehicle ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Insurance) REFERENCES Insurance ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Customer) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the Accident_Info relationship
CREATE TABLE Accident_Info
(
	accident_id INT PRIMARY KEY,
	Vehicle INT,
	Customer VARCHAR(14)
	FOREIGN KEY(accident_id) REFERENCES accident ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Customer) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Vehicle) REFERENCES Vehicle ON DELETE CASCADE ON UPDATE CASCADE,
)
--creation of the Accident_Info relationship
CREATE TABLE Responsible_Insurance
(
	Insurance varchar(15),
	Accident INT,
	Bill decimal(10,4),
	Number_Of_Installements INT
	PRIMARY KEY (Insurance,Accident),
	FOREIGN KEY(Insurance) REFERENCES Insurance ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Accident) REFERENCES Accident ON DELETE CASCADE ON UPDATE CASCADE
)
--creation of the Gift_Card relationship
CREATE TABLE Gift_Card
(
	Customer VARCHAR(14) PRIMARY KEY,
	Employee VARCHAR(14),
	Amount decimal(5,2)
	FOREIGN KEY(Customer) REFERENCES Customer ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY(Employee) REFERENCES Employee ON DELETE SET NULL ON UPDATE CASCADE
)
