# SQL Data Cleaning Project

A practical **MySQL data cleaning project** using a messy customer sales dataset.

## Project Overview

This project demonstrates a SQL data-cleaning workflow:

**Raw Data → Data Profiling → Data Cleaning → Validation**

The original `messy_customers` table is preserved. Cleaning is performed on a separate `cleaned_customers` table.

## Dataset

- Original dataset: 1,000 rows
- Imported working dataset: 961 rows
- Database: MySQL
- Raw table: `messy_customers`
- Cleaning table: `cleaned_customers`

> The raw table is kept unchanged. All cleaning is performed on `cleaned_customers`.

## Completed Tasks

### 1. Data Profiling

- Checked total records
- Checked missing values
- Checked duplicate records
- Reviewed gender variations
- Reviewed city variations
- Reviewed category variations
- Identified invalid values

### 2. Data Cleaning

- **Customer Name Cleaning:** Removed extra spaces using `TRIM()`.
- **Gender Standardization:**
  - `M`, `male` → `Male`
  - `F`, `female` → `Female`
  - Invalid values → `NULL`
- **City Standardization:**
  - `berlin` → `Berlin`
  - `munich` → `Munich`
  - `hamburg` → `Hamburg`
  - `cologne` → `Cologne`
  - `frankfurt` → `Frankfurt`
  - `stuttgart` → `Stuttgart`
  - `dresden` → `Dresden`
- **Category Standardization:**
  - `electronics` → `Electronics`
  - `clothing` → `Clothing`
  - `grocery` → `Grocery`
  - `home` → `Home`
  - `sports` → `Sports`
- **Email Cleaning:** Trimmed and lowercased valid email addresses; invalid or blank values set to `NULL`.
- **Phone Cleaning:** Removed leading and trailing spaces and converted blank values to `NULL`.
- **Age Validation:** Set ages below 1 or above 100 to `NULL`.
- **Quantity Validation:** Set zero or negative quantities to `NULL`.

## SQL Concepts Used

- `SELECT`
- `WHERE`
- `COUNT()`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `CASE`
- `TRIM()`
- `LOWER()`
- `REGEXP`
- `NULLIF()`
- `UPDATE`
- `NULL`
- Data profiling
- Data cleaning
- Data validation

## Project Progress

| Task | Status |
|---|---|
| Data profiling | Completed |
| Customer name cleaning | Completed |
| Gender standardization | Completed |
| City standardization | Completed |
| Category standardization | Completed |
| Email cleaning | Completed |
| Phone cleaning | Completed |
| Age validation | Completed |
| Quantity validation | Completed |
| Amount validation | Next |
| Date cleaning and conversion | Pending |
| Duplicate removal using `ROW_NUMBER()` | Pending |
| Final validation | Pending |
| Before-and-after data quality report | Pending |

## Tools Used

- MySQL
- MySQL Workbench
- SQL
- CSV dataset

## Project Goal

Transform a messy customer dataset into a consistent and reliable dataset ready for SQL analysis, reporting, and data visualization.

## Author

**Utsavkumar Makavana**

MSc Data Science | Data Analytics | SQL | Python | AI/LLM Evaluation
