# Retention Playbook
## Promotional Sunset Plan & Ideal Customer Profile
### D2C Fashion Brand · SQL Consulting & Analytics Club, IIT Guwahati

---

> **Methodology Note:** Promo usage alone does not imply low loyalty. Each
> recommendation below is grounded in a combination of Promo Dependency Score,
> purchase frequency, and purchase history — not any single signal in isolation.
> All wording reflects directional inference from observed behavioural patterns,
> not deterministic claims.

---

## Part A — Promotional Sunset Plan

### Data Foundation

Across 3,900 customers, 43% carry a Promo Dependency Score above zero.
The SQL segmentation identified **413 customers in the Champion and Established
segments** who remain promo-dependent despite purchase histories and frequencies
that historically associate with strong re-purchase behaviour. These 413 are the
highest-priority sunset candidates in the current base.

The logic is not that these customers are guaranteed to re-purchase without
discounts — it is that their behavioural signals associate most strongly with
sustained engagement after a phased, structured removal. Risk remains, and
the rollout timeline is designed to surface it early.

---

### Sunset Segment 1 — Champion × High Value Tier

**Profile:** ~38 customers · ~52 purchases/year · ~$87 avg spend · 37+ previous purchases

**Why this segment first:**
This cohort shows the highest annual purchase frequency in the dataset. Their
purchase history and Loyalty_B score suggest a meaningful probability of
retention independent of promotional incentives. At ~$87 per transaction and
weekly frequency, margin leakage from unnecessary promos is disproportionate
relative to any other segment.

**Trigger criteria (data-derived):**
- Previous Purchases ≥ 35
- Frequency of Purchases = Weekly
- Promo Dependency Score > 0 in most recent transaction

**Recommended action:**
Remove promos from backend transaction logic for this cohort. Do not send
proactive discount codes. If a customer actively requests a code, honour one
final instance framed as a loyalty acknowledgement — not a promotional event.

**Rollout timeline:**

| Phase | Activity | Signal to watch |
|---|---|---|
| Month 1–2 | Silent promo removal for new transactions | Reorder rate (60-day window) |
| Month 3 | Evaluate reorder stability; extend if signal holds | Reorder rate vs. pre-sunset baseline |
| Month 4+ | Assess margin direction on cohort | Revenue per customer (90-day) |

**Primary tracking metric:** Reorder rate — the percentage of customers making
a subsequent purchase within 60 days of their first promo-free transaction.
Reorder stability should be monitored closely before any broader rollout.

**Trade-off:** A subset of this cohort may reduce purchase frequency following
removal. The size of that subset is not predictable from available data alone.
If reorder rate deteriorates materially (>20% drop from baseline), pause
and reintroduce a reduced discount cadence before retrying.

---

### Sunset Segment 2 — Established × Mid Value Tier

**Profile:** ~135 customers · ~30 purchases/year · ~$60 avg spend · 34 previous purchases

**Why this segment:**
These customers demonstrate consistent repeat behaviour — 30 annual purchases and
34 in purchase history are the strongest tenure signals outside the Champion tier.
Every recorded transaction carries a Promo Dependency Score of 100, which suggests
promotional incentives may have become habitual rather than decision-driving.
Their behavioural depth — not their spend — is the basis for this recommendation.

**Trigger criteria (data-derived):**
- Previous Purchases ≥ 30
- Frequency of Purchases = Monthly or more frequent
- Promo Code Used = Yes in at least 2 of the last 3 transactions

**Recommended action:**
Transition from automatic discount to an earned-milestone model over 90 days.
Frame as: *"Your loyalty earns a reward every 3 purchases."* This preserves
perceived value while reducing the expectation of a discount on every transaction.

**Rollout timeline:**

| Phase | Activity | Signal to watch |
|---|---|---|
| Month 1 | Introduce milestone messaging alongside existing discount | No change to promo access yet |
| Month 2 | Shift to discount on every 3rd purchase cadence | Avg spend per transaction |
| Month 3 | Remove automatic discount; milestone-only model | Churn rate within segment |
| Month 4–6 | Evaluate spend per customer vs. $59.67 baseline | Revenue per customer (90-day) |

