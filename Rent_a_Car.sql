create database Rent_a_Car

----------------------------------------------------------------------------------------

use Rent_a_Car

create table Employee (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	EmployeeFirstName nvarchar(128) NOT NULL,
	EmployeeLastName nvarchar(128) NOT NULL,
)

create table VehicleCategory (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Category nvarchar(32)
		CHECK (Category = 'Economy' OR Category = 'Compact' OR Category = 'Mid-size' OR Category = 'Full-size' OR Category = 'Luxury'
		OR Category = 'Convertible' OR Category = 'SUV' OR Category = 'Mini Van' OR Category = 'Passenger Van' ) NOT NULL,
	WinterPricePerDay float NOT NULL,
	SummerPricePerDay float NOT NULL
)

create table Manufacturer (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Manufacturer nvarchar(64) UNIQUE NOT NULL
)

create table Vehicle (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	VehicleCategoryId int FOREIGN KEY REFERENCES VehicleCategory(Id),
	VehicleType nvarchar(32) CHECK(VehicleType = 'Car' OR VehicleType = 'Mini Van' OR VehicleType = 'Passenger Van') NOT NULL,
	ManufacturerId int FOREIGN KEY REFERENCES Manufacturer(Id),
	Model nvarchar(64) NOT NULL,
	Colour nvarchar(64) NOT NULL,
	Mileage float NOT NULL,
	RegistrationNumber nvarchar(32) UNIQUE NOT NULL
)

create table Registration (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	VehicleId int FOREIGN KEY REFERENCES Vehicle(id) NOT NULL,
	RegistrationDate datetime2 NOT NULL,
	RegistrationExpirationDate datetime2 NOT NULL
)

create table Rent (
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	EmployeeId int FOREIGN KEY REFERENCES Employee(Id) NOT NULL,
	VehicleId  int FOREIGN KEY REFERENCES Vehicle(Id) NOT NULL,
	BuyerFirstName nvarchar(128) NOT NULL,
	BuyerLastName nvarchar(128) NOT NULL,
	BuyerOib nvarchar(32) NOT NULL,
	BuyerBirthDate datetime2 NOT NULL,
	DrivingLicenseNumber nvarchar(25) NOT NULL,
	CreditCardNumber nvarchar(25) NOT NULL,
	PickupDate datetime2 NOT NULL,
	DropOffDate datetime2,
	TransactionTime datetime2 NOT NULL,
)

insert into Employee (EmployeeFirstName, EmployeeLastName) VALUES
('Alan', 'Turing'),
('Leonhard', 'Euler'),
('Dennis', 'Ritchie'),
('Bjarne', 'Stroustrup'),
('Linus', 'Torvalds')

insert into VehicleCategory (Category, WinterPricePerDay, SummerPricePerDay) VALUES 
('Economy', 100, 125),
('Compact', 200, 250),
('Mid-size', 500, 625),
('Full-size', 1000, 1250),
('Luxury', 2000, 2500),
('Convertible', 5000, 6250),
('SUV', 10000, 12500),
('Mini Van', 15000, 18750),
('Passenger Van', 20000, 25000)

insert into Manufacturer (Manufacturer) VALUES
('Ford'),
('Chevrolet'),
('Mitsubishi'),
('Nissan'),
('Hyundai'),
('VW'),
('Honda'),
('Toyota'),
('Chrysler'),
('Audi'),
('BMW'),
('Dodge'),
('Mercedes-Benz')

