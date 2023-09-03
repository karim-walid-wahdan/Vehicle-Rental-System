USE vrc
--PART 1
-- REGISTER A NEW CUSTOMER PART 1 A
EXEC CustomerRegister 
	'041-03-4680','MERNA','koletmpn57xL@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud'
-- REGISTER A NEW CUSTOMER THAT HIS SNN ALREADY EXISTS
EXEC CustomerRegister 
	'041-03-4680','MERNA','koletmpn57xK@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud' 
-- REGISTER A NEW CUSTOMER THAT HIS EMAIL ALREADY EXISTS
EXEC CustomerRegister 
	'041-03-4690','CLARIE','koletmpn57xl@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud'
-------------------------------------------------------------------------------------------
-- REGISTER A NEW EMPLOYEE PART 1 B
EXEC EmployeeRegister 
	'041-03-4680','MERNA','koletmpn57xL@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud',45
-- REGISTER A NEW employee THAT HIS SNN ALREADY EXISTS
EXEC EmployeeRegister 
	'041-03-4680','MERNA','koletmpn57xK@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud',20
-- REGISTER A NEW employee THAT HIS EMAIL ALREADY EXISTS
EXEC EmployeeRegister 
	'041-03-4690','CLARIE','koletmpn57xl@gmail.com','Niederhinzing 8','jH+6u5QD]ym@\?BUgud',23
-------------------------------------------------------------------------------------------
--GET THE NUMBER OF CUSTOMERS PART 1 C
  -------------------------------------------------------------------------------------------
--GET THE NUMBER OF AVALIABLE VEHICLES PART 1 D
DECLARE @COUNT_vehicle INT 
EXEC vehicleCount 
	@COUNT_vehicle OUTPUT
-------------------------------------------------------------------------------------------
--GET THE NUMBER OF RENTS PART 1 E
DECLARE @COUNT_RENT INT 
EXEC rentCount 
	@COUNT_RENT OUTPUT
-- END OF PART 1
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--PART 2
--CUSTOMER LOGIN WITH PROPER CREDINTIALS PART 2 A
DECLARE @sb_LOGIN int
declare @rent bit
declare @vehicle int
declare @insurance int

EXEC customerLogin 
	'041-03-4670' ,'jH+6u5QD]ym@\?BUgud',@sb_LOGIN OUTPUT, @rent output , @vehicle output, @insurance output
--CUSTOMER LOGIN WITH WRONG SSN
EXEC customerLogin 
	'041-03-467' ,'jH+6u5QD]ym@\?BUgud',@sb_LOGIN OUTPUT
--CUSTOMER LOGIN WITH WRONG PASSWORD 
EXEC customerLogin 
	'041-03-4670' ,'jH+6u5QD]ym@\?BUgu',@sb_LOGIN OUTPUT
--VIEWING CUSTOMER PROFILE THAT EXISTS PART 2 B
EXEC ViewCustProfile 
	'041-03-4670' 
--VIEWING CUSTOMER PROFILE THAT DOESNOT EXISTS
EXEC ViewCustProfile 
	'041-03-4679' 
--UPDATING CUSTOMER PROFILE THAT DOESNOT EXISTS (SSN) PART 2 C
DECLARE @sb_UPDATE BIT 
EXEC UpdateCustProfile 
	'041-03-4679' ,'KARIM','!"§$%&/(','ASDFGH','QWERTZUI',@sb_UPDATE OUTPUT
--UPDATING CUSTOMER PROFILE THAT  EXISTS (SSN)
EXEC UpdateCustProfile 
	'041-03-4670' ,'KARIM','!"§$%&/(','ASDFGH','QWERTZUI',@sb_UPDATE OUTPUT
--ADDING MOBILE TO A CUSTOMER THAT DOESNOT EXISTS (SSN) PART 2 D
EXEC addMobile 
	'041-03-4679','01022565980'
--ADDING MOBILE TO A CUSTOMER THAT DOES EXISTS (SSN)
EXEC addMobile 
	'041-03-4670','01022565980'
--ADDING AN ONLINE PAYMENT METHOD WITH A NON EXISTING CUSTOMER PART 2 E
EXEC addOnlinePayment 
	'041-03-4690','!"§$%&/()','!"§','2001-10-22'
--ADDING AN ONLINE PAYMENT METHOD WITH A NON EXISTING CUSTOMER PART 2 E
EXEC addOnlinePayment 
	'041-03-4670','!"§$%&/()',123,'2001-10-22'
--VIEWING ALL AVALIABLE VEHICLES WITH THIER AVERAGE RATING PART 2 F
EXEC viewVehicles
--VIEWING ALL INSURANCES PART 2 G
EXEC viewInsurance
--VIEWING ALL EXTRAS PART 2 G
EXEC viewExtra
--RENTING A VEHICLE THAT DOESNOT EXIST PART 2 H
EXEC rentTime 
	255 ,'2','041-03-4670',2.3,'QWER'
--RENTING A INSURANCE THAT DOESNOT EXIST PART 2 H
EXEC rentTime 
	1 ,'255','041-03-4670',2.3,'QWER'
