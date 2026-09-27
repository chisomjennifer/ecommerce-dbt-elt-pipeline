# ecommerce-dbt-elt-pipeline
End-to-end ELT pipeline using PostgreSQL, SQL, and dbt to transform e-commerce data into business-ready models.

## 1. Project Overview

This project is my first end-to-end data engineering project, built around an e-commerce dataset.

The goal was to build a simple ELT pipeline that takes raw e-commerce data, loads it into PostgreSQL, transforms it using dbt and SQL, and produces structured, business-ready data models.

This project focuses on learning and applying the fundamentals of data engineering, including data ingestion, transformation, data modeling, SQL, dbt, dependencies, data grain, and validation.


## 2. Project Goal

The goal of this project was to build a beginner-friendly ELT pipeline while understanding how raw data can be transformed into reliable, business-ready datasets.

The project was also designed to help me understand how data engineering supports downstream business analysis.


## 3. Business Questions

The dataset can be used to explore questions such as:

* How much revenue did the business generate?
* Which products generated the most revenue?
* Which categories generated the most revenue?
* How many orders were placed?
* How many units were sold?
* What is the average order value?
* How does revenue vary across customers and countries?
* What are the ordering patterns over time?
* How much historical revenue did each customer generate?

Some questions require additional source data or more advanced analysis and are planned for future iterations of the project.


## 4. Tools & Technologies

* PostgreSQL
* SQL
* dbt
* Python
* Git
* GitHub
* Visual Studio Code


## 5. Project Architecture

The project follows a simple ELT architecture:

Raw CSV Data
↓
PostgreSQL
↓
dbt Sources
↓
Staging Models
↓
Intermediate Model
↓
Mart
↓
Business Analysis

The transformation layer is managed using dbt, while PostgreSQL is used as the database where the data is stored and transformed.


## 6. Data Sources

The project uses three raw e-commerce datasets:

### Customers

Contains customer-level information such as:

* Customer ID
* Customer name
* Email
* Country

### Products

Contains product information such as:

* Product ID
* Product name
* Category
* Price

### Orders

Contains transaction-level information such as:

* Order ID
* Customer ID
* Product ID
* Order date
* Quantity


## 7. Project Structure


ecommerce_dbt/
│
├── models/
│   ├── staging/
│   │   ├── stg_customers.sql
│   │   ├── stg_products.sql
│   │   └── stg_orders.sql
│   │
│   ├── intermediate/
│   │   └── int_order_details.sql
│   │
│   └── marts/
│       └── fct_orders.sql
│
├── data/
├── scripts/
├── SQL/
├── tests/
├── dbt_project.yml
└── README.md

## 8. Data Pipeline

The pipeline follows an ELT approach.

### Step 1 — Load

Raw e-commerce data was loaded into PostgreSQL.

### Step 2 — Source Definition

The raw PostgreSQL tables were defined as dbt sources.

### Step 3 — Staging

Separate staging models were created for:

* Customers
* Products
* Orders

The staging layer provides a clean starting point for downstream transformations.

### Step 4 — Intermediate Transformation

The customer, product, and order datasets were joined in the intermediate model.

An `order_value` field was calculated using:

`quantity × price`

### Step 5 — Mart

The transformed data was then exposed through the `fct_orders` model for downstream analysis.


## 9. Data Models

### Staging Models

#### `stg_customers`

Cleans and selects the customer data needed for downstream transformations.

#### `stg_products`

Selects the required product fields, including product name, category, and price.

#### `stg_orders`

Provides the order-level data used in downstream transformations.

### Intermediate Model

#### `int_order_details`

Combines orders with customer and product information.

It also calculates:

`order_value = quantity × price`

The intended grain of this model is one row per order.

### Mart Model

#### `fct_orders`

Provides the final business-ready order dataset.

The grain is:

**One row per order.**


## 10. Data Transformations

The main transformation performed in the intermediate layer was the calculation of order value.


Order Value = Quantity × Price


The intermediate model also joins:

* Orders → Customers
* Orders → Products

This allows order-level data to contain relevant customer and product attributes for downstream analysis.

## 11. Data Validation

The dbt models were executed successfully and the resulting data was inspected to validate the transformations.

I manually validated the `order_value` calculation using sample records.

For example:


Quantity = 3
Price = 25

Order Value = 3 × 25 = 75

Another sample:


Quantity = 2
Price = 45

Order Value = 2 × 45 = 90


## 12. Key Learnings

Through this project, I learned and practiced:

* The difference between ETL and ELT
* Loading data into PostgreSQL
* Creating dbt sources
* Building staging models
* Building intermediate models
* Building mart models
* Using `source()` in dbt
* Using `ref()` to create model dependencies
* Understanding data grain
* Joining datasets using SQL
* Creating calculated fields
* Validating transformation results
* Structuring a basic analytics engineering workflow

One of the most important lessons was that data modeling should be connected to the business questions the data needs to answer.


## 13. Challenges & Lessons Learned

As my first data engineering project, I encountered several challenges while setting up the environment and building the pipeline.

Some of the challenges included configuring PostgreSQL, connecting the project to dbt, understanding dbt sources and references, and learning how the different modeling layers work together.

These challenges helped me understand that building a data pipeline involves more than writing SQL. Understanding the data, defining the grain of a model, validating transformations, and understanding how each layer contributes to the final output are equally important.

This project is intentionally a beginner implementation, and I plan to improve it as I learn more data engineering concepts.


