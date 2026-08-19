-------------------------------------------------------------------------
-- Q1 — Loyalty vs Discount Dependency
-------------------------------------------------------------------------

SELECT
    Loyalty_Segment,
    COUNT(*) AS customers,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),1) AS segment_share_pct,
    ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_spend_usd,
    ROUND(AVG(Freq_Score), 1) AS avg_annual_freq,
    ROUND(AVG(`Previous Purchases`), 1) AS avg_prev_purchases,
    ROUND(AVG(Promo_Dependency_Score), 1) AS avg_promo_dependency,
    ROUND(AVG(Organic_Buyer) * 100, 1) AS organic_buyer_pct,
    ROUND(AVG(`Purchase Amount (USD)`) * AVG(Freq_Score),1) AS est_annual_value_usd
FROM sqldrivenproject.cleaned_engineered
GROUP BY Loyalty_Segment
ORDER BY
    CASE Loyalty_Segment
        WHEN 'Champion' THEN 1
        WHEN 'Established' THEN 2
        WHEN 'Developing' THEN 3
        WHEN 'Low' THEN 4
    END;

--------------------------------------------------------------------------
-- Q2 Behavioural Patterns by Value Tier 
-------------------------------------------------------------------------    
SELECT
    Value_Tier,
    COUNT(*) AS customers,
    ROUND(AVG(`Previous Purchases`), 1) AS avg_prev_purchases,
    ROUND(AVG(Freq_Score), 1) AS avg_annual_freq,
    ROUND(AVG(Satisfaction_Flag) * 3.0, 2) AS avg_rating,
	ROUND(AVG(Promo_Dependency_Score), 1) AS avg_promo_dependency,
	ROUND( AVG(CASE WHEN `Subscription Status` = 'Yes' THEN 1 ELSE 0 END) * 100,1) AS subscribed_pct,
	ROUND(AVG(Organic_Buyer) * 100, 1) AS organic_pct
FROM sqldrivenproject.cleaned_engineered
GROUP BY Value_Tier
ORDER BY
    CASE Value_Tier
        WHEN 'Low' THEN 1
        WHEN 'Mid' THEN 2
        WHEN 'High' THEN 3
    END;    
    
-----------------------------------------------------------------    
-- Q3a — Season × Category (Tenure Lens)
-----------------------------------------------------------------

SELECT
    Season,
    Category,
	COUNT(*) AS customers,
	ROUND(AVG(`Previous Purchases`), 1) AS avg_prev_purchases,
	ROUND(AVG(Freq_Score), 1) AS avg_annual_freq,
	ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_spend_usd,
	ROUND(AVG(Promo_Dependency_Score), 1) AS avg_promo_dependency,
    CASE
        WHEN AVG(`Previous Purchases`) <= 24.5
            THEN 'Entry-Point Signal'
		WHEN AVG(`Previous Purchases`) >= 26.0
            THEN 'Retention Signal'
        ELSE 'Neutral'
    END AS tenure_signal

FROM sqldrivenproject.cleaned_engineered
GROUP BY Season,Category
ORDER BY AVG(`Previous Purchases`);    

----------------------------------------------------------
-- Q3b — Category Funnel Analysis
----------------------------------------------------------
SELECT
    Category,
	COUNT(*) AS total_customers,
	ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),1) AS category_share_pct,
	ROUND(AVG(`Previous Purchases`), 1) AS avg_prev_purchases,
	ROUND(AVG(Freq_Score), 1) AS avg_annual_freq,
	ROUND(AVG(Promo_Dependency_Score), 1) AS avg_promo_dependency,
	ROUND(AVG(`Purchase Amount (USD)`), 2) AS avg_spend_usd,
	CASE
        WHEN AVG(Promo_Dependency_Score) >= 44
            THEN 'Entry-Point Category'
        ELSE 'Retention Category'
    END AS category_role
FROM sqldrivenproject.cleaned_engineered
GROUP BY Category
ORDER BY total_customers DESC;

