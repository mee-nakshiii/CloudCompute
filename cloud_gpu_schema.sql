CREATE DATABASE IF NOT EXISTS cloud_gpu;
USE cloud_gpu;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    role ENUM('Provider', 'Renter', 'Support', 'Admin'),
    wallet_balance DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE Hardware (
    hardware_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_id INT,
    gpu_model VARCHAR(100),
    vram INT,
    base_price_per_hour DECIMAL(10, 2),
    status ENUM('Available', 'Busy', 'Maintenance'),
    FOREIGN KEY (provider_id) REFERENCES Users(user_id)
);

CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    hardware_id INT,
    start_time DATETIME,
    end_time DATETIME,
    total_cost DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hardware_id) REFERENCES Hardware(hardware_id)
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10, 2),
    transaction_type ENUM('Credit', 'Debit'),
    timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


INSERT INTO Users (name, email, password, role, wallet_balance)
VALUES 
('Alice', 'alice@example.com', 'pass123', 'Provider', 0.00),
('Bob', 'bob@example.com', 'pass123', 'Renter', 500.00),
('Charlie', 'charlie@example.com', 'pass123', 'Support', 0.00),
('AdminUser', 'admin@example.com', 'adminpass', 'Admin', 0.00);

INSERT INTO Hardware (provider_id, gpu_model, vram, base_price_per_hour, status)
VALUES
(1, 'RTX 3080', 10, 5.00, 'Available'),
(1, 'RTX 3090', 24, 8.00, 'Available');

INSERT INTO Rentals (user_id, hardware_id, start_time, end_time, total_cost)
VALUES
(2, 1, NOW(), NULL, 0.00);

INSERT INTO Transactions (user_id, amount, transaction_type)
VALUES
(2, 100.00, 'Debit');