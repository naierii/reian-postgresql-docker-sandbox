CREATE TABLE IF NOT EXISTS Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_username ON Users (username);

CREATE TABLE IF NOT EXISTS Loans (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    loan_amount INT NOT NULL,
    interest_rate DECIMAL(5, 2) NOT NULL,
    loan_term INT NOT NULL,
    start_date DATE NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE IF NOT EXISTS Payments (
    payment_id SERIAL PRIMARY KEY,
    loan_id INT NOT NULL,
    period INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (loan_id) REFERENCES Loans(id)
);

INSERT INTO Users (username, email, password) VALUES
('testuser', 'test@example.com', 'hashed_password_here');

INSERT INTO Users (id, username, email, password) VALUES
(2, 'reianviloria', 'reianviloria@gmail.com', 'FEATURE NOT YET AVAILABLE');

INSERT INTO Loans (id, user_id, loan_amount, interest_rate, loan_term, start_date) VALUES
(1, 2, 100000, 0.05, 30, '2024-12-01');

INSERT INTO Payments (loan_id, period, payment_date, payment_amount) VALUES
(1, 1, '2025-01-01', 536.82);

INSERT INTO Payments (loan_id, period, payment_date, payment_amount) VALUES
(1, 2, '2025-02-01', 536.82);