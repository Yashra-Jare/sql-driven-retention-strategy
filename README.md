# 🛍️ Decoding Customer Value: A SQL-Driven Retention Strategy

> **Is the business building loyal customers — or just attracting bargain hunters?**  
> A full-stack data analytics project for a D2C fashion brand with 3,900+ customers.

---

![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-336791?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen?style=for-the-badge)

---

## 📌 Background

A direct-to-consumer (D2C) fashion brand sells clothing, accessories, footwear, and outerwear across the United States. Every customer relationship is managed directly by the brand — no physical stores, no third-party retailers.

The brand has grown steadily and now has behavioral data covering **~3,900 customers**. It runs a promotional discount program but has **never built a structured way to understand its customers** beyond surface-level sales numbers.

**The founding team is at a critical point:**  
Keep running promotions reactively and hope customers return — or build something deliberate.  
**They chose to build.**

---

## ❓ Core Problem

The brand has data but no intelligence built on top of it. It cannot answer:

- Who are the customers likely to still be buying two years from now?
- Is the discount program building loyalty — or just attracting bargain hunters?
- Which product categories are entry points vs. retention drivers?
- Where does the brand have organic demand vs. promo-driven volume?
- What does the brand's best customer actually look like?

---

## 🎯 Key Questions Answered

| # | Question |
|---|----------|
| 1 | Who are genuinely loyal customers vs. those who only buy on discount? |
| 2 | What behavioral patterns today predict high customer value over time? |
| 3 | Which geographies and demographics are commercially underlevered? |
| 4 | How should the brand restructure its promotional strategy to protect margins? |
| 5 | What does the brand's ideal customer profile look like? |

---

## 🔬 Scope of Analysis

### 1. Data Preparation & Feature Engineering (Python)
- Cleaned raw dataset
- Built customer-level metrics from scratch (no loyalty score or churn label existed)
- Engineered 3 key features:
  - **Dependency Score** — how much a customer relies on discounts
  - **Value Tier** — High / Mid / Low classification
  - **Satisfaction Flag** — satisfied or not, based on behavioral signals

### 2. Customer Segmentation & Analysis (SQL)
- Built a structured query layer to answer all 5 key business questions
- Identified high-value vs. low-value customer profiles
- Mapped seasonal and geographic demand patterns

### 3. Founder Dashboard (Power BI)
Four-panel dashboard built for a non-technical founding team:
- **Customer Pyramid** — how value is distributed across the customer base
- **Promo Dependency vs. Retention Rate** — who needs discounts to buy, and who doesn't
- **Geographic Opportunity Map** — regions with high spend and low promo dependency
- **Category Funnel** — entry-point categories vs. retention categories

### 4. Retention Playbook (Business Recommendations)
- **Promotional Sunset Plan** — which segments to gradually stop discounting, why, and when
- **Ideal Customer Profile** — a data-backed description specific enough for marketing targeting

---

## 📦 Deliverables

| Tool | Output |
|------|--------|
| Python | Cleaned dataset + engineered features |
| SQL | Segmentation queries answering all 5 key questions |
| Power BI | Four-panel founder dashboard |
| Playbook | Promo sunset plan + ideal customer profile |
| Summary | One-page executive summary |

---

## 📁 Repository Structure

```
customer-retention-sql-project/
├── data/
│   └── customer_data.xlsx          # Raw dataset (sample only)
├── python/
│   └── feature_engineering.py      # Feature creation + data cleaning
├── sql/
│   └── segmentation_queries.sql    # All segmentation queries
├── dashboard/
│   └── customer_dashboard.html     # Interactive live dashboard
├── docs/
│   ├── retention_playbook.md       # Business recommendations
│   └── executive_summary.md        # One-page findings summary
└── README.md
```

---

## 🚀 Live Dashboard

👉 **[Click here to view the live dashboard](https://yashra-jare.github.io/sql-driven-retention-strategy/dashboard/dashboard.html)**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas) | Data cleaning, feature engineering |
| SQL | Customer segmentation, business queries |
| Power BI | Interactive dashboard |
| GitHub Pages | Dashboard hosting |

---

## 📊 Key Findings

*(Fill this section after your analysis is complete)*

- **X%** of revenue comes from promo-dependent customers
- **Top value tier** customers have Y times higher repeat purchase rate
- **Geography insight**: cities like [X] show high organic demand
- **Ideal customer profile**: [age range], [category preference], [payment method]

---

## 🏫 Context

This project was built as part of the **Consulting & Analytics Club, IIT Guwahati** — SQL | Consulting track.

---

## 👤 Author

| **Yashraj Jare** |
Mechanical Engineering, IIT Guwahati  
[GitHub](https://github.com/yashra-jare) •
---

> *"Every segment claim must be traceable. Labels like 'at-risk' or 'high-value' are only valid if they map to a specific, stated combination of variables."*
