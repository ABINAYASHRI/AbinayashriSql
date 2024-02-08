CREATE DATABASE CRSys;
USE CRSys;

-- drop database crsys;

CREATE TABLE Vehicle(
vehicleID INT NOT NULL auto_increment ,
make VARCHAR(50),
model VARCHAR(50),
year year default null ,
dailyRate double,
status VARCHAR(15),
passengerCapacity INT,
engineCapacity INT,
PRIMARY KEY(vehicleID)
);

ALTER TABLE Vehicle auto_increment=1001;


CREATE TABLE Customer(
customerID INT NOT NULL auto_increment,
firstName VARCHAR(50),
lastName VARCHAR(50),
email VARCHAR(50),
phoneNumber VARCHAR(15),
PRIMARY KEY(customerID)
);

ALTER TABLE Customer auto_increment=3001;


CREATE TABLE Lease(
    leaseID INT NOT NULL auto_increment ,
    vehicleID INT,
    FOREIGN KEY (vehicleID) references Vehicle(vehicleID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    customerID INT,
    FOREIGN KEY (customerID) references Customer(customerID)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    startDate DATE DEFAULT NULL, 
    endDate DATE DEFAULT NULL ,
    type VARCHAR(50),
    PRIMARY KEY(leaseID)
);

ALTER TABLE Lease auto_increment=7001;




-- CREATE TABLE Payment(
--         paymentID INT NOT NULL auto_increment,
--         leaseID INT,
--         FOREIGN KEY (leaseID) references Lease(leaseID)
--         ON DELETE CASCADE
--         ON UPDATE CASCADE,
--         paymentDate DATE ,
--         amount double,
--         PRIMARY KEY(paymentID)
-- );

ALTER TABLE Payment auto_increment=5001;


show tables;
select * from customer;
select * from lease;
select * from payment;
select * from vehicle;

-- Inserting data into the Vehicle table
INSERT INTO Vehicle (make, model, year, dailyRate, status, passengerCapacity, engineCapacity)
VALUES 
('Toyota', 'Corolla', 2019, 50.00, 'available', 5, 1800),
('Honda', 'Civic', 2020, 55.00, 'notAvailable', 5, 2000),
('Ford', 'Mustang', 2021, 80.00, 'available', 4, 3500),
('Chevrolet', 'Silverado', 2018, 70.00, 'available', 3, 5000),
('BMW', 'X5', 2022, 100.00, 'available', 5, 3000);

-- Inserting data into the Customer table
INSERT INTO Customer (firstName, lastName, email, phoneNumber)
VALUES 
('Alice', 'Johnson', 'alicejohnson@email.com', '1112223333'),
('Bob', 'Williams', 'bobwilliams@email.com', '4445556666'),
('Carol', 'Brown', 'carolbrown@email.com', '7778889999'),
('David', 'Taylor', 'davidtaylor@email.com', '1234567890'),
('Emma', 'Anderson', 'emmaanderson@email.com', '9876543210');

-- Inserting data into the Lease table
INSERT INTO Lease (vehicleID, customerID, startDate, endDate, type)
VALUES 
(1001, 3001, '2024-02-04', '2024-02-07', 'DailyLease'),
(1002, 3002, '2024-02-10', '2024-03-10', 'MonthlyLease'),
(1003, 3003, '2024-02-15', '2024-02-20', 'DailyLease'),
(1004, 3004, '2024-02-20', '2024-02-25', 'DailyLease'),
(1005, 3005, '2024-03-01', '2024-03-31', 'MonthlyLease');

-- Inserting data into the Payment table
INSERT INTO Payment (leaseID, paymentDate, amount)
VALUES 
(7001, '2024-02-06', 1500.00),
(7002, '2024-02-15', 2500.00),
(7003, '2024-02-18', 1800.00),
(7004, '2024-02-24', 2000.00),
(7005, '2024-03-05', 3000.00);


select * from customer;
select * from payment;
select * from vehicle;
select * from lease;

CREATE TABLE Payment(
        paymentID INT NOT NULL auto_increment,
        leaseID INT,
        FOREIGN KEY (leaseID) references Lease(leaseID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
        paymentDate datetime default now(),
        amount double,
        PRIMARY KEY(paymentID)
);

select * from Payment;
drop table Payment;

use sisdb;
show tables;
