USE vrc
-- PART 1
	GO
	-- PART 1 A Register to the website as a customer by providing my ssn, name (First and last name), email,address and password.
	CREATE PROC CustomerRegister
		@ssn VARCHAR(14),
		@name VARCHAR(25),
		@email VARCHAR(50),
		@address VARCHAR(40),
		@password VARCHAR(20),
		@success bit output
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
						set @success=0
						RETURN
					END
				INSERT INTO Customer 
					(ssn,customer_name,customer_email,customer_address,customer_password)  
					VALUES 
						(@ssn,@name,@email,@address,@password);
				set @success =1
			END
	GO
	-- PART 1 B Register to the website as an employee by providing my ssn, name (First and last name), email,address, password, hours_per_week.
	CREATE PROC EmployeeRegister
		@ssn VARCHAR(14), 
		@name VARCHAR(25), 
		@email VARCHAR(50),
		@address VARCHAR(40),
		@password VARCHAR(20), 
		@hours_per_week INT,
		@success bit output 
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
						set @success =0
						RETURN
					END
				INSERT INTO employee
					(ssn,employee_name,employee_email,employee_address,employee_password,Hours_Per_Week)	
					VALUES
					(@ssn,@name,@email,@address,@password,@hours_per_week);
					set @success =1
			END
	GO
	-- PART 1 C Get the number of available customers.
	CREATE PROC customerCount
		@count INT OUTPUT
		AS
			BEGIN
				SELECT @count = COUNT(*)
					FROM Customer
				PRINT @count
			END
	GO
	-- PART 1 D Get the number of available vehicles.
	CREATE PROC vehicleCount
		@count INT OUTPUT
		AS
			BEGIN
				SELECT @count=COUNT(*)
					FROM Vehicle v
					where v.v_status = 'available'
				
			END
	GO
	-- PART 1 E Get the number of rents that already occurred.
	CREATE PROC rentCount 
		@count INT OUTPUT
		AS
			BEGIN
				SELECT @count=COUNT(*)
					FROM Rents_for_time
				PRINT @count
			END
