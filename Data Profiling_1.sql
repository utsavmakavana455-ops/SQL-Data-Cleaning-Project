#Checking table structure
DESCRIBE messy_customers;

#Checking missing values
SELECT
    COUNT(*) AS total_rows,

    SUM(customer_name IS NULL OR TRIM(customer_name) = '') AS missing_name,

    SUM(gender IS NULL OR TRIM(gender) = '') AS missing_gender,

    SUM(age IS NULL OR TRIM(age) = '') AS missing_age,

    SUM(email IS NULL OR TRIM(email) = '') AS missing_email,

    SUM(phone IS NULL OR TRIM(phone) = '') AS missing_phone,

    SUM(city IS NULL OR TRIM(city) = '') AS missing_city,

    SUM(category IS NULL OR TRIM(category) = '') AS missing_category,

    SUM(product IS NULL OR TRIM(product) = '') AS missing_product,

    SUM(quantity IS NULL OR TRIM(quantity) = '') AS missing_quantity,

    SUM(amount IS NULL OR TRIM(amount) = '') AS missing_amount,

    SUM(order_date IS NULL OR TRIM(order_date) = '') AS missing_date

FROM messy_customers;

#Find the missing emails
SELECT
    record_id,
    customer_name,
    email
FROM messy_customers
WHERE email IS NULL
   OR TRIM(email) = '';


#Find missing phone numbers
SELECT
    record_id,
    customer_name,
    phone
FROM messy_customers
WHERE phone IS NULL
   OR TRIM(phone) = '';   
   
#Find missing dates
SELECT
    record_id,
    customer_name,
    order_date
FROM messy_customers
WHERE order_date IS NULL
   OR TRIM(order_date) = '';   
   
# Checking duplicates
SELECT
    record_id,
    COUNT(*) AS occurrences
FROM messy_customers
GROUP BY record_id
HAVING COUNT(*) > 1;

SELECT *
FROM messy_customers
WHERE record_id IN (
    SELECT record_id
    FROM messy_customers
    GROUP BY record_id
    HAVING COUNT(*) > 1
)
ORDER BY record_id;

#Check gender problems
SELECT
    gender,
    COUNT(*) AS total
FROM messy_customers
GROUP BY gender
ORDER BY gender;

SELECT
    city,
    COUNT(*) AS total
FROM messy_customers
GROUP BY city
ORDER BY city;

#Check category problems
SELECT
    category,
    COUNT(*) AS total
FROM messy_customers
GROUP BY category
ORDER BY category;

#Check invalid ages
SELECT
    record_id,
    customer_name,
    age
FROM messy_customers
WHERE age < 1
   OR age > 100;
   
#Check quantity
SELECT
    record_id,
    product,
    quantity
FROM messy_customers
WHERE quantity <= 0;

#Check amount
SELECT
    record_id,
    product,
    amount
FROM messy_customers
WHERE amount <= 0;

# Check email quality
SELECT
    record_id,
    customer_name,
    email
FROM messy_customers
WHERE email IS NULL
   OR TRIM(email) = ''
   OR LOWER(TRIM(email)) NOT REGEXP
      '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$';   #taking from google
      