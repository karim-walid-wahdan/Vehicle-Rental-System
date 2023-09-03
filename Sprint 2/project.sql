-- the vehicle rental system (vrc) database creation
CREATE DATABASE vrc 
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
	P_Value decimal(6,3) NOT NULL,
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
	Rented_By VARCHAR(14)
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
--INSERATIONS
INSERT INTO Rental_Location 
	(pin_number,gps_loc) 
	VALUES 
		('0000','alexander platz'),
		('0001','potsdamer platz'),
		('0002','wedding'),
		('0003','spandau'),
		('0004','nauen')
INSERT INTO Vehicle
	(owned,v_status,rate,class,brand,model,current_milage,gps_loc,loc) 
	VALUES 
		('owned','available',10.2,'2-wheel','Honda','CB 750F',10000,'alexander platz','0000'),
		('leased','rented',13.75,'3-wheel','Yamaha','YZF-R1M',12323,'potsdamer platz',null),
		('owned','in maintenance',10,'2-wheel','Suzuki','GSX1100S',1000,'wedding',null),
		('leased','available',25,'3-wheel','Ducati','Panigale S',0,'spandau','0002'),
		('owned','rented',99.99,'2-wheel','Triumph','Bonneville T100',120,'nauen',null),
		('leased','available',53.4,'2-wheel','Kawasaki','Ninja H2R',14368,'hermann straße','0002'),
		('owned','available',34.7,'3-wheel',' Unagi','Model One',120,'alexander platz','0000'),
		('leased','rented',23.9,'2-wheel',' Segway','Kickscooter Max',150,'potsdamer platz',null),
		('owned','in maintenance',12.25,'2-wheel','Swagtron','Swagger 5 Elite',0,'wedding',null),
		('leased','available',19.89,'2-wheel','Glion','Dolly',500,'spandau','0003'),
		('owned','rented',13.7,'2-wheel','Apollo','Explore',430,'nauen',null),
		('leased','available',15,'2-wheel','GoTrax','XR Ultra',204,'hermann straße','0003'),
		('owned','available',23.34,'2-wheel','Honda','CB 750F',3241,'alexander platz','0004'),
		('leased','rented',22,'2-wheel','Yamaha','YZF-R1M',190,'potsdamer platz',null),
		('owned','in maintenance',22.06,'2-wheel','Suzuki','GSX1100S',6421,'wedding',null),
		('leased','available',26.11,'2-wheel','Ducati','Panigale S',9876,'spandau','0002'),
		('owned','rented',20.7,'3-wheel','Swagtron','Swagger 5 Elite',1000,'nauen',null),
		('leased','available',20.04,'2-wheel',' Glion','Dolly',1543,'hermann straße','0000'),
		('owned','available',19.38,'2-wheel','Apollo','Explore',3211,'alexander platz','0002'),
		('leased','rented',18.72,'2-wheel','GoTrax','XR Ultra',876544,'potsdamer platz',null)
INSERT INTO  Motorcycle
	(id,motor) 
	VALUES
		(1,19.2),
		(2,99.34),
		(3,0),
		(4,20.1),
		(5,99.99),
		(6,13.7),
		(13,18),
		(14,47.35),
		(15,87.43),
		(16,92)
INSERT INTO Scooter
	(id,battery)
	VALUES
		(7,100),
		(8,69.4),
		(9,54.4),
		(10,12.3),
		(11,0),
		(12,35),
		(17,78),
		(18,65),
		(19,43),
		(20,98)
INSERT INTO Customer
	(ssn,customer_name,customer_email,customer_address,customer_password)
	VALUES
		('469-94-3991','Noah Dietfried','fatetmpwesqm@gmail.com','Kriemhildstraße 26, 90559 Berlin','_WY,!m(8q29;+C:y2@F'),
		('041-03-4670','Henrike Marlen','koletmpn57xm@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud'),
		('417-58-0890','Leberecht Ilka','thoasforbstmp@gmail.com','Schlottertal 28,Berlin','C@V{m)~`N7Aq67+(t6f'),
		('449-22-6392','Louisa Ella','leahtmp@gmail.com','Kirchgasse 31, 96123 Berlin','*Xj57@:-!;4(~Jsg&E:'),
		('222-92-7807','Dagmar Erwin','walktmphtwbd@gmail.com','Diener 17, 74229 Berlin','n$-+~L#Lq8*8"a6~GCw'),
		('252-49-6099','Uta Arnd','keantmpu28jg@gmail.com','Jahnstraße 18, 86830 Berlin','12345678'),
		('527-41-5568','Luitgard Helene','miyatmpvc7p3@gmail.com','Eschenweg 31, 15732 Berlin','password'),
		('232-66-5875','Annegret Sören','marltmp@gmail.com','Hauptstraße 12, 97846 Berlin','p@§§w0rD'),
		('506-47-4524','Gottschalk Gerda','domin.kwlfetmp@gmail.com','Alte Straße 32, 14542 Berlin','Gottschalk@Gerda'),
		('430-55-5820','Luitgard Torben','t.helastofustmp@gmail.com','Dr.-Zinn-Straße 17, 91126 Berlin','locked')
INSERT INTO Customer_Phone
	(ssn,phone)
	VALUES
		('469-94-3991','01589541782'),
		('041-03-4670','01190639933'),
		('417-58-0890','01111498304'),
		('449-22-6392','01030594088'),
		('252-49-6099','01529272504'),
		('506-47-4524','01007151076'),
		('232-66-5875','01546620938'),
		('506-47-4524','01293899309'),
		('527-41-5568','01080374363'),
		('449-22-6392','01090932271'),
		('506-47-4524','01195452245'),
		('430-55-5820','01507269133')