insert into Vehicle (VehicleType, ManufacturerId, Model, Colour, Mileage, RegistrationNumber, VehicleCategoryId) VALUES
('Car', 1, 'Fiesta', 'White', 81112.00, '000000', 1),
('Car', 1, 'Fiesta', 'Silver', 41112.00, '111111', 1),
('Car', 2, 'Spark', 'Blue', 78916.00, '000001', 1),
('Car', 3, 'Mirage', 'Red', 70590.00, '000010', 1),
('Car', 4, 'Versa', 'Silver', 38140.00, '000011', 2),
('Car', 1, 'Focus', 'Orange', 75349.00, '000100', 2),
('Car', 5, 'Elantra', 'Green', 89981.00, '000101', 3),
('Car', 6, 'Jetta', 'Bronze', 89981.00, '000110', 3),
('Car', 7, 'Accord', 'Yellow', 98887.00, '000111', 3),
('Car', 8, 'Camry', 'White', 38140.00, '001000', 3),
('Car', 5, 'Sonata', 'White', 75349.00, '001001', 4),
('Car', 4, 'Maxima', 'Blue', 70590.00, '001010', 4),
('Car', 2, 'Impala', 'Blue', 15618.00, '001011', 4),
('Car', 8, 'Avalon', 'Red', 10736.00, '0011100', 4),
('Car', 9, '300', 'Red', 26098.00, '001101', 5),
('Car', 10, 'A-5', 'Silver', 32437.00, '001110', 5),
('Car', 11, '5-series', 'Silver', 11443.00, '001111', 5),
('Car', 1, 'Mustang', 'Silver', 33152.00, '011000', 6),
('Car', 2, 'Camaro', 'Green', 11443.00, '011001', 6),
('Car', 11, '4-series', 'Green', 70590.00, '011010', 6),
('Car', 1, 'Explorer', 'Bronze', 11443.00, '011011', 7),
('Car', 7, 'CRV', 'Bronze', 33152.00, '011100', 7),
('Car', 4, 'Pathfinder', 'Black', 38140.00, '011101', 7),
('Mini Van', 9, 'Pacifica', 'Black', 32437.00, '011110', 8),
('Mini Van', 12, 'Grand Caravan', 'Black', 7549.00, '011111', 8),
('Mini Van', 8, 'Sienna', 'Orange', 7349.00, '111000', 8),
('Passenger Van', 1, 'Transit Wagon', 'Black', 75349.00, '111001', 9),
('Passenger Van', 13, 'Sprinter', 'White', 5349.00, '111010', 9),
('Passenger Van', 4, 'NV Passenger', 'Silver', 5369.00, '111011', 9)

insert into Registration(RegistrationDate, RegistrationExpirationDate, VehicleId) VALUES
('2020-01-01', '2021-01-01', 1),
('2019-01-01', '2020-01-01', 1),
('2018-01-01', '2019-01-01', 1),
('2020-03-01', '2021-03-01', 2),
('2019-03-01', '2020-03-01', 2),
('2019-11-01', '2020-11-01', 3),
('2018-11-01', '2019-11-01', 3),
('2020-01-10', '2021-01-10', 4),
('2020-07-01', '2021-07-01', 5),
('2020-08-01', '2021-08-01', 6),
('2020-09-01', '2021-09-01', 7),
('2020-10-01', '2021-10-01', 8),
('2020-11-01', '2021-11-01', 9),
('2020-12-01', '2021-12-01', 10),
('2019-01-01', '2020-01-01', 11),
('2019-02-01', '2020-02-01', 12),
('2019-03-01', '2020-03-01', 13),
('2019-04-01', '2020-04-01', 14),
('2019-05-01', '2020-05-01', 15),
('2019-06-01', '2020-06-01', 16),
('2019-07-01', '2020-07-01', 17),
('2019-08-01', '2020-08-01', 18),
('2019-09-01', '2020-09-01', 19),
('2019-10-01', '2020-10-01', 20),
('2019-11-01', '2020-11-01', 21),
('2019-12-01', '2020-12-01', 22),	
('2020-01-01', '2021-01-01', 23),
('2020-02-01', '2021-02-01', 24),
('2020-03-01', '2021-03-01', 25),
('2020-04-01', '2021-04-01', 26),
('2020-05-01', '2021-05-01', 27),
('2020-06-01', '2021-06-01', 28),
('2020-07-01', '2021-07-01', 29)

