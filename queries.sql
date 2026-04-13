-- =========================================
-- 1. Total number of transactions
-- =========================================
SELECT COUNT(*) AS total_transactions
FROM transactions;


-- =========================================
-- 2. Fraud vs Non-Fraud distribution
-- =========================================
SELECT class, COUNT(*) AS count
FROM transactions
GROUP BY class;


-- =========================================
-- 3. Basic statistics by class
-- =========================================
SELECT 
    class,
    AVG(amount) AS avg_amount,
    MAX(amount) AS max_amount,
    MIN(amount) AS min_amount
FROM transactions
GROUP BY class;


-- =========================================
-- 4. Fraud transactions sorted by amount
-- =========================================
SELECT class, amount
FROM transactions
WHERE class = 1
ORDER BY amount DESC;


-- =========================================
-- 5. Transaction amount buckets
-- =========================================
SELECT 
    class,
    CASE
        WHEN amount < 100 THEN 'low'
        WHEN amount BETWEEN 100 AND 1000 THEN 'medium'
        ELSE 'high'
    END AS amount_range,
    COUNT(*) AS count
FROM transactions
GROUP BY class, amount_range;


-- =========================================
-- 6. Fraud count per amount range
-- =========================================
SELECT 
    amount_range,
    COUNT(*) AS total,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) AS fraud_count
FROM (
    SELECT 
        class,
        CASE
            WHEN amount < 100 THEN 'low'
            WHEN amount BETWEEN 100 AND 1000 THEN 'medium'
            ELSE 'high'
        END AS amount_range
    FROM transactions
)
GROUP BY amount_range;


-- =========================================
-- 7. Fraud percentage per amount range
-- =========================================
SELECT 
    amount_range,
    COUNT(*) AS total,
    SUM(CASE WHEN class = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS fraud_percentage
FROM (
    SELECT 
        class,
        CASE
            WHEN amount < 100 THEN 'low'
            WHEN amount BETWEEN 100 AND 1000 THEN 'medium'
            ELSE 'high'
        END AS amount_range
    FROM transactions
)
GROUP BY amount_range;
