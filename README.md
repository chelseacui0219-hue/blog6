# Matching Parents and Children with SQL in Python

An econometric tutorial and empirical analysis demonstrating how to use SQL to match parents and children in longitudinal data, estimate the Intergenerational Elasticity (IGE), and correct for life-cycle bias.

## Research Question

**How much of a child's economic success is determined by their parents' economic status?**

To answer this, we calculate the **Intergenerational Elasticity (IGE)**. The analysis demonstrates why averaging income over multiple years (to construct a proxy for permanent income) is crucial for avoiding life-cycle bias in these estimates.

## Data Source

| Item | Description |
|------|-------------|
| Source | Panel Study of Income Dynamics (PSID) |
| Dataset | Class Exercise: Predicting Income Mobility in PSID (ICPSR) |
| Coverage | 1,365 matched parent-child pairs (three generations) |
| Key Variables | `g2_id` (Parent ID), `g3_id` (Child ID), `g2_log_income`, `g3_log_income` |

The income variables provided in this dataset are already adjusted for inflation and represent the **average income over multiple years** (ages 30-45) to proxy for lifetime economic status.

## Repository Structure
