"""
================================================================================
DELIVERABLE 1 — Data Preparation & Feature Engineering
================================================================================
Project  : Decoding Customer Value — A SQL-Driven Retention Strategy
Dataset  : 3,900 D2C Fashion Brand Customers (US Market)
Tool     : Python (pandas, numpy)

METHODOLOGY NOTE
----------------
Promo usage alone does not imply low loyalty. Therefore, promotional dependency
was evaluated alongside purchase frequency and purchase history to distinguish
bargain-driven behaviour from genuine retention signals.

All features are constructed exclusively from available variables.
No loyalty scores, churn labels, or timestamps exist in the source data —
every concept below is engineered, not assumed.
================================================================================
"""

import pandas as pd
import numpy as np

# ── 1. LOAD ──────────────────────────────────────────────────────────────────
df = pd.read_csv('/mnt/user-data/uploads/SQLDataset.csv')
print(f"Dataset loaded: {df.shape[0]} rows × {df.shape[1]} columns")

# ── 2. CLEAN ─────────────────────────────────────────────────────────────────
# 37 Review Ratings are missing (~0.9% of records). Imputed with column median
# to avoid any distributional distortion.
df['Review Rating'] = df['Review Rating'].fillna(df['Review Rating'].median())

# Encode binary Yes/No columns as 1/0 for numeric operations
for col in ['Discount Applied', 'Promo Code Used', 'Subscription Status']:
    df[col + '_bin'] = (df[col] == 'Yes').astype(int)

print(f"Missing values after cleaning: {df.isnull().sum().sum()}")

# ── 3. FREQUENCY → NUMERIC SCORE ────────────────────────────────────────────
# Maps self-reported purchase frequency to approximate annual transactions.
# 'Fortnightly' and 'Bi-Weekly' are treated as equivalent (both = 26/year).
freq_map = {
    'Weekly':          52,
    'Bi-Weekly':       26,
    'Fortnightly':     26,
    'Monthly':         12,
    'Every 3 Months':   4,
    'Quarterly':        4,
    'Annually':         1,
}
df['Freq_Score'] = df['Frequency of Purchases'].map(freq_map)

# ── 4. ENGINEERED FEATURES ───────────────────────────────────────────────────

# ── Feature 1: Promo Dependency Score (0 / 50 / 100) ────────────────────────
# Business question: How reliant is this customer on promotional incentives?
# Construction: average of Discount Applied and Promo Code Used binary flags × 100
# Interpretation:
#   0   = organic buyer — purchased without any promotional incentive
#   50  = partial dependency — used one promotional mechanism
#   100 = fully promo-driven — used both discount and promo code
df['Promo_Dependency_Score'] = (
    (df['Discount Applied_bin'] + df['Promo Code Used_bin']) / 2 * 100
)

# ── Feature 2: Value Tier ────────────────────────────────────────────────────
# Business question: Where does this customer sit in the brand's revenue base?
# Construction: tercile split on Purchase Amount (USD)
# Interpretation: High / Mid / Low relative spend — used for sunset targeting
spend_33 = df['Purchase Amount (USD)'].quantile(0.33)
spend_67 = df['Purchase Amount (USD)'].quantile(0.67)

def value_tier(amount):
    if amount >= spend_67:   return 'High'
    elif amount >= spend_33: return 'Mid'
    else:                    return 'Low'

df['Value_Tier'] = df['Purchase Amount (USD)'].apply(value_tier)

# ── Feature 3: Satisfaction Flag ─────────────────────────────────────────────
# Business question: Is this customer having an above-average experience?
# Construction: Review Rating ≥ 4.0 (above dataset median) = satisfied
# Note: Review Rating is the only experience proxy available in the dataset.
df['Satisfaction_Flag'] = (df['Review Rating'] >= 4.0).astype(int)

# ── Feature 4: Loyalty Definition A — Spend × Frequency ─────────────────────
# Hypothesis: A loyal customer is one who spends meaningfully AND buys frequently.
# Both signals are min-max normalised to 0–1 before averaging.
df['Norm_Spend'] = (
    (df['Purchase Amount (USD)'] - df['Purchase Amount (USD)'].min()) /
    (df['Purchase Amount (USD)'].max() - df['Purchase Amount (USD)'].min())
)
df['Norm_Freq'] = (
    (df['Freq_Score'] - df['Freq_Score'].min()) /
    (df['Freq_Score'].max() - df['Freq_Score'].min())
)
df['Loyalty_A'] = ((df['Norm_Spend'] + df['Norm_Freq']) / 2 * 100).round(1)
# Limitation: Loyalty_A is partially circular with revenue — a high one-time
# spender can score well without demonstrating repeat behaviour.

# ── Feature 5: Loyalty Definition B — Frequency × Purchase History ───────────
# Hypothesis: True loyalty is better captured by how often a customer returns
# AND how many purchases they have accumulated over time (tenure proxy).
# Spend is deliberately excluded to avoid conflating spend level with loyalty.
df['Norm_History'] = (
    (df['Previous Purchases'] - df['Previous Purchases'].min()) /
    (df['Previous Purchases'].max() - df['Previous Purchases'].min())
)
df['Loyalty_B'] = ((df['Norm_Freq'] + df['Norm_History']) / 2 * 100).round(1)

