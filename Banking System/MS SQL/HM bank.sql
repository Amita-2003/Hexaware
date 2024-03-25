CREATE DATABASE HMbank;
USE HMbank;

CREATE TABLE Customers(
    customer_id INT PRIMARY KEY ,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    email VARCHAR(40),
    phone_number VARCHAR(40),
    address VARCHAR(40)
);

CREATE TABLE Accounts(
    account_number INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance FLOAT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Transactions(
    transaction_id INT PRIMARY KEY,
    account_number INT,
    transaction_type VARCHAR(50),
    amount FLOAT,
    transaction_date DATE,
    FOREIGN KEY (account_number) REFERENCES Accounts(account_number)
);

INSERT INTO Customers VALUES
(1, 'Akash', 'D', 'akash@gmail.com', '1234567890', 'Chennai'),
(2, 'Karan', 'S', 'karan@gmail.com', '1876543102', 'Mumbai'),
(3, 'Jay', 'J', 'jay@gmail.com', '1551234567', 'Delhi'),
(4, 'Emily', 'B', 'emily@gmail.com', '1445556666', 'Agra'),
(5, 'Disha', 'D', 'disha@gmail.com', '1778889999', 'Bangalore'),
(6, 'Anu', 'M', 'anu@gmail.com', '1112223333', 'Chennai'),
(7, 'Dani', 'W', 'dani@gmail.com', '1223334444', 'Kolkata'),
(8, 'Olive', 'M', 'olive@gmail.com', '1267778888', 'Pune'),
(9, 'Deva', 'T', 'deva@gmail.com', '1334445555', 'Delhi'),
(10, 'Ava', 'G', 'ava@gmail.com', '1889990000', 'Pune');

INSERT INTO Accounts VALUES
(101, 1, 'Savings', 50000),
(102, 2, 'Current', 10000),
(103, 3, 'Savings', 7500),
(104, 4, 'Zero_Balance', 0),
(105, 5, 'Savings', 12000),
(106, 6, 'Current', 8500),
(107, 7, 'Savings', 3000),
(108, 8, 'Current', 20000),
(109, 9, 'Savings', 60000),
(110, 10, 'Savings', 9000);

INSERT INTO Transactions VALUES
(201, 101, 'Deposit', 1000, '2023-11-01'),
(202, 102, 'Withdrawal', 2000, '2022-12-01'),
(203, 103, 'Deposit', 1500, '2023-02-23'),
(204, 104, 'Deposit', 500, '2020-01-20'),
(205, 105, 'Withdrawal', 3000, '2020-04-05'),
(206, 106, 'Transfer', 1000, '2022-05-02'),
(207, 107, 'Deposit', 800, '2023-03-08'),
(208, 108, 'Withdrawal', 5000, '2021-08-16'),
(209, 109, 'Transfer', 2000, '2023-02-11'),
(210, 110, 'Deposit', 1200, '2022-01-09');



-- Retrieve customer information along with account details
SELECT c.first_name, c.last_name, a.account_type, c.email 
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- Retrieve transaction details along with customer and account information
SELECT t.transaction_id, t.transaction_type, t.amount, t.transaction_date, c.first_name, c.last_name, a.account_type
FROM Transactions t
JOIN Accounts a ON t.account_number = a.account_number
JOIN Customers c ON a.customer_id = c.customer_id;

-- Retrieve all accounts
SELECT * FROM Accounts;

-- Update account balance after deposit
UPDATE Accounts SET balance = balance + 500 WHERE account_number = 101;

-- Retrieve customer full names
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Customers;

-- Delete accounts with zero balance and 'savings' account type
DELETE FROM Accounts WHERE balance = 0 AND account_type = 'Savings';

-- Retrieve customer IDs with zero balance in 'savings' accounts
SELECT customer_id FROM Accounts
WHERE balance = 0 AND account_type ='Savings';

-- Retrieve customers with address 'Mumbai'
SELECT * FROM Customers WHERE address LIKE 'Mumbai';

-- Retrieve balance of account with account number 105
SELECT balance FROM Accounts WHERE account_number = 105;

-- Retrieve accounts with 'current' account type and balance > 1000
SELECT * FROM Accounts WHERE account_type = 'Current' AND balance > 1000;

-- Retrieve transactions related to account with account number 108
SELECT * FROM Transactions WHERE account_number = 108;

-- Calculate interest accrued for 'savings' accounts
SELECT customer_id, balance * 0.045 AS interest_accrued FROM Accounts WHERE account_type = 'Savings';

-- Retrieve accounts with balance < 500
SELECT * FROM Accounts WHERE balance < 500;

-- Retrieve customers with address not 'Delhi'
SELECT * FROM Customers WHERE address NOT LIKE 'Delhi';


-- Calculate average balance of all accounts
SELECT AVG(balance) AS average_balance FROM Accounts;

-- Retrieve top 10 accounts ordered by balance descending
SELECT TOP 10 * FROM Accounts ORDER BY balance DESC;

-- Calculate total deposits made on 01-Nov-23
SELECT SUM(amount) AS total_deposits FROM Transactions WHERE CONVERT(DATE, transaction_date) = '2023-11-01' AND amount > 0;

-- Retrieve oldest and newest customers along with their names
SELECT first_name, last_name, MIN(DOB) AS oldest_customer, MAX(DOB) AS newest_customer FROM Customers GROUP BY first_name, last_name;

-- Retrieve transaction details along with account type
SELECT t.*, a.account_type FROM Transactions t INNER JOIN Accounts a ON t.account_number = a.account_number;

-- Retrieve customer and account details
SELECT c.*, a.* FROM Customers c INNER JOIN Accounts a ON c.customer_id = a.customer_id;

-- Retrieve transaction details along with customer details for account with account number 105
SELECT t.*, c.* FROM Transactions t INNER JOIN Accounts a ON t.account_number = a.account_number INNER JOIN Customers c ON a.customer_id = c.customer_id WHERE a.account_number = 105;

-- Retrieve customer IDs having more than one account
SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(*) > 1;

-- Calculate transaction difference for each account
SELECT account_number, SUM(CASE WHEN transaction_type = 'Deposit' THEN amount ELSE -amount END) AS transaction_difference FROM Transactions GROUP BY account_number;

-- Calculate average daily balance for each account (assuming 500 is the number of days)
SELECT account_number, AVG(balance) AS average_daily_balance FROM Transactions GROUP BY account_number;

-- Calculate total balance for each account type
SELECT account_type, SUM(balance) AS total_balance FROM Accounts GROUP BY account_type;

-- Count transactions for each account and order by transaction count descending
SELECT account_number, COUNT(*) AS transaction_count FROM Transactions GROUP BY account_number ORDER BY transaction_count DESC;

-- Retrieve customer details along with total balance for each account type
SELECT c.customer_id, c.first_name, c.last_name, a.account_type, SUM(a.balance) AS total_balance FROM Customers c INNER JOIN Accounts a ON c.customer_id = a.customer_id GROUP BY c.customer_id, c.first_name, c.last_name, a.account_type ORDER BY total_balance DESC;

-- Retrieve transaction details for transactions with duplicate amount, date, and account ID
SELECT amount, transaction_date, account_number FROM Transactions GROUP BY amount, transaction_date, account_number HAVING COUNT(*) > 1;




-- Retrieve customer names and IDs with the maximum balance
SELECT c.first_name, c.last_name, c.customer_id AS max_balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
WHERE a.balance = (SELECT MAX(balance) FROM Accounts);

-- Calculate the average balance for customers with multiple accounts
SELECT AVG(balance) AS average_balance
FROM (
    SELECT customer_id
    FROM Accounts
    GROUP BY customer_id
    HAVING COUNT(*) > 1
) AS multiple_accounts
JOIN Accounts ON multiple_accounts.customer_id = Accounts.customer_id;

-- Retrieve accounts where the account balance is higher than the average transaction amount
SELECT *
FROM Accounts
WHERE account_number IN (
    SELECT account_number
    FROM Transactions
    GROUP BY account_number
    HAVING AVG(amount) > (SELECT AVG(amount) FROM Transactions)
);

-- Retrieve customers who have not made any transactions
SELECT *
FROM Customers
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id
    FROM Transactions
);

-- Calculate the total balance of accounts with no transactions
SELECT SUM(balance) AS total_balance_no_transactions
FROM Accounts
WHERE account_number NOT IN (
    SELECT DISTINCT account_number
    FROM Transactions
);

-- Retrieve transactions for accounts with the minimum balance
SELECT *
FROM Transactions
WHERE account_number IN (
    SELECT account_number
    FROM Accounts
    WHERE balance = (SELECT MIN(balance) FROM Accounts)
);

-- Retrieve customer IDs who have accounts of multiple types
SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;

-- Calculate the percentage of accounts for each account type
SELECT 
    account_type,
    COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;

-- Retrieve transactions for accounts associated with a specific customer ID
SELECT *
FROM Transactions
WHERE account_number IN (
    SELECT account_number
    FROM Accounts
    WHERE customer_id = (customer_id)
);

-- Calculate the total balance for each account type
SELECT 
    account_type,
    (SELECT SUM(balance) FROM Accounts WHERE account_type = A.account_type) AS total_balance
FROM Accounts A
GROUP BY account_type;