insert into Rent (VehicleId, EmployeeId, BuyerFirstName, BuyerLastName, BuyerBirthDate, BuyerOib, DrivingLicenseNUmber, CreditCardNumber, PickupDate, DropOffDate, TransactionTime) VALUES
(1, 1, 'Alex',	'Haley', '1921-08-11', 'Alex-oib',						'111001', '222001', '2020-01-01 9:00', '2020-02-01 12:00', '2020-01-01 8:00'),
(2, 2, 'Aurelije',	'Augustin', '0354-11-13', 'Aurelije-oib',			'111002', '222002', '2020-01-10 12:30', '2020-01-19 18:00', '2020-01-10 11:00'),
(3, 3, 'John Ronald	 Reuel', 'Tolkien', '1892-03-01', 'JRR-oib',		'111003', '222003', '2020-02-02 8:00', '2020-02-05 20:00', '2020-02-01 8:00'),
(4, 4, 'Christopher','Tolkien', '1924-11-21', 'Christopher-oib',		'111004', '222004', '2020-02-07 7:00', '2020-02-21 19:00', '2020-02-06 12:00'),
(5, 5, 'George Raymond Richard', 'Martin', '1984-09-20', 'George-oib',	'111005', '222005', '2020-03-05 12:00', '2020-03-15 18:00', '2020-03-05 9:00'),
(6, 1, 'Andrzej', 'Sapkowski', '1948-06-21', 'Andrzej-oib',				'111006', '222006', '2020-02-28 8:00', '2020-03-07 20:00', '2020-03-03 7:30'),
(7, 2, 'Guy Gavriel', 'Kay', '1954-11-07', 'Guy-oib',					'111007', '222007', '2020-04-14 13:00', '2020-04-29 16:00', '2020-04-14 12:00'),
(8, 3, 'Joanne', 'Rowling', '1965-07-31', 'Joanne-oib',					'111008', '222008', '2020-04-14 9:00', '2020-04-23 10:00', '2020-04-14 8:00'),
(9, 4, 'Albert', 'Einstein', '1879-03-14', 'Albert-oib',				'111009', '222009', '2020-04-16 19:00', '2020-04-21 23:32', '2020-04-16 16:00'),
(10, 5, 'Georg Friedrich Bernhard', 'Riemann','1826-09-12','Georg-oib', '111010', '222010', '2020-10-04 16:05', '2020-10-24 14:20', '2020-10-04 12:00'),
(12, 1, 'Piet', 'Mondrian', '1872-07-03', 'Piet-oib',					'111011', '222011', '2020-11-02 14:15', '2020-11-11 12:25', '2020-11-02 11:10'),
(14, 2, 'Christoph', 'Waltz', '1956-03-10', 'Christoph-oib',			'111012', '222012', '2019-01-13 13:55', '2019-01-24 09:20', '2019-01-13 10:05'),
(16, 3, 'Joe', 'Satriani', '1956-07-15', 'Joe-oib',						'111013', '222013', '2019-07-01 13:33', '2019-08-01 15:00', '2019-07-01 11:10'),
(18, 4, 'James', 'LaBrie', '1963-05-05', 'James-oib',					'111014', '222014', '2019-08-03 12:25', '2019-08-28 13:50', '2019-08-03 12:00'),
(20, 1, 'Hansi', 'Kürsch', '1966-10-10', 'Hansi-oib',					'111015', '222015', '2019-12-01 15:35', '2020-01-15 12:35', '2019-12-01 15:30'),
(22, 1, 'Tommy', 'Karevik', '1981-01-11', 'Tommy-oib',					'111016', '222016', '2020-07-02 15:40', '2020-07-22 11:45', '2020-07-02 15:20'),
(24, 2, 'Anthony Arjen', 'Lucassen', '1960-04-03', 'Anthony-oib',		'111017', '222017', '2020-07-01 15:20', '2020-07-12 15:45', '2020-07-01 13:00'),
(26, 3, 'Quentin', 'Tarantino', '1963-03-27', 'Quentin-oib',			'111018', '222018', '2020-08-24 11:55', '2020-09-10 14:20', '2020-08-24 9:32'),
(28, 1, 'Floor', 'Jansen', '1981-02-21', 'Floor-oib',					'111019', '222019', '2020-09-15 15:15', '2020-10-20 12:55', '2020-09-15 13:10'),
(29, 5, 'Bruce', 'Dickinson', '1958-08-07',	'Bruce-oib',				'111020', '222020', '2020-08-09 14:20', '2020-08-30 15:10', '2020-08-09 11:28'),
(27, 4, 'Quentin', 'Tarantino', '1963-03-27', 'Quentin-oib',			'111018', '222018', '2019-08-10 11:55', '2019-08-25 14:20', '2019-08-10 10:00'),
(14, 3, 'Christoph', 'Waltz', '1956-03-10', 'Christoph-oib',			'111012', '222012', '2020-02-13 13:55', '2020-02-24 09:20', '2020-02-13 13:05'),
(15, 2, 'Floor', 'Jansen', '1981-02-21', 'Floor-oib',					'111019', '222019', '2020-10-15 15:15', '2020-10-29 12:55', '2020-10-15 11:05')


