--Data Engineering

-- Drop Tables if Existing
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Managers;
DROP TABLE IF EXISTS Returns;

--Creating Tables
CREATE TABLE Orders (
    ROW_ID int   NOT NULL,
    ORDER_ID int   NOT NULL,
    ORDER_DATE date   NOT NULL,
    PRIORITY varchar   NOT NULL,
    QUANTITY int   NOT NULL,
    SALES float   NOT NULL,
    DISCOUNT float   NOT NULL,
    MODE varchar   NOT NULL,
    PROFIT float   NOT NULL,
    UNIT_PRICE float   NOT NULL,
    SHIPPING_COSTS float   NOT NULL,
    CUSTOMER_ID int   NOT NULL,
    PROVINCE varchar   NOT NULL,
    REGION varchar   NOT NULL,
    SEGMENT varchar   NOT NULL,
    CATEGORY varchar   NOT NULL,
    SUB_CATEGORY varchar   NOT NULL,
    PRODUCT_NAME varchar   NOT NULL,
    PRODUCT_CONTAINER varchar   NOT NULL,
    SHIP_DATE date   NOT NULL
);

CREATE TABLE Customers (
    CUSTOMER_ID int   NOT NULL,
    CUSTOMER_NAME varchar   NOT NULL,
    CUSTOMER_TYPE varchar   NOT NULL,
    CONSTRAINT pk_Customers PRIMARY KEY (
        CUSTOMER_ID
     )
);

CREATE TABLE Returns (
    ORDER_ID int   NOT NULL,
    ORDER_STATUS varchar   NOT NULL,
    CONSTRAINT pk_Returns PRIMARY KEY (
        ORDER_ID
     )
);

CREATE TABLE Managers (
    REGION varchar   NOT NULL,
    MANAGER varchar   NOT NULL,
    CONSTRAINT pk_Managers PRIMARY KEY (
        REGION
     )
);

ALTER TABLE Orders ADD CONSTRAINT fk_Orders_ORDER_ID FOREIGN KEY(ORDER_ID)
REFERENCES Returns (ORDER_ID);

ALTER TABLE Orders ADD CONSTRAINT fk_Orders_CUSTOMER_ID FOREIGN KEY(CUSTOMER_ID)
REFERENCES Customers (CUSTOMER_ID);

ALTER TABLE Orders ADD CONSTRAINT fk_Orders_REGION FOREIGN KEY(REGION)
REFERENCES Managers (REGION);


-- Query * FROM Each Table Confirming Data
SELECT * FROM Orders;
SELECT * FROM Customers;
SELECT * FROM Managers;
SELECT * FROM Returns;