INSERT INTO  Vehicle_Rating
	(vehicle,customer,rating)
	VALUES
		(3,'469-94-3991',10),
		(17,'041-03-4670',8),
		(20,'417-58-0890',5),
		(1,'449-22-6392',3),
		(18,'222-92-7807',7),
		(20,'252-49-6099',6),
		(16,'527-41-5568',9),
		(14,'232-66-5875',7),
		(19,'506-47-4524',3),
		(13,'430-55-5820',2),
		(17,'527-41-5568',1),
		(3,'232-66-5875',0),
		(17,'506-47-4524',10),
		(15,'430-55-5820',9),
		(8,'469-94-3991',6),
		(5,'041-03-4670',7),
		(3,'417-58-0890',5),
		(1,'430-55-5820',8),
		(2,'527-41-5568',9),
		(10,'232-66-5875',10)
INSERT INTO Payment_Type
	(customer,number)
	VALUES
		('449-22-6392','4024007161645733'),
		('222-92-7807','4539946409665730'),
		('252-49-6099','4916393309009532'),
		('252-49-6099','4716179496730598'),
		('430-55-5820','4929027505587991'),
		('449-22-6392','5506134414613054'),
		('527-41-5568','5389325485314018'),
		('430-55-5820','5531898765306984'),
		('449-22-6392','5354047556115956'),
		('232-66-5875','5490706461517912')
INSERT INTO  Credit
(Customer,Number,cvv,expire)
VALUES
('449-22-6392','4024007161645733','555','2022-10-01'),
('222-92-7807','4539946409665730','431','2024-12-01'),
('252-49-6099','4916393309009532','132','2023-09-01'),
('252-49-6099','4716179496730598','867','2025-01-01'),
('430-55-5820','4929027505587991','583','2022-06-01'),
('449-22-6392','5506134414613054','319','2022-12-01'),
('527-41-5568','5389325485314018','423','2024-11-01'),
('430-55-5820','5531898765306984','143','2022-07-01'),
('449-22-6392','5354047556115956','98','2023-08-01'),
('232-66-5875','5490706461517912','109','2022-02-01')
INSERT INTO Insurance
	(Insurance_Number,rate)
	VALUES
		('1',11),
		('2',21),
		('3',31),
		('4',12),
		('5',22),
		('6',32),
		('7',13),
		('8',21),
		('9',31),
		('10',12),
		('11',13),
		('12',24)
INSERT INTO Basic_Insurance
	(Insurance_Number) 
	VALUES
		('1'),
		('3'),
		('5'),
		('7')
INSERT INTO Advanced_Insurance
	(Insurance_Number,iability_amount) 
	VALUES
		('2',100.92),
		('4',89.2),
		('6',400),
		('7',230)
INSERT INTO Premium_Insurance
	(Insurance_Number)
	VALUES
		('8'),
		('9'),
		('10'),
		('11'),
		('12')
INSERT INTO Employee
	(ssn,employee_address,Hours_Per_Week,employee_email,employee_name,employee_password) 
	VALUES
		('441-72-5125','Akazienweg 10, 72138 Berlin, Germany',8,'blazewalterstmp@gmail.com','Ortrun Walther','`x]}$M2Wn7Q(5s&<'),
		('304-23-0037','Platanenallee 33, 15738 Berlin, Germany',20,'colytmpli3nj@gmail.com','Bernd Agnes','DJ6FZ${U?6uwpV5N'),
		('363-70-7654','Am Wald 31, 84175 Berlin, Germany',45,'navytmpcrkzv@gmail.com','Merten Kasimira','9`Bgfn/[R3!z.(4}'),
		('519-31-5990','Baaderstraße 28, 82515 Berlin, Germany',4,'pulltmp+2pxbn@gmail.com','Anita Bernhard','.Y&B?9qnT,kG]B=='),
		('050-42-6611','Thalhamerstraße 9, 83714 Berlin, Germany',17,'jonathanfulltmp@gmail.com','Lene Karl-Heinz','12345678')
INSERT INTO Accident  
	(Accident_Description) 
	VALUES
		('Lorem ipsum dolor sit amet'),
		('Lorem ipsum dolor sit amet'),
		('Lorem ipsum dolor sit amet'),
		('Lorem ipsum dolor sit amet'),
		('Lorem ipsum dolor sit amet'),
		('Lorem ipsum dolor sit amet'),
		('Lorem ipsum dolor sit amet')
INSERT INTO Extra  
	(extra_type ,rate ,Rented_By)
	VALUES
		('helmet',8.5,'469-94-3991'),
		('gloves',6.5,'041-03-4670'),
		('elbow',0.5,NULL),
		('knee',8.5,'417-58-0890'),
		('shoes',8.5,NULL)
INSERT INTO Rents_for_time   
	(Vehicle ,Insurance ,Customer ,Rent_Time ,destination)
	VALUES
		(1,1,'469-94-3991',1.23	,'alexander platz'),
		(2,2,'041-03-4670',2.5,'potsdamer platz'),
		(3,3,'417-58-0890',	3.75,'wedding'),
		(4,4,'449-22-6392',1,'spandau'),
		(5,5,'222-92-7807',0.5,'potsdamer platz'),
		(6,6,'252-49-6099',	34.89,'wedding'),
		(7,7,'527-41-5568',99.99,'spandau'),
		(8,8,'232-66-5875',0.01,'alt tegel'),
		(9,9,'469-94-3991',12.4,'mittte'),
		(10,10,'430-55-5820',32.5,	'spandau'),
		(11,5,'449-22-6392',9.5	,'potsdamer platz'),
		(12,12,'222-92-7807',4.74,'wedding'),
		(13,3,'252-49-6099',12.3,'spandau'),
		(7,4,'527-41-5568',89.7,'alt tegel'),
		(10,5,'232-66-5875',10.8,'mittte'),
		(16	,2,'252-49-6099',2.8,'spandau'),
		(17,3,'527-41-5568',5.8,'wedding'),
		(10	,4,'232-66-5875',4.6,'spandau'),
		(19,5,'232-66-5875',10,'alt tegel'),
		(20,6,'252-49-6099',3,'alexander platz')
