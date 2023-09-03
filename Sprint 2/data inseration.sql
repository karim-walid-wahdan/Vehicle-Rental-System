USE vrc
--INSERATIONS
	INSERT INTO Rental_Location
		(pin_number,gps_loc) 
		VALUES 
			('0000','alexander platz'),
			('0001','potsdamser platz'),
			('0002','wedding'),
			('0003','spandau'),
			('0004','nauen')
		
	INSERT INTO Vehicle
		(owned,v_status,rate,class,brand,model,current_milage,gps_loc,loc) 
		VALUES 
			('owned','available',10.2,'2-wheel','Honda','CB 750F',10000,'alexander platz','0000'),
			('leased','available',13.75,'3-wheel','Yamaha','YZF-R1M',12323,'potsdamer platz','0000'),
			('owned','available',10,'2-wheel','Suzuki','GSX1100S',1000,'wedding','0000'),
			('leased','available',25,'3-wheel','Ducati','Panigale S',0,'spandau','0002'),
			('owned','available',99.99,'2-wheel','Triumph','Bonneville T100',120,'nauen','0000'),
			('leased','available',53.4,'2-wheel','Kawasaki','Ninja H2R',14368,'hermann straße','0002'),
			('owned','available',34.7,'3-wheel','Unagi','Model One',120,'alexander platz','0000'),
			('leased','available',23.9,'2-wheel','Segway','Kickscooter Max',150,'potsdamer platz','0000'),
			('owned','available',12.25,'2-wheel','Swagtron','Swagger 5 Elite',0,'wedding','0000'),
			('leased','available',19.89,'2-wheel','Glion','Dolly',500,'spandau','0003'),
			('owned','available',13.7,'2-wheel','Apollo','Explore',430,'nauen','0000'),
			('leased','available',15,'2-wheel','GoTrax','XR Ultra',204,'hermann straße','0003'),
			('owned','available',23.34,'2-wheel','Honda','CB 750F',3241,'alexander platz','0004'),
			('leased','available',22,'2-wheel','Yamaha','YZF-R1M',190,'potsdamer platz','0004'),
			('owned','available',22.06,'2-wheel','Suzuki','GSX1100S',6421,'wedding','0004'),
			('leased','available',26.11,'2-wheel','Ducati','Panigale S',9876,'spandau','0002'),
			('owned','available',20.7,'3-wheel','Swagtron','Swagger 5 Elite',1000,'nauen','0004'),
			('leased','available',20.04,'2-wheel','Glion','Dolly',1543,'hermann straße','0000'),
			('owned','available',19.38,'2-wheel','Apollo','Explore',3211,'alexander platz','0002'),
			('leased','available',18.72,'2-wheel','GoTrax','XR Ultra',876544,'potsdamer platz','0004')
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
	/*INSERT INTO  Vehicle_Rating
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
			(10,'232-66-5875',10)*/
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
			('Lorem ipsum dolor sit amet1'),
			('Lorem ipsum dolor sit amet2'),
			('Lorem ipsum dolor sit amet3'),
			('Lorem ipsum dolor sit amet4'),
			('Lorem ipsum dolor sit amet5'),
			('Lorem ipsum dolor sit amet6'),
			('Lorem ipsum dolor sit amet7')
	INSERT INTO Extra
		(extra_type ,rate ,Rented_By)
		VALUES
			('helmet',8.5,'469-94-3991'),
			('gloves',6.5,null),
			('elbow',0.5,NULL),
			('knee',8.5,null),
			('shoes',8.5,NULL)
			truncate table  Rents_for_time
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
			(20,6,'252-49-6099',3,'alexander platz'),
			(2,1,'469-94-3991',1.23	,'alexander platz'),
			(3,1,'469-94-3991',1.23	,'alexander platz'),
			(4,1,'469-94-3991',1.23	,'alexander platz'),
			(5,1,'469-94-3991',1.23	,'alexander platz'),
			(6,1,'469-94-3991',1.23	,'alexander platz'),
			(7,1,'469-94-3991',1.23	,'alexander platz'),
			(8,1,'469-94-3991',1.23	,'alexander platz'),
			(9,1,'469-94-3991',1.23	,'alexander platz'),
			(10,1,'469-94-3991',1.23,'alexander platz'),
			(11,1,'469-94-3991',1.23,'alexander platz'),
			(12,1,'469-94-3991',1.23,'alexander platz'),
			(13,1,'469-94-3991',1.23,'alexander platz'),
			(14,1,'469-94-3991',1.23,'alexander platz'),
			(15,1,'469-94-3991',1.23,'alexander platz'),
			(16,1,'469-94-3991',1.23,'alexander platz'),
			(17,1,'469-94-3991',1.23,'alexander platz'),
			(18,1,'469-94-3991',1.23,'alexander platz'),
			(19,1,'469-94-3991',1.23,'alexander platz'),
			(20,1,'469-94-3991',1.23,'alexander platz')
			drop table Rents_for_time
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

	INSERT INTO Payment_Info
	(P_Value,Exp_Date,Customer)
	values

	(154,'2005-10-2','232-66-5875')
	(15,'2022-10-2','041-03-4670'),
	(154,'2005-10-2','232-66-5875'),
	(12.5,'2021-10-2','232-66-5875')
-- END OF INSERATIONS
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
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
	--CREDIT

	SELECT *
		FROM Credit
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
	SELECT *
		FROM Payment_Info	
--END OF SELECTIONS
