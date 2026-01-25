# cross-sell-analysis-sql-pbi
# Project Background

This project analyzes an e-commerce retailer dataset named "Fuzzy Factory" to evaluate the scaling efficiency and cross-sell health of a multi product operation. By processing a 1.73M+ record database across 6 relational tables, the primary goal was to transform raw transactional data into a cleaned set of 32,313 verified orders to identify high revenue product bundles. By balancing a 171.83% YoY revenue surge against $110.04K in "revenue leakage" from refunds, this analysis isolates the most profitable cross-sell pairings to guide global marketing and quality control strategies.

Insights and recommendations are provided on the following key areas:

* **Growth & Scaling Efficiency:** Evaluation of explosive revenue surges vs. operational risk.
* **Cross-Sell Performance:** Analyzing attachment rates and product pairing success against internal benchmarks.
* **Profitability & Product Mix:** Identifying high value bundles with the best revenue-to-risk ratios.
* **Refund Risk Management:** Quantifying the $110K financial impact of returns and identifying high risk products.

Targeted SQL queries regarding various business questions can be found [here](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/fuzzy_factory_queries.sql).

An interactive Power BI dashboard used to report and explore sales trends can be found [here](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Cross-Sell%20Analysis.pbit).

# Data Structure & Initial Checks

The database structure consists of six relational tables with a total raw record count exceeding **1.73 million rows**. These tables track every stage of the customer journey from website sessions to final orders and refunds.

* **Orders Table:** Tracks primary transaction details, including `order_id`, `created_at`, and `price_usd`.
* **Order_items Table:** Contains line level details for every product in an order, allowing for the identification of primary vs. cross-sell items.
* **Refunds Table:** Logs all returned products and the associated financial loss.
* **Products Table:** Detailed catalog information for our product offerings.
* **Website_Sessions/Pageviews:** Supporting tables for traffic and conversion analysis.

![ERD](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/ERD.png)

# Executive Summary

### Overview of Findings

The business has achieved a remarkable **171.83% Year-over-Year revenue surge**, signaling explosive market demand and successful scaling. However, this growth has been accompanied by **$110.04K in financial "leakage"** from 1,731 refunded units, suggesting that quality control and customer expectations are being strained by the rapid expansion. To maximize net profit, the company must pivot its cross-selling focus toward high margin, low risk bundles like the **Product 2 + 4 pairing** (AOV $89.98) while addressing the high refund rates associated with the current top volume bundles.


# Insights Deep Dive

### Category 1: Growth & Scaling Efficiency

* **Explosive Revenue Growth:** The company recorded a **171.83% YoY increase in revenue**, demonstrating strong market fit and aggressive customer acquisition.
* **Transactional Scale:** The analysis successfully processed and validated **32,313 verified orders** from a raw pool of 1.73M+ records, establishing a clean foundation for KPI tracking.
* **Scaling Strain:** Rapid growth is directly correlated with an increase in operational complexity, necessitating the deployment of the newly engineered **Analytical View Architecture** in SQL to monitor performance in real time.

### Category 2: Cross-Sell Performance & Benchmarking

* **Benchmark Leader:** **Product 3** emerged as the most successful cross-sell driver, achieving a **21.00% attachment rate** and successfully exceeding our 20% internal performance benchmark.
* **Underperforming Pairings:** **Product 1** showed significant cross-sell weakness, with an attachment rate of only **13.10%**, failing to meet the 20% target and indicating a need for better product market alignment.
* **Volume Distribution:** Analysis of order composition revealed that while primary items drive traffic, secondary "Attachment" items contributed **8,000 units** to total volume, highlighting their importance to bottom line growth.

![Dashboard Preview](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/Snapshot%20of%20Dashboard%20(prd%20performance).png)

### Category 3: Profitability & Product Mix

* **Premium Value Bundle:** The **Product 2 + Product 4** combination was identified as the highest-value lever, yielding a **Combo AOV of $89.98**.
* **Healthy Growth:** Unlike other high volume pairings, the Product 2 bundle maintains a low **2.73% refund risk**, making it the safest option for global marketing investment.
* **Revenue vs. Volume:** While some products drive high volume, this analysis prioritized "Net Value Per Order" to ensure that growth is profitable rather than just high scale.

### Category 4: Refund Risk & Quality Control

* **Quantifying Leakage:** Total financial leakage reached **$110.04K**, driven by **1,731 refunded units**, highlighting a significant drain on net profitability.
* **High-Risk Driver:** **Product 3** bundles, despite high attachment rates, carry a dangerous **8.13% refund rate**, suggesting that the bundle may not be meeting customer expectations or has quality defects.
* **Regional Impact:** Refund patterns varied, suggesting that certain shipping routes or regional quality batches may be contributing to the $110K loss.

![Dashboard Preview](https://github.com/afrinanegaban/cross-sell-analysis-sql-pbi/blob/main/Image/Snapshot%20of%20Dashboard%20(refund%20overview).png)

# Recommendations

Based on the insights and findings above, I recommend the Growth and Operations teams consider the following:

* **Pivot Marketing Spend:** Transition global ad spend from Product 1 cross-sells to **Product 2 + 4 bundles**. Observation: Product 2 offers the highest AOV ($89.98) with the lowest refund risk (2.73%).
* **Quality Audit for Product 3:** Initiate an immediate audit of the **Product 3 bundle** fulfillment process. Observation: Product 3 has the highest refund rate at 8.13%, which is undermining the growth driven by its high 21% attachment rate.
* **Revise Product 1 Bundling:** Re-evaluate the product pairing for Product 1. Observation: Its 13.10% attachment rate is significantly below the 20% benchmark, suggesting the current "partner product" is not appealing to this segment.
* **Automate Monitoring:** Deploy the **SQL Analytical View** as a permanent daily report. Observation: Manually processing 1.73M rows is inefficient; the engineered view allows for instant monitoring of leakage and attachment rates.

