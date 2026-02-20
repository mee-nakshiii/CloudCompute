DROP TABLE IF EXISTS Transactions;
DROP TABLE IF EXISTS Rentals;
DROP TABLE IF EXISTS Hardware;
DROP TABLE IF EXISTS Users;


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    role ENUM('Provider', 'Renter', 'Admin', 'Support') NOT NULL,
    wallet_balance DECIMAL(10,2) DEFAULT 0.00
);

CREATE TABLE Hardware (
    hardware_id INT AUTO_INCREMENT PRIMARY KEY,
    provider_id INT NOT NULL,
    gpu_model VARCHAR(100) NOT NULL,
    vram INT NOT NULL,
    base_price_per_hour DECIMAL(10,2) NOT NULL,
    status ENUM('Available', 'Busy', 'Maintenance') DEFAULT 'Available',
    FOREIGN KEY (provider_id) REFERENCES Users(user_id)
);

CREATE TABLE Rentals (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    hardware_id INT NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME,
    total_cost DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (hardware_id) REFERENCES Hardware(hardware_id)
);

CREATE TABLE Transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    transaction_type ENUM('Credit', 'Debit') NOT NULL,
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
