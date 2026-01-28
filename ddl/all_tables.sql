

-- =============================
-- TABLE: dim_customers
-- =============================

CREATE TABLE workspace.default.dim_customers (
  Customer_ID BIGINT COMMENT 'A unique identifier assigned to each customer, facilitating the tracking and management of customer-related data.',
  First_Name STRING COMMENT 'The given name of the customer, useful for personalized communication and marketing efforts.',
  Last_Name STRING COMMENT 'The family name of the customer, typically used alongside the first name for identification purposes.',
  Email STRING COMMENT 'The email address of the customer, essential for communication, account management, and marketing outreach.',
  State STRING COMMENT 'The state of residence for the customer, which can assist in regional marketing strategies and demographic analysis.')
USING delta
COMMENT 'The table contains detailed information about customers, including their names, email addresses, and state of residence. This data can be used for customer segmentation, targeted marketing campaigns, and analyzing customer demographics.'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd')
;


-- =============================
-- TABLE: dim_date
-- =============================

CREATE TABLE workspace.default.dim_date (
  date_key INT COMMENT 'A unique identifier for each date entry in the table, facilitating easy referencing and joining with other datasets.',
  full_date DATE COMMENT 'Represents the complete calendar date in a standard format, useful for any time-based analysis and reporting.',
  day_of_week STRING COMMENT 'Indicates the name of the day corresponding to the date, which can be useful for analyzing patterns based on weekdays versus weekends.',
  month_name STRING COMMENT 'Provides the name of the month associated with the date, allowing for month-specific reporting and seasonal analysis.',
  quarter STRING COMMENT 'Represents the fiscal or calendar quarter in which the date falls, aiding in quarterly analysis and comparisons.',
  year INT COMMENT 'Denotes the year of the date, essential for year-over-year comparisons and trend analysis.')
USING delta
COMMENT 'This table contains date-related information that can be used for time-based analysis. It includes details like the full date, day of the week, month name, quarter, and year. Potential use cases include reporting on trends over time, scheduling events, or analyzing seasonal patterns.'
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.domainMetadata' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.feature.rowTracking' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd',
  'delta.writePartitionColumnsToParquet' = 'true')
;


-- =============================
-- TABLE: dim_products
-- =============================

CREATE TABLE workspace.default.dim_products (
  product_id STRING COMMENT 'A unique identifier assigned to each product in the inventory, facilitating tracking and management.',
  product_name STRING COMMENT 'The name of the product as it appears in the catalog, used for identification and marketing purposes.',
  category STRING COMMENT 'The classification of the product, indicating its type or segment within the broader inventory.',
  brand STRING COMMENT 'The name of the brand that manufactures or markets the product, which can influence customer preferences.',
  unit_price DOUBLE COMMENT 'The selling price of the product per unit, reflecting the cost to customers and impacting sales calculations.')
USING delta
COMMENT 'The table contains detailed information about products, including their names, categories, brands, and pricing. This data can be useful for analyzing product performance, assessing pricing strategies, and segmenting products by category or brand for marketing purposes.'
TBLPROPERTIES (
  'delta.checkpoint.writeStatsAsJson' = 'false',
  'delta.checkpoint.writeStatsAsStruct' = 'true',
  'delta.enableDeletionVectors' = 'true',
  'delta.enableRowTracking' = 'true',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.domainMetadata' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.feature.rowTracking' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd',
  'delta.writePartitionColumnsToParquet' = 'true')
;


-- =============================
-- TABLE: ref_payment_methods
-- =============================

CREATE TABLE workspace.default.ref_payment_methods (
  Payment_Method STRING COMMENT 'The name of the payment method used for transactions, which can include options like credit card, PayPal, or bank transfer.',
  Processing_Fee_Pct DOUBLE COMMENT 'The percentage fee associated with processing transactions through the specific payment method, important for understanding the cost of using that method.',
  Is_Active BOOLEAN COMMENT 'Indicates whether the payment method is currently active and available for use in transactions, which is crucial for managing payment options.')
USING delta
COMMENT 'The table contains information about different payment methods used in transactions. It includes details such as the name of the payment method, the associated processing fee percentage, and whether the payment method is currently active. This data can be useful for analyzing the cost implications of various payment options and for managing the available payment methods in your systems.'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7')
;


-- =============================
-- TABLE: sales_data
-- =============================

CREATE TABLE workspace.default.sales_data (
  Transaction_ID BIGINT COMMENT 'Represents the unique identifier for each sales transaction, allowing for tracking and analysis of individual sales events.',
  Customer_ID DOUBLE COMMENT 'Serves as a unique identifier for customers, enabling the association of transactions with specific customers for better understanding of purchasing behavior.',
  Transaction_Date STRING COMMENT 'Indicates the date when the transaction occurred, which is essential for analyzing sales trends over time.',
  Product_Category STRING COMMENT 'Categorizes the products sold in each transaction, facilitating analysis of sales performance across different product lines.',
  Payment_Method STRING COMMENT 'Describes the method used for payment in the transaction, providing insights into customer preferences and payment trends.',
  Total_Amount DOUBLE COMMENT 'Reflects the total monetary value of the transaction, which is crucial for revenue analysis and financial reporting.')
USING delta
COMMENT 'The table contains sales transaction data, including details such as transaction IDs, customer IDs, transaction dates, product categories, payment methods, and total amounts. This data can be used for analyzing sales trends, understanding customer purchasing behavior, and evaluating the performance of different product categories and payment methods.'
TBLPROPERTIES (
  'delta.enableDeletionVectors' = 'true',
  'delta.feature.appendOnly' = 'supported',
  'delta.feature.deletionVectors' = 'supported',
  'delta.feature.invariants' = 'supported',
  'delta.minReaderVersion' = '3',
  'delta.minWriterVersion' = '7',
  'delta.parquet.compression.codec' = 'zstd')
;