--RENTING A CUSTOMER THAT DOESNOT EXIST PART 2 H
EXEC rentTime 
	1 ,'2','041-03-4671',2.3,'QWER'
--RENTING A VEHICLE WITH THE REQURIED DATA VALID PART 2 H
declare @success int 
EXEC rentTime 
	4 ,'3','041-03-4670',2.3,'QWER',@success output
--VIEWING CUSTOMER THE DOESNOT EXIST ACCIDENTS PART 2 I
EXEC viewMyAccidents 
	'041-03-4671'
--VIEWING CUSTOMER  ACCIDENTS PART 2 I
EXEC viewMyAccidents 
	'041-03-4670'
-- VIEWING CUSTOMER THAT DOESNOT EXIST REMANING PAYMENTS PART 2 J
EXEC viewRemaningPayments 
	'041-03-4671'
-- VIEWING CUSTOMER EXIST REMANING PAYMENTS PART 2 J
EXEC viewRemaningPayments 
	'041-03-4670'
--DELETEING A CREDIT CARD  FOR A CUSTOMER THAT DOESNOT EXIST PART 2 K
EXEC deleteCreditCard 
	'041-03-4671' ,'4716179496730598'	
--DELETEING AN	UNKNOWN CREDIT CARD  FOR A CUSTOMER PART 2 K
EXEC deleteCreditCard 
	'252-49-6099','4716179496730590'
--DELETEING AN CREDIT CARD  FOR A CUSTOMER PART 2 K
EXEC deleteCreditCard 
	'252-49-6099','4716179496730598'
--SEARCH FOR VEHICLES IN SPECIFED LOCATIONS NAMES PART 2 L
EXEC searchForVehicles 
	'WEDDING','0002','0003'
--ORDER VEHICLE BY BRAND PART 2 M
EXEC orderVehiclesByBrand
--ORDER VEHICLE BY CLASS PART 2 M
EXEC orderVehiclesByClass
--ORDER VEHICLE BY MODEL PART 2 M
EXEC orderVehiclesByRate
--COUNTING ACCIDENTS PER INSURANCE PART 2 N
EXEC countAccidentsPerInsurance
--GETTING VEHICLES THAT WERE NEVER RENTED PART 2 O
EXEC getNonRentedehicles
--View all insurances available sorted by rate PART 2 P
EXEC viewInsurances
-- END OF PART 2
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
--PART 3
--Submit an accident with info WITH INVALID SSN PART 3 A
EXEC accidentSubmission
	'041-03-4671',20,'rgrgrdcfgghj'
--Submit an accident with info WITH INVALID vehicle PART 3 A
EXEC accidentSubmission
	'041-03-4670',255,'rgrgrdcfgghj'
--Submit an accident with info WITH valid data PART 3 A
EXEC accidentSubmission
	'041-03-4670',2,'rgrgrdcfgghj'
--RENT AN EXTRA ITEM  WITH A VALID SSN ABD AN UNRENTED ITEM PART 3 B
EXEC rentExtra
	'041-03-4670' , 3
--RENT AN EXTRA ITEM WITH VALID AND A RENTED ITEM PART 3 B
EXEC rentExtra
	'041-03-4670' , 3
--RENT AN EXTRA ITEM WITH AN INVALID SSN PART 3 B
EXEC rentExtra
	'041-03-4671' , 3
--RETURN AN EXTRA WITH AN INVALID EXTRA ID PART 3 C
EXEC returnExtra 
	'041-03-4670',255
--RETURN AN EXTRA WITH AN INVALID SSN PART 3 C
EXEC returnExtra 
	'041-03-4671',2
--RETURN AN EXTRA WITH VALID DATA PART 3 C
EXEC returnExtra 
	'041-03-4670',2
--VIEW EXTRA ORDERED BY RATE DESC PART 3 D
EXEC viewExtraOrdered
--View the minimum rate of each Extra type PART 3 E
EXEC viewMinPerType
--Get the count of how many times the currently rented vehicle was rented PART 3 F
DECLARE @COUNT INT 
EXEC numberOfRents 255, @COUNT OUTPUT
--Evaluate the currently rented vehicle from 0 to 10  WITH INVALID SSN PART 3 G
EXEC evaluateVehicle 
	'041-03-4671' , 2,0
--Evaluate the currently rented vehicle from 0 to 10  WITH INVALID VEHICLE PART 3 G
EXEC evaluateVehicle 
	'041-03-4670' , 255,0
-- Evaluate the currently rented vehicle from 0 to 10  WITH VALID VEHICLE PART 3 G
EXEC evaluateVehicle 
	'041-03-4670' , 1,5
-- Update the location of the vehicle with invalid vehicle PART 3 H
DECLARE @SUCCESS BIT
EXEC updateLocation 
	255,'HZFZCGVHBJ', @SUCCESS OUTPUT
-- Update the location of the vehicle with valid vehicle PART 3 H
DECLARE @SUCCESS BIT
EXEC updateLocation 
	2,'HZFZCGVHBJ', @SUCCESS OUTPUT
