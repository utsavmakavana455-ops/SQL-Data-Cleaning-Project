
USE sql_data_cleaning;

-- 1. Check total cleaned records
SELECT COUNT(*) AS total_cleaned_records
FROM cleaned_customers;

-- 2. Check missing or blank customer names
SELECT COUNT(*) AS missing_names
FROM cleaned_customers
WHERE customer_name IS NULL
   OR TRIM(customer_name) = '';

-- 3. Check extra spaces in names
SELECT COUNT(*) AS names_with_extra_spaces
FROM cleaned_customers
WHERE customer_name <> TRIM(customer_name);

-- 4. Check invalid gender values
SELECT COUNT(*) AS invalid_genders
FROM cleaned_customers
WHERE gender IS NOT NULL
  AND gender NOT IN ('Male', 'Female');

-- 5. Check ages outside the valid range
SELECT COUNT(*) AS invalid_ages
FROM cleaned_customers
WHERE age < 1 OR age > 100;

-- 6. Check invalid quantities
SELECT COUNT(*) AS invalid_quantities
FROM cleaned_customers
WHERE quantity <= 0;

-- 7. Check invalid amounts
SELECT COUNT(*) AS invalid_amounts
FROM cleaned_customers
WHERE amount <= 0;

-- 8. Check missing or blank emails
SELECT COUNT(*) AS missing_emails
FROM cleaned_customers
WHERE email IS NULL
   OR TRIM(email) = '';

-- 9. Check duplicate record ID groups
SELECT COUNT(*) AS duplicate_record_id_groups
FROM (
    SELECT record_id
    FROM cleaned_customers
    GROUP BY record_id
    HAVING COUNT(*) > 1
) AS duplicates;

-- 10. Preview the cleaned data
SELECT *
FROM cleaned_customers;