INSERT INTO Accident_Info
	(accident_id ,Vehicle ,Customer)
	VALUES
		(1,5,'469-94-3991'),
		(2,6,'041-03-4670'),
		(3,7,'417-58-0890'),
		(4,8,'469-94-3991'),
		(5,9,'222-92-7807'),
		(6,6,'252-49-6099'),
		(7,9,'469-94-3991')
INSERT INTO Responsible_Insurance 
	(Insurance,Accident,Bill,Number_Of_Installements)
	VALUES
		('1',1,4000,6),
		('2',2,1234.56,7),
		('8',3,6543.21,2),
		('3',4,5678.43,1),
		('4',5,2210.67,4),
		('9',6,6789.02,5),
		('5',7,18976.5,3)
INSERT INTO Gift_Card  
	(customer,employee,amount)
	VALUES
		('041-03-4670','441-72-5125',12.5),
		('417-58-0890','304-23-0037',20),
		('449-22-6392','363-70-7654',10)
--SELECTIONS
--RENTAL LOCATION
SELECT *
	FROM rental_Location 
--VEHICLE
SELECT *
	FROM Vehicle
--MOTORCYCLE
SELECT * 
	FROM motorcycle
--SCOOTER
SELECT * 
	FROM scooter
--CUSTOMER
SELECT *
	FROM Customer
--CUSTOMER_PHONE
SELECT *
	FROM Customer_Phone
--Vehicle_Rating
SELECT *
	FROM Vehicle_Rating
--Payment_Type
SELECT *
	FROM Payment_Type
--Insurance
SELECT *
	FROM Insurance
--Basic_Insurance
SELECT *
	FROM Basic_Insurance
--Advanced_Insurance
SELECT *
	FROM Advanced_Insurance
--Premium_Insurance
SELECT *
	FROM Premium_Insurance
--Employee
SELECT *
	FROM Employee
--Accident
SELECT *
	FROM Accident
--Rents_for_time
SELECT *
	FROM Rents_for_time
--Accident_Info
SELECT *
	FROM Accident_Info
--Responsible_Insurance
SELECT *
	FROM Responsible_Insurance
--Extra
SELECT *
	FROM Extra
--Gift_Card
SELECT *
	FROM Gift_Card
-- PART 1
GO
CREATE PROC CustomerRegister 
	@ssn VARCHAR(14),
	@name VARCHAR(25),
	@email VARCHAR(50),
	@address VARCHAR(40),
	@password VARCHAR(20)
	AS
		BEGIN
			DECLARE @ssn_check VARCHAR(14)
			DECLARE @email_check VARCHAR(50)

			SELECT @ssn_check = ssn
				FROM Customer
				WHERE ssn =@ssn 
			SELECT @email_check = customer_email
				FROM Customer
				WHERE customer_email =@email
					
			IF(@ssn_check IS NOT NULL OR @email_check IS NOT NULL)
				BEGIN
					print 'this customer is already registered'
					RETURN
				END
			INSERT INTO Customer 
				(ssn,customer_name,customer_email,customer_address,customer_password)  
				VALUES 
					(@ssn,@name,@email,@address,@password);
		END
GO
CREATE PROC EmployeeRegister
	@ssn VARCHAR(14), 
	@name VARCHAR(25), 
	@email VARCHAR(50),
	@address VARCHAR(40),
	@password VARCHAR(20), 
	@hours_per_week INT
	AS
		BEGIN
			DECLARE @ssn_check VARCHAR(14)
			DECLARE @email_check VARCHAR(50)

			SELECT @ssn_check = ssn
				FROM Employee
				WHERE ssn =@ssn 
			SELECT @email_check = employee_email
				FROM Employee
				WHERE employee_email =@email
					
			IF(@ssn_check IS NOT NULL OR @email_check IS NOT NULL)
				BEGIN
					print 'this employee is already registered'
					RETURN
				END
			INSERT INTO employee
				(ssn,employee_name,employee_email,employee_address,employee_password,Hours_Per_Week)	
				VALUES
				(@ssn,@name,@email,@address,@password,@hours_per_week);
		END
GO
CREATE PROC customerCout
	@count INT OUTPUT
	AS
		BEGIN
			SELECT @count=COUNT(*)
				FROM Customer
			PRINT @count
		END
GO
CREATE PROC vehicleCount
	@count INT OUTPUT
	AS
		BEGIN
			SELECT @count=COUNT(*)
				FROM Vehicle v
				where v.v_status = 'available'
			PRINT @count
		END
GO
CREATE PROC rentCount  
	@count INT OUTPUT
	AS
		BEGIN
			SELECT @count=COUNT(*)
				FROM Rents_for_time
			PRINT @count
		END
GO
--END OF PART 1	
--PART 2
CREATE PROC customerLogin 
	@ssn VARCHAR(14),
	@password VARCHAR(20),
	@Success_bit BIT OUTPUT 
	AS
		BEGIN
			SET @Success_bit =0 
			DECLARE @checked_password VARCHAR(20)
			SELECT @checked_password = customer_password
				FROM Customer 
				WHERE ssn =@ssn
			IF(@checked_password is null)
				BEGIN
					PRINT 'user not found please enter a valid ssn mate' 
					SET  @Success_bit =0
					PRINT @Success_bit 
					RETURN
				END
			ELSE 
			BEGIN
				IF(@checked_password = @password)
					BEGIN
						SET @Success_bit =  1
						PRINT @success_bit
						PRINT 'login approved mate'
					END
				ELSE 
					BEGIN
						SET  @Success_bit =0
						PRINT @Success_bit 
						PRINT 'incorrect  password please try again mate'
					END
			END
		END