-- Dohvatiti sva vozila kojima je istekla registracija
select MIN(m.Manufacturer) AS Manufacturer, MIN(v.Model) AS Model, MIN(v.RegistrationNumber) AS RegistrationNumber,
	   MAX(r.RegistrationDate) AS LastRegistrationDate, MAX(r.RegistrationExpirationDate) AS RegistrationExpiredAt
from Registration r
JOIN Vehicle v ON r.VehicleId = v.Id
JOIN Manufacturer m ON v.ManufacturerId = m.Id
GROUP BY v.Id
HAVING MAX(r.RegistrationExpirationDate) < GETDATE()

-- Dohvatiti sva vozila kojima registracija ističe unutar idućih mjesec dana
select MIN(m.Manufacturer) AS Manufacturer, MIN(v.Model) AS Model, MIN(v.RegistrationNumber) AS RegistrationNumber,
	   MAX(r.RegistrationDate) AS LastRegistrationDate, MAX(r.RegistrationExpirationDate) AS RegistrationExpiresInside30Day
from Registration r
JOIN Vehicle v ON r.VehicleId = v.Id
JOIN Manufacturer m ON v.ManufacturerId = m.Id
GROUP BY v.Id
HAVING MAX(r.RegistrationExpirationDate) BETWEEN GETDATE() AND DATEADD(MONTH, 1, GETDATE())

-- Dohvatiti koliko vozila postoji po vrsti
select v.VehicleType, COUNT(*) AS KvantityByType from Vehicle v
GROUP BY v.VehicleType

--	Dohvatiti zadnjih 5 najmova koje je ostvario neki zaposlenik
select TOP(5) e.EmployeeFirstName, e.EmployeeLastName, r.TransactionTime,
			  m.Manufacturer, v.Model, v.RegistrationNumber, r.BuyerFirstName, r.BuyerLastName
from Rent r
JOIN Employee e ON r.EmployeeId = e.Id
JOIN Vehicle v ON r.VehicleId = v.Id
JOIN Manufacturer m ON v.ManufacturerId = m.Id
WHERE e.Id = 1
ORDER BY r.TransactionTime DESC


