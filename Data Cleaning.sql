 CREATE TABLE cleaned_customers AS
SELECT *
FROM messy_customers; 

#Clean customer names
SELECT
    record_id,
    customer_name,
    TRIM(customer_name) AS cleaned_name
FROM cleaned_customers
WHERE customer_name <> TRIM(customer_name);


/*Disable Safe Update Mode
   Required for updating the cleaning table*/
   

SET SQL_SAFE_UPDATES = 0;


UPDATE cleaned_customers
SET customer_name = TRIM(customer_name);

SELECT
    record_id,
    customer_name
FROM cleaned_customers
LIMIT 20;

# Standardize gender
SELECT
    gender,
    COUNT(*) AS total
FROM cleaned_customers
GROUP BY gender
ORDER BY gender;

UPDATE cleaned_customers
SET gender =
    CASE
        WHEN LOWER(TRIM(gender)) IN ('m', 'male')
            THEN 'Male'

        WHEN LOWER(TRIM(gender)) IN ('f', 'female')
            THEN 'Female'

        ELSE NULL
    END;
    
SELECT
    gender,
    COUNT(*) AS total
FROM cleaned_customers
GROUP BY gender;    

#Standardize cities
SELECT
    city,
    COUNT(*) AS total
FROM cleaned_customers
GROUP BY city
ORDER BY city;

UPDATE cleaned_customers
SET city =
    CASE
        WHEN LOWER(TRIM(city)) = 'berlin'
            THEN 'Berlin'

        WHEN LOWER(TRIM(city)) = 'munich'
            THEN 'Munich'

        WHEN LOWER(TRIM(city)) = 'hamburg'
            THEN 'Hamburg'

        WHEN LOWER(TRIM(city)) = 'cologne'
            THEN 'Cologne'

        WHEN LOWER(TRIM(city)) = 'frankfurt'
            THEN 'Frankfurt'

        WHEN LOWER(TRIM(city)) = 'stuttgart'
            THEN 'Stuttgart'

        WHEN LOWER(TRIM(city)) = 'dresden'
            THEN 'Dresden'

        ELSE NULL
    END;
    
    #Standardize categories
    UPDATE cleaned_customers
SET category =
    CASE
        WHEN LOWER(TRIM(category)) = 'electronics'
            THEN 'Electronics'

        WHEN LOWER(TRIM(category)) = 'clothing'
            THEN 'Clothing'

        WHEN LOWER(TRIM(category)) = 'grocery'
            THEN 'Grocery'

        WHEN LOWER(TRIM(category)) = 'home'
            THEN 'Home'

        WHEN LOWER(TRIM(category)) = 'sports'
            THEN 'Sports'

        ELSE NULL
    END;
    
    SELECT
    category,
    COUNT(*) AS total
FROM cleaned_customers
GROUP BY category
ORDER BY category;

#Clean email addresses
SELECT
    record_id,
    customer_name,
    email
FROM cleaned_customers
WHERE email IS NULL
   OR TRIM(email) = ''
   OR LOWER(TRIM(email)) NOT REGEXP
      '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';
UPDATE cleaned_customers
SET email =
    CASE
        WHEN LOWER(TRIM(email)) REGEXP
             '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'
        THEN LOWER(TRIM(email))

        ELSE NULL
    END;
    
    SELECT
    COUNT(*) AS invalid_or_missing_emails
FROM cleaned_customers
WHERE email IS NULL;

# Clean phone numbers
SELECT
    record_id,
    phone
FROM cleaned_customers
WHERE phone IS NULL
   OR TRIM(phone) = ''
   OR phone NOT REGEXP '^[0-9+ -]+$';
   
   UPDATE cleaned_customers
SET phone = NULLIF(TRIM(phone), '');

#Clean Invalid Ages in MySQL

SELECT
    record_id,
    customer_name,
    age
FROM cleaned_customers
WHERE age < 1
   OR age > 100;
   
 /* STEP 8: Replace Invalid Ages with NULL */

SET SQL_SAFE_UPDATES = 0;

UPDATE cleaned_customers
SET age = NULL
WHERE age < 1
   OR age > 100;

SET SQL_SAFE_UPDATES = 1;  

/* Validate Age Cleaning */

SELECT
    COUNT(*) AS remaining_invalid_ages