GO
CREATE PROC ViewCustProfile 
	@ssn VARCHAR(14)
	AS
		BEGIN
			SELECT *
				FROM Customer
				WHERE ssn = @ssn
		END
GO
CREATE PROC UpdateCustProfile 
	@ssn VARCHAR(14),
	@name VARCHAR(25),
	@password VARCHAR(20),
	@email VARCHAR(50),
	@address VARCHAR(40),
	@Success_bit BIT OUTPUT
	AS
		BEGIN
			DECLARE @checked_password VARCHAR(20)
			SELECT @checked_password = customer_password
				FROM Customer 
				WHERE ssn =@ssn
			IF(@checked_password IS NULL)
				BEGIN
					PRINT 'can`t update a user that doesnot exist mate'
					SET  @Success_bit =0
					PRINT @Success_bit
					RETURN
				END
			ELSE 
				BEGIN	
					UPDATE CUSTOMER
						SET customer_name = @name, customer_email =@email,customer_address = @address ,customer_password = @password
						WHERE ssn = @ssn 
					SET @Success_bit =  1
					PRINT @Success_bit
				END
		END
GO
CREATE PROC addMobile
	@ssn VARCHAR(14),
	@phone_number VARCHAR(11)
	AS
		BEGIN
			DECLARE @customer_ssn VARCHAR(14)
			SELECT @customer_ssn = ssn
				FROM Customer
				WHERE ssn=@ssn
			IF(@customer_ssn IS NULL)
				BEGIN
					PRINT 'PLEASE ENTER A VALID SSN'
					RETURN
				END
			ELSE
				BEGIN
					INSERT INTO Customer_Phone 
						(ssn,phone) 
						VALUES 
						(@customer_ssn,@phone_number)
				END
		END
GO
CREATE PROC addOnlinePayment
	@ssn VARCHAR(14),
	@credit_card_number VARCHAR(16), 
	@cvv VARCHAR(3), 
	@expire DATETIME
	AS
		BEGIN
			DECLARE @customer_ssn VARCHAR(14)
			SELECT @customer_ssn = ssn
				FROM Customer
				WHERE ssn=@ssn
			IF(@customer_ssn IS NULL)
				BEGIN
					PRINT 'PLEASE ENTER A VALID SSN'
					RETURN
				END
			ELSE
				BEGIN
					INSERT INTO Payment_Type 
						(Customer,Number) 
						VALUES 
						(@customer_ssn,@credit_card_number)
				DECLARE @credit_number VARCHAR(16)
				SELECT @credit_number =Number
					FROM Payment_Type 
					WHERE Number = @credit_card_number
				INSERT INTO credit 
					(Customer,Number,cvv,expire)
					VALUES
					(@customer_ssn,@credit_number,@cvv,@expire)
			END
		END
GO
CREATE PROC viewVehicles 
	AS 
		BEGIN
			SELECT avg(vr.rating) AS 'average rating' ,v.id,v.model,v.brand,v.class,v.current_milage,v.gps_loc,v.loc,v.owned,v.rate
				FROM vehicle v inner join Vehicle_Rating vr ON v.id = vr.vehicle
				WHERE v.v_status = 'available'
				GROUP BY v.id,v.model,v.brand,v.class,v.current_milage,v.gps_loc,v.loc,v.owned,v.rate
		END
GO 
CREATE PROC viewInsurance
	AS 
		BEGIN
			SELECT *
				FROM Insurance I LEFT OUTER JOIN Advanced_Insurance AI ON i.Insurance_Number = ai.Insurance_Number 
		END
GO
CREATE PROC viewExtra
	AS 
		BEGIN
			SELECT * 
				FROM extra
				WHERE Rented_By IS NULL
		END
GO
CREATE PROC rentTime
	@vehicle INT,
	@insurance VARCHAR(15),
	@customer_ssn VARCHAR(14),
	@time DECIMAL(4,2),
	@destination VARCHAR(40)
	AS
		BEGIN
			DECLARE @vehicle_id INT 
			SELECT @vehicle_id = v.id
				FROM Vehicle v
				WHERE v.id = @vehicle
			IF( @vehicle_id is null)
				BEGIN
					PRINT 'invalid vehicle id'
					RETURN
				END
			DECLARE @insurance_id VARCHAR(15)
			SELECT @insurance_id = I.Insurance_Number
				FROM Insurance I
				WHERE I.Insurance_Number = @insurance
			IF( @insurance_id is null)
				BEGIN
					PRINT 'invalid insurance id'
					RETURN
				END
			DECLARE @customerSsn VARCHAR(14)
			SELECT @customerSsn = c.ssn
				FROM Customer c
				WHERE c.ssn = @customer_ssn
			IF( @customerSsn is null)
				BEGIN
					PRINT 'invalid customer ssn'
					RETURN
				END
			INSERT INTO Rents_for_time 
				(Vehicle,Insurance,Customer,Rent_Time,destination)	
				VALUES
				(@vehicle_id,@customerSsn,@insurance_id,@time,@destination)
			UPDATE Vehicle
				SET v_status = 'rented'
				WHERE id = @vehicle_id
		END
