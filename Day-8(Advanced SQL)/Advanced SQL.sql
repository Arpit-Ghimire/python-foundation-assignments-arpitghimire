-- Banking SQL Practice: schema
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    gender          VARCHAR(10),
    dob             DATE,
    city            VARCHAR(50),
    state           VARCHAR(50),
    country         VARCHAR(50),
    phone           VARCHAR(20),
    email           VARCHAR(100),
    occupation      VARCHAR(50),
    annual_income   NUMERIC(14,2),
    credit_score    INT,
    kyc_status      VARCHAR(20),
    join_date       DATE,
    risk_category   VARCHAR(20)
);

CREATE TABLE accounts (
    account_id       INT PRIMARY KEY,
    customer_id      INT,  -- FK added separately below, AFTER data is loaded
    account_type     VARCHAR(30),
    branch           VARCHAR(50),
    ifsc_code        VARCHAR(15),
    currency         VARCHAR(5),
    balance          NUMERIC(14,2),
    interest_rate    NUMERIC(5,2),
    open_date        DATE,
    close_date       DATE,
    status           VARCHAR(20),
    is_joint_account BOOLEAN
);

CREATE TABLE transactions (
    transaction_id  INT PRIMARY KEY,
    account_id      INT REFERENCES accounts(account_id),
    txn_date        DATE,
    txn_time        TIME,
    txn_type        VARCHAR(30),
    channel         VARCHAR(30),
    amount          NUMERIC(14,2),
    currency        VARCHAR(5),
    balance_after   NUMERIC(14,2),
    merchant        VARCHAR(60),
    description     VARCHAR(100),
    is_flagged      BOOLEAN
);



-- ============================================================
-- Question 1
-- ============================================================
SELECT a.account_id, a.account_type, a.branch, a.balance, a.status,
       c.first_name || ' ' || c.last_name AS customer_name, c.email
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
WHERE a.status = 'Active';

-- ============================================================
-- Question 2
-- ============================================================
SELECT c.*
FROM customers c
LEFT JOIN accounts a ON a.customer_id = c.customer_id
WHERE a.account_id IS NULL;

-- ============================================================
-- Question 3
-- ============================================================
SELECT a.*
FROM accounts a
LEFT JOIN customers c ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- ============================================================
-- Question 4
-- ============================================================
SELECT c.customer_id, a.account_id,
       CASE
         WHEN c.customer_id IS NOT NULL AND a.account_id IS NOT NULL THEN 'Matched'
         WHEN c.customer_id IS NOT NULL AND a.account_id IS NULL THEN 'No Account'
         WHEN c.customer_id IS NULL AND a.account_id IS NOT NULL THEN 'Missing Customer'
       END AS match_status
FROM customers c
FULL OUTER JOIN accounts a ON a.customer_id = c.customer_id;

-- ============================================================
-- Question 5
-- ============================================================
SELECT t.transaction_id, t.amount, a.account_type, a.branch,
       c.first_name || ' ' || c.last_name AS customer_name
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id;

-- ============================================================
-- Question 6
-- ============================================================
SELECT branch, SUM(balance) AS total_balance
FROM accounts
GROUP BY branch
ORDER BY total_balance DESC;

-- ============================================================
-- Question 7
-- ============================================================
SELECT branch, SUM(balance) AS total_balance
FROM accounts
WHERE status = 'Active'
GROUP BY branch
ORDER BY total_balance DESC
LIMIT 5;

-- ============================================================
-- Question 8
-- ============================================================
SELECT account_type, ROUND(AVG(balance), 2) AS avg_balance
FROM accounts
GROUP BY account_type
HAVING AVG(balance) > 50000;

-- ============================================================
-- Question 9
-- ============================================================
SELECT customer_id, COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;

-- ============================================================
-- Question 10
-- ============================================================
SELECT a.branch, a.account_type, SUM(t.amount) AS total_amount
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
GROUP BY a.branch, a.account_type
ORDER BY total_amount DESC
LIMIT 1;

-- ============================================================
-- Question 11
-- ============================================================
SELECT c.customer_id, c.first_name, c.last_name, SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING SUM(a.balance) > (SELECT AVG(balance) FROM accounts);

-- ============================================================
-- Question 12
-- ============================================================
SELECT a.*
FROM accounts a
WHERE a.balance > (
  SELECT AVG(a2.balance)
  FROM accounts a2
  WHERE a2.account_type = a.account_type
);

-- ============================================================
-- Question 13
-- ============================================================
SELECT c.*
FROM customers c
WHERE EXISTS (
  SELECT 1
  FROM accounts a
  JOIN transactions t ON t.account_id = a.account_id
  WHERE a.customer_id = c.customer_id
    AND t.txn_type = 'Withdrawal'
);

