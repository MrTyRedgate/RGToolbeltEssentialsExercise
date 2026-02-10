# Setup Guide - SQL Toolbelt Essentials

This guide covers installing the required software for the hands-on exercise. **If you're using a Demo VM provided by the presenter, skip this guide entirely.**

---

## Prerequisites

- Windows 10/11 laptop with administrator access
- Minimum 8GB RAM recommended
- At least 10GB free disk space

---

## Step 1: Install SQL Server Express

1. Download **SQL Server 2025 Express** from Microsoft:
   - **Direct link:** https://go.microsoft.com/fwlink/p/?linkid=2216019
   

2. Run the installer and choose **Basic** installation type using defaults

3. Accept the license terms and click **Install**

4. Wait for installation to complete (5-10 minutes)

5. Note the connection string shown at the end - the server name is typically `localhost\SQLEXPRESS`

---

## Step 2: Install SQL Server Management Studio (SSMS)

1. Download **SSMS 20** from Microsoft:
   - **Direct link:** https://aka.ms/ssmsfullsetup


2. Run the installer

3. Click **Install** and wait for completion (5-10 minutes)

4. Restart your computer if prompted

---

## Step 2a: Configure SQL Server Network Settings (if needed)

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

## Step 3: Install Redgate SQL Toolbelt Essentials

1. Download **SQL Toolbelt Essentials** from Redgate:
   - **Direct link:** https://download.red-gate.com/installers/SQLToolbeltEssentials/2026-02-09/SQLToolbeltEssentials.exe

2. Run the installer

3. Select **all components** to install

4. Follow the installation wizard

5. When prompted, sign in to the **Redgate licensing portal** to access your license or start a **14-day free trial**

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

*Once setup is complete, return to the main README to continue with the exercises.*
