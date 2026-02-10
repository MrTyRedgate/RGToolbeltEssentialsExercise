# Redgate SQL Toolbelt Essentials - Hands-On Exercise

Welcome to the SQL Toolbelt Essentials practical exercise. This guide will walk you through installing the required software and setting up sample databases for exploring Redgate's database DevOps tools.

## Exercise Goals

By the end of this exercise, you will be familiar with:

**Primary Focus:**
- **SQL Source Control** - Version control your database schema
- **SQL Compare** - Compare and synchronize database schemas between environments

**Secondary Tools:**
- **Dependency Tracker** - Visualize object dependencies in your database
- **SQL Doc** - Generate documentation for your database schema

---

## Prerequisites

- Windows 10/11 laptop with administrator access
- Minimum 8GB RAM recommended
- At least 10GB free disk space

---

## Part 1: Software Installation

### Step 1: Install SQL Server Express

1. Download **SQL Server 2025 Express** from Microsoft:
   - **Direct link:** https://go.microsoft.com/fwlink/p/?linkid=2216019
   

2. Run the installer and choose **Basic** installation type using defaults

3. Accept the license terms and click **Install**

4. Wait for installation to complete (5-10 minutes)

5. Note the connection string shown at the end - the server name is typically `localhost\SQLEXPRESS`

---

### Step 2: Install SQL Server Management Studio (SSMS)

1. Download **SSMS 20** from Microsoft:
   - **Direct link:** https://aka.ms/ssmsfullsetup


2. Run the installer

3. Click **Install** and wait for completion (5-10 minutes)

4. Restart your computer if prompted

---

### Step 2a: Configure SQL Server Network Settings (if needed)

> **Note:** Only complete these steps if SSMS cannot connect to SQL Server.

To ensure SSMS can connect to SQL Server Express:

1. Open **SQL Server Configuration Manager**
   - Search for "SQL Server Configuration Manager" in the Start menu

2. Expand **SQL Server Network Configuration**

3. Click **Protocols for SQLEXPRESS**

4. Enable **TCP/IP** (right-click > Enable)

5. Enable **Named Pipes** (right-click > Enable)

6. Open **Services** (search "Services" in Start menu)

7. Find **SQL Server Browser**, set it to **Automatic** and **Start** it

8. Restart the **SQL Server (SQLEXPRESS)** service

---

### Step 3: Install Redgate SQL Toolbelt Essentials

1. Download **SQL Toolbelt Essentials** from Redgate:
   - **Direct link:** https://download.red-gate.com/installers/SQLToolbeltEssentials/2026-02-09/SQLToolbeltEssentials.exe

2. Run the installer

3. Select **all components** to install

4. Follow the installation wizard

5. When prompted, sign in to the **Redgate licensing portal** to access your license or start a **14-day free trial**

---

## Part 2: Create Sample Databases

### Step 1: Connect to SQL Server

1. Open **SQL Server Management Studio (SSMS)**

2. In the Connect dialog:
   - **Server name:** `localhost\SQLEXPRESS`
   - **Authentication:** Windows Authentication
   - You may need to tick **Trust server certificate**
   - Click **Connect**

### Step 2: Run the Setup Script

1. Open the file `CreateSimpleDBDatabases.sql` from this folder

2. In SSMS, go to **File > Open > File** and select the script

3. Click **Execute** (or press F5)

4. Wait for the script to complete

5. Refresh the Databases folder in Object Explorer to see:
   - `SimpleDB_Dev1`
   - `SimpleDB_Dev2`
   - `SimpleDB_Test`
   - `SimpleDB_Prod`

---

## Part 3: Explore the Tools

> **Wait for the instructor before completing these exercises.**

### Exercise A: SQL Source Control - Initial Setup

**Objective:** Link a database to source control and commit the initial schema

