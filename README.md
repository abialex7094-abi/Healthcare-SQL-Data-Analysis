# Healthcare Data Analysis Using MySQL

**A SQL Portfolio Project | Healthcare Operations, Patient Analytics & Billing Insights**

## 1. Project Overview

This project demonstrates the application of MySQL to a healthcare database covering patient registration, doctor and department information, appointments, treatments, diagnoses, medications, admissions, billing, prescriptions, and payments.

The objective is to develop practical SQL skills by exploring healthcare operational data, validating data quality, establishing table relationships, and solving business-oriented analytical questions.

The project includes database creation scripts, data insertion scripts, data verification and validation queries, and a structured set of **90 SQL questions with solutions**, progressing from foundational queries to advanced analytical techniques.

## 2. Business Objectives

The project explores questions relevant to healthcare operations and financial analysis:

* How many appointments are completed, cancelled, or marked as no-shows?
* Which doctors handle the highest number of appointments?
* What are the most frequently used treatment procedures?
* How do treatment costs vary across procedures?
* What are the total billed amounts and the distribution of paid and pending bills?
* Which departments have higher treatment-related revenue?
* Which patients have multiple appointments or hospital admissions?
* What percentage of appointments are marked as no-shows?
* How can patient-level healthcare summaries be generated from multiple related tables?

These questions demonstrate how SQL can transform relational data into information useful for operational monitoring and business decision-making.

## 3. Technology Stack

* **Database:** MySQL
* **SQL Development Environment:** MySQL Workbench
* **Data Modeling:** Relational database design and Entity Relationship Diagrams (ERDs)
* **Data Preparation:** CSV files and SQL data insertion scripts
* **Version Control and Portfolio:** GitHub

## 4. Database Structure

The database, named `healthcare_portfolio`, contains 11 tables:

| Table          | Purpose                                                   |
| -------------- | --------------------------------------------------------- |
| `patients`     | Patient registration, contact, and insurance details      |
| `doctors`      | Doctor information, specialization, and experience        |
| `department`   | Department information and leadership                     |
| `appointment`  | Appointment dates, times, reasons, and statuses           |
| `treatment`    | Procedures, treatment dates, descriptions, and costs      |
| `billing`      | Bill amounts, dates, payment methods, and statuses        |
| `payments`     | Payment transactions and payment details                  |
| `admission`    | Patient admissions, discharge dates, and follow-ups       |
| `diagnosis`    | Diagnoses associated with appointments                    |
| `medications`  | Medication information associated with appointments       |
| `prescription` | Prescription details, dosage, frequency, and instructions |

The tables are connected through primary keys, foreign keys, and other constraints where applicable, supporting relational queries across healthcare operations.

## 5. SQL Concepts Demonstrated

### Beginner — Data Retrieval and Aggregation

* `SELECT`, `WHERE`, `ORDER BY`, and `DISTINCT`
* Filtering with `LIKE`, `IS NULL`, and comparison operators
* Aggregate functions: `COUNT()`, `SUM()`, `AVG()`, `MIN()`, and `MAX()`
* `GROUP BY` and basic conditional filtering

### Intermediate — Relational Analysis

* `INNER JOIN` and `LEFT JOIN`
* Multi-table joins
* Table aliases and calculated columns
* `GROUP BY` and `HAVING`
* Subqueries and aggregate comparisons
* Conditional business analysis using healthcare data

### Advanced — Analytical SQL

* Nested and correlated subqueries
* Common Table Expressions (CTEs)
* Window functions, including `RANK()`, `DENSE_RANK()`, and `ROW_NUMBER()`
* `PARTITION BY` and analytical ordering
* Running totals and cumulative billing
* Conditional aggregation using `CASE`
* Percentage calculations and contribution analysis
* First, latest, and second appointment analysis
* Patient-level summaries across multiple healthcare tables

## 6. Data Quality and Database Validation

A dedicated SQL script is included for checking database integrity and validating relationships.

The validation work covers:

* Verifying table structures and record counts
* Checking missing and duplicate patient identifiers
* Identifying unmatched patient and doctor IDs
* Checking relationships between appointments, treatments, billing, admissions, and other tables
* Inspecting primary key, foreign key, and uniqueness constraints
* Examining missing values in selected patient attributes

These checks support more reliable querying and help identify potential data quality issues before analysis.

## 7. Project Deliverables

The repository contains :

* Database and table creation scripts
* SQL scripts for inserting patient records
* CSV datasets for healthcare tables
* Data verification and validation queries
* Business problem-solving SQL queries
* A collection of 90 SQL questions with answers
* An Entity Relationship Diagram (ERD)

## 8. Learning Outcomes

This project provides hands-on practice in:

* Designing and exploring a relational database
* Understanding relationships between healthcare entities
* Writing SQL queries to answer business questions
* Performing data quality checks and integrity validation
* Analyzing appointments, treatments, billing, and admissions
* Using advanced SQL techniques for ranking and analytical calculations
* Combining related datasets for patient-level reporting

## 9. Repository Structure


Healthcare-SQL-Data-Analysis:
│
├── README.md
├── Creating database and tables.sql
├── Inserting datas 1.sql
├── Inserting datas 2.sql
├── Inserting datas 3.sql
├── Inserting datas 4.sql
├── Data verification & Data validation.sql
├──erd/ Healthcare ER Diagram
├── SQL Queries and Business Problem-Solving.sql
│
├── datasets
      └── Healthcare CSV files



##10. How to Run the Project

1. Install MySQL and open MySQL Workbench.
2. Execute the database and table creation script.
3. Import or execute the appropriate data insertion scripts.
4. Run the data verification and validation queries.
5. Execute the analytical SQL queries against the populated database.
6. Review the 90-question practice document to explore the queries by difficulty level.

Run the scripts in the appropriate order and confirm that table names, column names, and constraints match your final database schema.

## 11. Important Analytical Considerations

When combining several one-to-many relationships, joining all tables directly can multiply rows and inflate aggregate totals. Patient-level financial and treatment summaries should therefore be designed carefully, using pre-aggregation or other appropriate techniques to avoid double-counting.

The analytical results should also be interpreted in the context of the available data and its completeness.

## 12. Conclusion

This project demonstrates the use of MySQL to investigate healthcare operations through structured data retrieval, relational joins, data validation, aggregation, and advanced analytical queries.

It serves as a practical portfolio project for developing SQL proficiency and preparing for Data and Business Analyst opportunities.

---

**Project Category:** Data Analytics | Healthcare | SQL
**Primary Tool:** MySQL
**Portfolio Focus:** Relational Data Analysis and Business Problem-Solving