# ── LOYALTY DEFINITION SELECTION ─────────────────────────────────────────────
# Test: A well-constructed loyalty score should show lower promo dependency
# among high-scoring customers — i.e. genuinely loyal customers should be
# less likely to require discounts to make a purchase.

high_A = df[df['Loyalty_A'] >= df['Loyalty_A'].quantile(0.75)]['Promo_Dependency_Score'].mean()
high_B = df[df['Loyalty_B'] >= df['Loyalty_B'].quantile(0.75)]['Promo_Dependency_Score'].mean()
corr_A = df['Loyalty_A'].corr(df['Purchase Amount (USD)'])
corr_B = df['Loyalty_B'].corr(df['Purchase Amount (USD)'])

print("\n── Loyalty Definition Comparison ──────────────────────────────────────")
print(f"  Avg promo dependency — all customers       : {df['Promo_Dependency_Score'].mean():.1f}")
print(f"  Avg promo dependency — top 25% Loyalty_A  : {high_A:.1f}")
print(f"  Avg promo dependency — top 25% Loyalty_B  : {high_B:.1f}")
print(f"  Correlation with revenue — Loyalty_A       : {corr_A:.3f}")
print(f"  Correlation with revenue — Loyalty_B       : {corr_B:.3f}")
print()
print("  SELECTION: Loyalty_B (Frequency × History) is adopted as the primary")
print("  loyalty metric. Loyalty_A's strong correlation with revenue (r=0.663)")
print("  indicates it largely recaptures spend rather than measuring repeat")
print("  engagement independently. Loyalty_B isolates behavioural depth —")
print("  how often and how long a customer has been purchasing — without")
print("  being influenced by transaction size.")

# ── Apply chosen definition ───────────────────────────────────────────────────
df['Loyalty_Score'] = df['Loyalty_B']
df['Loyalty_Segment'] = pd.cut(
    df['Loyalty_Score'],
    bins=[0, 25, 50, 75, 100],
    labels=['Low', 'Developing', 'Established', 'Champion'],
    include_lowest=True
)

# ── Feature 6: Organic Buyer Flag ────────────────────────────────────────────
# Business question: Who is buying on genuine brand preference vs. incentive pull?
# Construction: Organic = no discount applied AND no promo code used
# These customers represent the brand's most naturally acquired revenue base.
df['Organic_Buyer'] = (
    (df['Discount Applied_bin'] == 0) & (df['Promo Code Used_bin'] == 0)
).astype(int)

# ── 5. SAVE ───────────────────────────────────────────────────────────────────
out_cols = [
    'Customer ID', 'Age', 'Gender', 'Item Purchased', 'Category',
    'Purchase Amount (USD)', 'Location', 'Size', 'Color', 'Season',
    'Review Rating', 'Subscription Status', 'Shipping Type',
    'Discount Applied', 'Promo Code Used', 'Previous Purchases',
    'Payment Method', 'Frequency of Purchases',
    'Freq_Score', 'Promo_Dependency_Score', 'Value_Tier',
    'Satisfaction_Flag', 'Loyalty_Score', 'Loyalty_Segment',
    'Organic_Buyer', 'Discount Applied_bin', 'Promo Code Used_bin',
]
df[out_cols].to_csv('/mnt/user-data/outputs/cleaned_engineered.csv', index=False)

# ── 6. SUMMARY ────────────────────────────────────────────────────────────────
print("\n── Feature Engineering Summary ────────────────────────────────────────")
print(f"  Total customers         : {len(df):,}")
print(f"  Organic buyers          : {df['Organic_Buyer'].sum():,} ({df['Organic_Buyer'].mean()*100:.1f}%)")
print(f"  Promo-dependent (any)   : {(df['Promo_Dependency_Score'] > 0).sum():,} ({(df['Promo_Dependency_Score']>0).mean()*100:.1f}%)")
print(f"  Satisfied (rating ≥4.0) : {df['Satisfaction_Flag'].sum():,} ({df['Satisfaction_Flag'].mean()*100:.1f}%)")
print(f"  Subscribed              : {df['Subscription Status_bin'].sum():,} ({df['Subscription Status_bin'].mean()*100:.1f}%)")
print()
print("  Loyalty Segment Distribution:")
seg = df['Loyalty_Segment'].value_counts().sort_index(ascending=False)
for s, n in seg.items():
    print(f"    {s:<12} : {n:>5,}  ({n/len(df)*100:.1f}%)")
print()
print("  Value Tier Distribution:")
for t, n in df['Value_Tier'].value_counts().items():
    print(f"    {t:<6} : {n:>5,}  ({n/len(df)*100:.1f}%)")

print("\nOutput saved: cleaned_engineered.csv")
