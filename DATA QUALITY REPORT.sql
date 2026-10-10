
--  DATA QUALITY REPORT

-- 1. Compare total row counts
SELECT
    'Raw Data' AS dataset,
    COUNT(*) AS total_rows
FROM messy_customers

UNION ALL

SELECT
    'Cleaned Data' AS dataset,
    COUNT(*) AS total_rows
FROM cleaned_customers;


-- 2. Compare missing email values
SELECT
    'Raw Data' AS dataset,
    SUM(email IS NULL OR TRIM(email) = '') AS missing_emails
FROM messy_customers

UNION ALL

SELECT
    'Cleaned Data' AS dataset,
    SUM(email IS NULL OR TRIM(email) = '') AS missing_emails
FROM cleaned_customers;


-- 3. Compare invalid ages
SELECT
    'Raw Data' AS dataset,
    SUM(age < 1 OR age > 100) AS invalid_ages
FROM messy_customers

UNION ALL

SELECT
    'Cleaned Data' AS dataset,
    SUM(age < 1 OR age > 100) AS invalid_ages
FROM cleaned_customers;


-- 4. Compare invalid quantities
SELECT
    'Raw Data' AS dataset,
    SUM(quantity <= 0) AS invalid_quantities
FROM messy_customers

UNION ALL

SELECT
    'Cleaned Data' AS dataset,
    SUM(quantity <= 0) AS invalid_quantities
FROM cleaned_customers;


-- 5. Compare invalid amounts
SELECT
    'Raw Data' AS dataset,
    SUM(amount <= 0) AS invalid_amounts
FROM messy_customers

UNION ALL

SELECT
    'Cleaned Data' AS dataset,
    SUM(amount <= 0) AS invalid_amounts
FROM cleaned_customers;