**Primary tracking metric:** Average purchase amount (USD) per customer per
90-day window against the current baseline of $59.67. Secondary: segment
churn rate. If churn exceeds 20% in Month 3, pause and revert to Month 2
cadence before proceeding.

**Trade-off:** A subset may reduce frequency from Monthly to Quarterly. If
this occurs at scale, a partial reintroduction — seasonal discount only —
is a lower-risk fallback before a full second phase attempt.

---

### Segments Not Recommended for Sunset — Current Cycle

| Segment | Rationale |
|---|---|
| Low (all value tiers) | Insufficient purchase history; removal likely to accelerate churn |
| Developing (all value tiers) | Behavioural depth not yet established; promo may still be decision-driving |
| Champion × Low Value Tier | Revenue base too small to absorb churn risk at this stage |

**Recommended alternative for Developing:** Direct effort toward subscription
conversion (currently 27% of base). Subscription signals a higher commitment
threshold and provides a natural point to revisit promo eligibility.

---

## Part B — Ideal Customer Profile

### Data Construction

This profile is derived from SQL Query 5: Champion and Established customers
with a Promo Dependency Score of 0 (Organic Buyers), filtered to demographic
combinations with ≥ 10 customers. All values are data-derived; no assumptions
were introduced.

---

### Primary Profile

| Attribute | Data-Derived Value |
|---|---|
| Age Group | 18–30 or 46–60 (bimodal distribution) |
| Gender | Male and Female (broadly equivalent) |
| Payment Method | PayPal, Credit Card, Bank Transfer, Cash |
| Avg Spend per Transaction | $64–$72 |
| Loyalty_B Score | 63–76 (Established to Champion range) |
| Avg Previous Purchases | 33–42 |
| Promo Dependency Score | 0 — no discount applied, no promo code used |
| Purchase Frequency | 26–52× per year (Bi-Weekly to Weekly) |
| Avg Review Rating | 3.6–4.1 |

---

### What This Profile Tells the Marketing Team

**1. Age is bimodal — not uniform.**
The 18–30 and 46–60 cohorts show the strongest concentration of Organic Buyers
with high Loyalty_B scores. The 31–45 band is represented but shows lower
average spend and loyalty scores. This is a directional signal worth testing
with targeted creative — not a basis for writing off the middle cohort entirely.

**2. Payment method correlates with digital-native behaviour.**
PayPal and Credit Card dominate the ideal profile, consistent with customers
comfortable with D2C digital purchasing. Acquisition channels should prioritise
where this behaviour is native: social commerce, email retargeting, performance
search. Cash and Bank Transfer users are present in the ideal profile but at
lower concentrations.

**3. Zero Promo Dependency at high frequency indicates genuine brand pull.**
These customers are returning without a price incentive. Acquisition creative
leading with a discount offer risks attracting a different customer type —
one with lower retention signals. Brand narrative and product quality are
the appropriate lead for this cohort.

**4. Arizona is the clearest geographic acquisition signal.**
It is the only state in the top-spend tier that combines above-average spend
($66.55) with low Promo Dependency (33.8%) and an Organic Buyer rate of 66.2%.
Tennessee (36.4% promo dep.), Virginia (37.7%), and Texas (36.4%) show similar
organic demand patterns and represent strong second-tier geographic priorities.

---

### Acquisition Brief (Marketing-Ready)

> Target 18–30 and 46–60 age cohorts on digital channels with a demonstrated
> history of repeat D2C fashion purchases without discount reliance.
> Prioritise Arizona for geo-targeted paid acquisition.
> Use Tennessee, Virginia, and Texas as secondary markets.
> Lead creative with product quality and brand narrative — not price.
> Opening with a discount offer historically associates with lower-retention
> customer acquisition in this dataset.

---

*Retention Playbook · D2C Fashion Brand*
*SQL Consulting & Analytics Club · IIT Guwahati*
*Loyalty metric: Loyalty_B = normalised(Frequency) × normalised(Previous Purchases)*
*Promo Dependency Score: avg(Discount Applied, Promo Code Used) × 100*
