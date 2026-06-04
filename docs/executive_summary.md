# Executive Summary
## Decoding Customer Value: A SQL-Driven Retention Strategy
### D2C Fashion Brand · United States · 3,900 Customers
#### SQL Consulting & Analytics Club · IIT Guwahati

---

> **Methodology note:** Promo usage alone does not imply low loyalty.
> Promotional dependency was evaluated alongside purchase frequency and
> purchase history to distinguish bargain-driven behaviour from genuine
> retention signals. All metrics are constructed from available variables —
> no loyalty scores, churn labels, or timestamps exist in the source data.

---

## Key Metrics

| Metric | Value |
|---|---|
| Total Customers | 3,900 |
| Organic Buyers (no discount, no promo code) | **57% · 2,223 customers** |
| Promo-Dependent Customers | **43% · 1,677 customers** |
| Champion Segment | **7.2% · 279 customers** |
| Champion + Established Combined | **31.2% · 1,216 customers** |
| Promo Sunset Candidates | **413 customers** |
| Subscription Rate (all segments) | 27% |

---

## Core Finding

The brand is not in a loyalty crisis — but it has not yet converted organic demand
into a structurally loyal base. **57% of customers purchase without any discount
or promo incentive**, confirming genuine brand pull exists. The strategic risk is
that 43% of the base is retained through continuous incentives. Without a phased
reduction plan, margin dependency on promotions is likely to persist.

---

## What the Data Shows

**On Loyalty**
- 279 customers (7.2%) qualify as Champions — highest purchase frequency and tenure.
- A further 937 (24%) are Established — consistent repeat buyers.
- 1,709 (43.8%) sit in the Developing band: present, but behavioural depth not yet established.
- The core retention task is graduating Developing customers upward, not purely new acquisition.

**On Promotions**
- 43% average Promo Dependency across the base.
- **413 Champion and Established customers** show strong repeat-purchase signals yet remain promo-dependent — these represent recoverable margin leakage at the highest-value level.
- Promo dependency is broadly uniform across loyalty segments (~42–45%), indicating the programme has not yet been calibrated to customer behaviour.

**On Geography**
- Arizona presents the strongest directional opportunity signal: above-average spend ($66.55), lowest Promo Dependency among top states (33.8%), and the highest Organic Buyer rate (66.2%) — yet has not been deliberately targeted.
- Tennessee (36.4% promo dep.), Virginia (37.7%), and Texas (36.4%) show comparable organic demand signals at moderate spend levels and represent strong secondary targets.

**On Categories**
- Category differences are narrow but directionally consistent.
- Accessories associates with the highest average purchase history (25.7) — a retention-adjacent signal.
- Outerwear shows the lowest purchase history and highest Promo Dependency — consistent with a seasonal or entry-point role.
- Clothing carries the lowest Promo Dependency of all categories — organic demand appears strongest here.

---

## Business Impact Summary

| Action | Directional Impact | Risk |
|---|---|---|
| Sunset promos — Champion × High Value (38 customers) | Potential margin improvement on cohort; reorder stability to be monitored | Small subset may reduce purchase frequency |
| Expand organic acquisition in Arizona | Higher acquisition efficiency vs. discount-dependent markets | Regional scale limits near-term volume |
| Phase promos down — Established × Mid Tier (135 customers) | May help recover margin leakage; healthier retention base over time | Short-term frequency reduction possible |
| Push subscription conversion (currently 27%) | Stronger long-term retention signal | Incentive cost to drive initial sign-up |

---

## Recommendations

**1. Begin promo sunset for the 413 Champion and Established customers** currently
promo-dependent. Start with the 38 Champion × High Value customers (weekly
frequency, ~$87 avg spend). Monitor reorder rate as the primary stability signal
over 60 days before extending to the broader Established cohort.

**2. Prioritise Arizona for paid acquisition.** The organic demand signal is
already present without deliberate investment. Lead with brand-narrative creative,
not discount messaging. Tennessee, Virginia, and Texas are viable second-tier targets.

**3. Hold promo access for Low and Developing segments.** Insufficient purchase
history to make removal safe at this stage. Direct effort toward subscription
conversion to build behavioural depth before revisiting promo eligibility.

**4. Acquire toward the ideal customer profile:** 18–30 and 46–60 age bands,
digital payment methods (PayPal, Credit Card), zero Promo Dependency, Bi-Weekly
to Weekly purchase cadence. Creative should lead with product quality and brand
identity — not price.

---

## Strategic Answer

> *"Is the business successfully building a loyal customer base, or is it
> reliant on continuous promotional activity?"*

**Both are partially true — and that is the opportunity, not the crisis.**
The brand has a real organic base (57%) that does not depend on discounts.
It also has a promo-dependent cohort that can likely be graduated off incentives
without losing them, if the transition is phased and segment-specific. The data
suggests the brand is at an inflection point where deliberate action — not
reactive discounting — will determine the quality of its long-term revenue base.

---

*Deliverables: Python (feature engineering) · SQL (8 segmentation queries) ·
Power BI-style Dashboard (4-panel) · Retention Playbook · Executive Summary*
*SQL Consulting & Analytics Club · IIT Guwahati*