-- ============================================================
-- Question 14
-- ============================================================
SELECT a.*
FROM accounts a
WHERE NOT EXISTS (
  SELECT 1 FROM transactions t WHERE t.account_id = a.account_id
);

-- ============================================================
-- Question 15
-- ============================================================
SELECT *
FROM customers
WHERE city IN (
  SELECT city
  FROM customers
  GROUP BY city
  HAVING COUNT(*) > 3
);

-- ============================================================
-- Question 16
-- ============================================================
SELECT branch_stats.branch, branch_stats.account_count, branch_stats.avg_balance
FROM (
  SELECT branch, COUNT(*) AS account_count, AVG(balance) AS avg_balance
  FROM accounts
  GROUP BY branch
) AS branch_stats
WHERE branch_stats.account_count > 5;

-- ============================================================
-- Question 17
-- ============================================================
SELECT customer_id FROM accounts WHERE account_type = 'Savings'
UNION
SELECT customer_id FROM accounts WHERE account_type = 'Checking';

-- ============================================================
-- Question 18
-- ============================================================
SELECT customer_id FROM accounts WHERE account_type = 'Savings'
UNION ALL
SELECT customer_id FROM accounts WHERE account_type = 'Checking';

-- ============================================================
-- Question 19
-- ============================================================
SELECT customer_id FROM accounts WHERE account_type = 'Savings'
INTERSECT
SELECT customer_id FROM accounts WHERE account_type = 'Checking';

-- ============================================================
-- Question 20
-- ============================================================
SELECT customer_id FROM accounts WHERE account_type = 'Savings'
EXCEPT
SELECT customer_id FROM accounts WHERE account_type = 'Fixed Deposit';

-- ============================================================
-- Question 21
-- ============================================================
WITH account_totals AS (
  SELECT account_id, SUM(amount) AS total_amount
  FROM transactions
  GROUP BY account_id
)
SELECT a.*, at.total_amount
FROM accounts a
JOIN account_totals at ON at.account_id = a.account_id
WHERE at.total_amount > 100000;

-- ============================================================
-- Question 22
-- ============================================================
WITH ranked AS (
  SELECT a.*, ROW_NUMBER() OVER (PARTITION BY branch ORDER BY balance DESC) AS rn
  FROM accounts a
)
SELECT *
FROM ranked
WHERE rn = 1;

-- ============================================================
-- Question 23
-- ============================================================
WITH deposit_totals AS (
  SELECT account_id, SUM(amount) AS total_deposits
  FROM transactions
  WHERE txn_type = 'Deposit'
  GROUP BY account_id
),
account_compare AS (
  SELECT a.account_id, a.balance, dt.total_deposits
  FROM accounts a
  JOIN deposit_totals dt ON dt.account_id = a.account_id
)
SELECT *
FROM account_compare
WHERE total_deposits > balance;

-- ============================================================
-- Question 24
-- ============================================================
CREATE VIEW active_accounts_view AS
SELECT a.*, c.first_name || ' ' || c.last_name AS customer_name
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
WHERE a.status = 'Active';

-- ============================================================
-- Question 25
-- ============================================================
CREATE MATERIALIZED VIEW branch_balance_summary AS
SELECT branch, SUM(balance) AS total_balance, COUNT(*) AS account_count
FROM accounts
GROUP BY branch;

-- REFRESH ... CONCURRENTLY requires a unique index on the view:
CREATE UNIQUE INDEX ON branch_balance_summary (branch);

REFRESH MATERIALIZED VIEW CONCURRENTLY branch_balance_summary;

-- ============================================================
-- Question 26
-- ============================================================
WITH ranked AS (
  SELECT t.*,
         ROW_NUMBER() OVER (PARTITION BY account_id ORDER BY txn_date DESC, txn_time DESC) AS rn
  FROM transactions t
)
SELECT * FROM ranked WHERE rn = 1;

-- ============================================================
-- Question 27
-- ============================================================
SELECT c.customer_id, c.first_name, c.last_name,
       SUM(a.balance) AS total_balance,
       RANK() OVER (ORDER BY SUM(a.balance) DESC) AS balance_rank
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

-- ============================================================
-- Question 28
-- ============================================================
WITH branch_totals AS (
  SELECT a.branch, SUM(t.amount) AS total_amount
  FROM transactions t
  JOIN accounts a ON t.account_id = a.account_id
  GROUP BY a.branch
)
SELECT branch, total_amount,
       DENSE_RANK() OVER (ORDER BY total_amount DESC) AS branch_rank