-- View average rating of the vehicle currently rented VALID VEHICLE PART 3 I
DECLARE @AVG DECIMAL(5,3)
EXEC viewAverageRating 2 , @AVG OUTPUT
-- View average rating of the vehicle currently rented INVALID VEHICLE PART 3 I
EXEC viewAverageRating 255 , @AVG OUTPUT
-- View aACCIDENTS of the vehicle currently rented WITH VALID VEHICLE PART 3 J
EXEC viewAccidentsForCurrentVehicle  2
-- View aACCIDENTS of the vehicle currently rented WITH VALID VEHICLEPART 3 J
EXEC viewAccidentsForCurrentVehicle  255
-- END OF PART 3
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-- PART 4
-- View and update my profile  WITH VALID SSN partition 1 PART 4 A
EXEC ViewEmpProfile 
	'441-72-5125'
-- View and update my profile  WITH INVALID SSN partition 1 PART 4 A
EXEC ViewEmpProfile 
	'441-72-5122'
--  View and update my profile  WITH INVALID SSN partition 2 PARRT 4 A
DECLARE @SUCCESS BIT
EXEC UpdateEmpProfil
	'441-72-5122' , 'QWERTZ','QWERTZ','QWERTZ','QWERTZ',12,@SUCCESS OUTPUT
--  View and update my profile  WITH VALID SSN partition 2 PART 4 A
DECLARE @SUCCESS BIT
EXEC UpdateEmpProfil
	'441-72-5125' , 'QWERTZ','`x]}$M2Wn7Q(5s&<','QWERTZ','QWERTZ',12,@SUCCESS OUTPUT
-- ADD AN NEW EXTRA PART 4 B
EXEC AddExtra 
	'7AMSA', 7.2
-- VIEW ALL AVALIABLE VEHICLES 4 C
EXEC viewVehiclesAvailable 
--Provide a gift-card to an employee WITH VALID DATA PART 4 D
EXEC ProvideGift 
	'041-03-4670','519-31-5990',3.6
--Provide a gift-card to an employee WITH VALID CUSTOMER PART 4 D
EXEC ProvideGift 
	'041-03-4671','519-31-5990',3.6
--Provide a gift-card to an employee WITH INVALID EMPLOYEE PART 4 D
EXEC ProvideGift 
	'041-03-4670','519-31-5991',3.6
--Add an available basic insurance PART 4 E
EXEC AddInsurance 
	'1239',12.4,'basic',null
--Add an available advanced insurance PART 4 E
EXEC AddInsurance 
	'1238',12.4,'advanced',124.4
--Add an available premuim insurance PART 4 E
EXEC AddInsurance 
	'1237',12.4,'premium',null
--add an new location PART 4 F
EXEC ADDLocation 
	'12345','QWERTZUI'
--LISTING ALL RENTERD VEHICLES PART 4 G
EXEC ListRentedVehicles
--List all cutomer names currently renting a vehicle PART 4 H
EXEC ListCustomersCurrentlyRenting
-- List all customer information whose names start with a specific character PART 4 I
EXEC CustomersStaringWithACharacter 
	'N'
--Update an Extra item to a specific rate PART 4 J
EXEC UpdateExtraRate 
	'3',12.7
EXEC UpdateExtraRate 
	'255',12.7
--Increment all Extra items of a specific type by a specific value PAT 4 K
EXEC UpdateExtraTypeWithVal 
	'gloves',12.7
--Increment all Extra items of a specific type by a specific value PAT 4 K
EXEC UpdateExtraTypeWithVal 
	'glove',12.7
--Issue a bill for an accident PART 4 L
EXEC IssueBill	
	'7',1,6000,6
EXEC IssueBill	
	'255',1,6000,6
EXEC IssueBill	
	'7',255,6000,6
--List all customer information who have an unused gift-card PART 4 M
EXEC CustomerWithGift
--Issue installments as per the number of installments for a certain accident separated by 1 month each PART 4 N
EXEC IssueInstallements 
	'1',1
--List customers along with their due bills (if any) PART 4 O
EXEC ListCustomersWithBills
--Update the battery level of a scooter and the motor diesel needed. PART 4 P
EXEC UpdateBattery 
	'7',100
EXEC UpdateDiesel
	'1',100
--View all Extra items that are currently rented PART 4 Q
EXEC viewExtraRented
--View all insurance info with no due bills.
EXEC ViewInsuranceWithNoBills 
--Delete payments with an expire date earlier than a specific date. PART 4 S
EXEC DeleteExpiredPayments 
	'2022-10-22'
--Delete payments with an expire date earlier than a specific date PART 4 T
EXEC ViewPremiumCustomers
--Get all locations at which there is currently a vehicle. PART 4 U
EXEC getLocationsOfVehicles
--Get all locations at which there is no vehicles
EXEC getEmptyLocations
--Get the customer information with the greatest gift card amount.
EXEC greatestGiftCard
--Get the vehicles that are either unavailable or have a battery level 0 or have less than 30 kilometers left.
EXEC GetUnavailableVehicles