FROM cleaned_customers
WHERE age < 1
   OR age > 100;
   
   /* STEP 9: Identify Invalid Quantities */

SELECT
    record_id,
    product,
    quantity
FROM cleaned_customers
WHERE quantity <= 0;

/* STEP 9: Replace Invalid Quantities with NULL */

SET SQL_SAFE_UPDATES = 0;

UPDATE cleaned_customers
SET quantity = NULL
WHERE quantity <= 0;

SET SQL_SAFE_UPDATES = 1;

/* Validate Quantity Cleaning */

SELECT
    COUNT(*) AS remaining_invalid_quantities
FROM cleaned_customers
WHERE quantity <= 0;

#Also checked how many missing quantities remain:
SELECT
    COUNT(*) AS missing_quantities
FROM cleaned_customers
WHERE quantity IS NULL;

 
#AMOUNT VALIDATION

-- Check invalid amounts before cleaning
SELECT COUNT(*) AS invalid_amounts
FROM cleaned_customers
WHERE amount <= 0;

-- Set zero and negative amounts to NULL
UPDATE cleaned_customers
SET amount = NULL
WHERE amount <= 0;

-- Validate after cleaning
SELECT COUNT(*) AS remaining_invalid_amounts
FROM cleaned_customers
WHERE amount <= 0;


-- DATE CLEANING

-- Check the order_date column data type
DESCRIBE cleaned_customers;

-- Count missing dates
SELECT COUNT(*) AS missing_order_dates
FROM cleaned_customers
WHERE order_date IS NULL;

-- Review the earliest and latest dates
SELECT
    MIN(order_date) AS earliest_order_date,
    MAX(order_date) AS latest_order_date
FROM cleaned_customers;

-- Preview order dates
SELECT record_id, order_date
FROM cleaned_customers
LIMIT 20;

# duplicate records
 
-- STEP 13: DUPLICATE DETECTION

-- Find duplicate records using all columns
SELECT
    record_id,
    customer_name,
    gender,
    age,
    email,
    phone,
    city,
    category,
    product,
    quantity,
    amount,
    order_date,
    COUNT(*) AS duplicate_count
FROM cleaned_customers
GROUP BY
    record_id,
    customer_name,
    gender,
    age,
    email,
    phone,
    city,
    category,
    product,
    quantity,
    amount,
    order_date
HAVING COUNT(*) > 1;

# Check duplicate record IDs

SELECT
    record_id,
    COUNT(*) AS id_count
FROM cleaned_customers
GROUP BY record_id
HAVING COUNT(*) > 1;

# Validate the total row count

SELECT COUNT(*) AS total_rows
FROM cleaned_customers;


-- STEP 14: FINAL DATA QUALITY VALIDATION

-- Total records
SELECT COUNT(*) AS total_records
FROM cleaned_customers;

-- Missing values in important columns
SELECT
    SUM(customer_name IS NULL OR TRIM(customer_name) = '') AS missing_names,
    SUM(email IS NULL OR TRIM(email) = '') AS missing_emails,
    SUM(phone IS NULL OR TRIM(phone) = '') AS missing_phones,
    SUM(age IS NULL) AS missing_ages,
    SUM(city IS NULL OR TRIM(city) = '') AS missing_cities,
    SUM(amount IS NULL) AS missing_amounts,
    SUM(order_date IS NULL) AS missing_order_dates
FROM cleaned_customers;


-- Invalid ages
SELECT COUNT(*) AS invalid_ages
FROM cleaned_customers
WHERE age < 1 OR age > 100;

-- Invalid quantities
SELECT COUNT(*) AS invalid_quantities
FROM cleaned_customers
WHERE quantity <= 0;

-- Invalid amounts
SELECT COUNT(*) AS invalid_amounts
FROM cleaned_customers
WHERE amount <= 0;

-- Unstandardized gender values
SELECT DISTINCT gender
FROM cleaned_customers;

-- Unstandardized city values
SELECT DISTINCT city
FROM cleaned_customers
ORDER BY city;

-- Unstandardized category values
SELECT DISTINCT category
FROM cleaned_customers
ORDER BY category;


SELECT 'Raw Table' AS table_name, COUNT(*) AS total_rows
FROM messy_customers

UNION ALL

SELECT 'Cleaned Table' AS table_name, COUNT(*) AS total_rows
FROM cleaned_customers;
