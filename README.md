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

- Removed extra spaces from customer names

- Standardized gender values:
  - `M`, `male` → `Male`
  - `F`, `female` → `Female`
  - Invalid values → `NULL`

- Standardized city values:
  - `berlin` → `Berlin`
  - `munich` → `Munich`
  - `hamburg` → `Hamburg`
  - `cologne` → `Cologne`
  - `frankfurt` → `Frankfurt`
  - `stuttgart` → `Stuttgart`
  - `dresden` → `Dresden`

- Standardized category values:
  - `electronics` → `Electronics`
  - `clothing` → `Clothing`
  - `grocery` → `Grocery`
  - `home` → `Home`
  - `sports` → `Sports`

## SQL Concepts Used

- SELECT
- WHERE
- COUNT()
- GROUP BY
- HAVING
- ORDER BY
- CASE
- TRIM()
- LOWER()
- UPDATE
- NULL
- Data profiling
- Data validation

