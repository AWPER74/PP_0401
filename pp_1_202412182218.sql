﻿--
-- Script was generated by Devart dbForge Studio for MySQL, Version 9.2.128.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 18.12.2024 22:18:16
-- Server version: 5.5.25
-- Client version: 4.1
--

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set SQL mode
-- 
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

--
-- Set default database
--
USE pp_1;

--
-- Drop table `путевки`
--
DROP TABLE IF EXISTS путевки;

--
-- Drop table `клиенты`
--
DROP TABLE IF EXISTS клиенты;

--
-- Drop table `виды_жилья`
--
DROP TABLE IF EXISTS виды_жилья;

--
-- Drop table `пансионаты`
--
DROP TABLE IF EXISTS пансионаты;

--
-- Drop table `туры`
--
DROP TABLE IF EXISTS туры;

--
-- Set default database
--
USE pp_1;

--
-- Create table `туры`
--
CREATE TABLE туры (
  Идентификатор int(11) NOT NULL,
  Name varchar(255) NOT NULL,
  TransportationType varchar(255) DEFAULT NULL,
  AccommodationType varchar(255) DEFAULT NULL,
  MealPlan varchar(255) DEFAULT NULL,
  PricePerDay decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (Идентификатор)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `пансионаты`
--
CREATE TABLE пансионаты (
  Идентификатор int(11) NOT NULL,
  Name varchar(255) NOT NULL,
  Address varchar(255) DEFAULT NULL,
  City varchar(255) DEFAULT NULL,
  Country varchar(255) DEFAULT NULL,
  Phone varchar(20) DEFAULT NULL,
  Description text DEFAULT NULL,
  NumberOfRooms int(11) DEFAULT NULL,
  HasPool bit(1) DEFAULT NULL,
  HasMedicalServices bit(1) DEFAULT NULL,
  HasSpa bit(1) DEFAULT NULL,
  Rating varchar(50) DEFAULT NULL,
  DistanceToSea float DEFAULT NULL,
  PRIMARY KEY (Идентификатор)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `виды_жилья`
--
CREATE TABLE виды_жилья (
  Идентификатор int(11) NOT NULL,
  Name varchar(255) NOT NULL,
  Category varchar(50) DEFAULT NULL,
  LodgingID int(11) DEFAULT NULL,
  Description text DEFAULT NULL,
  PricePerNight decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (Идентификатор)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create foreign key
--
ALTER TABLE виды_жилья
ADD CONSTRAINT `@i0@o0@k0@n1_@m0@o0@r0@o1@r1_ibfk_1` FOREIGN KEY (LodgingID)
REFERENCES пансионаты (Идентификатор);

--
-- Create table `клиенты`
--
CREATE TABLE клиенты (
  Идентификатор int(11) NOT NULL,
  LastName varchar(255) NOT NULL,
  FirstName varchar(255) NOT NULL,
  MiddleName varchar(255) DEFAULT NULL,
  PassportData varchar(50) DEFAULT NULL,
  BirthDate date DEFAULT NULL,
  Address varchar(255) DEFAULT NULL,
  City varchar(255) DEFAULT NULL,
  Phone varchar(20) DEFAULT NULL,
  PRIMARY KEY (Идентификатор)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create table `путевки`
--
CREATE TABLE путевки (
  Идентификатор int(11) NOT NULL,
  ClientID int(11) NOT NULL,
  LodgingID int(11) DEFAULT NULL,
  RoomTypeID int(11) DEFAULT NULL,
  TourID int(11) DEFAULT NULL,
  ArrivalDate date NOT NULL,
  DepartureDate date NOT NULL,
  Children bit(1) DEFAULT NULL,
  HasMedicalInsurance bit(1) DEFAULT NULL,
  NumberOfPeople int(11) NOT NULL,
  Price decimal(10, 2) NOT NULL,
  TotalAmount decimal(10, 2) NOT NULL,
  PRIMARY KEY (Идентификатор)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf8mb3,
COLLATE utf8mb3_general_ci,
ROW_FORMAT = COMPACT;

--
-- Create foreign key
--
ALTER TABLE путевки
ADD CONSTRAINT `@v0@z0@y0@l0@i0@q0@o0_ibfk_1` FOREIGN KEY (ClientID)
REFERENCES клиенты (Идентификатор);

--
-- Create foreign key
--
ALTER TABLE путевки
ADD CONSTRAINT `@v0@z0@y0@l0@i0@q0@o0_ibfk_2` FOREIGN KEY (LodgingID)
REFERENCES пансионаты (Идентификатор);

--
-- Create foreign key
--
ALTER TABLE путевки
ADD CONSTRAINT `@v0@z0@y0@l0@i0@q0@o0_ibfk_3` FOREIGN KEY (RoomTypeID)
REFERENCES виды_жилья (Идентификатор);

--
-- Create foreign key
--
ALTER TABLE путевки
ADD CONSTRAINT `@v0@z0@y0@l0@i0@q0@o0_ibfk_4` FOREIGN KEY (TourID)
REFERENCES туры (Идентификатор);

-- 
-- Dumping data for table туры
--
INSERT INTO туры VALUES
(1, 'Тур на море', 'Авиа', 'Отель', 'Все включено', 5000.00),
(2, 'Летний отдых', 'Авто', 'Пансионат', 'Завтрак', 4000.00),
(3, 'Зимний отдых', 'Поезд', 'Курорт', 'Полный пансион', 7000.00);

-- 
-- Dumping data for table пансионаты
--
INSERT INTO пансионаты VALUES
(1, 'Пансионат Золотая Ривьера', 'ул. Морская, 1', 'Сочи', 'Россия', '+78000000001', 'Красивая зона отдыха у моря', 50, True, True, True, '4 звезды', 0.5),
(2, 'Пансионат Лесная Сказка', 'ул. Лесная, 5', 'Калуга', 'Россия', '+78000000002', 'Отдых в тишине леса', 30, False, True, False, '3 звезды', 10),
(3, 'Пансионат Солнечный Берег', 'пр. Солнечный, 10', 'Анапа', 'Россия', '+78000000003', 'Пансионат с видом на море', 40, True, False, True, '5 звезд', 0.2);

-- 
-- Dumping data for table клиенты
--
INSERT INTO клиенты VALUES
(1, 'Иванов', 'Иван', 'Иванович', '1234567890', '1980-01-01', 'ул. Ленина, 1', 'Москва', '+79000000001'),
(2, 'Петров', 'Петр', 'Петрович', '0987654321', '1990-02-02', 'ул. Победы, 2', 'Санкт-Петербург', '+79000000002'),
(3, 'Сидоров', 'Сидор', 'Сидорович', '1122334455', '2000-03-03', 'ул. Солнечная, 3', 'Нижний Новгород', '+79000000003');

-- 
-- Dumping data for table виды_жилья
--
INSERT INTO виды_жилья VALUES
(1, 'Стандартный номер', 'Стандарт', 1, 'Уютный номер с видом на море', 3000.00),
(2, 'Люкс', 'Люкс', 1, 'Роскошный номер с балконом', 6000.00),
(3, 'Эконом', 'Эконом', 2, 'Просторный номер по доступной цене', 1500.00);

-- 
-- Dumping data for table путевки
--
INSERT INTO путевки VALUES
(1, 1, 1, 1, 1, '2023-07-01', '2023-07-10', False, True, 2, 27000.00, 27000.00),
(2, 2, 2, 3, 2, '2023-08-01', '2023-08-05', True, False, 3, 7500.00, 7500.00),
(3, 3, 1, 2, 3, '2023-09-10', '2023-09-15', False, True, 1, 30000.00, 30000.00);

-- 
-- Restore previous SQL mode
-- 
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;