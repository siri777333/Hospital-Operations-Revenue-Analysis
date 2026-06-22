# 🏥 Hospital Operations & Revenue Analysis Dashboard

### SQL Server | Power BI | DAX | Healthcare Analytics

## Project Overview

Developed an end-to-end healthcare analytics solution using SQL Server and Power BI to analyze hospital operations, revenue performance, workforce utilization, and patient behavior.
Built on a 5-table relational database containing Patients, Doctors, Appointments, Treatments, and Billing data. Created 11 SQL queries using CTEs, Window Functions, Multi-Table JOINs, Conditional Aggregation, and Ranking Functions, then transformed the results into a 2-page interactive Power BI dashboard.

## Tools & Technologies
* SQL Server
* Power BI
* DAX
* SQL
* Data Visualization
* Healthcare Analytics

## 📊 Key Metrics

| Metric                           | Value           |
| -------------------------------- | --------------- |
| Total Revenue                    | ₹551.25K        |
| Average Patient Lifetime Revenue | ₹57.26K         |
| Total Appointments               | 200             |
| Revenue Peak                     | ₹64K (Apr 2023) |
| Revenue Low                      | ₹28K (Dec 2023) |
| Appointment Loss Rate            | 49%             |

##  Key Business Insights

### Revenue Leakage

Identified unpaid treatments across multiple categories, including **36 Chemotherapy** and **29 ECG** cases, helping prioritize revenue recovery efforts.

### Doctor Performance Analysis

Measured doctor-level completion, cancellation, and no-show rates to support performance evaluation and operational planning.

### Patient Lifetime Value

Ranked patients by total revenue contribution using SQL Window Functions to identify high-value patients for retention strategies.

### Specialization Revenue Analysis

* Oncology: ₹259K (47%)
* Dermatology: ₹203K (37%)
* Pediatrics: ₹90K (16%)

Revealed a significant revenue gap between medical specializations.

### Branch Workload Analysis

Detected workload imbalance across hospital branches, with Central Hospital and Eastside Clinic handling more appointments per doctor than Westside Clinic.

### Senior Doctor ROI Analysis

Compared doctor experience with generated revenue and found that higher experience did not always translate into higher financial performance.

### Monthly Revenue Trends

Tracked monthly revenue fluctuations and identified a 56% decline from the yearly peak to the lowest-performing month.

##  Critical Finding

Out of 200 appointments:
* 51 Cancelled (25.5%)
* 46 No-Shows (23%)
This resulted in a **49% appointment loss rate**, making missed appointments the largest operational and revenue challenge identified in the analysis.

## Dashboard Highlights
### Page 1 – Financial & Doctor Overview
* Total Revenue KPI
* Average Patient Lifetime Revenue KPI
* Doctor Performance Analysis
* Top 5 Treatments
* Revenue Leakage Treemap
* Revenue by Specialization
* Doctor Experience vs Revenue

### Page 2 – Operational Analysis
* Monthly Revenue Trend
* Gender Distribution
* Appointments by Hospital Branch
* Appointment Status Analysis

## SQL Skills Demonstrated
* Common Table Expressions (CTEs)
* Window Functions (RANK)
* CASE WHEN Conditional Aggregation
* INNER JOIN & LEFT JOIN
* Multi-Table JOINs
* GROUP BY & Aggregations
* COUNT DISTINCT
* CAST & ROUND
* Date Functions (MONTH, FORMAT)

## Repository Contents
* Hospital_Operations_Revenue_Analysis.sql
* Hospital_Operations_Revenue_Analysis.pbix
* Dashboard Screenshots
* README.md

## Dashboard Preview

### Page 1 – Financial & Doctor Overview

<img width="895" height="500" alt="Dashboard Screenshot 1" src="https://github.com/user-attachments/assets/0ebaefb7-3a45-4fa1-a66d-c9050cde4bcd" />


### Page 2 – Operational Analysis

<img width="884" height="484" alt="Dashboard Screenshot 2" src="https://github.com/user-attachments/assets/bb9e13a2-2763-4bf0-a708-cc364ed9acf6" />


## Business Impact

The dashboard provides hospital management with actionable insights to improve revenue recovery, reduce appointment losses, optimize workforce allocation, identify high-value patients, and support data-driven operational decision-making.