GO
CREATE PROC viewMyAccidents
	@customer_ssn VARCHAR(14)
	as 
		BEGIN
			DECLARE @ssn  VARCHAR(14)
			SELECT @ssn = c.ssn
				FROM Customer c
				WHERE c.ssn = @customer_ssn
			IF(@ssn is null)
				BEGIN
					PRINT 'please enter a valid ssn to view his/her accidents'
					RETURN
				END
			SELECT *
				FROM Accident_Info aI
				WHERE aI.Customer = @customer_ssn
		END
GO
CREATE PROC viewRemaningPayments
	@customer_ssn VARCHAR(14)
	AS
		BEGIN 
			DECLARE @ssn  VARCHAR(14)
			SELECT @ssn = c.ssn
				FROM Customer c
				WHERE c.ssn = @customer_ssn
			IF(@ssn is null)
				BEGIN
					PRINT 'please enter a valid ssn to view his/her pending payments'
					RETURN
				END 
			SELECT *
				FROM Payment_Info p
				WHERE p.Customer =@customer_ssn
		END
GO
CREATE PROC deleteCreditCard
	@customer_ssn VARCHAR(14),
	@credit_card_number VARCHAR(16)
	AS 
		BEGIN
			DECLARE @ssn  VARCHAR(14)
			SELECT @ssn = c.ssn
				FROM Customer c
				WHERE c.ssn = @customer_ssn
			IF(@ssn is null)
				BEGIN
					PRINT 'please enter a valid ssn'
					RETURN
				END 
			DECLARE @card_number  VARCHAR(16)
			SELECT @card_number  = pt.Number
				FROM Payment_Type pt
				WHERE pt.Customer = @customer_ssn AND pt.Number = @credit_card_number
			IF(@card_number  is null)
				BEGIN
					PRINT 'please enter a valid card number to be deleted'
					RETURN
				END 
			DELETE FROM Payment_Type 
			WHERE Payment_Type.Customer = @customer_ssn AND Payment_Type.Number = @credit_card_number
		END
GO
CREATE PROC searchForVehicles
	@location1 VARCHAR(20),
	@location2 VARCHAR(20),
	@location3 VARCHAR(20)
	AS
		BEGIN
			SELECT  v.* ,rl.gps_loc
				FROM Vehicle V inner join rental_Location rl ON v.loc = rl.pin_number 
				WHERE rl.gps_loc in (@location1,@location2,@location3)
				ORDER BY rl.gps_loc
		END
GO
CREATE PROC orderVehiclesByBrand
	AS 
		BEGIN
			SELECT *
				FROM Vehicle v 
				WHERE v.v_status = 'available' 
				ORDER BY brand
		END
GO
CREATE PROC orderVehiclesByClass
	AS 
		BEGIN
			SELECT *
				FROM Vehicle v 
				WHERE v.v_status = 'available'
				ORDER BY class
		END
GO
CREATE PROC orderVehiclesByRate
	AS 
		BEGIN
			SELECT *
			FROM Vehicle v 
			WHERE v.v_status = 'available' 
			ORDER BY rate
		END
GO
CREATE PROC countAccidentsPerInsurance
	AS 
		BEGIN 
			SELECT Insurance,COUNT(*) 
				FROM Responsible_Insurance
				GROUP BY Insurance
		END 
GO
CREATE PROC getNonRentedehicles
	AS
		BEGIN
			SELECT v.*
				FROM vehicle v LEFT OUTER JOIN Rents_for_time rft ON v.id =rft.Vehicle
				WHERE rft.Vehicle IS NULL
		END
GO
CREATE PROC viewInsurances
	AS
		BEGIN
			SELECT *
				FROM Insurance
				ORDER BY rate
		END
GO
--END OF PART 2	
--PART 3
CREATE PROC accidentSubmission
	@ssn VARCHAR(14),
	@vehicle INT, 
	@description VARCHAR(100)
	AS
		BEGIN
			INSERT INTO Accident
				(Accident_Description)	
				VALUES
				(@description)
			DECLARE @accident_id INT
			SELECT @accident_id = id
				FROM Accident
				WHERE Accident_Description = @description 

			DECLARE @customer_ssn VARCHAR(14)
			SELECT @customer_ssn = ssn
				FROM Customer
				WHERE ssn =@ssn
			IF(@customer_ssn is null)
				BEGIN
					PRINT('please enter a valid ssn')
					RETURN
				END
			DECLARE @vehicle_id INT
			SELECT @vehicle_id = id
				FROM Vehicle
				WHERE id =@vehicle
			IF(@vehicle is null)
				BEGIN
					PRINT('please enter a valid vehicle')
					RETURN
				END
			INSERT INTO Accident_Info
				(accident_id,Vehicle,Customer) 
				VALUES
				(@accident_id,@ssn,@vehicle)
		END
GO
CREATE PROC rentExtra
	@ssn VARCHAR(14),
	@id INT
	AS 
		BEGIN
			DECLARE @customer_ssn VARCHAR(14)
			SELECT @customer_ssn = ssn
				FROM Customer
				WHERE ssn =@ssn
			IF(@customer_ssn is null)
				BEGIN
					PRINT('please enter a valid ssn')
					RETURN
				END
			DECLARE @extra_id INT
			DECLARE @Rented_By VARCHAR(14)
			SELECT @extra_id= id , @Rented_By = Rented_By
				FROM extra
				WHERE id = @id
			IF(@extra_id is null or @Rented_By is not null)
				BEGIN
					PRINT('the extra id entered is either rented already or invalid ')
					RETURN
				END
			UPDATE extra 
				SET Rented_By =@Rented_By
				WHERE id =@id
		END
