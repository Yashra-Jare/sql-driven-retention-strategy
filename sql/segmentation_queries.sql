CUSTOMER SEGMENTATION & ANALYSIS — SQL OUTPUT
D2C Fashion Brand | SQL Consulting & Analytics Club, IIT Guwahati
========================================================================

========================================================================
  Q1 — Loyalty vs Discount Dependency
========================================================================
Loyalty_Segment  customers  segment_share_pct  avg_spend_usd  avg_annual_freq  avg_prev_purchases  avg_promo_dependency  organic_buyer_pct  est_annual_value_usd
       Champion        279                7.2          58.73             52.0                37.8                  44.8               55.2                3054.0
    Established        937               24.0          60.14             29.6                33.3                  44.1               55.9                1779.0
     Developing       1709               43.8          59.47             12.4                27.1                  41.7               58.3                 739.0
            Low        975               25.0          60.21              4.8                11.1                  43.7               56.3                 289.0

========================================================================
  Q2 — Behavioural Patterns by Value Tier
========================================================================
Value_Tier  customers  tier_share_pct  avg_prev_purchases  avg_annual_freq  avg_rating  avg_promo_dependency  subscribed_pct  organic_pct
       Mid       1356            34.8                25.5             17.8        3.74                  43.1            27.0         56.9
       Low       1247            32.0                25.3             17.4        3.73                  43.7            27.0         56.3
      High       1297            33.3                25.3             17.2        3.77                  42.3            27.0         57.7

========================================================================
  Q3a — Season × Category (Tenure Lens)
========================================================================
Season    Category  customers  avg_prev_purchases  avg_annual_freq  avg_spend_usd  avg_promo_dependency      tenure_signal
Spring    Footwear        163                24.2             18.1          58.62                  38.7 Entry-Point Signal
Summer   Outerwear         75                24.3             15.5          57.04                  44.0 Entry-Point Signal
  Fall   Outerwear         88                24.4             18.9          59.76                  45.5 Entry-Point Signal
Summer    Clothing        408                24.5             17.2          56.56                  45.1 Entry-Point Signal
  Fall    Footwear        136                24.6             16.4          63.71                  49.3            Neutral
  Fall Accessories        324                24.7             16.9          61.34                  42.6            Neutral
Spring    Clothing        454                24.8             18.1          61.00                  44.9            Neutral
Winter   Outerwear         80                25.2             19.0          57.02                  47.5            Neutral
  Fall    Clothing        427                25.5             16.6          61.41                  35.6            Neutral
Winter Accessories        303                25.5             18.1          60.37                  43.6            Neutral
Summer    Footwear        160                25.6             17.4          58.71                  45.6            Neutral
Spring Accessories        301                25.9             17.7          56.50                  46.5            Neutral
Spring   Outerwear         81                26.0             17.0          54.63                  40.7            Neutral
Winter    Clothing        448                26.1             17.6          60.88                  42.6   Retention Signal
Winter    Footwear        140                26.7             19.8          60.57                  40.0   Retention Signal
Summer Accessories        312                26.8             16.4          60.99                  42.6   Retention Signal

========================================================================
  Q3b — Category Funnel Analysis
========================================================================
   Category  total_customers  category_share_pct  avg_prev_purchases  avg_annual_freq  avg_promo_dependency  avg_spend_usd        category_role
Accessories             1240                31.8                25.7             17.3                  43.8          59.84   Retention Category
   Footwear              599                15.4                25.2             17.9                  43.2          60.26   Retention Category
   Clothing             1737                44.5                25.2             17.4                  42.1          60.03   Retention Category
  Outerwear              324                 8.3                25.0             17.7                  44.4          57.17 Entry-Point Category

========================================================================
  Q4 — Geographic Opportunity Analysis (All States)
========================================================================
         state  customers  avg_spend_usd  avg_promo_dependency  organic_pct  avg_prev_purchases  total_est_revenue geo_classification
        Alaska         72          67.60                  40.3         59.7                28.1             4867.0           Moderate
  Pennsylvania         74          66.57                  44.6         55.4                27.4             4926.0           Moderate
       Arizona         65          66.55                  33.8         66.2                28.4             4326.0   High Opportunity
 West Virginia         81          63.88                  49.4         50.6                23.6             5174.0           Moderate
        Nevada         87          63.38                  47.1         52.9                26.0             5514.0           Moderate
    Washington         73          63.33                  43.8         56.2                24.7             4623.0           Moderate
  North Dakota         83          62.89                  45.8         54.2                23.8             5220.0           Moderate
      Virginia         77          62.88                  37.7         62.3                23.5             4842.0           Moderate
          Utah         71          62.58                  46.5         53.5                27.2             4443.0           Moderate
      Michigan         73          62.10                  39.7         60.3                26.9             4533.0           Moderate
     Tennessee         77          61.97                  36.4         63.6                26.0             4772.0           Moderate
    New Mexico         81          61.90                  44.4         55.6                26.0             5014.0           Moderate
  Rhode Island         63          61.44                  39.7         60.3                23.6             3871.0           Moderate
         Texas         77          61.19                  36.4         63.6                21.5             4712.0           Moderate
      Arkansas         79          61.11                  46.8         53.2                27.1             4828.0           Moderate
      Illinois         92          61.05                  40.2         59.8                26.6             5617.0           Moderate
   Mississippi         80          61.04                  47.5         52.5                26.0             4883.0           Moderate
 Massachusetts         72          60.89                  48.6         51.4                23.0             4384.0           Moderate
          Iowa         69          60.88                  52.2         47.8                27.6             4201.0 Discount Dependent
