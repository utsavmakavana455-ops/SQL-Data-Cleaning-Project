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