-- END OF PART 1	
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- PART 2
	GO
	-- PART 2 A login using my ssn and password. 
	CREATE PROC customerLogin
		@ssn VARCHAR(14),
		@password VARCHAR(20),
		@Success_bit int OUTPUT ,
		@renting int output,
		@vehicleholder int output,
		@insurance int output
		AS
			BEGIN
				SET @Success_bit =0 
				DECLARE @checked_password VARCHAR(20)
				SELECT @checked_password = customer_password
					FROM Customer 
					WHERE ssn =@ssn
				IF(@checked_password is null)
					BEGIN
						SET  @Success_bit =0
						print @Success_bit
					END
				ELSE 
				BEGIN
					IF(@checked_password = @password)
						BEGIN
							SET @Success_bit =  2
							print @Success_bit
						END
					ELSE 
						BEGIN
							SET  @Success_bit =1
							print @Success_bit
						END
				END
				declare @vehicle int
				select @vehicle= Vehicle
				from Rents_for_time rft
				where Customer =@ssn 
				if(@vehicle is null)
				begin 
				set @renting =0;
				print @renting
				return
				end
				declare @state varchar(14)
				select @state= v_status
				from Vehicle
				where id = @vehicle
				if(@state = 'rented')
				begin 
				set @vehicleholder = @vehicle
				select @insurance = Insurance 
				from Rents_for_time
				where Customer=@ssn  and Vehicle  =@vehicleholder
				set @renting =1
				print @insurance
				print @vehicleholder
				print @renting
				return
				end
				else
				begin
				set @renting =0 
				print @renting
				return
				end
			END
	GO
	-- PART 2 B View and update my profile PARTITION 1
	CREATE PROC ViewCustProfile
		@ssn VARCHAR(14)
		AS
			BEGIN
				SELECT *
					FROM Customer
					WHERE ssn = @ssn
			END
	GO
	-- PART 2 B View and update my profile PARTITION 2
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
	-- PART 2 C add my phone number(s).
	CREATE PROC addMobile
		@ssn VARCHAR(14),
		@phone_number VARCHAR(11),
		@success bit output
		AS
			BEGIN
				DECLARE @customer_ssn VARCHAR(14)
				SELECT @customer_ssn = ssn
					FROM Customer
					WHERE ssn=@ssn
				IF(@customer_ssn IS NULL)
					BEGIN
						PRINT 'PLEASE ENTER A VALID SSN'
						set @success=0
						RETURN
					END
				ELSE
					BEGIN
						INSERT INTO Customer_Phone 
							(ssn,phone) 
							VALUES 
							(@customer_ssn,@phone_number)
						set @success=1
					END
			END
	GO
	-- PART 2 D add online payment details.
	CREATE PROC addOnlinePayment
		@ssn VARCHAR(14),
		@credit_card_number VARCHAR(16), 
		@cvv VARCHAR(3), 
		@expire DATETIME,
		@success bit output
		AS
			BEGIN
				DECLARE @customer_ssn VARCHAR(14)
				SELECT @customer_ssn = ssn
					FROM Customer
					WHERE ssn=@ssn
				IF(@customer_ssn IS NULL)
					BEGIN
						PRINT 'PLEASE ENTER A VALID SSN'
						set @success=0
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
				set @success=1
				END
			END
	GO
	-- PART 2 E View all available vehicles each with its average rating.
	CREATE PROC viewVehicles
		AS 
			BEGIN
				SELECT v.id,v.model,v.brand,v.class,v.current_milage,v.gps_loc,v.loc,v.owned,v.rate,v.v_status,avg(vr.rating) AS 'average rating' 
					FROM vehicle v left outer join Vehicle_Rating vr ON v.id = vr.vehicle
					WHERE v.v_status ='available'
					GROUP BY v.id,v.model,v.brand,v.class,v.current_milage,v.gps_loc,v.loc,v.owned,v.rate,v.v_status

			END
	GO 
	-- PART 2 F View all available insurances with different types.
	CREATE PROC viewInsurance
		AS 
			BEGIN
				SELECT *
					FROM Insurance I LEFT OUTER JOIN Advanced_Insurance AI ON i.Insurance_Number = ai.Insurance_Number 
			END
	GO
	-- PART 2 G View all extras for rent.
	CREATE PROC viewExtra
		AS 
			BEGIN
				SELECT * 
					FROM extra
					WHERE Rented_By IS NULL
			END
	GO
	-- PART 2 H Rent a vehicle for a specified time-frame.
	CREATE PROC rentTime
		@vehicle INT,
		@insurance VARCHAR(15),
		@customer_ssn VARCHAR(14),
		@time DECIMAL(4,2),
		@destination VARCHAR(40),
		@success int output
		AS
			BEGIN
				DECLARE @vehicle_id INT 
				SELECT @vehicle_id = v.id
					FROM Vehicle v
					WHERE v.id = @vehicle and v_status ='available'
				IF( @vehicle_id is null)
					BEGIN
						PRINT 'invalid vehicle id'
						set @success = 0
						RETURN
					END

				DECLARE @insurance_id VARCHAR(15)
				SELECT @insurance_id = I.Insurance_Number
					FROM Insurance I
					WHERE I.Insurance_Number = @insurance
				IF( @insurance_id is null)
					BEGIN
						PRINT 'invalid insurance id'
						set @success = 1
						RETURN
					END

				DECLARE @customerSsn VARCHAR(14)
				SELECT @customerSsn = c.ssn
					FROM Customer c
					WHERE c.ssn = @customer_ssn
				IF( @customerSsn is null)
					BEGIN
						PRINT 'invalid customer ssn'
						set @success = 2
						print @success
						RETURN
					END
			begin try
				INSERT INTO Rents_for_time 
					(Vehicle,Insurance,Customer,Rent_Time,destination)	
					VALUES
					(@vehicle,@insurance,@customer_ssn,@time,@destination)
					
				UPDATE Vehicle
					SET v_status = 'rented' ,loc = null
					WHERE id = @vehicle_id
					set @success = 3
					
					return
			end try
			begin catch
			set @success=4
			return
			end catch
			END
	GO
	-- PART 2 I View all information of my previous accidents
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
					FROM Accident_Info aI inner join Accident a on ai.accident_id= a.Id
					WHERE aI.Customer = @customer_ssn
			END
	GO
	-- PART 2 J View any pending payements if any.
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
					WHERE p.Customer =@customer_ssn and Exp_Date> CURRENT_TIMESTAMP
			END
	GO
	-- PART 2 K Delete one of my credit cards.
	create proc viewpaymentinfo 
	@ssn varchar(14)
	as 
	select  Number
	from Payment_Type
	where Customer = @ssn
	go
	CREATE PROC deleteCreditCard
		@customer_ssn VARCHAR(14),
		@credit_card_number VARCHAR(16),
		@success bit output
		AS 
			BEGIN
				DECLARE @ssn  VARCHAR(14)
				SELECT @ssn = c.ssn
					FROM Customer c
					WHERE c.ssn = @customer_ssn
				IF(@ssn is null)
					BEGIN
						PRINT 'please enter a valid ssn'
						set @success=0
						RETURN
					END 
				DECLARE @card_number  VARCHAR(16)
				SELECT @card_number  = pt.Number
					FROM Payment_Type pt
					WHERE pt.Customer = @customer_ssn AND pt.Number = @credit_card_number
				IF(@card_number  is null)
					BEGIN
						PRINT 'please enter a valid card number to be deleted'
						set @success =0
						RETURN
					END 
				DELETE FROM Payment_Type 
				WHERE Payment_Type.Customer = @customer_ssn AND Payment_Type.Number = @credit_card_number
			set @success=1
			END
	GO
	-- PART 2 L Search for vehicles that are in one of three locations provided.
	/*not done yet*/CREATE PROC searchForVehicles
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
	-- PART 2 M Order all vehicles that are not rented by brand/class/rate PARTITION 1
	CREATE PROC orderVehiclesByBrand
		AS 
			BEGIN
				SELECT *
					FROM Vehicle v 
					WHERE v.v_status = 'available' 
					ORDER BY brand
			END
	GO
	-- PART 2 M Order all vehicles that are not rented by brand/class/rate PARTITION 2
	CREATE PROC orderVehiclesByClass
		AS 
			BEGIN
				SELECT *
					FROM Vehicle v 
					WHERE v.v_status = 'available'
					ORDER BY class
			END
	GO
	-- PART 2 M Order all vehicles that are not rented by brand/class/rate PARTITION 3
	CREATE PROC orderVehiclesByRate
		AS 
			BEGIN
				SELECT *
				FROM Vehicle v 
				WHERE v.v_status = 'available' 
				ORDER BY rate
			END
	GO
	-- PART 2 N Get the count of accidents covered by each insurance.
	CREATE PROC countAccidentsPerInsurance
		AS 
			BEGIN 
				SELECT Insurance,COUNT(*) AS 'COUNT'
					FROM Responsible_Insurance
					GROUP BY Insurance
			END 
	GO
	-- PART 2 O Get the vehicles that were never rented before.
	CREATE PROC getNonRentedehicles
		AS
			BEGIN
				SELECT v.*
					FROM vehicle v LEFT OUTER JOIN Rents_for_time rft ON v.id =rft.Vehicle
					WHERE rft.Vehicle IS NULL
			END
	GO
	-- PART 2 P View all insurances available sorted by rate.
	CREATE PROC viewInsurances
		AS
			BEGIN
				SELECT *
					FROM Insurance i LEFT OUTER JOIN Advanced_Insurance ai on i.Insurance_Number = ai.Insurance_Number
					ORDER BY rate
			END
