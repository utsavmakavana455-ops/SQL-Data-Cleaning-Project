# SQL Data Cleaning Project

A practical **MySQL data cleaning and validation project** using a messy customer sales dataset.

## Project Overview

This project demonstrates an end-to-end SQL data cleaning workflow:

**Raw Data → Data Profiling → Data Cleaning → Data Validation → Quality Checks**

The original `messy_customers` table is preserved, while all cleaning operations are performed on the separate `cleaned_customers` table.

## Dataset

- Original CSV dataset: 1,000 rows
- Initially imported records: 961 rows
- Final cleaned records: 956 rows *(verify against the final query result)*
- Database: MySQL
- Raw table: `messy_customers`
- Cleaned table: `cleaned_customers`

> The raw table remains unchanged to preserve the original data.

## Tasks Completed

### 1. Data Profiling
- Checked total records and missing values.
- Identified duplicate records and record ID groups.
- Reviewed gender, city, and category variations.
- Identified invalid values and data quality issues.

### 2. Data Cleaning
- Removed extra spaces from customer names using `TRIM()`.
- Standardized gender values (`M`/`male` → `Male`, `F`/`female` → `Female`).
- Standardized city names and product categories.
- Trimmed and lowercased email addresses.
- Converted invalid or blank emails to `NULL`.
- Cleaned phone numbers and converted blank values to `NULL`.
- Set invalid ages outside the range of 1–100 to `NULL`.
- Set zero or negative quantities to `NULL`.
- Validated amounts and identified invalid values.
- Reviewed date values and date conversion requirements.

### 3. Data Validation
Created `03_data_validation.sql` to verify:
- Total cleaned record count.
- Missing or blank customer names.
- Extra spaces in customer names.
- Invalid gender values.
- Ages outside the valid range.
- Invalid quantities and amounts.
- Missing or blank email addresses.
- Duplicate record ID groups.
- A preview of the cleaned dataset.

### 4. Final Quality Checks
- Checked data consistency after cleaning.
- Verified key fields using SQL validation queries.
- Reviewed duplicate ID groups.
- Compared the original, imported, and cleaned record counts.

## SQL Concepts Used

`SELECT` · `WHERE` · `COUNT()` · `GROUP BY` · `HAVING` · `ORDER BY` · `CASE` · `TRIM()` · `LOWER()` · `REGEXP` · `NULLIF()` · `UPDATE` · `NULL` · Subqueries

## Project Status

| Task | Status |
|---|---|
| Data profiling | Completed |
| Name cleaning | Completed |
| Gender standardization | Completed |
| City standardization | Completed |
| Category standardization | Completed |
| Email cleaning | Completed |
| Phone cleaning | Completed |
| Age validation | Completed |
| Quantity validation | Completed |
| Amount validation | Completed |
| Duplicate ID validation | Completed |
| Final SQL validation | Completed |
| Cleaned data preview | Completed |

## Tools Used

- MySQL
- MySQL Workbench
- SQL
- CSV dataset

## Key Learning Outcomes

- Practiced real-world SQL data cleaning techniques.
- Improved data consistency and quality.
- Used validation queries to identify potential data issues.
- Applied SQL functions and conditional logic to standardize data.
- Prepared a cleaned dataset for further analysis and visualization.

## Project Goal

Transform a messy customer sales dataset into a consistent, validated dataset ready for SQL analysis, reporting, and business intelligence.

## Author

**Utsavkumar Makavana**

MSc Data Science | Data Analytics | SQL | Python | AI/LLM Evaluation