GO
CREATE PROC returnExtra
	@ssn VARCHAR(14),
	@id INT
	AS 
		BEGIN
		DECLARE @customer_ssn VARCHAR(14)
		SELECT @customer_ssn = ssn
			FROM Customer
			WHERE ssn =@ssn
		IF(@customer_ssn is null)
			BEGIN
				PRINT('please enter a valid ssn')
				RETURN
			END
		DECLARE @extra_id INT
		DECLARE @Rented_By VARCHAR(14)
		SELECT @extra_id= id , @Rented_By = Rented_By
			FROM extra
			WHERE id = @id
		IF(@extra_id is null or @Rented_By != @ssn)
			BEGIN
				PRINT('the extra id entered is either not rented by you or invalid ')
				RETURN
			END
		UPDATE extra 
		SET Rented_By  = NULL
		WHERE id =@id AND Rented_By = @ssn
	END
GO
CREATE PROC viewExtraOrdered
	AS 
		BEGIN
			SELECT *
				FROM extra 
				WHERE Rented_By is null
				ORDER BY rate DESC
		END
GO
CREATE PROC viewMinPerType
	AS 
		BEGIN
			SELECT extra_type,min(rate) 
				FROM extra
				WHERE Rented_By IS NULL
				GROUP BY extra_type
		END
GO
CREATE PROC numberOfRents
	@vehicle_id INT,
	@count INT OUTPUT
	AS
		BEGIN
			SELECT  @count= COUNT(*)
				FROM Rents_for_time
				WHERE Vehicle =@vehicle_id
		END
GO
CREATE PROC evaluateVehicle
	@customer_ssn VARCHAR(14), 
	@vehicle INT, 
	@rating INT
	AS
		BEGIN
			DECLARE @customerSsn VARCHAR(14)
			SELECT @customerSsn = c.ssn
			FROM Customer c
			WHERE c.ssn = @customer_ssn
			IF( @customerSsn is null)
				BEGIN
					PRINT 'invalid customer ssn'
					RETURN
				END
			DECLARE @vehicle_id INT 
			SELECT @vehicle_id = rft.Vehicle
				FROM Rents_for_time rft
				WHERE rft.Vehicle = @vehicle AND Customer = @customer_ssn
			IF( @vehicle_id IS NULL)
				BEGIN
					PRINT 'invalid rented vehicle'
					RETURN
				END
			INSERT INTO Vehicle_Rating
				(vehicle,Customer,rating) 
				VALUES
				(@vehicle, @customer_ssn,@rating)
		END
GO
CREATE PROC updateLocation
	@vehicle INT, 
	@vehicle_location VARCHAR(20),
	@success_bit BIT OUTPUT
	AS
		BEGIN
			DECLARE @vehicle_id INT 
				SELECT @vehicle_id = v.id
					FROM Vehicle v
					WHERE v.id = @vehicle
			IF( @vehicle_id IS NULL)
				BEGIN
					PRINT 'invalid vehicle'
					SET @success_bit =0
					PRINT @success_bit
					RETURN
				END
			UPDATE vehicle
				SET gps_loc = @vehicle_location
				WHERE id =@vehicle
			SET @success_bit =1
			PRINT @success_bit
		END
GO
CREATE PROC viewAverageRating
	@vehicle INT,
	@average DECIMAL(5,3) OUTPUT 
	AS
		BEGIN
			DECLARE @vehicle_id INT 
			SELECT @vehicle_id = v.id
				FROM Vehicle v
				WHERE v.id = @vehicle
			IF( @vehicle_id is null)
				BEGIN
					PRINT 'invalid vehicle'
					RETURN
				END
			SELECT @average =AVG(vr.rating)
				FROM Vehicle_Rating vr
				WHERE vr.vehicle = @vehicle
		END
GO
CREATE PROC viewAccidentsForCurrentVehicle
	@vehicle int
	AS
		BEGIN
			DECLARE @vehicle_id INT 
			SELECT @vehicle_id = v.id
				FROM Vehicle v
				WHERE v.id = @vehicle
			IF( @vehicle_id IS NULL)
				BEGIN
					print 'invalid vehicle'
					RETURN
				END
			SELECT *
				FROM Accident_Info ai INNER JOIN Accident a ON ai.accident_id =a.Id 
				WHERE ai.Vehicle =@vehicle
		END
GO
-- END OF PART 3
-- PART 4
CREATE PROC ViewEmpProfile 
	@ssn VARCHAR(14)
	AS
		BEGIN
			SELECT *
				FROM employee
				WHERE ssn = @ssn
		END
GO
CREATE PROC UpdateEmpProfil 
	@ssn VARCHAR(14),
	@name VARCHAR(25),
	@password VARCHAR(20),
	@email VARCHAR(50),
	@address VARCHAR(40),
	@hours_per_week INT,
	@Success_bit BIT OUTPUT
	AS
		BEGIN
			DECLARE @checked_password VARCHAR(20)
			SELECT @checked_password = employee_password
				FROM employee 
				WHERE ssn =@ssn
			IF(@checked_password IS NULL)
				BEGIN
					PRINT 'can`t update a user that doesnot exist mate'
					SET  @Success_bit =0
					PRINT @Success_bit
					RETURN
				END
			ELSE 
				BEGIN
					IF(@checked_password = @password)
						BEGIN
							UPDATE employee
								SET employee_name = @name, employee_email =@email,employee_address = @address ,employee_password = @password,Hours_Per_Week = @hours_per_week
								WHERE ssn = @ssn and employee_password = @password
							SET @Success_bit =  1
							PRINT @Success_bit
						END
					ELSE
						BEGIN
							SET  @Success_bit =0
							PRINT 'incorrect old password please try again mate'
							PRINT @Success_bit
							RETURN
						END
				END
		END
