# 📊 Corporate ESG & Decarbonization Strategy Dashboard

## 📌 Project Overview
This project focuses on tracking corporate carbon footprints, analyzing greenhouse gas (GHG) reduction targets, and identifying operational emissions risks using **SQL and Power BI**. The dashboard provides a unified executive view of Scope 1, 2, and 3 emissions, regulatory compliance variances, and operational drivers of carbon intensity, enabling data-driven sustainability strategies.

---

## 🎯 Key Objectives

- Quantify corporate carbon liabilities across **Scope 1, 2, and 3 emissions**
- Evaluate multi-year reduction performance against a **fixed 2024 historical baseline**
- Track real-time compliance gaps using **Target Variance (MT)** metrics  
- Isolate carbon-heavy operational assets based on industrial **segment and country**
- Identify specific carbon root-causes (e.g., fuel type or transport mode) for mitigation  

---

## 📊 Key KPIs in the Dashboard

- **Total GHG Emissions:** 321,544.75 MT CO2e (Accumulated corporate carbon footprint across all reporting years)
- **2024 Baseline Emissions:** 154,210.30 MT CO2e (The fixed historical anchor used to judge reduction targets)
- **Target Variance:** +14,842.15 MT CO2e (The total volume running over the combined regulatory budget, signaling risk)
- **Scope 1 & 2 Emissions:** 182,344.25 MT CO2e (Carbon footprint originating directly from internal facility utility consumption)
- **Scope 3 Emissions:** 139,200.50 MT CO2e (Indirect carbon footprint generated via supply chain freight logistics)

---

## 📈 Dashboard Insights Covered

- **The CSO Executive Control Tower (KPI Cards)** Displays absolute emissions volumes alongside color-coded indicators showing target status.

- **Scope Segment Breakdown (Donut Chart)** Provides an immediate visual split between facility operations (Scope 1 & 2) and logistics (Scope 3).

- **Decarbonization Trajectory (Line Chart)** Plots a time-series gap analysis comparing actual historical emissions lines directly against the regulatory target ceiling line across 2024, 2025, and 2026.

- **Global Emissions Liability (Regional Compliance Map)** Pins facility locations on a world map with green-to-red conditional gradients highlighting regional compliance risks.

- **Operational Carbon Root-Cause (Decomposition Tree)** An interactive, AI-driven drill-down visual mapping total carbon metrics down through *Segment ➔ Country ➔ Facility Name ➔ Fuel/Transport Activity*.

- **Plant Performance Risk Grid (Matrix Table)** A tabular matrix highlighting precise year-over-year target variances with soft red-to-green heat-mapping.

---

## 🗂️ Dataset Information

This project integrates disparate corporate operational registries into a centralized data structure:
- **`esg_facilities_dim`**: Contains facility unique identifiers, location details, industry segments, and mandatory decarbonization targets.
- **`esg_emissions_factors_dim`**: Contains certified annual conversion coefficients based on activity type (e.g., Grid Electricity, Air Freight, Solar).
- **`esg_energy_consumption_fact`**: Contains monthly utility tracking records (MWh) across all physical facilities.
- **`esg_logistics_fact`**: Contains supply chain freight transport registers tracking mass (tons) and travel distance (km).

---

### ⚠ Disclaimer

This dataset is used for **educational and portfolio demonstration purposes only**. All facility names, operational metrics, and carbon tracking figures are **synthetic and do not represent real corporate performance or properties**.

---

## 🧹 Advanced Data Engineering & SQL View Creation

- **Staging Layer Architecture:** Ingested fragmented operational utility and logistics files as text formats into temporary database schemas to establish a safe transformation layer.
- **Data Type Standardization:** Utilized advanced date-parsing syntax to cast inconsistent reporting strings into true, queryable database date values.
- **Dynamic Session Overrides:** Configured strict safety-toggle overrides in the query environment to allow batch modification of structural tables without workflow interruptions.
- **Duplicate Records Scrubbing:** Engineered precise deduplication rules inside core queries to identify and filter out repeating facility entries that would otherwise artificially inflate carbon totals.
- **Dynamic Current-Date Gating:** Integrated real-time date filters to automatically restrict data visibility up through the current calendar day, actively dropping future-dated testing anomalies from the calculations.
- **Carbon Conversion Pre-calculation:** Constructed permanent relational views that automatically calculate absolute volumes ($MT\ CO_2e$) by dynamically pairing operational volumes against annual greenhouse gas conversion dimensions.

