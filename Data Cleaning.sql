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