GO
CREATE PROC AddExtra
	@type VARCHAR(15), 
	@rate DECIMAL(4,2)
	AS
		BEGIN
			INSERT INTO extra
				(extra_type, rate) 
				VALUES
				(@type,@rate)
		END
GO 
CREATE PROC viewVehiclesAvailable
	AS
		BEGIN
			SELECT *
				FROM Vehicle v
				WHERE v.v_status = 'available'
		END
GO
CREATE PROC ProvideGift 
	@customer_ssn VARCHAR(14), 
	@employee_ssn VARCHAR(14), 
	@amount DECIMAL(5,2)
	AS
	BEGIN
		DECLARE @customerSsn VARCHAR(14)
		SELECT @customerSsn = c.ssn
			FROM Customer c
			WHERE c.ssn = @customer_ssn
		IF( @customerSsn IS NULL)
			BEGIN
				PRINT 'invalid customer ssn'
				RETURN
			END
		DECLARE @employeeSsn VARCHAR(14)
		SELECT @employeeSsn = e.ssn
			FROM employee e
			WHERE e.ssn = @employee_ssn
		IF( @employeeSsn IS NULL)
			BEGIN
				PRINT 'invalid employee ssn'
				RETURN
			END
		INSERT INTO Gift_Card 
			(Employee,Customer,Amount)
			VALUES
			(@employee_ssn,@customer_ssn,@amount)
	END
GO
CREATE PROC AddInsurance 
	@insurance VARCHAR(15), 
	@rate DECIMAL(4,1), 
	@type VARCHAR(8),
	@liability_amount DECIMAL(5,2)
	AS
		BEGIN
			DECLARE @insurance_check VARCHAR(15)
			SELECT @insurance_check = Insurance_Number
			FROM Insurance
			WHERE Insurance_Number = @insurance
			IF(@insurance_check IS NOT NULL)
				BEGIN
					print 'this insurance is already registered'
				END
			INSERT INTO Insurance 
				(Insurance_Number,rate)
				VALUES
				(@insurance,@rate)
			IF(@type = 'Basic')
				BEGIN
					INSERT INTO Basic_Insurance 
						(Insurance_Number)
						VALUES
						(@insurance)
				END
			ELSE
				BEGIN
					IF(@type = 'Advanced')
						BEGIN
							INSERT INTO Advanced_Insurance 
								(Insurance_Number,iability_amount)
								VALUES
								(@insurance,@liability_amount)
						END
					ELSE
						BEGIN
							INSERT INTO Premium_Insurance
								(Insurance_Number)
								VALUES
								(@insurance)
						END
		END
	END
GO
CREATE PROC ADDLocation 
	@pin_number VARCHAR(10),
	@gps_location VARCHAR(40)
	AS 
		BEGIN
			DECLARE @location_check VARCHAR(10)
			SELECT @location_check = pin_number
				FROM rental_Location
				WHERE pin_number =@pin_number
			IF(@location_check IS NOT NULL)
				BEGIN
					print 'this locations is already registered'
				END
			INSERT INTO rental_Location 
				(pin_number,gps_loc) 
				VALUES 
				(@pin_number,@gps_location)
		END
GO
CREATE PROC ListRentedVehicles
	AS
		BEGIN
			SELECT *
				FROM Vehicle v
				WHERE v.v_status = 'rented'
		END
GO
CREATE PROC ListCustomersCurrentlyRenting 
	AS
		BEGIN 
			SELECT C.customer_name
				FROM Customer C INNER JOIN Rents_for_time RFT ON C.ssn = RFT.Customer INNER JOIN Vehicle V ON RFT.Vehicle = V.id 
				WHERE V.v_status = 'rented'
		END
GO
CREATE PROC CustomersStaringWithACharacter
	@character VARCHAR(1)
	AS 
		BEGIN
			SELECT * 
				FROM Customer 
				WHERE customer_name LIKE @character +'%'
		END
GO
CREATE PROC UpdateExtraRate
	@id INT,
	@rate DECIMAL(4,2)
	AS
		BEGIN
				DECLARE @extra_id INT
				SELECT @extra_id= id 
					FROM extra
					WHERE id = @id
				IF(@extra_id IS NULL)
					BEGIN
						PRINT('the extra id entered is invalid ')
						RETURN
					END
				UPDATE extra
					SET rate =@rate
					WHERE @id = id
		END
GO 
CREATE PROC UpdateExtraTypeWithVal
		@type VARCHAR(15), 
		@value DECIMAL(4,2)
		AS
			BEGIN
				DECLARE @extra_Type VARCHAR(15)
				SELECT @extra_Type= extra_type 
					FROM extra
					WHERE extra_type = @extra_Type
				IF(@extra_Type IS NULL)
					BEGIN
						PRINT('the extra type entered is invalid ')
						RETURN
					END
				UPDATE extra
					SET rate = rate + @value
					WHERE @type = extra_type
			END
GO 
CREATE PROC IssueBill
	@insurance VARCHAR(15),
	@accident INT, 
	@bill DECIMAL(10,4),
	@Number_Of_Installements INT
	AS
		BEGIN
		DECLARE @insurance_check  VARCHAR(15)
		SELECT @insurance_check= Insurance_Number
			FROM Insurance 
			WHERE Insurance_Number = @insurance
		IF(@insurance_check IS NULL)
			BEGIN
				PRINT ' PLEASE ENTER A VALID INSURANCE scheme'
				RETURN
			END
		DECLARE @accident_check  INT
		SELECT @accident_check= Id
			FROM Accident
			WHERE Id = @accident
		IF(@accident_check IS NULL)
			BEGIN
				PRINT ' PLEASE ENTER A VALID accident'
				RETURN
			END
		INSERT INTO Responsible_Insurance 
			(Insurance,Accident,Bill,Number_Of_Installements)
			VALUES
			(@insurance_check,@accident_check,@bill,@Number_Of_Installements)
		END
