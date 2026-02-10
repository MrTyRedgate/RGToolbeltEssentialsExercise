/*
=============================================================================
SQL Toolbelt Exercises - SimpleDB_Dev1
=============================================================================
*** DO NOT RUN THESE COMMANDS UNTIL THE INSTRUCTOR TELLS YOU TO ***
=============================================================================
Complete these tasks in order: 1, 2, 3
Make sure you are connected to SimpleDB_Dev1 before running these scripts.
=============================================================================
*/

USE SimpleDB_Dev1;
GO

-- =============================================================================
-- TASK 1: Create the Customers.Socials Table
-- =============================================================================
-- This table will store social media details for customers.
-- Run this task FIRST before proceeding to Task 2.
-- =============================================================================

CREATE TABLE Customers.Socials
(
    CustomerID  INT           NOT NULL,
    Facebook    NVARCHAR(255) NULL,
    X           NVARCHAR(255) NULL,
    Instagram   NVARCHAR(255) NULL,
    Youtube     NVARCHAR(255) NULL,
    CONSTRAINT PK_Socials_CustomerID PRIMARY KEY (CustomerID),
    CONSTRAINT FK_Socials_CustomerID FOREIGN KEY (CustomerID) REFERENCES Customers.Customer(CustomerID)
);
GO

-- =============================================================================
-- TASK 2: Create the Customers.ListSocials Stored Procedure
-- =============================================================================
-- This stored procedure returns all rows from the Socials table.
-- Run this task SECOND after Task 1 has been completed.
-- =============================================================================

CREATE PROCEDURE Customers.ListSocials
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CustomerID,
        Facebook,
        X,
        Instagram,
        Youtube
    FROM Customers.Socials;
END;
GO

-- =============================================================================
-- TASK 3: Add WorkPhone Column to Customers.Customer Table
-- =============================================================================
-- This adds a new column to store customer work phone numbers.
-- Run this task THIRD after Tasks 1 and 2 have been completed.
-- =============================================================================

ALTER TABLE Customers.Customer
    ADD WorkPhone INT NULL;
GO

-- =============================================================================
-- END OF EXERCISES
-- =============================================================================