--END OF PART 2	
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--PART 3
	GO
	-- PART 3 A Submit an accident with info.
	CREATE PROC accidentSubmission
		@ssn VARCHAR(14),
		@vehicle INT, 
		@description VARCHAR(100)
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
				DECLARE @vehicle_id INT
				SELECT @vehicle_id = id
					FROM Vehicle
					WHERE id =@vehicle
				IF(@vehicle_id is null)
					BEGIN
						PRINT('please enter a valid vehicle')
						RETURN
					END
				INSERT INTO Accident
					(Accident_Description)	
					VALUES
					(@description)

				DECLARE @accident_id INT
				SELECT @accident_id = id
					FROM Accident
					WHERE Accident_Description = @description 

				INSERT INTO Accident_Info
					(accident_id,Vehicle,Customer) 
					VALUES
					(@accident_id,@vehicle,@ssn)
			END
	GO
	-- PART 3 B Submit an accident with info.
	CREATE PROC rentExtra
		@ssn VARCHAR(14),
		@id INT,
		@success bit output
		AS 
			BEGIN
				DECLARE @customer_ssn VARCHAR(14)
				SELECT @customer_ssn = ssn
					FROM Customer
					WHERE ssn =@ssn
				IF(@customer_ssn is null)
					BEGIN
						PRINT('please enter a valid ssn')
					set @success=0
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
						set @success=0
						RETURN
					END
				UPDATE Extra 
					SET Rented_By =@ssn
					WHERE id =@id
					set @success= 1
			END
	GO
	-- PART 3 C Return an extra item.
	CREATE PROC returnExtra
		@ssn VARCHAR(14),
		@id INT,
		@success bit output
		AS 
			BEGIN
			DECLARE @customer_ssn VARCHAR(14)
			SELECT @customer_ssn = ssn
				FROM Customer
				WHERE ssn =@ssn
			IF(@customer_ssn is null)
				BEGIN
					PRINT('please enter a valid ssn')
					set @success =0
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
					set @success =0
					RETURN
				END
			UPDATE extra 
			SET Rented_By  = NULL
			WHERE id =@id AND Rented_By = @ssn
			set @success=1
		END
	GO
	create proc returnvehicle
	@loc_pin varchar(20),
	@vehicle int,
	@success bit output
	as
	begin
	declare @location varchar(20)
	select @location = pin_number
	from rental_Location
	where pin_number=@loc_pin
	if(@location is null)
	begin
	set @success=0
	return
	end
	update Vehicle
		set v_status ='available' ,loc= @loc_pin
		where id=@vehicle
	
	set @success=1			
	end 
	go
	-- PART 3 D View Extra items ordered by rate descendingly.
	CREATE PROC viewExtraNotRented
		AS 
			BEGIN
				SELECT * 
					FROM extra
					WHERE Rented_By IS NULL
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
	-- PART 3 E View the minimum rate of each Extra type.
	CREATE PROC viewMinPerType
		AS 
			BEGIN
				SELECT extra_type,min(rate) AS 'RATE' 
					FROM extra
					WHERE Rented_By IS NULL
					GROUP BY extra_type
			END
	GO
	-- PART 3 F Get the count of how many times the currently rented vehicle was rented.
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
	-- PART 3 G Evaluate the currently rented vehicle from 0 to 10.
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

				IF(@vehicle_id IS NULL)
					BEGIN
						PRINT 'invalid rented vehicle'
						RETURN
					END

				declare @ratingtemp decimal(4,2)
				select @ratingtemp =rating
				from  Vehicle_Rating
				where Customer=@customer_ssn and vehicle =@vehicle
				if(@ratingtemp is null)
				begin
				INSERT INTO Vehicle_Rating
					(vehicle,Customer,rating) 
					VALUES
					(@vehicle, @customer_ssn,@rating)
					end
					else 
					begin
					update Vehicle_Rating
					set rating =@rating
					where vehicle=@vehicle and Customer=@customerSsn
					end
			END
	GO
	-- PART 3 H Update the location of the vehicle.
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
	-- PART 3 I View average rating of the vehicle currently rented.
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
					IF(@average IS NULL)
					begin
					set @average =0
					end
					print @average
			END
	GO
	-- PART 3 J View average rating of the vehicle currently rented.
	/*not done yet*/CREATE PROC viewAccidentsForCurrentVehicle
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
-- END OF PART 3
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
-- PART 4
go
CREATE PROC employeeLogin
		@ssn VARCHAR(14),
		@password VARCHAR(20),
		@Success_bit INT OUTPUT 
		AS
			BEGIN
				SET @Success_bit =0 
				DECLARE @checked_password VARCHAR(20)
				SELECT @checked_password = employee_password
					FROM Employee
					WHERE ssn =@ssn
				IF(@checked_password is null)
					BEGIN 
						SET  @Success_bit =0
						PRINT @Success_bit 
						RETURN
					END
				ELSE 
				BEGIN
					IF(@checked_password = @password)
						BEGIN
							SET @Success_bit =  2
							PRINT @success_bit
						END
					ELSE 
						BEGIN
							SET  @Success_bit =1
							PRINT @Success_bit 
						END
				END
			END
	GO
	-- PART 4 A View and update my profile PARTITION 1
	CREATE PROC ViewEmpProfile
		@ssn VARCHAR(14)
		AS
			BEGIN
				SELECT *
					FROM employee
					WHERE ssn = @ssn
			END
	GO
	-- PART 4 A View and update my profile PARTITION 2
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
						UPDATE employee
							SET employee_name = @name, employee_email =@email,employee_address = @address ,employee_password = @password,Hours_Per_Week = @hours_per_week
							WHERE ssn = @ssn
						SET @Success_bit =  1
						PRINT @Success_bit
				
					END
			END
	GO
	-- PART 4 B Add a newly acquired Extra.
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
	-- PART 4 C View all available vehicles.
	CREATE PROC viewVehiclesAvailable
		AS
			BEGIN
				SELECT *
					FROM Vehicle v
					WHERE v.v_status = 'available'
			END
	GO
	-- PART 4 D Provide a gift-card to an employee.
	CREATE PROC ProvideGift
		@customer_ssn VARCHAR(14), 
		@employee_ssn VARCHAR(14), 
		@amount DECIMAL(5,2),
		@success bit output
		AS
		BEGIN

			DECLARE @customerSsn VARCHAR(14)
			SELECT @customerSsn = c.ssn
				FROM Customer c
				WHERE c.ssn = @customer_ssn
			IF( @customerSsn IS NULL)
				BEGIN
					PRINT 'invalid customer ssn'
					set @success=0
					RETURN
				END
			declare @check varchar(14)
			declare @value decimal(5,2)
			select @check = Customer ,@value = Amount
			from Gift_Card
			where Customer =@customer_ssn
			
			DECLARE @employeeSsn VARCHAR(14)
			SELECT @employeeSsn = e.ssn
				FROM employee e
				WHERE e.ssn = @employee_ssn
			IF( @employeeSsn IS NULL)
				BEGIN
					PRINT 'invalid employee ssn'
					RETURN
				END
			if(@check is null and @value is null)
			begin
			INSERT INTO Gift_Card 
				(Employee,Customer,Amount)
				VALUES
				(@employee_ssn,@customer_ssn,@amount)
				set @success=1
				end
			else
			begin
			update Gift_Card 
			set Amount = @value + @amount
			where Customer= @customer_ssn
			set @success =1
			end
		END
	GO
	-- PART 4 E Add an available insurance.
	CREATE PROC AddInsurance
		@insurance VARCHAR(15), 
		@rate DECIMAL(4,1), 
		@type VARCHAR(8),
		@liability_amount DECIMAL(5,2),
		@success bit output
		AS
			BEGIN
				DECLARE @insurance_check VARCHAR(15)
				SELECT @insurance_check = Insurance_Number
				FROM Insurance
				WHERE Insurance_Number = @insurance
				IF(@insurance_check IS NOT NULL)
					BEGIN
						print 'this insurance is already registered'
						set @success =0
						return
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
			set @success =1
			END

		END
	GO
	-- PART 4 F Add a new Location.
	CREATE PROC ADDLocation
		@pin_number VARCHAR(10),
		@gps_location VARCHAR(40),
		@success bit output
		AS 
			BEGIN
				DECLARE @location_check VARCHAR(10)
				SELECT @location_check = pin_number
					FROM rental_Location
					WHERE pin_number =@pin_number
				IF(@location_check IS NOT NULL)
					BEGIN
						print 'this locations is already registered'
						set @success =0
						return
					END
				INSERT INTO rental_Location 
					(pin_number,gps_loc) 
					VALUES 
					(@pin_number,@gps_location)
					set @success =1
			END
	GO
	-- PART 4 G List the currently rented vehicles
	CREATE PROC ListRentedVehicles
		AS
			BEGIN
				SELECT *
					FROM Vehicle v
					WHERE v.v_status = 'rented'
			END
	GO
	-- PART 4 H List all cutomer names currently renting a vehicle.
	CREATE PROC ListCustomersCurrentlyRenting
		AS
			BEGIN 
				SELECT C.customer_name ,c.ssn
					FROM Customer C INNER JOIN Rents_for_time RFT ON C.ssn = RFT.Customer INNER JOIN Vehicle V ON RFT.Vehicle = V.id 
					WHERE V.v_status = 'rented'
			END
	GO
	/* not done yet*/-- PART 4 I List all customer information whose names start with a specific character.
	CREATE PROC CustomersStaringWithACharacter
		@character VARCHAR(1)
		AS 
			BEGIN
				SELECT * 
					FROM Customer 
					WHERE customer_name LIKE @character +'%'
			END
	GO
	-- PART 4 J Update an Extra item to a specific rate.
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
	-- PART 4 K Increment all Extra items of a specific type by a specific value.
	CREATE PROC UpdateExtraTypeWithVal
			@type VARCHAR(15), 
			@value DECIMAL(4,2)
			AS
				BEGIN
					DECLARE @extra_Type VARCHAR(15)
					SELECT @extra_Type= extra_type 
						FROM extra
						WHERE extra_type = @Type
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
	
	-- PART 4 M List all customer information who have an unused gift-card.
	CREATE PROC CustomerWithGift
		AS
			BEGIN
				SELECT C.* , GC.Amount
					FROM Customer c INNER JOIN Gift_Card GC ON c.ssn = GC.Customer
			END
	GO		
	-- PART 4 L Issue a bill for an accident
	CREATE PROC IssueBill
		@insurance VARCHAR(15),
		@accident INT, 
		@bill DECIMAL(10,4),
		@Number_Of_Installements INT,
		@success int OUTPUT
		AS
			BEGIN
			
			DECLARE @accident_check  INT
			SELECT @accident_check= Id
				FROM Accident
				WHERE Id = @accident
			IF(@accident_check IS NULL)
				BEGIN
					PRINT ' PLEASE ENTER A VALID accident'
					SET @success = 0
					RETURN
				END
			
			declare @check int
			select @check =Accident
				from Responsible_Insurance
				where Accident =@accident 
			if(@check is not null)
				begin
					set @success=1
					return
				end 
			
			DECLARE @insurance_check  VARCHAR(15)
			SELECT @insurance_check= Insurance_Number
				FROM Insurance 
				WHERE Insurance_Number = @insurance
			IF(@insurance_check IS NULL)
				BEGIN
					PRINT ' PLEASE ENTER A VALID INSURANCE scheme'
					RETURN
				
				END
			INSERT INTO Responsible_Insurance 
				(Insurance,Accident,Bill,Number_Of_Installements)
				VALUES
				(@insurance_check,@accident_check,@bill,@Number_Of_Installements)
			SET @success = 2
			END 
	GO
	/*NOT DONE YET*/-- PART 4 N Issue installments as per the number of installments for a certain accident separated by 1 month each.
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
		SELECT *
			FROM Payment_Info
			END
		END
	GO
	-- PART 4 O List customers along with their due bills (if any).
	CREATE PROC ListCustomersWithBills
		AS
			BEGIN
				SELECT c.ssn,c.customer_name,P_I.P_Id,P_I.P_Value,P_I.Exp_Date
					FROM Customer C INNER JOIN Payment_Info P_I ON c.ssn = P_I.Customer
					order by c.ssn ,P_I.Exp_Date 
			END
	GO
	-- PART 4 P Update the battery level of a scooter and the motor diesel needed PARTITION 1.
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
	-- PART 4 P Update the battery level of a scooter and the motor diesel needed PARTITION 2.
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
	/*NOT DONE YET*/-- PART 4 Q View all Extra items that are currently rented.
	CREATE PROC viewExtraRented
		AS 
			BEGIN
				SELECT * 
					FROM extra
					WHERE Rented_By IS NOT NULL
			END
	GO 
	/*NOT DONE YET*/-- PART 4 R View all insurance info with no due bills.
	CREATE PROC ViewInsuranceWithNoBills
		AS
			BEGIN
				SELECT I.*
				FROM Insurance I LEFT OUTER JOIN Responsible_Insurance RI ON I.Insurance_Number =RI.Insurance
				WHERE RI.Insurance IS NULL
			END
	GO
	-- PART 4 S View all insurance info with no due bills.
	CREATE PROC DeleteExpiredPayments
		@date DATETIME
		AS
			BEGIN
				DELETE FROM Payment_Info 
					WHERE Exp_Date < @date
			END
	GO
	-- PART 4 T View all insurance info with no due bills. 
	CREATE PROC ViewPremiumCustomers
		AS
			BEGIN
				SELECT C.*
					FROM Customer C 
					WHERE NOT EXISTS
									(
										SELECT V.id
											FROM Vehicle V
									EXCEPT
										SELECT  RFT.Vehicle
											FROM Customer C1 INNER JOIN Rents_for_time RFT ON C1.ssn = RFT.Customer
											WHERE C1.ssn = C.SSN 
									)
			END
	GO
	-- PART 4 U Get all locations at which there is currently a vehicle.
	CREATE PROC getLocationsOfVehicles
		AS
			BEGIN
				SELECT DISTINCT L.*
					FROM rental_Location L INNER JOIN Vehicle V ON L.pin_number = V.loc
			END
	GO
	-- PART 4 V Get all locations at which there is currently NO vehicle.
	CREATE PROC getEmptyLocations
		AS
			BEGIN
				SELECT DISTINCT *
					FROM rental_Location L LEFT OUTER JOIN Vehicle V ON L.pin_number = V.loc
					where v.id is null
			END
	GO
	-- PART 4 W Get all locations at which there is currently a vehicle.
	CREATE PROC greatestGiftCard
		AS
			BEGIN 
					DECLARE @Max DECIMAL(5,2)
					SELECT @Max = MAX(Amount)
					FROM Gift_Card
					SELECT C.* , gc.Amount
					FROM Customer C INNER JOIN Gift_Card GC ON C.ssn =GC.Customer
					WHERE GC.Amount = @max
			END
	GO
	-- PART 4 X Get the vehicles that are either unavailable or have a battery level 0 or have less than 30 kilometers left.
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
	GO
	-- END OF PART 4
	----------------------------------------------------------------------
	-- EXTRA PROCEDURES
	CREATE PROC updatestatus
	@vehicle INT,
	@status VARCHAR(14),
	@success BIT OUTPUT
		AS 
			BEGIN
				DECLARE @id INT
				SELECT @id =id
					FROM Vehicle
					WHERE id =@vehicle
				IF(@id IS NULL)
					BEGIN
						SET @success =0
						RETURN
					END
				UPDATE Vehicle
					SET v_status =@status
					WHERE id =@vehicle
				SET @success =1
			END
	GO
	CREATE PROC decidemotor 
	@vehicle INT,
	@motor INT OUTPUT
		AS
			BEGIN
				DECLARE @id INT
				SELECT @id= id
					FROM Vehicle
					WHERE id= @vehicle
				IF(@id IS NULL)
					BEGIN
						RETURN
					END
				DECLARE @disel INTT
				SELECT @disel= id
					FROM motorcycle
					WHERE id= @vehicle
				IF(@disel is not null)
					BEGIN
						SET @motor =1
						RETURN
					END
				DECLARE @battery INT
				SELECT @battery= id
					FROM scooter
					WHERE id= @vehicle
				IF(@battery is not  null)
					BEGIN
						SET @motor =2
						RETURN
					END
			END
	GO

	CREATE PROC addvehicle
	@owned VARCHAR(6),
	@rate DECIMAL(4,2) ,
	@class VARCHAR(20) ,
	@brand VARCHAR(20) ,
	@model VARCHAR(20) ,
	@current_milage INT ,
	@gps_loc VARCHAR(20), 
	@loc VARCHAR(10),
	@motor varchar(10)
		AS
			BEGIN
				INSERT INTO Vehicle
					(owned,rate,class,brand,model,current_milage,gps_loc,loc)
					VALUES
						(@owned,@rate,@class,@brand,@model,@current_milage,@gps_loc,@loc)
			declare @id int
			select @id =id
			from Vehicle
			where owned=@owned and class=@class and brand=@brand and model = @model and current_milage= @current_milage and gps_loc = @gps_loc and loc =@loc
			if(@motor='gas')
			begin
				insert into motorcycle
					values
					(@id,0)
					end
			else 
			begin
				insert into scooter
					values
					(@id,0)
					end
			END

	GO
	CREATE PROC viewextrasid
		AS 
			BEGIN
			SELECT distinct extra_type
			FROM Extra
			END
	GO

	CREATE PROC viewinsurancesid
		AS 
			BEGIN
			SELECT Insurance_Number
			FROM Insurance
			END
	GO
	CREATE PROC viewvehicleid
		AS 
			BEGIN
			SELECT id
			FROM Vehicle
			END
	GO
	CREATE PROC viewlocation
		AS 
			BEGIN
			SELECT pin_number
			FROM rental_Location
			END
	GO
	-- END OF EXTRAS