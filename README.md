# global-predictive-inventory-system
A data-driven system forecasting demand and tracking stock-out risks across global warehouses using rolling sales metrics and environmental context.


# Global Multi-Warehouse Predictive Inventory & Stock-Out Mitigation System

## 📋 Project Overview
This repository features a data engineering and analytics solution built to resolve inventory distribution challenges across global fulfillment centers. The framework processes historical sales momentum, stock tiers, and environmental variables to mitigate stock-outs and decrease overhead costs.

## 💼 Business Problem
The enterprise operates across multiple international fulfillment hubs, namely **Dubai, Lagos, London, and New York**. Operating without a unified inventory analytics platform resulted in distinct inefficiencies:
* **Revenue Losses:** Occurred due to premature stock-outs in high-demand municipal markets.
* **Capital Bloat:** Caused by high carrying and holding costs from overstocking slow-moving goods in other regions.

## 🎯 Project Objective
To architect an end-to-end data-driven pipeline that:
1. Forecasts regional consumer demand using historical sales momentum.
2. Formulates a live engine calculating inventory **Days of Coverage**.
3. Safeguards supply chain ecosystems against distribution bottlenecks and disruptions.

## 🛠️ Tech Stack & Tools
* MySQL 
* Tableau
  
## ⚙️ System Architecture & Data Approach

### 1. Data Integration Layer
* Consolidates discrete schemas including master product specifications, chronological sales histories, and real-time stock balances.
* Normalizes data entities into a standardized data model known as the **"Golden Dataset"**.

### 2. Feature Engineering Engine
* Computes **7-day and 30-day rolling averages** to map short-term demand shocks against long-term baselines.
* Structural design explicitly prevents data leakage by calculating rolling windows strictly behind historical horizons.

### 3. Environmental Context Layer
* Synthesizes external data signals—specifically marketing promotional schedules and municipal local temperature trends—to refine demand variance calculations.

### 4. Risk Visualization Dashboard
* An analytical monitoring network driven by a heatmap-based matrix tracking operational stock-out probabilities filtered by warehouse and SKU.


## 📊 Data Insights & Analytical Findings
* **Regional Variance:** Demand patterns and overall stock health vary significantly by city. A static, uniform reorder point strategy is highly ineffective across disparate global hubs.
* **Lead Time Vulnerability:** High-velocity goods, such as the *Latex Extreme Trainer* in New York, possess coverage metrics dropping below average supplier lead times, signaling an imminent stock-out.
* **Inventory Bloat:** Capital stagnation is prominent in specific apparel categories, notably the *Daily Support Corset*, which remains overstocked while faster-moving SKUs starve for budget allocation.

## 🚀 Strategic Action Plan & Recommendations

### 1. Inter-Warehouse Stock Transfers
Initiate immediate redistribution workflows of overstocked components between nodes to balance coverage levels without waiting for supplier lead times. 
* *Example Action:* Transition excess allocations of *Toned Arm Shapers* from New York directly to Dubai.

### 2. Dynamic Reordering Mechanics
Convert static warehouse reorder bounds within SQL production systems to adapt dynamically based on the localized **7-day rolling sales average** parameter.

### 3. Promotional Boundary Alignment
Cross-evaluate the `is_promotion` active marketing flag directly against current Days of Coverage parameters. Ensure internal restrictions block promotional deployments for any item with less than **20 days** of verified stock coverage.