FROM branch_totals;

-- ============================================================
-- Question 29
-- ============================================================
SELECT transaction_id, account_id, txn_date, amount,
       LAG(amount) OVER (PARTITION BY account_id ORDER BY txn_date, txn_time) AS prev_amount
FROM transactions
ORDER BY account_id, txn_date;

-- ============================================================
-- Question 30
-- ============================================================
SELECT transaction_id, account_id, txn_date, amount,
       LEAD(amount) OVER (PARTITION BY account_id ORDER BY txn_date, txn_time) AS next_amount,
       LEAD(amount) OVER (PARTITION BY account_id ORDER BY txn_date, txn_time) - amount AS diff
FROM transactions
ORDER BY account_id, txn_date;

-- ============================================================
-- Question 31
-- ============================================================
SELECT transaction_id, account_id, txn_date, amount,
       SUM(amount) OVER (
         PARTITION BY account_id
         ORDER BY txn_date, txn_time
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS running_total
FROM transactions
ORDER BY account_id, txn_date;

-- ============================================================
-- Question 32
-- ============================================================
SELECT first_name, last_name, dob, COUNT(*), ARRAY_AGG(customer_id) AS customer_ids
FROM customers
GROUP BY first_name, last_name, dob
HAVING COUNT(*) > 1;

-- ============================================================
-- Question 33
-- ============================================================
-- Query A: customers missing city or email
SELECT *
FROM customers
WHERE city IS NULL OR TRIM(city) = ''
   OR email IS NULL OR TRIM(email) = '';

-- Query B: orphaned accounts
SELECT a.*
FROM accounts a
LEFT JOIN customers c ON a.customer_id = c.customer_id
WHERE c.customer_id IS NULL;

-- ============================================================
-- Question 34
-- ============================================================
SELECT
  CASE
    WHEN balance < 10000 THEN 'Low'
    WHEN balance BETWEEN 10000 AND 100000 THEN 'Medium'
    ELSE 'High'
  END AS balance_bucket,
  COUNT(*) AS account_count
FROM accounts
WHERE status = 'Active'
GROUP BY balance_bucket;

-- ============================================================
-- Question 35
-- ============================================================
BEGIN;

-- Snapshot which accounts qualify BEFORE changing any balances
CREATE TEMP TABLE fee_targets AS
SELECT account_id, currency, balance - 500 AS new_balance
FROM accounts
WHERE balance > 200000;

UPDATE accounts a
SET balance = ft.new_balance
FROM fee_targets ft
WHERE a.account_id = ft.account_id;

INSERT INTO transactions
  (transaction_id, account_id, txn_date, txn_time, txn_type, channel,
   amount, currency, balance_after, merchant, description, is_flagged)
SELECT
  (SELECT COALESCE(MAX(transaction_id), 0) FROM transactions) + ROW_NUMBER() OVER (ORDER BY account_id),
  account_id, CURRENT_DATE, CURRENT_TIME, 'Fee', 'System',
  500, currency, new_balance, 'Bank', 'Maintenance fee', false
FROM fee_targets;

-- Review the results, then either:
COMMIT;
-- or, if anything looks wrong: ROLLBACK;

DROP TABLE IF EXISTS fee_targets;

-- ============================================================
-- Question 36
-- ============================================================
WITH quartiles AS (
  SELECT customer_id, annual_income,
         NTILE(4) OVER (ORDER BY annual_income) AS income_quartile
  FROM customers
)
SELECT income_quartile, COUNT(*) AS customer_count
FROM quartiles
GROUP BY income_quartile
ORDER BY income_quartile;

-- ============================================================
-- Question 37
-- ============================================================
SELECT DISTINCT c.*
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
WHERE c.credit_score < 500
  AND a.balance > 200000;

-- ============================================================
-- Question 38
-- ============================================================
SELECT t.transaction_id, t.amount, t.channel, a.branch,
       c.first_name || ' ' || c.last_name AS customer_name
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE t.is_flagged = true
ORDER BY t.amount DESC;

-- ============================================================
-- Question 39
-- ============================================================
SELECT DISTINCT c.*
FROM customers c
JOIN accounts a ON a.customer_id = c.customer_id
WHERE c.kyc_status = 'Expired'
  AND a.status = 'Active';

-- ============================================================
-- Question 40
-- ============================================================
SELECT a.*
FROM accounts a
WHERE a.is_joint_account = true
  AND a.balance > (
    SELECT AVG(a2.balance)
    FROM accounts a2
    WHERE a2.branch = a.branch
  );

