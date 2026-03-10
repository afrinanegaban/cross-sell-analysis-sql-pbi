# cross-sell-analysis-sql-pbi
# Project Background

This project analyzes a 1.73M+ record e-commerce dataset to evaluate the scaling efficiency and cross-sell health of a multi-product operation. Using MySQL for data engineering and Power BI for strategic visualization, the primary goal was to transform raw transactional data into a verified set of 32,313 orders to identify high value product bundles.

By auditing a 171.83% YoY revenue surge against $110.04K in financial leakage from refunds, this analysis isolates the most profitable cross-sell pairings to guide global marketing and quality control strategies.

### Insights and recommendations are provided on the following key areas:

* **Growth & Scaling Efficiency:** Evaluation of explosive revenue surges vs. operational risk.
* **Cross-Sell Performance:** Analyzing attachment rates and product pairing success against internal benchmarks.
* **Profitability & Product Mix:** Identifying high value bundles with the best revenue-to-risk ratios.
* **Refund Risk Management:** Quantifying the $110K financial impact of returns and identifying high risk products.

Targeted SQL queries regarding various business questions can be found [here](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/fuzzy_factory_queries.sql).

An interactive Power BI dashboard used to report and explore sales trends can be found [here](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Cross-Sell%20Analysis.pbit).

# Data Structure & Initial Checks

The database architecture consists of six relational tables tracking the customer journey from initial session to final refund. To ensure data integrity, I engineered a Unified Fact Table (prd_performance_fact) to streamline the reporting process.

* Relational Logic: Integrated orders, order_items, and refunds to isolate primary vs. secondary (cross-sell) items.

* Data Quality Audit: Used SQL to validate the 1.73M row pool, ensuring 100% accuracy in the 32,313 verified orders.


![ERD](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/ERD.png)


# Executive Summary

### Overview of Findings

The business has achieved a remarkable **171.83% Year-over-Year revenue surge**, signaling explosive market demand and successful scaling. However, this growth has been accompanied by **$110.04K in financial "leakage"** from 1,731 refunded units, suggesting that quality control and customer expectations are being strained by the rapid expansion. SQL analysis discovered that while Product 3 is increasing volume , but the Product 2 + 4 pairing is the strategic winner, offering an $89.98 AOV with the lowest refund risk (2.73%).

To maximize net profit, the company must pivot its cross-selling focus toward high margin, low risk bundles like the **Product 2 + 4 pairing** (AOV $89.98) while addressing the high refund rates associated with the current top volume bundles.


# Insights Deep Dive

### Category 1: Growth & Scaling Efficiency

* **Explosive Revenue Growth:** The company recorded a **171.83% YoY increase in revenue**, demonstrating strong market fit and aggressive customer acquisition.
* **Analytical View Architecture:** Curated a systematic cleanup of 1.73M raw records to isolate 32,313 verified transactions, creating a high integrity foundation for KPI tracking.

![Query 1](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/Query%201.png)

### Category 2: Cross-Sell Performance & Benchmarking

* **Benchmark Leader:** **Product 3** emerged as the most successful cross-sell driver, achieving a **21.00% attachment rate** and successfully exceeding our 20% internal performance benchmark.
* **Underperforming Pairings:** **Product 1** showed significant cross-sell weakness, with an attachment rate of only **13.10%**, failing to meet the 20% target and indicating a need for better product market alignment.
* **Attachment Rate Gap:** Identified that while primary items drive traffic, secondary items contributed **8,000** units to total volume.

![Query 4](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/Query%204.png)

### Category 3: Profitability & Product Mix

* **Value Bundle:** SQL analysis confirms that the Product 3 + 4 combination significantly out-performs individual sales, yielding a Combo AOV of $75.98 compared to just $54.46 for standalone Product 3 orders.

* **Marginal Revenue Growth:** Successfully validated that bundling Product 4 as a cross-sell item drives a 39% increase in average order value ($54.46) for the Product 3 customer base, identifying a high-margin lever for bottom-line growth.

![Query 7](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/Query%207.png)

### Category 4: Refund Risk & Quality Control

* **Quantifying Leakage:** Total financial leakage reached **$110.04K**, driven by **1,731 refunded units**, highlighting a significant drain on net profitability.
* **High-Risk Driver:** **Product 3** bundles, despite high attachment rates, carry a dangerous **8.13% refund rate**, signaling potential quality defects or misaligned customer expectations.

![Query 6](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/Query%206.png)

# Visualization: 
### [🔗Dashboard Link](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Cross-Sell%20Analysis.pbit)


<table style="width:100%">
  <tr>
    <th style="text-align:center">Product Performance</th>
    <th style="text-align:center">Refund Overview </th>
  </tr>
  <tr>
    <td><img src="https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/raw/main/Image/Snapshot%20of%20Dashboard%20(prd%20performance).png" alt="Product Performance" width="100%"/></td>
    <td><img src="https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/raw/main/Image/Snapshot%20of%20Dashboard%20(refund%20overview).png" alt="Refund Overview" width="100%"/></td>
  </tr>
  <tr>
    <td align="center"><i>Visualizing Attachment Rates & AOV Lift</i></td>
    <td align="center"><i>Monitoring Financial Leakage & Refund Drivers</i></td>
  </tr>
</table>

# Recommendations

Based on the insights and findings above, I recommend the Growth and Operations teams consider the following:

* **Pivot Marketing Spend:** Transition global ad spend from Product 1 cross-sells to **Product 2 + 4 bundles**. Observation: Product 2 offers the highest AOV ($89.98) with the lowest refund risk (2.73%).
* **Quality Audit for Product 3:** Initiate an immediate audit of the **Product 3 bundle** fulfillment process. Observation: Product 3 has the highest refund rate at 8.13%, which is undermining the growth driven by its high 21% attachment rate.
* **Revise Product 1 Bundling:** Re-evaluate the product pairing for Product 1. Observation: Its 13.10% attachment rate is significantly below the 20% benchmark, suggesting the current "partner product" is not appealing to this segment.
* **Automate Monitoring:** Deploy the **SQL Analytical View** as a permanent daily report. Observation: Manually processing 1.73M rows is inefficient; the engineered view allows for instant monitoring of leakage and attachment rates.