1. In SSMS Object Explorer, right-click on `SimpleDB_Dev1`
2. Select **SQL Source Control > Link Database to Source Control...**
3. Choose your source control system (Git, TFS, SVN, etc.) or **"Just let me try it out"** for a Demo
4. Select a repository folder
5. Click **Link**
6. Observe how database objects appear as scripts in source control
7. **Commit** all objects to version control as your initial baseline - think of a meaningful commit message (e.g., "Initial database schema")

---

### Exercise B: SQL Source Control - Making Changes

**Objective:** Make schema changes and commit them to source control

1. In SSMS, open `Exercises.sql` from this folder

2. Run the tasks in order (1, 2, 3) to make schema changes to `SimpleDB_Dev1`

3. Return to SQL Source Control in SSMS and use the Commit Tab

4. See the new changes appear (the Socials table, ListSocials stored procedure, and WorkPhone column)

5. Select and **Commit** all your changes to version control

---

### Exercise C: SQL Compare - Deploy to Test

**Objective:** Deploy your changes from Dev1 to Test

1. Open **SQL Compare** from the Start menu or SSMS Tools menu

2. In the comparison wizard:
   - **Source:** Select **SQL Source Control**, then choose `SimpleDB_Dev1` with revision **Latest (HEAD)**
   - **Target:** Select **Database**, choose server `(local)\SQLEXPRESS`, tick **Trust certificate**, then select `SimpleDB_Test`

3. Click **Compare Now**

4. Review the differences - you should see the changes you made in Exercise B

5. Select the objects to deploy

6. Generate a deployment script to sync `Test`

7. Review the script and deploy the changes

8. Now repeat the process to deploy those changes to `SimpleDB_Prod` as well.
 **NB** Did you notice anything about Prod that was concerning?

---

### Exercise D: Dependency Tracker (Secondary)

**Objective:** Visualize database object dependencies

1. Open **Dependency Tracker** from the Start menu

2. Connect to `SimpleDB_Dev1`

3. Explore the dependency graph for:
   - `Sales.Orders` table - see related views, stored procedures, and foreign keys
   - `Sales.CustomerOrdersView` - see which tables it depends on

---

### Exercise E: SQL Doc (Secondary)

**Objective:** Generate database documentation

1. Open **SQL Doc** from the Start menu

2. Create a new project and connect to `SimpleDB_Test`

3. Select all database objects to document

4. Choose output format (HTML, PDF, or Word)

5. Generate documentation

6. Review the output - tables, relationships, stored procedures are all documented

---

## Database Schema Overview

Each sample database contains:

| Schema | Objects |
|--------|---------|
| **Customers** | Customer, LoyaltyProgram, CustomerFeedback tables + views |
| **Inventory** | Flight, FlightRoute, MaintenanceLog tables + views |
| **Sales** | Orders, DiscountCode, OrderAuditLog tables + views + stored procedures |

**Sample Stored Procedures:**
- `Sales.GetCustomerFlightHistory` - View customer's order history
- `Sales.UpdateOrderStatus` - Update an order's status
- `Sales.ApplyDiscount` - Apply discount codes to orders
- `Inventory.UpdateAvailableSeats` - Manage flight seat inventory
- `Customers.RecordFeedback` - Record customer feedback

---

## Troubleshooting

### Cannot connect to SQL Server
- Ensure SQL Server service is running (Services > SQL Server (SQLEXPRESS))
- Try `localhost\SQLEXPRESS` or `.\SQLEXPRESS` as server name
- Check Windows Firewall isn't blocking connections

### SQL Toolbelt tools not appearing in SSMS
- Restart SSMS after installing the Toolbelt
- Check the Tools menu in SSMS for Redgate options

### Script execution errors
- Ensure you're connected with a login that has sysadmin privileges
- Run the script from the `master` database context

---

## Quick Reference

| Tool | Purpose | Access |
|------|---------|--------|
| SQL Source Control | Version control for databases | SSMS > Right-click database |
| SQL Compare | Schema comparison & sync | Start Menu or SSMS Tools |
| Dependency Tracker | Visualize object relationships | Start Menu |
| SQL Doc | Generate documentation | Start Menu |

---

*Happy exploring! Ask questions if you get stuck.*
