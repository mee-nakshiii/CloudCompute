-- Insert Sample Users
INSERT INTO Users (name, email, password, role, wallet_balance)
VALUES 
('Alice', 'alice@example.com', 'pass123', 'Provider', 0.00),
('Bob', 'bob@example.com', 'pass123', 'Renter', 500.00),
('Charlie', 'charlie@example.com', 'pass123', 'Support', 0.00),
('AdminUser', 'admin@example.com', 'adminpass', 'Admin', 0.00);

-- Insert Sample Hardware
INSERT INTO Hardware (provider_id, gpu_model, vram, base_price_per_hour, status)
VALUES
(1, 'RTX 3080', 10, 5.00, 'Available'),
(1, 'RTX 3090', 24, 8.00, 'Available');

-- Insert Sample Rental
INSERT INTO Rentals (user_id, hardware_id, start_time, end_time, total_cost)
VALUES
(2, 1, NOW(), NULL, 0.00);

-- Insert Sample Transaction
INSERT INTO Transactions (user_id, amount, type, timestamp)
VALUES
(2, 100.00, 'Debit', NOW());
