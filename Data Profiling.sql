CREATE DATABASE sql_data_cleaning;

USE sql_data_cleaning;

USE sql_data_cleaning;
SHOW TABLES;

USE sql_data_cleaning;

SELECT *
FROM sql_messy_data_1000_rows_v2
LIMIT 20;

SELECT COUNT(*) AS total_rows
FROM sql_messy_data_1000_rows_v2;


# Rename it to our project name
RENAME TABLE sql_messy_data_1000_rows_v2
TO messy_customers;


USE sql_data_cleaning;

RENAME TABLE sql_messy_data_1000_rows_v2
TO messy_customers;