-------------------------------------------------------------------------
--  Q4 — Geographic Opportunity Analysis (All States)
-------------------------------------------------------------------------
SELECT
    Location AS state,
	COUNT(*) AS customers,
	ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend_usd,
	ROUND(AVG(Promo_Dependency_Score),1) AS avg_promo_dependency,
	ROUND(AVG(Organic_Buyer) * 100,1) AS organic_pct,
	ROUND(AVG(`Previous Purchases`),1) AS avg_prev_purchases,
	ROUND(SUM(`Purchase Amount (USD)` * Freq_Score),1) AS total_est_revenue,

    CASE
        WHEN AVG(Promo_Dependency_Score) <= 35
             AND AVG(Organic_Buyer) >= 0.60
        THEN 'High Opportunity'
		WHEN AVG(Promo_Dependency_Score) >= 50 THEN 'Discount Dependent'
		ELSE 'Moderate'
    END AS geo_classification
FROM sqldrivenproject.cleaned_engineered
GROUP BY Location
ORDER BY avg_spend_usd DESC;


---------------------------------------------------------------------------------
-- Q5 — Ideal Customer Profile
---------------------------------------------------------------------------------
SELECT
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18–30'
        WHEN Age BETWEEN 31 AND 45 THEN '31–45'
        WHEN Age BETWEEN 46 AND 60 THEN '46–60'
        WHEN Age >= 61 THEN '60+'
    END AS age_group,
	Gender,
    `Payment Method`,
	COUNT(*) AS customers,
	ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend_usd,
	ROUND(AVG(Loyalty_Score),1) AS avg_loyalty_score,
	ROUND(AVG(`Previous Purchases`),1) AS avg_prev_purchases,
	ROUND(AVG(Freq_Score),1) AS avg_annual_freq,
	ROUND(AVG(Promo_Dependency_Score),1) AS avg_promo_dependency,
	ROUND(AVG(`Review Rating`),2) AS avg_rating

FROM sqldrivenproject.cleaned_engineered
GROUP BY
    CASE
        WHEN Age BETWEEN 18 AND 30 THEN '18–30'
        WHEN Age BETWEEN 31 AND 45 THEN '31–45'
        WHEN Age BETWEEN 46 AND 60 THEN '46–60'
        WHEN Age >= 61 THEN '60+'
    END,
    Gender,
    `Payment Method`
HAVING COUNT(*) >= 10
ORDER BY avg_spend_usd DESC;


----------------------------------------------------------------------------
-- Supporting — Promo Sunset Candidates
----------------------------------------------------------------------------
SELECT
    Loyalty_Segment,
    Value_Tier,
	COUNT(*) AS sunset_candidates,
	ROUND(COUNT(*) * 100.0 /SUM(COUNT(*)) OVER (),1) AS share_of_total_candidates_pct,
	ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend_usd,
	ROUND(AVG(Promo_Dependency_Score),1) AS avg_promo_dependency,
	ROUND(AVG(`Previous Purchases`),1) AS avg_prev_purchases,
	ROUND(AVG(Freq_Score),1) AS avg_annual_freq,
	ROUND(AVG(`Purchase Amount (USD)`) * AVG(Freq_Score),1) AS est_annual_value_usd

FROM sqldrivenproject.cleaned_engineered
WHERE Loyalty_Segment IN ('Champion', 'Established') AND Promo_Dependency_Score = 100
GROUP BY Loyalty_Segment,Value_Tier
ORDER BY est_annual_value_usd DESC;


-------------------------------------------------------------------------------------
-- Supporting — Top vs Bottom 20% Customers
-------------------------------------------------------------------------------------
WITH ranked_customers AS (
    SELECT *,
        NTILE(5) OVER (ORDER BY `Purchase Amount (USD)` DESC) AS value_band
    FROM sqldrivenproject.cleaned_engineered )

SELECT
    CASE
        WHEN value_band = 1 THEN 'Top 20%'
        WHEN value_band = 5 THEN 'Bottom 20%'
    END AS customer_band,
	COUNT(*) AS customers,
	ROUND(AVG(`Purchase Amount (USD)`),2) AS avg_spend_usd,
	ROUND(AVG(Freq_Score),1) AS avg_annual_freq,
	ROUND(AVG(`Previous Purchases`),1) AS avg_prev_purchases,
	ROUND(AVG(Promo_Dependency_Score),1) AS avg_promo_dependency,
	ROUND(AVG(Organic_Buyer) * 100,1) AS organic_pct

FROM ranked_customers
WHERE value_band IN (1, 5)
GROUP BY value_band
ORDER BY value_band;