North Carolina         78          60.79                  44.9         55.1                24.8             4742.0           Moderate
       Wyoming         71          60.69                  42.3         57.7                28.2             4309.0           Moderate
  South Dakota         70          60.51                  37.1         62.9                24.6             4236.0           Moderate
      New York         87          60.43                  41.4         58.6                24.2             5257.0           Moderate
          Ohio         77          60.38                  44.2         55.8                25.1             4649.0           Moderate
       Montana         96          60.25                  37.5         62.5                25.3             5784.0           Moderate
         Idaho         93          60.08                  40.9         59.1                24.2             5587.0           Moderate
      Nebraska         87          59.45                  42.5         57.5                24.8             5172.0           Moderate
 New Hampshire         71          59.42                  43.7         56.3                27.1             4219.0           Moderate
       Alabama         89          59.11                  40.4         59.6                27.4             5261.0           Moderate
    California         95          59.00                  42.1         57.9                24.5             5605.0           Moderate
       Indiana         79          58.92                  57.0         43.0                25.8             4655.0 Discount Dependent
       Georgia         79          58.80                  40.5         59.5                25.1             4645.0           Moderate
South Carolina         76          58.41                  50.0         50.0                26.0             4439.0 Discount Dependent
      Oklahoma         75          58.35                  48.0         52.0                23.0             4376.0           Moderate
      Missouri         81          57.91                  49.4         50.6                28.1             4691.0           Moderate
        Hawaii         65          57.72                  49.2         50.8                29.2             3752.0           Moderate
     Louisiana         84          57.71                  41.7         58.3                23.4             4848.0           Moderate
        Oregon         74          57.34                  51.4         48.6                25.5             4243.0 Discount Dependent
       Vermont         85          57.18                  38.8         61.2                24.6             4860.0           Moderate
         Maine         77          56.99                  35.1         64.9                22.6             4388.0           Moderate
    New Jersey         67          56.75                  40.3         59.7                23.8             3802.0           Moderate
     Minnesota         88          56.56                  44.3         55.7                26.2             4977.0           Moderate
      Colorado         75          56.29                  41.3         58.7                24.0             4222.0           Moderate
     Wisconsin         75          55.95                  48.0         52.0                23.0             4196.0           Moderate
       Florida         68          55.85                  45.6         54.4                26.1             3798.0           Moderate
      Maryland         86          55.76                  44.2         55.8                26.5             4795.0           Moderate
      Kentucky         79          55.72                  43.0         57.0                26.4             4402.0           Moderate
      Delaware         86          55.33                  45.3         54.7                24.6             4758.0           Moderate
        Kansas         63          54.56                  23.8         76.2                23.4             3437.0           Moderate
   Connecticut         78          54.18                  33.3         66.7                24.0             4226.0           Moderate

========================================================================
  Q5 — Ideal Customer Profile
========================================================================
age_group Gender Payment Method  customers  avg_spend_usd  avg_loyalty_score  avg_prev_purchases  avg_annual_freq  avg_promo_dependency  avg_rating
    46–60   Male          Venmo         11          72.18               64.6                38.9             27.5                   0.0        3.45
    18–30 Female         PayPal         18          71.78               67.0                35.1             33.9                   0.0        3.72
    46–60   Male  Bank Transfer         13          69.77               72.2                33.4             40.9                   0.0        3.85
    18–30   Male           Cash         12          69.50               63.0                33.3             31.7                   0.0        4.08
      60+   Male  Bank Transfer         12          69.08               67.0                38.2             30.7                   0.0        3.98
      60+   Male    Credit Card         10          68.60               76.0                42.4             35.4                   0.0        3.68
    46–60   Male           Cash         19          67.95               60.0                33.3             28.6                   0.0        3.89
    18–30 Female    Credit Card         17          67.29               67.9                39.3             30.4                   0.0        3.94
    18–30 Female           Cash         18          67.06               65.1                34.8             32.2                   0.0        3.79
    18–30   Male         PayPal         13          66.00               67.2                34.0             35.2                   0.0        3.61
    31–45 Female           Cash         16          65.38               61.1                24.9             38.4                   0.0        3.53
    18–30   Male    Credit Card         16          65.19               69.7                32.6             39.3                   0.0        3.78
      60+ Female     Debit Card         13          64.69               68.7                34.7             36.0                   0.0        3.61
    46–60   Male    Credit Card         15          64.47               63.3                36.1             29.1                   0.0        3.99
    31–45   Male           Cash         13          64.15               75.1                33.5             43.8                   0.0        3.89

========================================================================
  Supporting — Promo Sunset Candidates
========================================================================
Loyalty_Segment Value_Tier  sunset_candidates  share_of_total_candidates_pct  avg_spend_usd  avg_promo_dependency  avg_prev_purchases  avg_annual_freq  est_annual_value_usd
       Champion       High                 38                            7.1          87.18                 100.0                37.7             52.0                4534.0
       Champion        Mid                 48                            8.9          57.44                 100.0                38.6             52.0                2987.0
    Established       High                139                           25.8          86.76                 100.0                33.9             28.2                2448.0
    Established        Mid                135                           25.1          59.67                 100.0                34.3             30.0                1788.0
       Champion        Low                 39                            7.2          32.95                 100.0                38.2             52.0                1713.0
    Established        Low                139                           25.8          30.50                 100.0                33.3             29.6                 903.0

========================================================================
  Supporting — Top vs Bottom 20% Customers
========================================================================
customer_band  customers  avg_spend_usd  avg_annual_freq  avg_prev_purchases  avg_promo_dependency  organic_pct
      Top 20%        787          59.26             40.3                35.9                  45.0         55.0
   Bottom 20%        795          60.65              4.2                 9.6                  43.0         57.0
