CREATE TABLE IF NOT EXISTS Users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_username ON Users (username);

CREATE TABLE Loans (
    id SERIAL PRIMARY KEY,
    userId INT NOT NULL,
    loanAmount DECIMAL(15, 2) NOT NULL,
    interestRate DECIMAL(5, 4) NOT NULL,
    loanTerm INT NOT NULL,
    startDate DATE NOT NULL,
    FOREIGN KEY (userId) REFERENCES Users(id)
);

CREATE TABLE Payments (
    paymentId SERIAL PRIMARY KEY,
    loanId INT NOT NULL,
    period INT NOT NULL,
    paymentDate DATE NOT NULL,
    paymentAmount DECIMAL(15, 2) NOT NULL,
    FOREIGN KEY (loanId) REFERENCES Loans(id)
);

INSERT INTO Users (username, email, password) VALUES
('testuser', 'test@example.com', 'hashed_password_here');

INSERT INTO Users (id, username, email, password) VALUES
(2, 'reianviloria', 'reianviloria@gmail.com', 'FEATURE NOT YET AVAILABLE');

INSERT INTO Loans (id, userId, loanAmount, interestRate, loanTerm, startDate) VALUES
(1, 2, 100000, 0.05, 30, '2024-12-01');

INSERT INTO Payments (loanId, period, paymentDate, paymentAmount) VALUES
(1, 1, '2025-01-01', 536.82);

INSERT INTO Payments (loanId, period, paymentDate, paymentAmount) VALUES
(1, 2, '2025-02-01', 536.82);