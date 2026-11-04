-- Debit & Credit Transactions Analysis: QA queries to validate dashboard numbers (MySQL)
USE banking_data;

-- ===== DEBIT & CREDIT DASHBOARD: KPI check =====
-- Expected: 127603386.41 | 127285269.22 | 100000 | 2548.89
SELECT SUM(CASE WHEN transaction_type = 'Credit' THEN amount END) AS total_credit,
       SUM(CASE WHEN transaction_type = 'Debit'  THEN amount END) AS total_debit,
       COUNT(*)                                                    AS transactions,
       ROUND(AVG(amount), 2)                                       AS avg_transaction_amount
FROM transactions;

-- Transactions per month (Dec = 305)
SELECT txn_month, COUNT(*) AS transactions
FROM transactions GROUP BY txn_month ORDER BY MIN(MONTH(transaction_date));

-- High risk vs normal (50000 / 50000)
SELECT risk_flag, COUNT(*) AS transactions FROM transactions GROUP BY risk_flag;
