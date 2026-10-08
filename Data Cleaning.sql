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