GO
CREATE PROC CustomerWithGift 
	AS
		BEGIN
			SELECT C.*
				FROM Customer c INNER JOIN Gift_Card GC ON c.ssn = GC.Customer
		END
GO		
CREATE PROC IssueInstallements
	@insurance VARCHAR(15), 
	@accident INT
	AS
	BEGIN
	DECLARE @accident_check INT
	SELECT @accident_check = id
		FROM Accident
		WHERE Id =@accident
	IF(@accident_check IS NULL)
		BEGIN
			PRINT 'please enter a valid accident id'
			RETURN
		END
	
	DECLARE @insurance_check INT
	SELECT @insurance_check = Insurance_Number
		FROM insurance
		WHERE Insurance_Number =@insurance
	IF(@insurance_check IS NULL)
		BEGIN
			PRINT 'please enter a valid insurance id'
			RETURN
		END
	
	DECLARE @customer VARCHAR(14)
	SELECT @customer =Customer
		FROM Accident_Info
		WHERE accident_id = @accident 
	
	DECLARE @bill DECIMAL(10,2)
	DECLARE @Number_Of_Installements INT
	SELECT @bill = Bill ,@Number_Of_Installements = Number_Of_Installements
		FROM Responsible_Insurance RI
		WHERE Accident = @accident_check and Insurance = @insurance_check
	
	DECLARE @i INT =0
	DECLARE @Payment_value DECIMAL(10,4) = @bill/@Number_Of_Installements
	DECLARE @date DATE = GETDATE()
	WHILE @i < @Number_Of_Installements
		BEGIN
			SET @i = @i +1
			SET @date = DATEADD(month,1,@date)
			INSERT INTO Payment_Info
				(P_Value,Exp_Date,Customer)
				VALUES
					(@Payment_value,@date,@customer)
		END
	SELECT *
	FROM Payment_Info
	END
GO
CREATE PROC ListCustomersWithBills
	AS
		BEGIN
			SELECT c.ssn,c.customer_name,P_I.P_Id,P_I.P_Value,P_I.Exp_Date
				FROM Customer C INNER JOIN Payment_Info P_I ON c.ssn = P_I.Customer
		END
GO
CREATE PROC UpdateBattery
	@vehicle INT, 
	@battery DECIMAL(4,1)
	AS
		BEGIN
		DECLARE @vehicle_Id INT
		SELECT @vehicle_Id =id
			FROM scooter
			WHERE id = @vehicle
		IF(@vehicle_Id IS NULL)
			BEGIN
				PRINT 'the vehicle entered is not a scooter or doesnot exist'
				RETURN
			END
		UPDATE scooter
			SET battery =@battery
			WHERE id =@vehicle_Id
		END
GO
CREATE PROC UpdateDiesel
	@vehicle INT, 
	@motor DECIMAL(4,1)
	AS
		BEGIN
		DECLARE @vehicle_Id INT
		SELECT @vehicle_Id =id
			FROM motorcycle
			WHERE id = @vehicle
		IF(@vehicle_Id IS NULL)
			BEGIN
				PRINT 'the vehicle entered is not a motorcycle or doesnot exist'
				RETURN
			END
		UPDATE motorcycle
			SET motor =@motor
			WHERE id =@vehicle_Id
		END
GO
CREATE PROC viewExtraRented
	AS 
		BEGIN
			SELECT * 
				FROM extra
				WHERE Rented_By IS NOT NULL
		END
GO 
CREATE PROC ViewInsuranceWithNoBills
	AS
		BEGIN
			SELECT I.*
			FROM Insurance I LEFT OUTER JOIN Responsible_Insurance RI ON I.Insurance_Number =RI.Insurance
			WHERE RI.Insurance IS NULL
		END
GO
CREATE PROC DeleteExpiredPayments
	@date DATETIME
	AS
		BEGIN
			DELETE FROM Payment_Info 
				WHERE Exp_Date < @date
		END
GO
CREATE PROC ViewPremiumCustomers
	AS
		BEGIN
		SELECT C.*
		FROM Customer C INNER JOIN Rents_for_time RFT ON C.ssn = RFT.Customer INNER JOIN Vehicle V ON RFT.Vehicle = V.id
		WHERE 
		END
GO
CREATE PROC getLocationsOfVehicles
	AS
		BEGIN
			SELECT DISTINCT L.*
				FROM rental_Location L INNER JOIN Vehicle V ON L.pin_number = V.loc
		END
GO
CREATE PROC getEmptyLocations
	AS
		BEGIN
			SELECT DISTINCT *
				FROM rental_Location L LEFT OUTER JOIN Vehicle V ON L.pin_number = V.loc
				where v.id is null
		END
GO
CREATE PROC greatestGiftCard
	AS
		BEGIN 
				DECLARE @Max DECIMAL(5,2)
				SELECT @Max = MAX(Amount)
				FROM Gift_Card
				SELECT C.*
				FROM Customer C INNER JOIN Gift_Card GC ON C.ssn =GC.Customer
				WHERE GC.Amount = @max
		END
GO
CREATE PROC GetUnavailableVehicles
	AS
		BEGIN
			SELECT V.* ,M.motor AS 'fuel'
				FROM Vehicle  V INNER JOIN motorcycle M ON V.id =M.id
				WHERE V.v_status != 'available' OR M.motor <30
			UNION 
			SELECT V.* ,S.battery AS 'fuel'
				FROM Vehicle  V INNER JOIN scooter S ON V.id =S.id
				WHERE V.v_status != 'available' OR S.battery =0
			
		END
-- END OF PART 4