---

## 📐 Data Modeling & DAX Metric Architecture

- **Star Schema Standardization:** Configured a high-performance star schema model by connecting dimensional lookups (facilities and factor attributes) directly to calculated fact tables via clean, single-direction relationships.
- **Shared Calendar Engineering:** Generated a dedicated, centralized Time Intelligence date dimension using logical DAX formulas to establish uniform time-series constraints across completely separate operational activities.
- **Bridge Dimensions:** Built a custom scope mapping table to unify separate fact data elements into a single integrated attribute, allowing comprehensive visual slicing.
- **Absolute Scope Segregation:** Formulated measures to independently sum carbon volumes from utility consumption streams (Scope 1 & 2) and third-party transportation networks (Scope 3).
- **Historical Baseline Anchoring:** Created an unfilterable baseline measure utilizing advanced evaluation modifiers to permanently lock 2024 emissions data as a static comparison standard.
- **Dynamic Regulatory Ceilings:** Developed multi-layered logic to calculate real-time maximum emissions boundaries by reading facility-specific reduction goals directly against the 2024 baseline anchor.
- **Compliance Variance Metrics:** Authored variance expressions to track the exact metric ton gaps between actual emissions and target thresholds, driving automated green-to-red compliance alerts across visual report elements.

---

## 🛠️ Tools and Technologies Used

- **MySQL Workbench** ➔ Ingestion, text parsing, duplicate scrubbing, and view calculation engines.
- **Power BI Desktop** ➔ Advanced star schema modeling, custom calendar generation, and enterprise user interface design.
- **DAX (Data Analysis Expressions)** ➔ Time intelligence modifiers, table construction, and conditional formatting drivers.

---

## 🔍 Key Business Insights

- 📉 **Successful Decoupling:** Overall corporate metrics indicate a downward trend in absolute carbon volumes compared to the 2024 baseline.
- 🔴 **Sector Deviations:** While the **Automotive** and **Electronics** segments are safely meeting their reduction targets, the **Industrial Equipment** segment is consistently over budget, driving positive target variance liabilities.
- 🔴 **Utility Vulnerability:** Drill-downs expose high carbon dependency on regional **Grid Electricity** and **Natural Gas** utility structures within non-compliant manufacturing assets.
- 🔴 **Logistics Footprint:** In Scope 3 evaluations, **Air Freight** contributes steep, disproportionate carbon intensity spikes relative to the physical cargo mass transported.

---

## 💡 Business Recommendations

- **Renewable PPAs:** Move carbon-heavy facilities in the *Industrial Equipment* segment toward Onsite Solar arrays or regional Wind Power Purchase Agreements (PPAs) to mitigate electricity footprints.
- **Logistics Modal Shift:** Shift shipping procurement from *Air Freight* to *Ocean Freight or Rail* wherever supply chain timeline buffers permit.
- **Capital Realignment:** Redirect green modernization budgets directly to facilities exhibiting critical positive target variances to mitigate potential regulatory fines.
- **Supplier Requirements:** Introduce strict carbon caps for third-party shipping vendors to control Scope 3 distribution liabilities.

---

## 📸 Dashboard Preview

![image alt](https://github.com/neha396singh-hub/Corporate-ESG-and-Decarbonization-Strategy/blob/main/Documents/Dashboard_Overview.jpg?raw=true)

---

## 🚀 Project Summary

> This project showcases a robust, corporate-grade data ecosystem—engineering raw operational logs into pre-computed SQL views and transforming them into an interactive Power BI analytics suite for strategic carbon tracking and compliance audit readiness.

---

## 👩‍💻 Author

**Neha Singh** 
Business Analyst
