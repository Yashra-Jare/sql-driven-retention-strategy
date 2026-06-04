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
- Cleaned raw dataset (imputed 37 missing Review Ratings with column median)
- Built customer-level metrics from scratch — no loyalty score, churn label, or timestamps existed
- Engineered 6 features:
  - **Promo Dependency Score** — how much a customer relies on discounts (0 / 50 / 100)
  - **Value Tier** — High / Mid / Low based on tercile split of purchase amount
  - **Satisfaction Flag** — Review Rating ≥ 4.0 = satisfied
  - **Loyalty Score (A & B)** — two competing definitions tested; Loyalty B (Frequency × Purchase History) selected over Loyalty A due to lower revenue correlation (avoids circular logic)
  - **Loyalty Segment** — Champion / Established / Developing / Low
  - **Organic Buyer Flag** — no discount AND no promo code used

### 2. Customer Segmentation & Analysis (SQL)
- Built a structured query layer to answer all 5 key business questions
- Identified high-value vs. low-value customer profiles
- Mapped seasonal and geographic demand patterns
- Identified 413 high-priority promo sunset candidates

### 3. Founder Dashboard (HTML)
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
| Python | Cleaned dataset + 6 engineered features |
| SQL | Segmentation queries answering all 5 key questions |
| Dashboard | Four-panel interactive HTML dashboard |
| Playbook | Promo sunset plan + ideal customer profile |
| Summary | One-page executive summary |

---

## 📁 Repository Structure

```
sql-driven-retention-strategy/
├── data/
│   └── customer_data.csv               # Raw dataset
├── python/
│   └── feature_engineering.py          # Feature creation + data cleaning
├── sql/
│   └── segmentation_queries.sql        # All segmentation queries
├── dashboard/
│   └── dashboard.html                  # Interactive live dashboard
├── docs/
│   ├── retention_playbook.md           # Business recommendations
│   └── executive_summary.md           # One-page findings summary
└── README.md
```

---

## 🚀 Live Dashboard

👉 **[Click here to view the live dashboard](https://yashra-jare.github.io/sql-driven-retention-strategy/dashboard/dashboard.html)**

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Python (Pandas, NumPy) | Data cleaning, feature engineering |
| SQL | Customer segmentation, business queries |
| HTML / CSS / JS | Interactive dashboard |
| GitHub Pages | Dashboard hosting |

---

## 📊 Key Findings

- **57%** of customers (2,223) are organic buyers — purchasing without any discount or promo code
- **43%** of customers (1,677) are promo-dependent — retained through continuous incentives
- **7.2%** of customers (279) are Champions — highest purchase frequency and tenure
- **413 Champion & Established customers** remain promo-dependent despite strong repeat-purchase signals — recoverable margin leakage
- **Arizona** is the strongest acquisition opportunity: above-average spend ($66.55), lowest promo dependency (33.8%), highest organic buyer rate (66.2%)
- **Clothing** has the lowest promo dependency of all categories — strongest organic demand
- **Outerwear** has the highest promo dependency — consistent with a seasonal entry-point role
- **Ideal customer profile:** Age 18–30 or 46–60 · PayPal or Credit Card · Bi-Weekly to Weekly purchase cadence · Zero promo dependency

---

## 💡 Strategic Answer

> *"Is the business successfully building a loyal customer base, or is it reliant on continuous promotional activity?"*

**Both are partially true — and that is the opportunity, not the crisis.**  
The brand has a real organic base (57%) that does not depend on discounts. It also has a promo-dependent cohort that can be graduated off incentives without losing them — if the transition is phased and segment-specific.

---

## 🏫 Context

This project was built as part of the **Consulting & Analytics Club, IIT Guwahati** — SQL | Consulting track.

---

## 👥 Author


| **Yashraj** | [GitHub](https://github.com/yashra-jare) |


*IIT Guwahati*

---

> *"Every segment claim must be traceable. Labels like 'at-risk' or 'high-value' are only valid if they map to a specific, stated combination of variables."*