--Izračunati ukupnu cijenu najma za određeni najam
select v.Model, r.PickupDate, r.DropOffDate,
CASE
	When DATEPART(month, r.PickupDate) >= '10' OR DATEPART(month, r.PickupDate) < '3' THEN 
		CASE
			WHEN  DATEPART(month, r.DropOffDate) >= '10' OR DATEPART(month, r.DropOffDate) < '3' 
				THEN (select CAST(round(DATEDIFF(MINUTE, r.PickupDate, r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.WinterPricePerDay AS nvarchar))
			ELSE
				(select CAST(round(DATEDIFF(MINUTE, r.PickupDate, CAST('2020-03-1' AS datetime2)) / (24.0 * 60) * 2, 0) / 2 * vc.WinterPricePerDay
						   + round(DATEDIFF(MINUTE, CAST('2020-03-1' AS datetime2), r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.SummerPricePerDay
				AS nvarchar))
		END
	ELSE
		CASE
			WHEN  DATEPART(month, r.DropOffDate) < '10' AND DATEPART(month, r.DropOffDate) >= '3' 
				THEN (select CAST(round(DATEDIFF(MINUTE, r.PickupDate, r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.SummerPricePerDay AS nvarchar))
			ELSE 
				(select CAST(round(DATEDIFF(MINUTE, r.PickupDate, CAST('2020-10-1' AS datetime2)) / (24.0 * 60) * 2, 0) / 2 * vc.SummerPricePerDay
						   + round(DATEDIFF(MINUTE, CAST('2020-10-1' AS datetime2), r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.WinterPricePerDay
				AS nvarchar))
		END
END AS PriceOfRent
from Rent r
JOIN Vehicle v ON r.VehicleId = v.Id
JOIN VehicleCategory vc ON v.VehicleCategoryId = vc.Id
WHERE r.id = 1

-------------------------evo čisto da se vidi šta kojem razdoblju pripada-------------------------------|
select v.Id AS VehicleId, r.Id AS RentId, v.Model, r.PickupDate, r.DropOffDate, 		              --|
round(DATEDIFF(MINUTE, r.PickupDate , r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 AS TimeDifferenceInDays,--|
vc.SummerPricePerDay, vc.WinterPricePerDay,							                                  --|
CASE												                                                  --|
	When DATEPART(month, r.PickupDate) >= '10' OR DATEPART(month, r.PickupDate) < '3' THEN 	          --|
		CASE																						  --|
			WHEN  DATEPART(month, r.DropOffDate) >= '10' OR DATEPART(month, r.DropOffDate) < '3' 	  --|
				THEN 'Interval je untar zimske tarife'												  --|
			ELSE																					  --|s
				'Interval počinje u zimskoj ali završava u ljetnoj tarifi'						      --|
		END																							  --|
	ELSE																							  --|
		CASE																						  --|
			WHEN  DATEPART(month, r.DropOffDate) < '10' AND DATEPART(month, r.DropOffDate) >= '3' 	  --|
				THEN 'Interval je unutar ljetne tarife'												  --|
			ELSE 'Interval počinje u ljetnoj ali završava u zimskoj tarifi'						      --|
		END																							  --|
END AS PriceOfRent																					  --|
from Rent r																							  --|
JOIN Vehicle v ON r.VehicleId = v.Id																  --|
JOIN VehicleCategory vc ON v.VehicleCategoryId = vc.Id												  --|
--------------------------------------------------------------------------------------------------------|


--Dohvatiti sve kupce najmova ikad, s tim da se ne ponavljaju u rezultatima
select MIN(r.BuyerFirstName), MIN(r.BuyerLastName) AS BuyerLastName, MIN(r.BuyerOib) from Rent r
GROUP BY r.BuyerOib
ORDER BY BuyerLastName

-- Dohvatiti za svakog zaposlenika timestamp zadnjeg najma kojeg je ostvario
select MIN(e.EmployeeFirstName) AS EmployeeFirstName, MIN(e.EmployeeLastName) AS EmployeeLastName, MAX(r.TransactionTime) AS LastTransaction
from Employee e
JOIN Rent r ON e.Id = r.EmployeeId
GROUP BY e.Id


-- Dohvatiti broj vozila svake marke koji rent-a-car ima
select MIN(m.Manufacturer), COUNT(*) AS NumberOfVehicleByManufacturer from Vehicle v
JOIN Manufacturer m ON v.ManufacturerId = m.Id
GROUP BY m.Id


-- Arhivirati sve najmove koji su završili u novu tablicu.
 --Osim već postojećih podataka u najmu, arhivirana tablica će sadržavati i podatak koliko je taj najam koštao.
 select r.*,
CASE
	When DATEPART(month, r.PickupDate) >= '10' OR DATEPART(month, r.PickupDate) < '3' THEN 
		CASE
			WHEN  DATEPART(month, r.DropOffDate) >= '10' OR DATEPART(month, r.DropOffDate) < '3' 
				THEN (select CAST(round(DATEDIFF(MINUTE, r.PickupDate, r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.WinterPricePerDay AS nvarchar))
			ELSE
				(select CAST(round(DATEDIFF(MINUTE, r.PickupDate, CAST('2020-03-1' AS datetime2)) / (24.0 * 60) * 2, 0) / 2 * vc.WinterPricePerDay
						   + round(DATEDIFF(MINUTE, CAST('2020-03-1' AS datetime2), r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.SummerPricePerDay
				AS nvarchar))
		END
	ELSE
		CASE
			WHEN  DATEPART(month, r.DropOffDate) < '10' AND DATEPART(month, r.DropOffDate) >= '3' 
				THEN (select CAST(round(DATEDIFF(MINUTE, r.PickupDate, r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.SummerPricePerDay AS nvarchar))
			ELSE 
				(select CAST(round(DATEDIFF(MINUTE, r.PickupDate, CAST('2020-10-1' AS datetime2)) / (24.0 * 60) * 2, 0) / 2 * vc.SummerPricePerDay
						   + round(DATEDIFF(MINUTE, CAST('2020-10-1' AS datetime2), r.DropOffDate) / (24.0 * 60) * 2, 0) / 2 * vc.WinterPricePerDay
				AS nvarchar))
		END
END AS PriceOfRent
into CompletedRents
from Rent r
JOIN Vehicle v ON r.VehicleId = v.Id
JOIN VehicleCategory vc ON v.VehicleCategoryId = vc.Id
where r.DropOffDate < GETDATE()

select * from CompletedRents

-- Pobrojati koliko je najmova bilo po mjesecu, u svakom mjesecu 2020. godine.
select MONTH(r.TransactionTime) AS Month, COUNT(*) AS RentsPerMonthIn2020 from Rent r
WHERE YEAR(r.TransactionTime) = '2020'
GROUP BY MONTH(r.TransactionTime)


-- Za sva vozila određene vrste, osim informaciju o vozilu, ispisati tekstualnu informaciju treba li registrirati vozilo unutar idućih mjesec dana (‘Treba registraciju’, ‘Ne treba registraciju’)
select MIN(m.Manufacturer) AS Manufacturer, MIN(v.Model) AS Model, MIN(v.RegistrationNumber) AS RegistrationNumber,
MAX(r.RegistrationDate) AS LastRegistrationDate, MAX(r.RegistrationExpirationDate) AS RegistrationExpiresInside30Day,
CASE
	WHEN MAX(r.RegistrationExpirationDate) < DATEADD(MONTH, 1, GETDATE()) THEN 'Treba registraciju'
	ELSE 'Ne treba registraciju'
END
AS NeedsRegistration
from Registration r
JOIN Vehicle v ON r.VehicleId = v.Id
JOIN Manufacturer m ON v.ManufacturerId = m.Id
WHERE v.VehicleType = 'Car'
GROUP BY v.Id

-- Dohvatiti broj najmova po vrsti vozila čija duljina najma (razdoblje) prelazi prosječnu duljinu najma
select MIN(v.VehicleType), COUNT(*) AS NCount
from Rent r
JOIN Vehicle v ON r.VehicleId = v.Id
WHERE CAST(DATEDIFF(DAY, r.PickupDate, r.DropOffDate) AS float) > (
	select AVG(CAST(DATEDIFF(DAY, r.PickupDate, r.DropOffDate) AS float))
	from Rent  r
)
GROUP BY v.VehicleType
