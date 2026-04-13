Credit Card Fraud Analysis (SQL)

Objective

The goal of this project is to analyze credit card transaction data to identify patterns and behavioral differences between fraudulent and legitimate transactions.

----

Dataset Overview

* Total transactions: ~284,000
* Fraudulent transactions: 492 (~0.17%)
* Highly imbalanced dataset

Each transaction includes:

* `amount` — transaction value
* `class` — 0 (legitimate), 1 (fraud)
* anonymized features (V1–V28)

----

Key Questions

* Does transaction amount influence fraud likelihood?
* Are fraud transactions distributed differently than normal ones?
* Can we identify behavioral patterns useful for fraud detection?

----

Methodology

1. Transaction Bucketing

Transactions were grouped into categories based on amount:

* LOW: < 100
* MEDIUM: 100 – 1000
* HIGHE: > 1000

This was implemented using SQL `CASE` statements.

----

2. Fraud Rate Analysis

Fraud percentage was calculated per bucket:

| Amount Range | Fraud Rate |
| ------------ | ---------- |
| Low          | 0.16%      |
| Medium       | 0.22%      |
| High         | 0.31%      |


Insight: 
Fraud is rare overall, but the probability of fraud increases with transaction amount.

----

3. Behavioral Distribution Comparison

Instead of only measuring fraud rate, I compared how transactions are distributed across ranges.

Normal Transactions (class = 0)

* Low: 80%
* Medium: 19%
* High: 1%

Fraud Transactions (class = 1)

* Low: 74%
* Medium: 25%
* High: 1.8%

----

Key Insight:

Although most transactions (both legitimate and fraudulent) occur at low amounts, fraudulent transactions are relatively more concentrated in medium and high-value ranges compared to normal transactions.

This indicates a behavioral shift, not just a numerical difference.

----

Important Considerations

* Fraud cases are extremely rare (~0.17%)
* High-value fraud transactions are very few (only 9 cases)
* Observed patterns should be interpreted cautiously
* Further statistical validation would be required in a real-world setting

----

Conclusion

* Transaction amount alone is not a strong predictor of fraud
* However, higher transaction values are associated with increased relative fraud risk
* Fraud behavior differs subtly but consistently from normal transaction patterns

----

Next Steps

* Add time-based or sequential analysis
* Explore anomaly detection techniques
* Build a simple fraud prediction model
* Incorporate additional features beyond transaction amount

----

Tools Used

* SQL (SQLite)
* Data aggregation and grouping techniques
* Exploratory data analysis
* ChatGPT

----

Project Structure

* `queries.sql` → all SQL queries used
* `README.md` → project documentation
* screenshots of results

----

Final Note

This project focuses on developing analytical thinking using SQL — moving beyond simple queries to extracting meaningful insights from data.
